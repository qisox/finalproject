package com.kh.dungjip.common.websocket.model.vo;

import java.util.List;

import com.kh.dungjip.estate.model.vo.Estate;
import com.kh.dungjip.member.model.vo.Member;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

@AllArgsConstructor
@NoArgsConstructor
@Data
public class ChatRoom {

	private int chatRoomNo;
	private int userNo;
	private String chatRoomName;
	private String chatRoomCreate;
	private String status;
	
	private List<Member> members;

	private List<Estate> estates;
	
	public ChatRoom(int userNo, String chatRoomName) {
		super();
		this.userNo = userNo;
		this.chatRoomName = chatRoomName;
	}
	
	
	
	
	
}
