package com.kh.dungjip.notice.model.service;

import java.util.List;

import com.kh.dungjip.notice.model.vo.Notice;

public interface NoticeService {

	// 공지사항 목록
	List<Notice> selectList();
	// 조회수 증가
	void increaseCount(int noticeNo);
	// 공지사항 상세보기
	Notice getNoticeByNo(int noticeNo);
	// 공지사항 작성하기
	int insertNotice(Notice notice);
	// 공지사항 수정 시 데이터 가져오기
	Notice getNoticeByNoticeNo(int noticeNo);
	// 공지사항 수정하기
	int updateNotice(Notice notice);
	// 공지사항 삭제하기
	int deleteNotice(Notice notice);

}
