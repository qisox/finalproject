package com.kh.dungjip.common.websocket.model.vo;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

@AllArgsConstructor
@NoArgsConstructor
@Data
public class JoinChat {

	private int chatRoomNo;
	private int loginUserNo;
	private int estateuserNo;
	private String estateUserName;
	
	
	public JoinChat(int loginUserNo, String estateUserName) {
		super();
		this.loginUserNo = loginUserNo;
		this.estateUserName = estateUserName;
	}


	public JoinChat(int loginUserNo, int estateuserNo) {
		super();
		this.loginUserNo = loginUserNo;
		this.estateuserNo = estateuserNo;
	}
	
	
	
}
