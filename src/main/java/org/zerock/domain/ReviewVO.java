package org.zerock.domain;

import java.util.Date;

import lombok.Data;

@Data
public class ReviewVO {
//	gdsNum int not null,
//    userId varchar(50) not null,
//    reviewNum int not null,
//    reviewCon varchar(2048) not null,
//    reviewDate TIMESTAMP default NOW()
	private int gdsNum;
	private String userId;
	private int reviewNum;
	private String reviewCon;
	private Date reviewDate; 
}
