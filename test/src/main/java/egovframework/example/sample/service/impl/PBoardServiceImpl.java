package egovframework.example.sample.service.impl;

import java.util.List;

import javax.annotation.Resource;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Service;

import egovframework.example.sample.domain.PBoardVO;
import egovframework.example.sample.mapper.PBoardMapper;
import egovframework.example.sample.service.PBoardService;
import egovframework.rte.fdl.cmmn.EgovAbstractServiceImpl;

@Service("pBoardService")
public class PBoardServiceImpl extends EgovAbstractServiceImpl implements PBoardService {
	
private static final Logger LOGGER = LoggerFactory.getLogger(PBoardServiceImpl.class);
	
	@Resource(name="pBoardMapper")
	private PBoardMapper boardMapper;
	
	@Resource(name = "pBoardService")
	private PBoardService boardService;

	@Override
	public void pBoardInsert(PBoardVO vo) throws Exception {
		boardMapper.pBoardInsert(vo);
	}

	@Override
	public List<PBoardVO> pBoardList(PBoardVO vo) throws Exception {
		return boardMapper.pBoardList(vo);
	}

	@Override
	public List<PBoardVO> pBoardCateList() throws Exception {
		return boardMapper.pBoardCateList();
	}

	@Override
	public PBoardVO pBoardListOneRead(int pBoard_no) throws Exception {
		return boardMapper.pBoardListOneRead(pBoard_no);
	}

	@Override
	public List<PBoardVO> pBoardListAll(PBoardVO vo) throws Exception {
		return boardMapper.pBoardListAll(vo);
	}

	@Override
	public void pBoardUpdate(PBoardVO vo) throws Exception {
		boardMapper.pBoardUpdate(vo);
	}

	@Override
	public void pBoardDelete(int pBoard_no) throws Exception {
		boardMapper.pBoardDelete(pBoard_no);
	}

	@Override
	public List<PBoardVO> pBoardListAllPaging(PBoardVO vo) throws Exception {
		return boardMapper.pBoardListAllPaging(vo);
	}

	@Override
	public int pBoardListAllPagingCount(PBoardVO vo) throws Exception {
		return boardMapper.pBoardListAllPagingCount(vo);
	}

}
