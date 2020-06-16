package org.zerock.domain;

import java.util.Date;
import java.util.List;

import lombok.Data;

//USERID VARCHAR2(50) NOT NULL,
//USERPW VARCHAR2(100) NOT NULL,
//USERNAME VARCHAR2(100) NOT NULL,
//USERPHONE VARCHAR2(100) NOT NULL,
//POSTCODE VARCHAR2(100) NULL,
//USERADDR VARCHAR2(100) NULL,
//USERADDR2 VARCHAR2(100) NULL,
//REGDATE DATE DEFAULT SYSDATE,
//VERIFY NUMBER DEFAULT 0,
//PRIMARY KEY(USERID)
@Data
public class MemberVO {
	private String userid;
	private String userpw;
	private String userName;
	private String userPhone;
	private String userPostcode;
	private String userAddress;
	private String userAddress2;
	private String userGender;
	private String userBirth;
	private String userEmail;
	private Date regDate;
	private int verify;
	private boolean enabled;
	private String auth;
	private List<AuthVO> authList;
	
	
	
}
