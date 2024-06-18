package com.kh.dungjip.common.websocket.model.dao;

import java.util.ArrayList;
import java.util.Map;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.stereotype.Repository;

import com.kh.dungjip.common.report.model.vo.ReportEstate;
import com.kh.dungjip.common.websocket.model.vo.ChatMessage;
import com.kh.dungjip.common.websocket.model.vo.ChatRoom;
import com.kh.dungjip.common.websocket.model.vo.JoinChat;
import com.kh.dungjip.member.model.vo.Member;
@Repository
public class ChatDao {

	public Member clickIndividualEstate(SqlSessionTemplate sqlSession, int mno) {

		return (Member)sqlSession.selectOne("chatMapper.clickIndividualEstate", mno);
	}

	public ArrayList<ChatRoom> chatRoomList(SqlSessionTemplate sqlSession, int userNo) {//채팅방 리스트
		ArrayList<ChatRoom> chatRooms = (ArrayList)sqlSession.selectList("chatMapper.chatRoomList", userNo);


		  for (ChatRoom chatRoom : chatRooms) {
		        if (chatRoom.getMembers() != null) {
		            for (Member member : chatRoom.getMembers()) {
		               
		            	boolean activeStatus = member.isActive();
		              
		            	String timeAgo = member.calculateTimeAgo();
		              
		            	member.setActive(activeStatus);
		            }
		        }
		    }
		 return chatRooms;
	}

	public ArrayList<ChatMessage> selectChatMsg(SqlSessionTemplate sqlSession, int cno) {//이전 대화 불러오는 기능


		return (ArrayList)sqlSession.selectList("chatMapper.selectChatMsg",cno);
		
	}

	public int updateChatRoomMsg(SqlSessionTemplate sqlSession, ChatMessage c) {//해당채팅방 대화내용 저장 
	
		
		return sqlSession.insert("chatMapper.updateChatRoomMsg",c);
	}

	public int createChatRoom(SqlSessionTemplate sqlSession, JoinChat createRoom) {//채팅방 만들기
		// TODO Auto-generated method stub
		return sqlSession.insert("chatMapper.createChatRoom", createRoom);
	}
	public int nowCreateChatRoomMe(SqlSessionTemplate sqlSession, int loginUserNo) {//내가 생성한방 joinChat 테이블에 등록

		return sqlSession.insert("chatMapper.nowCreateChatRoomMe",loginUserNo);
	}
	public int joinNowCreateChatRoom(SqlSessionTemplate sqlSession, int estateUserNo) {//joinChat테이블에 상대방 등록
		// TODO Auto-generated method stub
		return sqlSession.insert("chatMapper.joinNowCreateChatRoom",estateUserNo);
	}
	public int alreadyUsedChatRoomCheck(SqlSessionTemplate sqlSession, JoinChat c) {//채팅방 생성시 이미 채팅방이 존재하면 생성 x 
		// TODO Auto-generated method stub
		return sqlSession.selectOne("chatMapper.alreadyUsedChatRoomCheck", c);
	}

	public ArrayList<ChatRoom> findChat(SqlSessionTemplate sqlSession, ChatRoom c) {//seacrh창에 채팅방 이름 검색하면 나오게
		// TODO Auto-generated method stub
		return (ArrayList)sqlSession.selectList("chatMapper.findChat", c);
	}

	public int updateReportEstate(SqlSessionTemplate sqlSession, ReportEstate reportEstate) {//신고 하기
		// TODO Auto-generated method stub
		return sqlSession.insert("chatMapper.updateReportEsate", reportEstate);
	}

	public int deleteJoinChatRoom(SqlSessionTemplate sqlSession, int chatNo) {// 마우스 우클릭시 채팅방 삭제

	
		
		return sqlSession.delete("chatMapper.deleteJoinChatRoom", chatNo);
	}

	public int delteChatMsg(SqlSessionTemplate sqlSession, int chatNo) {
		// TODO Auto-generated method stub
		return sqlSession.delete("chatMapper.deleteChatMsg",chatNo);
	}

	public int deleteChatRoom(SqlSessionTemplate sqlSession, int chatNo) {
		// TODO Auto-generated method stub
		return sqlSession.delete("chatMapper.deleteChatRoom", chatNo);
	}

	
	 public int pileUpMsg(SqlSessionTemplate sqlSession, ChatMessage cm) {
		
		 return sqlSession.update("chatMapper.pileUpMsg",cm);
	  }

	public int nowFileUpMsg(SqlSessionTemplate sqlSession, Map<String, Object> map) {
		// TODO Auto-generated method stub
		return sqlSession.selectOne("chatMapper.nowFileUpMsg", map);
	}

	public int reportCount(SqlSessionTemplate sqlSession, int eno) {
		// TODO Auto-generated method stub
		return sqlSession.selectOne("chatMapper.reportCount",eno);
	}
	  
	 

}
