package egovframework.example.sample.mapper;

import java.util.List;

import org.springframework.stereotype.Repository;

import egovframework.example.sample.domain.PBoardVO;
import egovframework.rte.psl.dataaccess.EgovAbstractMapper;

@Repository("pBoardMapper")
public class PBoardMapper extends EgovAbstractMapper {
	
	public void pBoardInsert(PBoardVO vo) throws Exception {
		insert("pBoardInsert", vo);
	}
	
	public List<PBoardVO> pBoardList(PBoardVO vo) throws Exception {
		return selectList("pBoardList", vo);
	}
	
	public List<PBoardVO> pBoardCateList() throws Exception {
		return selectList("pBoardCateList");
	}
	
	public PBoardVO pBoardListOneRead(int pBoard_no) throws Exception {
		return selectOne("pBoardListOneRead", pBoard_no);
	}
	

}
