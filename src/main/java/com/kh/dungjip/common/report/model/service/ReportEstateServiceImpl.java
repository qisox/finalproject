package com.kh.dungjip.common.report.model.service;

import java.util.ArrayList;
import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.kh.dungjip.common.model.vo.PageInfo;
import com.kh.dungjip.common.report.model.dao.ReportEstateDao;
import com.kh.dungjip.common.report.model.vo.ReportEstate;
import com.kh.dungjip.common.websocket.model.vo.ChatMessage;
import com.kh.dungjip.member.model.vo.Member;

@Service
public class ReportEstateServiceImpl implements ReportEstateService {

	@Autowired
	private ReportEstateDao reportEstateDao;
	
	@Autowired
	private SqlSessionTemplate sqlSession;

	@Override
	public List<ReportEstate> selectReportList() {
		
		return reportEstateDao.selectReportList(sqlSession);
	}

	@Override
	public List<ChatMessage> selectChatHistory(int chatRoomNo) {
		
		return reportEstateDao.selectChatHistory(sqlSession, chatRoomNo);
	}

	@Override
	@Transactional
	public void increaseMemberCount(int chatRoomNo) {
		// TODO Auto-generated method stub
		reportEstateDao.increaseMemberCount(sqlSession, chatRoomNo);
	}

	@Override
	@Transactional
	public void updateReportStatus(int chatRoomNo) {
		// TODO Auto-generated method stub
		reportEstateDao.updateReportStatus(sqlSession, chatRoomNo);
	}

	//신고내역 리스트
	@Override
	public ArrayList<ReportEstate> memberMypageReportEstateList(Member m, PageInfo pi) {
		// TODO Auto-generated method stub
		return reportEstateDao.memberMypageReportEstateList(sqlSession,m,pi);
	}
}
