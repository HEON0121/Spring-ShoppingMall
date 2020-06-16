package org.zerock.domain;

import lombok.Data;

@Data
public class OrderDetailsVO {
/*
orderDetailsNum int not null auto_increment primary key, 
orderId varchar(50) not null,
gdsNum int not null, 
cartStock int not null
 */
	
	private int orderDetailsNum;
	private String orderId;
	private int gdsNum;
	private int cartStock;
}
