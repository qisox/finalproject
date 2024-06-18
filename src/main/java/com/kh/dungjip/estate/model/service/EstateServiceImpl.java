package com.kh.dungjip.estate.model.service;

import java.util.ArrayList;
import java.util.List;
import java.util.Map;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.kh.dungjip.common.model.vo.PageInfo;
import com.kh.dungjip.estate.model.dao.EstateDao;
import com.kh.dungjip.estate.model.vo.EsReLike;
import com.kh.dungjip.estate.model.vo.Estate;
import com.kh.dungjip.estate.model.vo.EstateReview;
import com.kh.dungjip.estate.model.vo.Own;
import com.kh.dungjip.house.model.vo.ReservationNew;
import com.kh.dungjip.house.model.vo.Time;
import com.kh.dungjip.member.model.vo.Member;

@Service
public class EstateServiceImpl implements EstateService {

	@Autowired
	private EstateDao estateDao;
	
	@Autowired
	private SqlSessionTemplate sqlSession;

	//부동산 리스트
	@Override
	public ArrayList<Estate> selectEstateList(int houseNo) {
		
		return estateDao.selectEstateList(sqlSession,houseNo);
	}

	//조회수 증가
	@Override
	public int increaseCount(int esNo) {
	
		return estateDao.increaseCount(sqlSession,esNo);
	}

	//부동산 상세정보
	@Override
	public Estate estateDetail(int esNo) {
		
		return estateDao.estateDetail(sqlSession,esNo);
	}

	//부동산 리뷰 리스트
	@Override
	public ArrayList<EstateReview> selectEstateReviewList(int esNo) {
	
		return estateDao.selectEstateReviewList(sqlSession,esNo);
	}

	//부동산 리뷰 총점
	@Override
	public int selectEstateReviewSum(int esNo) {
		
		return estateDao.selectEstateReviewSum(sqlSession,esNo);
	}

	//부동산 리뷰 개수
	@Override
	public int selectEstateReviewCount(int esNo) {
		
		return estateDao.selectEstateReviewCount(sqlSession,esNo);
	}

	
	//각 별의 개수
	@Override
	public int selectEstateFiveStar(int esNo) {
	
		return estateDao.selectEstateFiveStar(sqlSession,esNo);
	}
	
	@Override
	public int selectEstateFourStar(int esNo) {
	
		return estateDao.selectEstateFourStar(sqlSession,esNo);
	}

	
	@Override
	public int selectEstateThreeStar(int esNo) {
	
		return estateDao.selectEstateThreeStar(sqlSession,esNo);
	}

	
	@Override
	public int selectEstateTwoStar(int esNo) {
	
		return estateDao.selectEstateTwoStar(sqlSession,esNo);
	}

	
	@Override
	public int selectEstateOneStar(int esNo) {
	
		return estateDao.selectEstateOneStar(sqlSession,esNo);
	}

	
	@Override
	public List<Integer> selectSubscribeEstateList() {
		return estateDao.selectSubscribeEstateList(sqlSession);
	}

	@Override
	public int selectEstateEmoCount(int esReNo) {
		// TODO Auto-generated method stub
		return estateDao.selectEstateEmoCount(sqlSession, esReNo);
	}

	@Override
	public int selectReviewLikeCount(Map<String, Object> map) {
		// TODO Auto-generated method stub
		return estateDao.selectReviewLikeCount(sqlSession, map);
	}

	@Override
	public int decreaseCount(Map<String, Object> map) {
		// TODO Auto-generated method stub
		int result = estateDao.decreaseCount(sqlSession, map);
		
		int count = 0;
		
		String esReNoString = map.get("esReNo").toString();
		int esReNo = Integer.parseInt(esReNoString);

		if(result > 0) {
			count = estateDao.selectEstateEmoCount(sqlSession, esReNo);
		}
		
		return count;
	}

	@Override
	public int increaseEsReLikeCount(Map<String, Object> map) {
		// TODO Auto-generated method stub
		int result = estateDao.increaseEsReLikeCount(sqlSession, map);
		
		String esReNoString = map.get("esReNo").toString();
		int esReNo = Integer.parseInt(esReNoString);
		
		int count = 0;
		
		if(result > 0) {
			count = estateDao.selectEstateEmoCount(sqlSession, esReNo);
		}
		
		return count;
	}
	
	//예약 시간 select
	@Override
	public ArrayList<Time> selectTime() {
		return estateDao.selectTime(sqlSession);
	}


	//리뷰 작성
	@Override
	public int insertEstateReview(Map<String, Object> paramMap) {

		return estateDao.insertEstateReview(sqlSession,paramMap);
	}


	//조회
	@Override
	public ArrayList<EstateReview> selectEstateReview(Member m,PageInfo pi) {
		
		return estateDao.selectEstateReview(sqlSession,m,pi);
	}

	//삭제
	@Override
	public int esReviewDelete(int esReNo) {
		// TODO Auto-generated method stub
		return estateDao.esReviewDelete(sqlSession,esReNo);
	}

	@Override
	public int updateReview(int esReNo, int esReScore, String esReContent) {
		// TODO Auto-generated method stub
		return estateDao.updateReview(sqlSession,esReNo,esReScore,esReContent );
	}

	//부동산 리뷰 상세
	@Override
	public EstateReview estateReviewDetail(int esReNo) {
		
		return estateDao.estateReviewDetail(sqlSession,esReNo);
	}


	//부동산 리뷰 수정
	@Override
	public int updateEstateReview(Map<String, Object> paramMap) {
		// TODO Auto-generated method stub
		return estateDao.updateReview(sqlSession,paramMap);
	}
	
	@Override
	public ArrayList<EsReLike> memberMypageReviewLike(Member m,PageInfo pi) {
		// TODO Auto-generated method stub
		return estateDao.memberMypageReviewLike(sqlSession,m,pi);
	}

	//중개인리뷰공감페이징
	@Override
	public int selectEstateListCountByMember(Member m) {
		// TODO Auto-generated method stub
		return estateDao.selectEstateListCountByMember(sqlSession,m);
	}

	//공감삭제
	@Override
	public int myEsReviewDelete(int esReNo) {
		// TODO Auto-generated method stub
		return estateDao.myEsReviewDelete(sqlSession,esReNo);
	}

	//예약기능
	@Override
	public int insertReservation(ReservationNew reservation) {
		return estateDao.insertReservation(sqlSession,reservation);
	}

	//예약 날짜 눌렀을때 데이터 있는지 확인
	@Override
	public ArrayList<ReservationNew> selectReservationList(ReservationNew reservation) {
		return estateDao.selectReservationList(sqlSession,reservation);
	}

	//마이페이지 중개인 리뷰 페이징
	@Override
	public int selectListCount() {
		// TODO Auto-generated method stub
		return estateDao.selectListCount(sqlSession);
	}

	//마이페이지 매물내역 
	@Override
	public int selectEstate(int esNo) {
		// TODO Auto-generated method stub
		return estateDao.selectEstate(sqlSession,esNo);
	}

	@Override
	public int getEsNo(int userNo) {
		// TODO Auto-generated method stub
		return estateDao.getEsNo(sqlSession, userNo);
	}

	//신고내역 페이징 카운트
	@Override
	public int selectReportEstateListCount() {
		// TODO Auto-generated method stub
		return estateDao.selectReportEstateListCount(sqlSession);
	}

	//마이페이지 중개사무소 정보수정
	@Override
	public ArrayList<Estate> mypageEstateUpdate(Member m) {
		// TODO Auto-generated method stub
		return estateDao.mypageEstateUpdate(sqlSession,m);
	}

	//중개인 매물내역 삭제
	@Override
	public int myEstateHouseDelete(Own o) {
		// TODO Auto-generated method stub
		return estateDao.myEstateHouseDelete(sqlSession,o);
	}

	//중개인 페이지
	@Override
	public ArrayList<Estate> myEspage(Member m) {
		// TODO Auto-generated method stub
		return estateDao.myEspage(sqlSession,m);
	}

	//마이페이지 - 예약 삭제
	@Override
	public int deleteReview(int reservationNo) {
		return estateDao.deleteReview(sqlSession,reservationNo);
	}
}
