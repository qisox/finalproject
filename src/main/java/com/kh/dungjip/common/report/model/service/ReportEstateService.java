package com.kh.dungjip.common.report.model.service;

import java.util.ArrayList;
import java.util.List;

import com.kh.dungjip.common.model.vo.PageInfo;
import com.kh.dungjip.common.report.model.vo.ReportEstate;
import com.kh.dungjip.common.websocket.model.vo.ChatMessage;
import com.kh.dungjip.member.model.vo.Member;

public interface ReportEstateService {

	List<ReportEstate> selectReportList();

	List<ChatMessage> selectChatHistory(int chatRoomNo);

	void increaseMemberCount(int chatRoomNo);

	void updateReportStatus(int chatRoomNo);

	//신고내역 리스트
	ArrayList<ReportEstate> memberMypageReportEstateList(Member m, PageInfo pi);
}
