package com.kh.dungjip.common.report.model.dao;

import java.util.ArrayList;
import java.util.List;

import org.apache.ibatis.session.RowBounds;
import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.stereotype.Repository;

import com.kh.dungjip.common.model.vo.PageInfo;
import com.kh.dungjip.common.report.model.vo.ReportEstate;
import com.kh.dungjip.common.websocket.model.vo.ChatMessage;
import com.kh.dungjip.member.model.vo.Member;

@Repository
public class ReportEstateDao {

	public List<ReportEstate> selectReportList(SqlSessionTemplate sqlSession) {
		
		return sqlSession.selectList("chatMapper.selectReportList");
	}

    public List<ChatMessage> selectChatHistory(SqlSessionTemplate sqlSession, int chatRoomNo) {
        return sqlSession.selectList("chatMapper.selectChatHistory", chatRoomNo);
    }

	public void increaseMemberCount(SqlSessionTemplate sqlSession, int chatRoomNo) {
		// TODO Auto-generated method stub
		sqlSession.update("chatMapper.increaseMemberCount", chatRoomNo);
	}

	public void updateReportStatus(SqlSessionTemplate sqlSession, int chatRoomNo) {
		// TODO Auto-generated method stub
		sqlSession.update("chatMapper.updateReportStatus", chatRoomNo);
	}

	//신고내역 리스트
	public ArrayList<ReportEstate> memberMypageReportEstateList(SqlSessionTemplate sqlSession, Member m, PageInfo pi) {
		
		int limit = pi.getBoardLimit();
		
		int offset = (pi.getCurrentPage()-1)*limit;
		
		RowBounds rowBounds = new RowBounds(offset,limit);
		
		return (ArrayList)sqlSession.selectList("estateMapper.memberMypageReportEstateList", m, rowBounds);
	}

}
