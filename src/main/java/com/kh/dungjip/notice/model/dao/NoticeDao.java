package com.kh.dungjip.notice.model.dao;

import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.stereotype.Repository;

import com.kh.dungjip.notice.model.vo.Notice;

@Repository
public class NoticeDao {

	// 공지사항 목록
	public List<Notice> selectList(SqlSessionTemplate sqlSession) {
		
		return sqlSession.selectList("noticeMapper.selectList");
	}
	// 조회수 증가
	public void increaseCount(SqlSessionTemplate sqlSession, int noticeNo) {
		
		sqlSession.update("noticeMapper.increaseCount", noticeNo);
	}
	// 공지사항 상세보기
	public Notice getNoticeByNo(SqlSessionTemplate sqlSession, int noticeNo) {
		
		return sqlSession.selectOne("noticeMapper.getNoticeByNo", noticeNo);
	}
	// 공지사항 작성
	public int insertNotice(SqlSessionTemplate sqlSession, Notice notice) {
		
		return sqlSession.insert("noticeMapper.insertNotice", notice);
	}
	// 공지사항 수정 시 데이터 가져오기
	public Notice getNoticeByNoticeNo(SqlSessionTemplate sqlSession, int noticeNo) {
		
		return sqlSession.selectOne("noticeMapper.getNoticeByNoticeNo", noticeNo);
	}
	// 공지사항 수정
	public int updateNotice(SqlSessionTemplate sqlSession, Notice notice) {

		return sqlSession.update("noticeMapper.updateNotice", notice);
	}
	// 공지사항 삭제
	public int deleteNotice(SqlSessionTemplate sqlSession, Notice notice) {
		
		return sqlSession.update("noticeMapper.deleteNotice", notice);
	}

}
