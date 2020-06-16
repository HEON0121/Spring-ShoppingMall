package org.zerock.domain;

import java.util.Date;

import lombok.Data;

//goodsNum number not null,
//goodsName varchar2(50) not null,
//cateCode varchar2(50) not null,
//goodsPrice number not null,
//goodsStock number null,
//goodsDetail varchar2(1000) null,
//goodsImg varchar2(200) null,
//regdate date default sysdate,
@Data
public class GoodsVO {
	private int gdsNum;
	private String gdsName;
	private String cateCode;
	private int gdsPrice;
	private int gdsStock;
	private String gdsInfo;
	private String gdsImg;
	private String gdsThumbnail;
	private Date gdsDate;
	
	
}
