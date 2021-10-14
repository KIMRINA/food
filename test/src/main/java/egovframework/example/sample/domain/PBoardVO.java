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

}
