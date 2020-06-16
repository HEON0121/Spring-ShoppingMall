package org.zerock.domain;

import java.util.Date;

import lombok.Data;
@Data
public class ReviewListVO {
	private int gdsNum;
	private String userId;
	private int reviewNum;
	private String reviewCon;
	private Date reviewDate;
	
	private String userName;
}
