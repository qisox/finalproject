package com.kh.dungjip.member.model.service;

import java.util.ArrayList;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.kh.dungjip.common.model.vo.PageInfo;
import com.kh.dungjip.estate.model.vo.Estate;
import com.kh.dungjip.house.model.vo.Reservation;
import com.kh.dungjip.member.model.dao.MemberDao;
import com.kh.dungjip.member.model.vo.Member;

@Service //해당 클래스를 service의 역할로 사용
public class MemberServiceImpl implements MemberService{
	
	@Autowired
	private MemberDao memberDao;
	
	@Autowired
	private SqlSessionTemplate sqlSession;

	//로그인 처리 
	@Override
	public Member loginMember(Member m) {
		return memberDao.loginMember(sqlSession, m);
	}
	
	
	//아이디 중복 체크 (임대인/임차인)
	@Override
	public int ajaxIdMethod(String userId) {
		// TODO Auto-generated method stub
		return memberDao.ajaxIdMethod(sqlSession,userId);
	}

	
	//회원가입 메소드 (임대인/임차인)
	@Override
	public int insertMember(Member m) {
		// TODO Auto-generated method stub
		return memberDao.insertMember(sqlSession,m);
	}


	//회원가입 메소드 (사용자폼에추가)
	@Override
	public int esInsertMember(Member m) {
		// TODO Auto-generated method stub
		return memberDao.esInsertMember(sqlSession,m);
	}

	//아이디 중복 체크(중개인)
	@Override
	public int esajaxIdMethod(String userId) {
		// TODO Auto-generated method stub
		return memberDao.esajaxIdMethod(sqlSession,userId);
	}

	//번호 중복 체크(중개인)
	@Override
	public int exajaxphoneMethod(String phone) {
		// TODO Auto-generated method stub
		return memberDao.exajaxphoneMethod(sqlSession,phone);
	}
	
	//회원가입 메소드 (중개인폼에추가)
	@Override
	public int insertEsMember(Estate e) {
				
		return memberDao.insertEsMember(sqlSession,e);
	}


	//userID를 이용하여 userNo 데려오기
	@Override
	public int userNum(String userId) {
		// TODO Auto-generated method stub
		return memberDao.userNum(sqlSession,userId);
	}

	//번호 중복 체크(임대인/임차인)
	@Override
	public int ajaxphoneMethod(String phone) {
		// TODO Auto-generated method stub
		return memberDao.ajaxphoneMethod(sqlSession,phone);
	}
	
	//닉네임 중복 체크
	@Override
	public int ajaxnickname(String userNickName) {
		// TODO Auto-generated method stub
		return memberDao.ajaxnickname(sqlSession,userNickName);
	}

	//아이디 찾기
	@Override
	public Member memberFindId(Member m) {
		// TODO Auto-generated method stub
		return memberDao.memberFindId(sqlSession,m);
	}

	//비밀번호 찾기 
	@Override
	public int memberFindPwd(Member m) {
		// TODO Auto-generated method stub
		return memberDao.memberFindPwd(sqlSession,m);
	}

	//새로 부여받은 비밀번호 update
	@Override
	public void updateMemberPwd(Member m) {
		// TODO Auto-generated method stub
		String newPwd = m.getUserPwd(); //새로운 암호화된 비밀번호 가져오기 
		
		memberDao.updateMemberPwd(sqlSession, m);
	}

	//회원 탈퇴
	@Override
	public int memberDelete(String userId) {
		// TODO Auto-generated method stub
		return memberDao.memberDelete(sqlSession,userId);
	}

	//비밀번호 변경
	@Override
	public int memberPwdUpdate(Member member) {
		// TODO Auto-generated method stub
		return memberDao.memberPwdUpdate(sqlSession,member);
	}

	//회원정보 수정
	@Override
	public int mypageUpdate(Member m) {
		// TODO Auto-generated method stub
		return memberDao.mypageUpdate(sqlSession,m);
	}

	@Override
	public int userSubscribe(int userNo) {
		int result = memberDao.userSubscribe(sqlSession, userNo);
		
		return result;
	}

	@Override
	public int updateLastLoginTime(Member loginUser) {

		
		return memberDao.updateLastLoginTime(sqlSession,loginUser);
	}

	@Override
	public Member loginMemberPlusCurrentTime(Member beginLoginUser) {

		
		return memberDao.loginMemberPlusCurrentTime(sqlSession,beginLoginUser);
	}
	@Override
	public int LastLogoutTime(int userNo) {//로그아웃 할떄의 시간
		// TODO Auto-generated method stub
		return memberDao.LastLogoutTime(sqlSession,userNo);
	}

	//프로필 사진 수정
	@Override
	public int fileAjaxMethod(Member m) {
		// TODO Auto-generated method stub
		return memberDao.fileAjaxMethod(sqlSession,m);
	}

	//예약 내역
	@Override
	public ArrayList<Reservation> selectReservation(Member loginUser) {
		
		return memberDao.selectReservation(sqlSession,loginUser);
	}

	//마이페이지 예약내역 4개 리스트 띄울 용도
	@Override
	public ArrayList<Reservation> selectReservationList(Member m) {
		// TODO Auto-generated method stub
		return memberDao.selectReservationList(sqlSession,m);
	}

	//중개사무소 정보수정
	@Override
	public int mypageEstateUpdate(Estate elist) {
		// TODO Auto-generated method stub
		return memberDao.mypageEstateUpdate(sqlSession,elist);
	}

	//중개인 예약내역
	@Override
	public ArrayList<Reservation> membermypageEsReservation(Integer esNo,PageInfo pi) {
		// TODO Auto-generated method stub
		return memberDao.membermypageEsReservation(sqlSession,esNo,pi);
	}

	@Override
	public Member findSubscribeUser(int userNo) {
		// TODO Auto-generated method stub
		return memberDao.findSubscribeUser(sqlSession, userNo);
	}


	@Override
	public int noSubscribe(int userNo) {
		// TODO Auto-generated method stub
		return memberDao.noSubscribe(sqlSession, userNo);
	}



	

}
