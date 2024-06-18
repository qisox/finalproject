package com.kh.dungjip.member.model.dao;

import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.stereotype.Repository;

import com.kh.dungjip.member.model.vo.Member;

@Repository
public class AdminDao {

	public List<Member> selectMemberList(SqlSessionTemplate sqlSession) {

		return sqlSession.selectList("memberMapper.selectMemberList");
	}

	public Member getDetailByNo(SqlSessionTemplate sqlSession, int userNo) {
		
		return sqlSession.selectOne("memberMapper.getDetailByNo", userNo);
	}
	
	public int banMember(SqlSessionTemplate sqlSession, Member member) {
		
		return sqlSession.update("memberMapper.banMember", member);
	}

	public int permitMember(SqlSessionTemplate sqlSession, Member member) {
		
		return sqlSession.update("memberMapper.permitMember", member);
	}

}
