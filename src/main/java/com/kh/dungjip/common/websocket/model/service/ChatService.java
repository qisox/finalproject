
package com.kh.dungjip.common.websocket.model.service;

import java.util.ArrayList;
import java.util.Map;

import com.kh.dungjip.common.report.model.vo.ReportEstate;
import com.kh.dungjip.common.websocket.model.vo.ChatMessage;
import com.kh.dungjip.common.websocket.model.vo.ChatRoom;
import com.kh.dungjip.common.websocket.model.vo.JoinChat;
import com.kh.dungjip.member.model.vo.Member;

public interface ChatService {
	ArrayList<ChatRoom> chatRoomList(int userNo);//채팅방 리스트

	ArrayList<ChatMessage> selectChatMsg(int cno);//해당 채팅방 대화내용 불러옴

	int updateChatRoomMsg(ChatMessage c);

	Member clickIndividualEstate(int mno);

	int createChatRoom(JoinChat createRoom);//로그인유저가 방을 만들고 

	int joinNowCreateChatRoom(int estateUserNo);//바로 대상자 조인

	int nowCreateChatRoomMe(int loginUserNo);

	int alreadyUsedChatRoomCheck(JoinChat c);

	ArrayList<ChatRoom> findChat(ChatRoom c);

	int updateReportEstate(ReportEstate reportEstate);

	int deleteJoinChatRoom(int chatNo);

	int deleteChatRoom(int chatNo);

	int deleteChatMsg(int chatNo);

	 int pileUpMsg(ChatMessage cm);

	int nowFileUpMsg(Map<String, Object> map);

	int reportCount(int eno); 

	
}
