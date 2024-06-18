package com.kh.dungjip.estate.model.service;

import java.util.ArrayList;
import java.util.List;
import java.util.Map;

import com.kh.dungjip.estate.model.vo.Estate;
import com.kh.dungjip.estate.model.vo.EstateReview;
import com.kh.dungjip.estate.model.vo.Own;
import com.kh.dungjip.house.model.vo.ReservationNew;
import com.kh.dungjip.house.model.vo.Time;
import com.kh.dungjip.member.model.vo.Member;

import com.kh.dungjip.common.model.vo.PageInfo;
import com.kh.dungjip.estate.model.vo.EsReLike;

public interface EstateService {

	//부동산 리스트
	ArrayList<Estate> selectEstateList(int houseNo);

	//조회수 증가
	int increaseCount(int esNo);

	//부동산 상세정보
	Estate estateDetail(int esNo);

	List<Integer> selectSubscribeEstateList();

	//부동산 리뷰 리스트
	ArrayList<EstateReview> selectEstateReviewList(int esNo);

	//부동산 리뷰 총점
	int selectEstateReviewSum(int esNo);

	//부동산 리뷰 개수
	int selectEstateReviewCount(int esNo);

	//각 별의 개수
	int selectEstateFiveStar(int esNo);
	int selectEstateFourStar(int esNo);
	int selectEstateThreeStar(int esNo);
	int selectEstateTwoStar(int esNo);
	int selectEstateOneStar(int esNo);

	//리뷰 공감수
	int selectEstateEmoCount(int esReNo);

	int selectReviewLikeCount(Map<String, Object> map);

	int decreaseCount(Map<String, Object> map);

	int increaseEsReLikeCount(Map<String, Object> map);

	//예약 시간 select
	ArrayList<Time> selectTime();

	//리뷰 작성
	int insertEstateReview( Map<String, Object> paramMap);


	//조회
	ArrayList<EstateReview> selectEstateReview(Member m,PageInfo pi);

	//삭제
	int esReviewDelete(int esReNo);

	//수정
	int updateReview(int esReNo, int esReScore, String esReContent);
	
	//부동산 리뷰 상세
	EstateReview estateReviewDetail(int esReNo);

	//부동산 리뷰 수정
	int updateEstateReview(Map<String, Object> paramMap);

	//중개사리뷰공감
	ArrayList<EsReLike> memberMypageReviewLike(Member m, PageInfo pi);

	//중개사리뷰공감페이징
	int selectEstateListCountByMember(Member m);

	//공감삭제
	int myEsReviewDelete(int esReNo);

	//예약기능
	int insertReservation(ReservationNew reservation);

	//예약 날짜 눌렀을때 데이터 있는지 확인
	ArrayList<ReservationNew> selectReservationList(ReservationNew reservation);

	//마이페이지 중개사 리뷰 페이징
	int selectListCount();

	//마이페이지 매물내역
	int selectEstate(int esNo);

	int getEsNo(int userNo);

	//신고내역 페이징
	int selectReportEstateListCount();

	//마이페이지 중개사무소 정보수정
	ArrayList<Estate> mypageEstateUpdate(Member m);

	//중개인 매물내역 삭제 
	int myEstateHouseDelete(Own o);

	//중개인페이지
	ArrayList<Estate> myEspage(Member m);

	//마이페이지 - 예약 삭제
	int deleteReview(int reservationNo);

}
