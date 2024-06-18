package com.kh.dungjip.residentReview.model.service;

import java.util.ArrayList;

import com.kh.dungjip.common.model.vo.PageInfo;
import com.kh.dungjip.member.model.vo.Member;
import com.kh.dungjip.residentReview.model.vo.ReReLike;
import com.kh.dungjip.residentReview.model.vo.ResidentReview;

public interface ResidentReviewService {

	//조회
	ArrayList<ResidentReview> selectResidentReview(Member m,PageInfo pi);
	
	//삭제
	int esReviewDelete(int reReviewNo);

	//수정
	int updateReReview(int reReviewNo, int interiorScore, int buildingScore, int trafficScore, int safetyScore,
			int lifeScore, String reAdContent, String reDisContent);

	//조회
	ArrayList<ReReLike> memberMypageReviewLike(Member m, PageInfo pi);

	//거주자 리뷰 공감 페이징
	int selectResidentListCountByMember(Member m);

	//공감삭제
	int myReReviewDelete(int reReviewNo);

	//마이페이지 집 리뷰 페이징
	int selectListCount();


}
