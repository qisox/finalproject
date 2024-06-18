package com.kh.dungjip.residentReview.model.dao;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.Map;

import org.apache.ibatis.session.RowBounds;
import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.stereotype.Repository;

import com.kh.dungjip.common.model.vo.PageInfo;
import com.kh.dungjip.member.model.vo.Member;
import com.kh.dungjip.residentReview.model.vo.ReReLike;
import com.kh.dungjip.residentReview.model.vo.ResidentReview;

@Repository
public class ResidentReviewDao {

	public ArrayList<ResidentReview> selectResidentReview(SqlSessionTemplate sqlSession, Member m,PageInfo pi) {
		
		//몇개를 보여줄지
		int limit = pi.getBoardLimit();
		//몇개를 건너뛸지
		int offset = (pi.getCurrentPage()-1)* limit;		
		
		RowBounds rowBounds = new RowBounds(offset,limit);
	
		return (ArrayList)sqlSession.selectList("residentReviewMapper.selectResidentReview",m,rowBounds);
	}

	public int esReviewDelete(SqlSessionTemplate sqlSession, int reReviewNo) {
		// TODO Auto-generated method stub
		return sqlSession.delete("residentReviewMapper.esReviewDelete",reReviewNo);
	}

	public int updateReReview(SqlSessionTemplate sqlSession, int reReviewNo, int interiorScore, int buildingScore,
			int trafficScore, int safetyScore, int lifeScore, String reAdContent, String reDisContent) {
		   
		Map<String, Object> params = new HashMap<>();
		    params.put("reReviewNo", reReviewNo);
		    params.put("interiorScore", interiorScore);
		    params.put("buildingScore", buildingScore);
		    params.put("trafficScore", trafficScore);
		    params.put("safetyScore", safetyScore);
		    params.put("lifeScore", lifeScore);
		    params.put("reAdContent", reAdContent);
		    params.put("reDisContent", reDisContent);

		    return sqlSession.update("residentReviewMapper.updateReReview", params);
	}

	//조회
	public ArrayList<ReReLike> memberMypageReviewLike(SqlSessionTemplate sqlSession, Member m, PageInfo pi) {
		// TODO Auto-generated method stub
		
		//몇개를 보여줄지
		int limit = pi.getBoardLimit();
		//몇개를 건너뛸지
		int offset = (pi.getCurrentPage()-1)* limit;		
		
		RowBounds rowBounds = new RowBounds(offset,limit);
		
		return (ArrayList)sqlSession.selectList("residentReviewMapper.memberMypageReviewLike", m,rowBounds);
	}

	//거주자 리뷰 공감 페이징
	public int selectResidentListCountByMember(SqlSessionTemplate sqlSession, Member m) {
		// TODO Auto-generated method stub
		return sqlSession.selectOne("residentReviewMapper.selectResidentListCountByMember", m);
	}

	//공감삭제
	public int myReReviewDelete(SqlSessionTemplate sqlSession, int reReviewNo) {
		// TODO Auto-generated method stub
		return sqlSession.delete("residentReviewMapper.myReReviewDelete", reReviewNo);
	}

	//마이페이지 집 리뷰 페이징
	public int selectListCount(SqlSessionTemplate sqlSession) {
		// TODO Auto-generated method stub
		return sqlSession.selectOne("residentReviewMapper.selectListCount", sqlSession);
	}


}
