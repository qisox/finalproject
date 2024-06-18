package com.kh.dungjip.member.model.dao;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.Map;

import org.apache.ibatis.session.RowBounds;
import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.stereotype.Repository;

import com.kh.dungjip.common.model.vo.PageInfo;
import com.kh.dungjip.estate.model.vo.Estate;
import com.kh.dungjip.house.model.vo.Reservation;
import com.kh.dungjip.member.model.vo.Member;

@Repository
public class MemberDao {
	
	//로그인
	public Member loginMember(SqlSessionTemplate sqlSession, Member m) {
		return sqlSession.selectOne("memberMapper.loginMember", m);
	}
	
	//아이디 중복체크 (임대인/임차인)
	public int ajaxIdMethod(SqlSessionTemplate sqlSession, String userId) {
		// TODO Auto-generated method stub
		return sqlSession.selectOne("memberMapper.ajaxIdMethod", userId);
	}

	//회원가입 메소드 (임대인/임차인)
	public int insertMember(SqlSessionTemplate sqlSession, Member m) {
		// TODO Auto-generated method stub
		return sqlSession.insert("memberMapper.insertMember", m);
	}

	//회원가입 메소드(사용자 폼에 추가)
	public int esInsertMember(SqlSessionTemplate sqlSession, Member m) {
		// TODO Auto-generated method stub
		return sqlSession.insert("memberMapper.esInsertMember", m);
	}

	//아이디 중복체크(중개인)
	public int esajaxIdMethod(SqlSessionTemplate sqlSession, String userId) {
		// TODO Auto-generated method stub
		return sqlSession.selectOne("memberMapper.esajaxIdMethod", userId);
	}

	//회원가입 메소드(중개인 폼에 추가)
	public int insertEsMember(SqlSessionTemplate sqlSession, Estate e) {
		// TODO Auto-generated method stub
		return sqlSession.insert("memberMapper.insertEsMember", e);
	}


	//userId를 이용하여 uno데리고오기
	public int userNum(SqlSessionTemplate sqlSession, String userId) {
		// TODO Auto-generated method stub
		return sqlSession.selectOne("memberMapper.userNum", userId);
	}

	//번호 중복체크(중개인)
	public int exajaxphoneMethod(SqlSessionTemplate sqlSession, String phone) {
		// TODO Auto-generated method stub
		return sqlSession.selectOne("memberMapper.exajaxphoneMethod", phone);
	}

	//번호 중복체크(임대인/임차인)
	public int ajaxphoneMethod(SqlSessionTemplate sqlSession, String phone) {
		// TODO Auto-generated method stub
		return sqlSession.selectOne("memberMapper.ajaxphoneMethod", phone);
	}
	
	//닉네임 중복체크
	public int ajaxnickname(SqlSessionTemplate sqlSession, String userNickName) {
		// TODO Auto-generated method stub
		return sqlSession.selectOne("memberMapper.ajaxnickname", userNickName);
	}
	
	//로그인시 현재시간 집어넣기
	public int updateLastLoginTime(SqlSessionTemplate sqlSession, Member loginUser) {
		// TODO Auto-generated method stub
		return sqlSession.update("memberMapper.updateLastLoginTime", loginUser);
	}

	public Member loginMemberPlusCurrentTime(SqlSessionTemplate sqlSession, Member beginLoginUser) {
		// TODO Auto-generated method stub
		Member member = sqlSession.selectOne("memberMapper.loginMember", beginLoginUser);
		
		member.setActive(member.isActive());
		
		return member;
	}

	public int LastLogoutTime(SqlSessionTemplate sqlSession, int userNo) {
		// TODO Auto-generated method stub
		return sqlSession.update("memberMapper.lastLogoutTime", userNo);
	}

	//아이디 찾기 
	public Member memberFindId(SqlSessionTemplate sqlSession, Member m) {
		// TODO Auto-generated method stub
		return sqlSession.selectOne("memberMapper.memberFindId", m);
	}

	//비밀번호 찾기 
	public int memberFindPwd(SqlSessionTemplate sqlSession, Member m) {
		// TODO Auto-generated method stub
		return sqlSession.selectOne("memberMapper.memberFindPwd", m);
	}

	//새로 발급받은 비밀번호 update
	public void updateMemberPwd(SqlSessionTemplate sqlSession,Member m) {
		// TODO Auto-generated method stub
		sqlSession.update("memberMapper.updateMemberPwd",m);
	}

	//회원 탈퇴
	public int memberDelete(SqlSessionTemplate sqlSession, String userId) {
		// TODO Auto-generated method stub
		return sqlSession.delete("memberMapper.memberDelete", userId);
	}

	//비밀번호 변경
	public int memberPwdUpdate(SqlSessionTemplate sqlSession,Member member) {
		
    		Map<String, Object> mpwd = new HashMap<>();
    		mpwd.put("member", member);

	    return sqlSession.update("memberMapper.memberPwdUpdate", member);	
	}

	//회원 정보 수정 
	public int mypageUpdate(SqlSessionTemplate sqlSession, Member m) {
		// TODO Auto-generated method stub
		return sqlSession.update("memberMapper.mypageUpdate", m);
	}


	public int userSubscribe(SqlSessionTemplate sqlSession, int userNo) {
		return sqlSession.update("memberMapper.userSubscribe", userNo);
	}

	public Member findSubscribeUser(SqlSessionTemplate sqlSession, int userNo) {
		// TODO Auto-generated method stub
		return sqlSession.selectOne("memberMapper.findSubscribeUser", userNo);
	}

	public int noSubscribe(SqlSessionTemplate sqlSession, int userNo) {
		// TODO Auto-generated method stub
		return sqlSession.update("memberMapper.noSubscribe", userNo);
	}

	//예약 내역
	public ArrayList<Reservation> selectReservation(SqlSessionTemplate sqlSession, Member loginUser) {				
		
		return (ArrayList)sqlSession.selectList("memberMapper.selectReservation",loginUser);
	}

	//프로필 사진 수정
	public int fileAjaxMethod(SqlSessionTemplate sqlSession, Member m) {
		// TODO Auto-generated method stub
		return sqlSession.update("memberMapper.fileAjaxMethod", m);
	}

	//마이페이지 예약내역 페이징
	public int selectListCount(SqlSessionTemplate sqlSession) {
		// TODO Auto-generated method stub
		return sqlSession.selectOne("memberMapper.selectListCount", sqlSession);
	}

	//마이페이지 예약내역 4개 리스트 띄울 용도
	public ArrayList<Reservation> selectReservationList(SqlSessionTemplate sqlSession, Member m) {
		// TODO Auto-generated method stub
		return (ArrayList)sqlSession.selectList("memberMapper.selectReservation", m);
	}

	public int mypageEstateUpdate(SqlSessionTemplate sqlSession, Estate elist) {
		// TODO Auto-generated method stub
		return sqlSession.update("memberMapper.mypageEstateUpdate", elist);
	}

	//중개인 예약내역
	public ArrayList<Reservation> membermypageEsReservation(SqlSessionTemplate sqlSession, Integer esNo, PageInfo pi) {
		// TODO Auto-generated method stub
		//몇개를 보여줄지
		int limit = pi.getBoardLimit();
		//몇개를 건너뛸지
		int offset = (pi.getCurrentPage()-1)* limit;		
		
		RowBounds rowBounds = new RowBounds(offset,limit);
				
		return (ArrayList)sqlSession.selectList("memberMapper.membermypageEsReservation",esNo,rowBounds);
	}

	
}
