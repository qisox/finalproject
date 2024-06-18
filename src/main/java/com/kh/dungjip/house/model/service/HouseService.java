package com.kh.dungjip.house.model.service;

import java.util.ArrayList;
import java.util.Map;

import com.kh.dungjip.common.model.vo.PageInfo;
import com.kh.dungjip.estate.model.vo.Estate;
import com.kh.dungjip.house.model.vo.House;
import com.kh.dungjip.house.model.vo.Jjim;
import com.kh.dungjip.house.model.vo.Reservation;
import com.kh.dungjip.house.model.vo.HouseImg;
import com.kh.dungjip.member.model.vo.Member;
import com.kh.dungjip.residentReview.model.vo.ResidentReview;
import com.kh.dungjip.residentReview.model.vo.ReviewImg;

public interface HouseService {

	int insertHouseJSON(House house);

	ArrayList<House> selectLocations();

	ArrayList<House> selectHouse(String type);
	
	ArrayList<House> selectHouseMain(String type);

	ArrayList<HouseImg> selectHouseThumnail(String type);

	//부동산 집 리스트
	ArrayList<House> selectHouseList(int esNo,PageInfo pi);

	//부동산 집 이미지
	ArrayList<HouseImg> selectHouseImg(int esNo);

	//부동산이 갖고 있는 집 개수
	int selectHouseListCount(int esNo);

	//찜하기
	int insertJjim(Jjim jj);

	//찜 데이터 있는지 확인
	Jjim selectJjim(Jjim jj);

	//찜취소
	int deleteJjim(Jjim jj);

	//집 상세보기
	House selectHouseDetail(int houseNo);

	//상세보기 집 이미지
	 ArrayList<HouseImg> selectHouseImgDetail(int houseNo);

	 //비슷한 매물 찾기 list
	ArrayList<House> houseLikeList(House house,PageInfo pi);

	//비슷한 매물 찾기 img
	ArrayList<HouseImg> houseImgLike(House house);
	HouseImg selectHouseMainThumnail(int houseNo);

	//조회
	ArrayList<House> memberMypageHousejjimForm(Member m,PageInfo pi);
	
	//집사진 조회
	HouseImg memberMypageHousejjimImg(int houseNo);

	ArrayList<House> selectSubscribeHouseList(Map<String, Object> map);

	//비슷한 매물 전체 개수
	int selectHouseLikeCount(House house);

	//마이페이지 찜목록에서 찜해제
	int mypageHjjimdelete(int houseNo);

	//부동산 집 리스트(모달창)
	ArrayList<House> selectHouseModal(int esNo);

	//거주자 리뷰 리스트
	ArrayList<ResidentReview> selectResidentReviewList(int houseNo);

	//거주자 리뷰 총점
	int selectResidentReviewSum(int houseNo);

	//거주자 리뷰 수
	int selectResidentReviewCount(int houseNo);

	//매물 리뷰 작성
	int insertResidentReview(ResidentReview rr);

	void enrollReviewImg(ReviewImg reviewImg);

	int insertMemberKeyword(Map<String, Object> map);

	//매물 리뷰 수정 상세뷰 
	ResidentReview ResidentReviewDetail(int reReviewNo);

	int selectBuilding(int houseNo);

	int selectBuildingcount(int houseNo);

	int selectTraffic(int houseNo);

	int selectTrafficCount(int houseNo);

	int selectInterior(int houseNo);

	int selectInteriorCount(int houseNo);

	int selectSafety(int houseNo);

	int selectSafetyCount(int houseNo);

	int selectLife(int houseNo);

	int selectLifeCount(int houseNo);

	//마이페이지 집 찜 페이징
	int selectListCount(Member m);

	//마이페이지 중개인 매물내역
	ArrayList<House> memberMypageEstateHouseList(Integer esNo, PageInfo pi);

	//마이페이지 중개인 매물내역 페이징
	int selectEsHouseListCount();

	//마이페이지 임대인 매물내역
	ArrayList<House> mypageImdaHouseList(PageInfo pi, Member m);

	//마이페이지 임대인 매물내역 
	int mypageImdaHouseListCount();

	//마이페이지 임대인 매물내역 삭제
	int myImdaHouseDelete(int houseNo);

	//매물 리뷰 수정
	int updateResidentReview(Map<String, Object> paramMap);

	int updateKeywords(Map<String, Object> paramMap);

	int deleteKeywords(Map<String, Object> paramMap);


	int updateReviewImg(Map<String, Object> paramMap);

	int selectResidentEmoCount(int reReviewNo);

	int selectResidentReviewLikeCount(Map<String, Object> numMap);

	int selectReviewLikeCount(Map<String, Object> map);

	int decreaseCount(Map<String, Object> map);

	int increaseReReLikeCount(Map<String, Object> map);
  
	//중개인 예약내역 페이징
	int mypagemypageEsReservationCount(Integer esNo);




}
