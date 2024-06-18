package com.kh.dungjip.residentReview.model.service;

import java.util.ArrayList;


import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.kh.dungjip.common.model.vo.PageInfo;
import com.kh.dungjip.member.model.vo.Member;
import com.kh.dungjip.residentReview.model.dao.ResidentReviewDao;
import com.kh.dungjip.residentReview.model.vo.ReReLike;
import com.kh.dungjip.residentReview.model.vo.ResidentReview;

@Service
public class ResidentReviewServiceImpl implements ResidentReviewService{

	@Autowired
	private ResidentReviewDao residentReviewDao;
	
	@Autowired
	private SqlSessionTemplate sqlSession;
	
	//조회
	@Override
	public ArrayList<ResidentReview> selectResidentReview(Member m,PageInfo pi) {
		// TODO Auto-generated method stub
		return residentReviewDao.selectResidentReview(sqlSession,m,pi);
	}

	//삭제
	@Override
	public int esReviewDelete(int reReviewNo) {
		// TODO Auto-generated method stub
		return residentReviewDao.esReviewDelete(sqlSession,reReviewNo);
	}

	//수정
	@Override
	public int updateReReview(int reReviewNo, int interiorScore, int buildingScore, int trafficScore, int safetyScore,
			int lifeScore, String reAdContent, String reDisContent) {
		// TODO Auto-generated method stub
		return residentReviewDao.updateReReview(sqlSession,reReviewNo,interiorScore,buildingScore,trafficScore,safetyScore,lifeScore
													,reAdContent,reDisContent);
	}

	//조회
	@Override
	public ArrayList<ReReLike> memberMypageReviewLike(Member m,PageInfo pi) {
		// TODO Auto-generated method stub
		return residentReviewDao.memberMypageReviewLike(sqlSession,m,pi);
	}

	//거주자 리뷰 공감 페이징
	@Override
	public int selectResidentListCountByMember(Member m) {
		// TODO Auto-generated method stub
		return residentReviewDao.selectResidentListCountByMember(sqlSession,m);
	}

	//공감삭제
	@Override
	public int myReReviewDelete(int reReviewNo) {
		// TODO Auto-generated method stub
		return residentReviewDao.myReReviewDelete(sqlSession,reReviewNo);
	}

	//마이페이지 집리뷰 페이징
	@Override
	public int selectListCount() {
		// TODO Auto-generated method stub
		return residentReviewDao.selectListCount(sqlSession);
	}


}
