package com.kh.dungjip.house.model.service;

import java.util.ArrayList;
import java.util.Map;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.kh.dungjip.common.model.vo.PageInfo;
import com.kh.dungjip.estate.model.vo.Estate;
import com.kh.dungjip.house.model.dao.HouseDao;
import com.kh.dungjip.house.model.vo.House;
import com.kh.dungjip.house.model.vo.Jjim;
import com.kh.dungjip.house.model.vo.Reservation;
import com.kh.dungjip.house.model.vo.HouseImg;
import com.kh.dungjip.member.model.vo.Member;
import com.kh.dungjip.residentReview.model.vo.ResidentReview;
import com.kh.dungjip.residentReview.model.vo.ReviewImg;

import lombok.extern.slf4j.Slf4j;

@Slf4j
@Service
public class HouseServiceImpl implements HouseService{
	
	@Autowired
	private HouseDao houseDao;
	
	@Autowired
	private SqlSessionTemplate sqlSession;

	@Override
	public int insertHouseJSON(House house) {
		return houseDao.insertHouseJSON(sqlSession, house);
	}

	@Override
	public ArrayList<House> selectLocations() {
		return houseDao.selectLocations(sqlSession);
	}

	@Override
	public ArrayList<House> selectHouse(String type) {
		return houseDao.selectHouse(sqlSession, type);
	}

	@Override
	public ArrayList<HouseImg> selectHouseThumnail(String type) {
		return houseDao.selectHouseThumnail(sqlSession, type);
	}

	//부동산 집 리스트
	@Override
	public ArrayList<House> selectHouseList(int esNo,PageInfo pi) {
		
		return houseDao.selectHouseList(sqlSession,esNo,pi);
	}

	//부동산 집 이미지
	@Override
	public ArrayList<HouseImg> selectHouseImg(int esNo) {
		
		return houseDao.selectHouseImg(sqlSession,esNo);
	}

	//부동산이 갖고있는 집 개수
	@Override
	public int selectHouseListCount(int esNo) {
		
		return houseDao.selectHouseListCount(sqlSession,esNo);
	}
	//찜하기
	@Override
	public int insertJjim(Jjim jj) {
		return houseDao.insertJjim(sqlSession,jj);
	}

	//찜 데이터 있는지 확인
	@Override
	public Jjim selectJjim(Jjim jj) {
		return houseDao.selectJjim(sqlSession,jj);
	}

	//찜취소
	@Override
	public int deleteJjim(Jjim jj) {
		return houseDao.deleteJjim(sqlSession,jj);
	}

	//집 상세보기
	@Override
	public House selectHouseDetail(int houseNo) {
		return houseDao.selectHouseDetail(sqlSession,houseNo);
	}

	//상세보기 집 이미지
	@Override
	public ArrayList<HouseImg> selectHouseImgDetail(int houseNo) {
		return houseDao.selectHouseImgDetail(sqlSession,houseNo);
	}

	//비슷한 매물 찾기 list
	@Override
	public ArrayList<House> houseLikeList(House house,PageInfo pi) {
		return houseDao.houseLikeList(sqlSession,house,pi);
	}

	//비슷한 매물 찾기 img
	@Override
	public ArrayList<HouseImg> houseImgLike(House house) {
		return houseDao.houseImgLike(sqlSession,house);
	}
	
	@Override
	public ArrayList<House> selectHouseMain(String type) {
		return houseDao.selectHouseMain(sqlSession, type);
	}

	@Override
	public HouseImg selectHouseMainThumnail(int houseNo) {
		return houseDao.selectHouseMainThumnail(sqlSession, houseNo);
	}

	@Override
	public ArrayList<House> memberMypageHousejjimForm(Member m,PageInfo pi) {
		// TODO Auto-generated method stub
		return houseDao.memberMypageHousejjimForm(sqlSession,m,pi);
	}

	@Override
	public HouseImg memberMypageHousejjimImg(int houseNo) {
		// TODO Auto-generated method stub
		return houseDao.memberMypageHousejjimImg(sqlSession,houseNo);
	}


	public ArrayList<House> selectSubscribeHouseList(Map<String, Object> map) {
		return houseDao.selectSubscribeHouseList(sqlSession, map);
	}

	//비슷한 매물 전체 개수
	@Override
	public int selectHouseLikeCount(House house) {
		return houseDao.selectHouseLikeCount(sqlSession, house);
	}

	//마이페이지 찜 목록에서 찜 해제
	@Override
	public int mypageHjjimdelete(int houseNo) {
		// TODO Auto-generated method stub
		return houseDao.mypageHjjimdelete(sqlSession, houseNo);
	}	

	//부동산 집 리스트(모달창)
	
	@Override
	public ArrayList<House> selectHouseModal(int esNo) {
		
		return houseDao.selectHouseModal(sqlSession,esNo);
	}

	//거주자 리뷰 리스트
	@Override
	public ArrayList<ResidentReview> selectResidentReviewList(int houseNo) {
		
		return houseDao.selectResidentReviewList(sqlSession,houseNo);
	}

	//거주자 리뷰 총점
	@Override
	public int selectResidentReviewSum(int houseNo) {
	
		return houseDao.selectResidentReviewSum(sqlSession,houseNo);
	}

	//거주자 리뷰 수 
	@Override
	public int selectResidentReviewCount(int houseNo) {
		
		return houseDao.selectResidentReviewCount(sqlSession,houseNo);
	}

	//매물 리뷰 작성
	@Override
	public int insertResidentReview(ResidentReview rr) {
		houseDao.insertResidentReview(sqlSession,rr);
		return rr.getReReviewNo();
	}

	@Override
	public void enrollReviewImg(ReviewImg reviewImg) {
		houseDao.enrollReviewImg(sqlSession,reviewImg);
		
	}

	@Override
	public int insertMemberKeyword(Map<String, Object> map) {
		// TODO Auto-generated method stub
		return houseDao.insertMemberKeyword(sqlSession, map);
	}

	//매물 리뷰 수정 상세뷰 
	@Override
	public ResidentReview ResidentReviewDetail(int reReviewNo) {
		
		return houseDao.ResidentReviewDetail(sqlSession,reReviewNo);
	}

	@Override
	public int selectBuilding(int houseNo) {
		
		return houseDao.selectBuilding(sqlSession,houseNo);
	}

	@Override
	public int selectBuildingcount(int houseNo) {
	
		return houseDao.selectBuildingCount(sqlSession,houseNo);
	}

	@Override
	public int selectTraffic(int houseNo) {
		
		return houseDao.selectTraffic(sqlSession,houseNo);
	}

	@Override
	public int selectTrafficCount(int houseNo) {
		
		return houseDao.selectTrafficCount(sqlSession,houseNo);
	}

	@Override
	public int selectInterior(int houseNo) {
		
		return houseDao.selectInterior(sqlSession,houseNo);
	}

	@Override
	public int selectInteriorCount(int houseNo) {
		
		return houseDao.selectInteriorCount(sqlSession,houseNo);
	}

	@Override
	public int selectSafety(int houseNo) {
		
		return houseDao.selectSafety(sqlSession,houseNo);
	}

	@Override
	public int selectSafetyCount(int houseNo) {
		
		return houseDao.selectSafetyCount(sqlSession,houseNo);
	}

	@Override
	public int selectLife(int houseNo) {
		
		return houseDao.selectLife(sqlSession,houseNo);
	}

	@Override
	public int selectLifeCount(int houseNo) {
		
		return houseDao.selectLifeCount(sqlSession,houseNo);
	}

	//마이페이지 집 찜 페이징
	@Override
	public int selectListCount(Member m) {
		// TODO Auto-generated method stub
		return houseDao.selectListCount(sqlSession,m);
	}

	//마이페이지 중개인 매물내역
	@Override
	public ArrayList<House> memberMypageEstateHouseList(Integer esNo, PageInfo pi) {
		// TODO Auto-generated method stub
		return houseDao.memberMypageEstateHouseList(sqlSession,esNo,pi);
	}

	//마이페이지 중개인 매물내역 카운트
	@Override
	public int selectEsHouseListCount() {
		// TODO Auto-generated method stub
		return houseDao.selectEsHouseListCount(sqlSession);
	}

	//마이페이지 임대인 매물내역 카운트
	@Override
	public int mypageImdaHouseListCount() {
		// TODO Auto-generated method stub
		return houseDao.mypageImdaHouseListCount(sqlSession);
	}
	
	//마이페이지 임대인 매물내역
	@Override
	public ArrayList<House> mypageImdaHouseList(PageInfo pi,Member m) {
		// TODO Auto-generated method stub
		return houseDao.mypageImdaHouseList(sqlSession,pi,m);
	}

	@Override
	public int myImdaHouseDelete(int houseNo) {
		// TODO Auto-generated method stub
		return houseDao.myImdaHouseDelete(sqlSession,houseNo);
	}

	//매물 리뷰 수정
	@Override
	public int updateResidentReview(Map<String, Object> paramMap) {
		
		return houseDao.updateResidentReview(sqlSession,paramMap);
	}

	@Override
	public int updateKeywords(Map<String, Object> paramMap) {
		// TODO Auto-generated method stub
		
		return houseDao.updateKeywords(sqlSession,paramMap);
	}

	@Override
	public int deleteKeywords(Map<String, Object> paramMap) {
		// TODO Auto-generated method stub
		
		return houseDao.deleteKeywords(sqlSession,paramMap);
	}


	@Override
	public int updateReviewImg(Map<String, Object> paramMap) {
		
		return houseDao.updateReviewImg(sqlSession,paramMap);
		
	}

	@Override
	public int selectResidentEmoCount(int reReviewNo) {
		// TODO Auto-generated method stub
		return houseDao.selectResidentEmoCount(sqlSession, reReviewNo);
	}

	@Override
	public int selectResidentReviewLikeCount(Map<String, Object> numMap) {
		// TODO Auto-generated method stub
		return houseDao.selectResidentReviewLikeCount(sqlSession, numMap);
	}

	@Override
	public int selectReviewLikeCount(Map<String, Object> map) {
		// TODO Auto-generated method stub
		return houseDao.selectReviewLikeCount(sqlSession, map);
	}

	@Override
	public int decreaseCount(Map<String, Object> map) {
		// TODO Auto-generated method stub
		int result = houseDao.decreaseCount(sqlSession, map);
		
		int count = 0;
		
		String reReNoString = map.get("reReNo").toString();
		int reReNo = Integer.parseInt(reReNoString);
		
		if(result > 0) {
			count = houseDao.selectResidentEmoCount(sqlSession, reReNo);
		}
		
		return count;
	}

	@Override
	public int increaseReReLikeCount(Map<String, Object> map) {
		// TODO Auto-generated method stub
		int result = houseDao.increaseReReLikeCount(sqlSession, map);
		
		String reReNoString = map.get("reReNo").toString();
		int reReNo = Integer.parseInt(reReNoString);
		
		int count = 0;
		
		if(result > 0) {
			count = houseDao.selectResidentEmoCount(sqlSession, reReNo);
		}
		
		return count;
	}
    
	//중개인 예약내역 페이징
	@Override
	public int mypagemypageEsReservationCount(Integer esNo) {
		// TODO Auto-generated method stub
		return houseDao.mypagemypageEsReservationCount(sqlSession,esNo);

	}

	

}
