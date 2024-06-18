package com.kh.dungjip.enquiry.model.service;

import java.util.ArrayList;

import com.kh.dungjip.enquiry.model.vo.Enquiry;
import com.kh.dungjip.member.model.vo.Member;

public interface EnquiryService {
	//1:1문의 등록
	int insertEnquiry(Enquiry en);
	//관리자 댓글 등록
	int insertReply(Enquiry en);
	//더보기
	ArrayList<Enquiry> moreEnquiry(Enquiry en);
	
	//조회
	ArrayList<Enquiry> selectEnquiryList(Member m);
	
	//삭제
	int myQnAdelete(int enquiryNo);
	
	ArrayList<Enquiry> selectqList(Member m);
	

	
}
