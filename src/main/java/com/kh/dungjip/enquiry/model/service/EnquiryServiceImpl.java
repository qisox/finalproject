package com.kh.dungjip.enquiry.model.service;

import java.util.ArrayList;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.kh.dungjip.enquiry.model.dao.EnquiryDao;
import com.kh.dungjip.enquiry.model.vo.Enquiry;
import com.kh.dungjip.member.model.vo.Member;

@Service
public class EnquiryServiceImpl implements EnquiryService{
	
	@Autowired
	private EnquiryDao enquiryDao;
	@Autowired
	private SqlSessionTemplate sqlSession;
	
	//1:1문의 등록
	@Override
	public int insertEnquiry(Enquiry en) {
		return enquiryDao.insertEnquiry(sqlSession,en);
	}
	//관리자 댓글 등록
	@Override
	public int insertReply(Enquiry en) {
		return enquiryDao.insertReply(sqlSession, en);
	}
	//더보기
	@Override
	public ArrayList<Enquiry> moreEnquiry(Enquiry en) {
		return enquiryDao.moreEnquiry(sqlSession, en);
	}
	
	//조회
	@Override
	public ArrayList<Enquiry> selectEnquiryList(Member m) {
		// TODO Auto-generated method stub
		return enquiryDao.selectEnquiryList(sqlSession,m);
	}
	
	//삭제
	@Override
	public int myQnAdelete(int enquiryNo) {
		// TODO Auto-generated method stub
		return enquiryDao.myQnAdelete(sqlSession,enquiryNo);
	}
	@Override
	public ArrayList<Enquiry> selectqList(Member m) {
		// TODO Auto-generated method stub
		return enquiryDao.selectqList(sqlSession,m);
	}
	
	
	
	
}
