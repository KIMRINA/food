package egovframework.example.sample.web;

import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Collections;
import java.util.Date;
import java.util.List;
import java.util.Map;
import java.util.Random;
import java.util.TreeMap;
import java.util.stream.Collectors;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.RestController;
import org.springmodules.validation.commons.DefaultBeanValidator;

import com.google.common.base.Function;
import com.google.common.collect.Lists;

import egovframework.example.sample.domain.PBoardVO;
import egovframework.example.sample.service.PBoardService;
import egovframework.example.sample.util.TestUtil;
import egovframework.rte.fdl.property.EgovPropertyService;

@Controller
@RequestMapping(value = "/pBoard")
public class BoardController {

	private static final Logger LOGGER = LoggerFactory.getLogger(BoardController.class);

	@Resource(name = "pBoardService")
	private PBoardService boardService;

	/** EgovPropertyService */
	@Resource(name = "propertiesService")
	protected EgovPropertyService propertiesService;

	/** Validator */
	@Resource(name = "beanValidator")
	protected DefaultBeanValidator beanValidator;

	// 게시판 글 작성 화면
	@RequestMapping(value = "/pBoardInsertView.do", method = RequestMethod.GET)
	public String insertView(PBoardVO vo, Model model, HttpServletRequest req, HttpServletResponse response)
			throws Exception {
		LOGGER.info("** get insertView **");

//		if (req.getSession().getAttribute("login") == null) {
//			response.setContentType("text/html; charset=utf-8");
//			PrintWriter out = response.getWriter();
//			out.print("<script>alert('로그인 글 작성이 가능합니다');window.close();</script>");
//			out.flush();
//			out.close();
//		}

//		HttpSession session = req.getSession();
//		MemberVO login = (MemberVO) session.getAttribute("login");
//		System.out.println("???1: " + login.getMem_name());
//		System.out.println("???2: " + login.getMem_id());
//
//		session.getAttribute("memName");
//		model.addAttribute("insert", boardService.boardOneRead(vo.getBoard_no()));

		return "pBoard/insert";
	}

	// 게시판 글 작성
	@RequestMapping(value = "/pBoardInsert.do", method = RequestMethod.POST)
	public String write(PBoardVO vo) throws Exception {
		LOGGER.info("** POST boardInsert **");

		boardService.pBoardInsert(vo);

		return "redirect:/pBoard/pBoardList.do";
	}
	
	@GetMapping("/pBoardList.do")
	public String pBoardList(HttpServletRequest req, PBoardVO vo, Model model) throws Exception {
		LOGGER.info("** get list **");
		
//		SimpleDateFormat format = new SimpleDateFormat("yyyy-MM-dd");
		
		String category = req.getParameter("category");
		vo.setCategory(category);
		
//		Random rand = new Random();
//		vo.setPboard_no(rand.nextInt(10));	// 1~100
//		System.out.println(rand.nextInt(10));
		
		List<PBoardVO> list = boardService.pBoardList(vo);
		
		List<Integer> data = new ArrayList<Integer>();
		
		for(int i=0; i<list.size(); i++) {
			data.add(list.get(i).getPboard_no());
		}
		
		// shuffle 이용
        Collections.shuffle(data);
        Integer get_Card2 = data.get(0);
        data.remove(0);
        System.out.println(get_Card2);
		
		model.addAttribute("list", list);
		
//		List<String> categoryList = Lists.transform(list, new Function<PBoardVO, String> (){
//			@Override
//			public String apply(PBoardVO category) {
//				return category.getPboard_category();
//			}
//        });
//		model.addAttribute("categoryList", categoryList);
//		System.out.println(categoryList);
		
		model.addAttribute("categoryList", boardService.pBoardCateList());
		
		
		return "pBoard/list";
	}
	
	@GetMapping("/pBoardListExcel.do")
	public void pBoardListExcel(HttpServletRequest req, HttpServletResponse res, PBoardVO vo) throws Exception {
		LOGGER.info("** pBoardListExcel **");
		
		
		List<PBoardVO> list = boardService.pBoardList(vo);
		SimpleDateFormat format = new SimpleDateFormat("yyyy-MM-dd");
		
		// Sheet를 채우기 위한 데이터들을 Map에 저장
		Map<Integer, Object[]> data = new TreeMap<>();
		data.put(0, new Object[]{"NO", "CATEGORY", "SUBJECT", "WRITER", "DATE"});
		
		for(int i=0; i<list.size(); i++) {
			Date curDate = list.get(i).getPboard_date();
			String newDate = format.format(curDate);
			data.put(list.get(i).getPboard_no(), new Object[]{list.get(i).getPboard_no(), list.get(i).getPboard_category(), 
					list.get(i).getPboard_subject(), list.get(i).getPcate_name(), newDate});
		}
		TestUtil.excelDownload(res, req, data);
		
	}
	
	@GetMapping("/pBoardOneRead.do")
	public String pBoardOneRead(@RequestParam("pboard_no") int pboard_no, Model model) throws Exception {
		LOGGER.info("** get pBoardOneRead **");
		
		PBoardVO read = boardService.pBoardListOneRead(pboard_no);
		
		model.addAttribute("read", read);
		
		
		return "pBoard/read";
	}

	
}
