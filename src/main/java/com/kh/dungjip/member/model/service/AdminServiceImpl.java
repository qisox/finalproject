package com.kh.dungjip.member.model.service;

import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.kh.dungjip.member.model.dao.AdminDao;
import com.kh.dungjip.member.model.vo.Member;

@Service
public class AdminServiceImpl implements AdminService {

	@Autowired
	private AdminDao adminDao;
	
	@Autowired
	private SqlSessionTemplate sqlSession;
	
	// 유저 목록 조회
	@Override
	public List<Member> selectMemberList() {
		
		return adminDao.selectMemberList(sqlSession);
	}
	// 유저 상세 정보
	@Override
	public Member getDetailByNo(int userNo) {
		
		return adminDao.getDetailByNo(sqlSession, userNo);
	}
	// 유저 정지
	@Override
	public int banMember(Member member) {
		
		return adminDao.banMember(sqlSession, member);
	}
	// 유저 정지 해제
	@Override
	public int permitMember(Member member) {
		
		return adminDao.permitMember(sqlSession, member);
	}
}
