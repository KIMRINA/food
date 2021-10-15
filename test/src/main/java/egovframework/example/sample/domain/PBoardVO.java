package egovframework.example.sample.domain;

import java.util.Date;

import lombok.Data;

@Data
public class PBoardVO {
	private int pboard_no;
	private String pboard_subject;
	private String pboard_category;
	private String pboard_content;
	private Date pboard_date;
	private int board_no;
	
	private String pcate_rname;
	private String pcate_name;
	
	private String category;
	
	
	/** 현재페이지 */
	private int pageIndex = 1;

	/** 페이지갯수 */
	private int pageUnit = 10;

	/** 페이지사이즈 */
	private int pageSize = 10;

	/** firstIndex */
	private int firstIndex = 1;

	/** lastIndex */
	private int lastIndex = 1;

	/** recordCountPerPage */
	private int recordCountPerPage = 10;

}
