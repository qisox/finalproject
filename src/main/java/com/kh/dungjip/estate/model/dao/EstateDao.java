package com.kh.dungjip.estate.model.dao;

import java.util.ArrayList;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.apache.ibatis.session.SqlSession;
import org.apache.ibatis.session.RowBounds;
import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.stereotype.Repository;

import com.kh.dungjip.common.model.vo.PageInfo;
import com.kh.dungjip.estate.model.vo.EsReLike;
import com.kh.dungjip.estate.model.vo.Estate;
import com.kh.dungjip.estate.model.vo.EstateReview;
import com.kh.dungjip.estate.model.vo.Own;
import com.kh.dungjip.house.model.vo.ReservationNew;
import com.kh.dungjip.house.model.vo.Time;
import com.kh.dungjip.member.model.vo.Member;

@Repository
public class EstateDao {

	//부동산 리스트
	public ArrayList<Estate> selectEstateList(SqlSessionTemplate sqlSession,int houseNo) {
		
		return (ArrayList)sqlSession.selectList("estateMapper.selectEatateList",houseNo);
	}

	//조회수 증가
	public int increaseCount(SqlSessionTemplate sqlSession, int esNo) {
		
		return sqlSession.update("estateMapper.increaseCount",esNo);
	}

	//부동산 상세정보
	public Estate estateDetail(SqlSessionTemplate sqlSession, int esNo) {
		
		return sqlSession.selectOne("estateMapper.estateDetail",esNo);
	}

	//부동산 리뷰 리스트
	public ArrayList<EstateReview> selectEstateReviewList(SqlSessionTemplate sqlSession, int esNo) {
		
		return (ArrayList)sqlSession.selectList("estateMapper.selectEstateReviewList",esNo);
	}

	//부동산 리뷰 총점
	public int selectEstateReviewSum(SqlSessionTemplate sqlSession, int esNo) {
		
		return sqlSession.selectOne("estateMapper.selectEstateReviewSum",esNo);
	}

	//부동산 리뷰 개수
	public int selectEstateReviewCount(SqlSessionTemplate sqlSession, int esNo) {
		
		return sqlSession.selectOne("estateMapper.selectEstateReviewCount",esNo);
	}

	//각 별의 개수
	public int selectEstateFiveStar(SqlSessionTemplate sqlSession, int esNo) {
		
		return sqlSession.selectOne("estateMapper.selectEstateFiveStar",esNo);
	}
	
	public int selectEstateFourStar(SqlSessionTemplate sqlSession, int esNo) {
		
		return sqlSession.selectOne("estateMapper.selectEstateFourStar",esNo);
	}

	public int selectEstateThreeStar(SqlSessionTemplate sqlSession, int esNo) {
	
		return sqlSession.selectOne("estateMapper.selectEstateThreeStar",esNo);
	}

	public int selectEstateTwoStar(SqlSessionTemplate sqlSession, int esNo) {
	
		return sqlSession.selectOne("estateMapper.selectEstateTwoStar",esNo);
	}

	public int selectEstateOneStar(SqlSessionTemplate sqlSession, int esNo) {
	
		return sqlSession.selectOne("estateMapper.selectEstateOneStar",esNo);
	}

	public List<Integer> selectSubscribeEstateList(SqlSessionTemplate sqlSession) {
		return sqlSession.selectList("estateMapper.selectSubscribeEstateList");
	}

	public int selectReviewLikeCount(SqlSessionTemplate sqlSession, Map<String, Object> map) {
		// TODO Auto-generated method stub
		int count = 0;
		try {
			count = sqlSession.selectOne("estateMapper.selectReviewLikeCount", map);
			
			if(count > 0) {
				count = 1;
			}
		} catch(Exception e) {
			count = 0;
		}
		return count;
	}

	public int decreaseCount(SqlSessionTemplate sqlSession, Map<String, Object> map) {
		// TODO Auto-generated method stub
		return sqlSession.delete("estateMapper.decreaseCount", map);
	}

	public int increaseEsReLikeCount(SqlSessionTemplate sqlSession, Map<String, Object> map) {
		// TODO Auto-generated method stub
		return sqlSession.insert("estateMapper.increaseEsReLikeCount", map);
	}

	//예약 시간 select
	public ArrayList<Time> selectTime(SqlSessionTemplate sqlSession) {
		return (ArrayList)sqlSession.selectList("estateMapper.selectTime");
	}

	//리뷰 작성
	public int insertEstateReview(SqlSessionTemplate sqlSession, Map<String, Object> paramMap) {
		// TODO Auto-generated method stub
		return sqlSession.insert("estateMapper.insertEstateReview",paramMap);
	}

	public ArrayList<EstateReview> selectEstateReview(SqlSessionTemplate sqlSession, Member m,PageInfo pi) {

		//몇개를 보여줄지
		int limit = pi.getBoardLimit();
		//몇개를 건너뛸지
		int offset = (pi.getCurrentPage()-1)* limit;		
		
		RowBounds rowBounds = new RowBounds(offset,limit);
		
		return (ArrayList)sqlSession.selectList("estateMapper.selectEstateReview", m,rowBounds);
	}

	public int esReviewDelete(SqlSessionTemplate sqlSession, int esReNo) {
		// TODO Auto-generated method stub
		return sqlSession.delete("estateMapper.esReviewDelete", esReNo);
	}

	public int updateReview(SqlSessionTemplate sqlSession, int esReNo, int esReScore, String esReContent) {
		Map<String, Object> params = new HashMap<>();
	    params.put("esReNo", esReNo);
	    params.put("esReScore", esReScore);
	    params.put("esReContent", esReContent);
	    return sqlSession.update("estateMapper.updateReview", params);
	}
	//리뷰 공감수
	public int selectEstateEmoCount(SqlSessionTemplate sqlSession, int esReNo) {
		
		return sqlSession.selectOne("estateMapper.selectEstateEmoCount",esReNo);
	}

	//부동산 리뷰 상세
	public EstateReview estateReviewDetail(SqlSessionTemplate sqlSession, int esReNo) {
		
		return sqlSession.selectOne("estateMapper.estateReviewDetail",esReNo);
	}

	//부동산 리뷰 수정
	public int updateReview(SqlSessionTemplate sqlSession, Map<String, Object> paramMap) {
		// TODO Auto-generated method stub
		return sqlSession.update("estateMapper.updateReview",paramMap);
	}

	public ArrayList<EsReLike> memberMypageReviewLike(SqlSessionTemplate sqlSession, Member m, PageInfo pi) {
		// TODO Auto-generated method stub
		
		int limit = pi.getBoardLimit();
		
		int offset = (pi.getCurrentPage()-1)*limit;
		
		RowBounds rowBounds = new RowBounds(offset,limit);
		
		return (ArrayList)sqlSession.selectList("estateMapper.memberMypageReviewLike", m,rowBounds);
	}

	//중개인 리뷰공감 페이징
	public int selectEstateListCountByMember(SqlSessionTemplate sqlSession, Member m) {
		return sqlSession.selectOne("estateMapper.selectEstateListCountByMember",m);
	}

	//공감삭제
	public int myEsReviewDelete(SqlSessionTemplate sqlSession, int esReNo) {
		// TODO Auto-generated method stub
		return sqlSession.delete("estateMapper.myEsReviewDelete", esReNo);
	}

	//예약기능
	public int insertReservation(SqlSessionTemplate sqlSession, ReservationNew reservation) {
		return sqlSession.insert("estateMapper.insertReservation", reservation);
	}
	
	//마이페이지 중개인 리뷰 페이징
	public int selectListCount(SqlSessionTemplate sqlSession) {
		// TODO Auto-generated method stub
		return sqlSession.selectOne("estateMapper.selectEstateListCountByMember", sqlSession);
	}

	public int selectEstate(SqlSessionTemplate sqlSession, int esNo) {
		// TODO Auto-generated method stub
		return sqlSession.selectOne("estateMapper.selectEstate", esNo);
	}

	public int getEsNo(SqlSessionTemplate sqlSession, int userNo) {
		// TODO Auto-generated method stub
		return sqlSession.selectOne("estateMapper.getEsNo", userNo);
	}

	//신고내역 페이징 카운트
	public int selectReportEstateListCount(SqlSessionTemplate sqlSession) {
		// TODO Auto-generated method stub
		return sqlSession.selectOne("estateMapper.selectReportEstateListCount");
	}

	//마이페이지 중개사무소 정보수정
	public ArrayList<Estate> mypageEstateUpdate(SqlSessionTemplate sqlSession, Member m) {
		// TODO Auto-generated method stub
		return (ArrayList)sqlSession.selectList("estateMapper.mypageEstateUpdate", m);
	}

	//중개인 매물내역 삭제
	public int myEstateHouseDelete(SqlSessionTemplate sqlSession, Own o) {
		// TODO Auto-generated method stub
		return sqlSession.update("estateMapper.myEstateHouseDelete", o);
	}

	//예약 날짜 눌렀을때 데이터 있는지 확인
	public ArrayList<ReservationNew> selectReservationList(SqlSessionTemplate sqlSession, ReservationNew reservation) {
		return (ArrayList)sqlSession.selectList("estateMapper.selectReservationList",reservation);
	}

	//중개인 페이지
	public ArrayList<Estate> myEspage(SqlSessionTemplate sqlSession,Member m) {
		// TODO Auto-generated method stub
		return (ArrayList)sqlSession.selectList("estateMapper.myEspage",m);
	}

	//마이페이지 - 예약 삭제
	public int deleteReview(SqlSessionTemplate sqlSession, int reservationNo) {
		return sqlSession.delete("estateMapper.deleteReview",reservationNo);
	}
}