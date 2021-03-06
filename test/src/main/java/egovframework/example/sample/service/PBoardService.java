package egovframework.example.sample.service;

import java.util.List;

import egovframework.example.sample.domain.PBoardVO;

public interface PBoardService {
	
	public void pBoardInsert(PBoardVO vo) throws Exception;
	
	public List<PBoardVO> pBoardListAll(PBoardVO vo) throws Exception;
	
	public List<PBoardVO> pBoardList(PBoardVO vo) throws Exception;
	
	public List<PBoardVO> pBoardCateList() throws Exception;
	
	public PBoardVO pBoardListOneRead(int pBoard_no) throws Exception;
	
	public void pBoardUpdate(PBoardVO vo) throws Exception;
	
	public void pBoardDelete(int pBoard_no) throws Exception;
	
	public List<PBoardVO> pBoardListAllPaging(PBoardVO vo) throws Exception;
	
	public int pBoardListAllPagingCount(PBoardVO vo) throws Exception;

}
