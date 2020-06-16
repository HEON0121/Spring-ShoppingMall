package org.zerock.domain;

import java.util.Date;

import lombok.Data;

@Data
public class OrderVO {
/*
orderId varchar(50) not null primary key,
userId varchar(50) not null ,
orderRec varchar(50) not null,
postCode varchar(50) not null,
userAddr1 varchar(50) not null,
userAddr2 varchar(50) not null,
orderPhone varchar(50) not null,
amount int not null,
orderDate timestamp default now()
*/
	private String orderId;
	private String userId;
	private String orderRec; // 수신인
	private String postCode;
	private String userAddr1;
	private String userAddr2;
	private String orderPhone;
	private int amount;
	private Date orderDate;
	private String deliveryStatus;
}
