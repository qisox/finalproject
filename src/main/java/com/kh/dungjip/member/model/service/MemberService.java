package com.kh.dungjip.member.model.service;

import java.util.ArrayList;

import com.kh.dungjip.common.model.vo.PageInfo;
import com.kh.dungjip.estate.model.vo.Estate;
import com.kh.dungjip.house.model.vo.Reservation;
import com.kh.dungjip.member.model.vo.Member;

public interface MemberService {
	
	//로그인 처리 
	Member loginMember(Member m);

	//아이디 중복체크 (임대인/임차인)
	int ajaxIdMethod(String userId);
	
	//회원가입 메소드 (임대인/임차인)
	int insertMember(Member m);

	//회원가입 메소드 (사용자폼에추가)
	int esInsertMember(Member m);

	//아이디 중복체크(중개인)
	int esajaxIdMethod(String userId);
	
	//번호 중복체크 (중개인)
	int exajaxphoneMethod(String phone);
	
	//회원가입 메소드 (중개인폼추가)
	int insertEsMember(Estate e);

	//userId를 이용해서 uno 데이고오기
	int userNum(String userId);

	//번호 중복체크 (임대인/임차인)
	int ajaxphoneMethod(String phone);
	
	//닉네임 중복 체크
	int ajaxnickname(String userNickName);

	//아이디 찾기
	Member memberFindId(Member m);

	//비밀번호 찾기 
	int memberFindPwd(Member m);

	//새로 부여받은 비밀번호 update 
	void updateMemberPwd(Member m);

	//회원 탈퇴
	int memberDelete(String userId);

	//비밀번호 변경
	int memberPwdUpdate(Member member);

	//회원 정보 수정
	int mypageUpdate(Member m);

	int userSubscribe(int userNo);

	int updateLastLoginTime(Member beginLoginUser);

	Member loginMemberPlusCurrentTime(Member beginLoginUser);
	
	int LastLogoutTime(int userNo);

	Member findSubscribeUser(int userNo);

	int noSubscribe(int userNo);
	//예약 내역
	ArrayList<Reservation> selectReservation(Member loginUser);

	//프로필 사진 수정
	int fileAjaxMethod(Member m);

	//마이페이지 예약내역 4개 리스트 뽑는 용도
	ArrayList<Reservation> selectReservationList(Member m);

	//중개사무소 수정
	int mypageEstateUpdate(Estate elist);

	//중개인 예약내역
	ArrayList<Reservation> membermypageEsReservation(Integer esNo,PageInfo pi);


}
