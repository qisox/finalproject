package com.kh.dungjip.member.model.service;

import java.util.List;

import com.kh.dungjip.member.model.vo.Member;

public interface AdminService {
	// 유저 정보 조회
	List<Member> selectMemberList();
	// 유저 상세 정보
	Member getDetailByNo(int userNo);
	// 회원 정지
	int banMember(Member member);
	// 회원 정지 해제
	int permitMember(Member member);
	
}
