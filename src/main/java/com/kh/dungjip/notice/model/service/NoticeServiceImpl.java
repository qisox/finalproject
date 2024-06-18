package com.kh.dungjip.notice.model.service;

import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.kh.dungjip.notice.model.dao.NoticeDao;
import com.kh.dungjip.notice.model.vo.Notice;

@Service
public class NoticeServiceImpl implements NoticeService {

	@Autowired
	private NoticeDao noticeDao;
	
	@Autowired
	private SqlSessionTemplate sqlSession;

	// 공지사항 목록
	@Override
	public List<Notice> selectList() {
		
		return noticeDao.selectList(sqlSession);
	}

	// 조회수 증가
    @Override
    public void increaseCount(int noticeNo) {
    	
        noticeDao.increaseCount(sqlSession, noticeNo);
    }
    // 공지사항 상세보기
    @Override
    public Notice getNoticeByNo(int noticeNo) {

    	return noticeDao.getNoticeByNo(sqlSession, noticeNo);
    }
	// 공지사항 작성하기
	@Override
	public int insertNotice(Notice notice) {
		
		return noticeDao.insertNotice(sqlSession, notice);
	}
	// 공지사항 수정하기
	@Override
	public int updateNotice(Notice notice) {
		
		return noticeDao.updateNotice(sqlSession, notice);
	}
	// 공지사항 수정 시 데이터 가져오기
	@Override
	public Notice getNoticeByNoticeNo(int noticeNo) {
		
		return noticeDao.getNoticeByNoticeNo(sqlSession, noticeNo);
	}
	// 공지사항 삭제하기
	@Override
	public int deleteNotice(Notice notice) {
		
		return noticeDao.deleteNotice(sqlSession, notice);
	}



}
