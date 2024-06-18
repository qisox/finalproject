package com.kh.dungjip.enquiry.model.vo;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@AllArgsConstructor
@NoArgsConstructor
public class Enquiry {

	private int enquiryNo; //ENQUIRY_NO	NUMBER
	private int userNo; //USER_NO	NUMBER
	private String enquiryEnrollDate; //ENQUIRY_ENROLL_DATE	DATE
	private String enquiryTitle; //ENQUIRY_TITLE	VARCHAR2(100 BYTE)
	private String enquiryContent; //ENQUIRY_CONTENT	VARCHAR2(1000 BYTE)
	private String enquiryImage; //ENQUIRY_IMAGE	VARCHAR2(500 BYTE)
	private String enquiryDate; //ENQUIRY_DATE	DATE
	private String enquiryReply; //ENQUIRY_REPLY	VARCHAR2(1000 BYTE)
	private String status; //STATUS	VARCHAR2(1 BYTE)
	private String changeName; //CHANGE_NAME	VARCHAR2(100 BYTE)
	private String userName;
	
	private int enquiryList;
	private int startIndex;
	
	public Enquiry(int enquiryList, int startIndex) {
		super();
		this.enquiryList = enquiryList;
		this.startIndex = startIndex;
	}
}
