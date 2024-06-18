package com.kh.dungjip.common.report.model.vo;

import com.kh.dungjip.member.model.vo.Member;

import lombok.AllArgsConstructor;
import lombok.Builder;
import lombok.Data;
import lombok.NoArgsConstructor;

@NoArgsConstructor
@AllArgsConstructor
@Data
public class ReportEstate {
private int reportNo;
private int userNo;
private int chatRoomNo;
private int esNo;
private String reportReason;
private String esName;
private String userName;

private Member user;  // 사용자 정보를 담는 Member 객체
private Member estate;  // 부동산 정보를 담는 Member 객체

	public ReportEstate(int userNo, int chatRoomNo, int esNo, String reportReason) {
		super();
		this.userNo = userNo;
		this.chatRoomNo = chatRoomNo;
		this.esNo = esNo;
		this.reportReason = reportReason;
	}

}
