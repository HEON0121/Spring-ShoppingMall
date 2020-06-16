package org.zerock.domain;

import java.util.Date;

import lombok.Data;

@Data
public class CartVO {
	private int gdsNum;
	private String userId;
	private int cartStock;
	private int cartNum;
	private Date addDate;
	
}
