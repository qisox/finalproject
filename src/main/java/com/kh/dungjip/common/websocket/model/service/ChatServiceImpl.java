
package com.kh.dungjip.common.websocket.model.service;

import java.util.ArrayList;
import java.util.Map;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.kh.dungjip.common.report.model.vo.ReportEstate;
import com.kh.dungjip.common.websocket.model.dao.ChatDao;
import com.kh.dungjip.common.websocket.model.vo.ChatMessage;
import com.kh.dungjip.common.websocket.model.vo.ChatRoom;
import com.kh.dungjip.common.websocket.model.vo.JoinChat;
import com.kh.dungjip.member.model.vo.Member;

@Service
public class ChatServiceImpl implements ChatService {

	@Autowired
	private ChatDao chatDao;

	@Autowired

	private SqlSessionTemplate sqlSession;

	@Override
	public Member clickIndividualEstate(int mno) {

		return chatDao.clickIndividualEstate(sqlSession,mno);
	}
	@Override
	public int alreadyUsedChatRoomCheck(JoinChat c) {//이미 두유저간 채팅방이 존재할때 막아주는 메소드
		
		
		return chatDao.alreadyUsedChatRoomCheck(sqlSession,c);
	}
	@Override
	public int createChatRoom(JoinChat createRoom) {

		return chatDao.createChatRoom(sqlSession,createRoom);
	}
	@Override
	public int nowCreateChatRoomMe(int loginUserNo) {

		return chatDao.nowCreateChatRoomMe(sqlSession,loginUserNo);
	}
	@Override
	public int joinNowCreateChatRoom(int estateUserNo) {
		// TODO Auto-generated method stub
		return chatDao.joinNowCreateChatRoom(sqlSession,estateUserNo);
	}
	@Override//
	public ArrayList<ChatRoom> chatRoomList(int userNo) {//사용장의 현재 채팅방 리스트를 뽑아오는 메소드
		
		return chatDao.chatRoomList(sqlSession,userNo);
	}
	@Override
	public ArrayList<ChatMessage> selectChatMsg(int cno) {//기존 채팅방의 메세지 받아오는 메소드
		
		
		return  chatDao.selectChatMsg(sqlSession,cno);
	}
	@Override
	public int updateChatRoomMsg(ChatMessage c) {

		
		return chatDao.updateChatRoomMsg(sqlSession, c);
	}
	@Override
	public ArrayList<ChatRoom> findChat(ChatRoom c) {// 검색으로 채팅방 찾기
		
		return chatDao.findChat(sqlSession,c);
	}
	@Override
	public int updateReportEstate(ReportEstate reportEstate) {//채팅중 신고
		
		
		return chatDao.updateReportEstate(sqlSession,reportEstate);
	}
	@Override
	public int deleteJoinChatRoom(int chatNo) {
		
		return chatDao.deleteJoinChatRoom(sqlSession,chatNo);
	}
	@Override
	public int deleteChatMsg(int chatNo) {

		
		return chatDao.delteChatMsg(sqlSession,chatNo);
	}

	@Override
	public int deleteChatRoom(int chatNo) {
		// TODO Auto-generated method stub
		return chatDao.deleteChatRoom(sqlSession, chatNo);
	}
	@Override
	public int pileUpMsg(ChatMessage cm) {
		// TODO Auto-generated method stub
		return chatDao.pileUpMsg(sqlSession,cm);
	}
	@Override
	public int nowFileUpMsg(Map<String, Object> map) {
		// TODO Auto-generated method stub
		return chatDao.nowFileUpMsg(sqlSession, map);
	}
	@Override
	public int reportCount(int eno) { //공인중개사 신고 카운트 많으면 짜르게
		// TODO Auto-generated method stub
		return chatDao.reportCount(sqlSession,eno);
	}

}
