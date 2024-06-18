package com.kh.dungjip.house.model.dao;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.Map;

import org.apache.ibatis.session.RowBounds;
import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.stereotype.Repository;

import com.kh.dungjip.common.model.vo.PageInfo;
import com.kh.dungjip.house.model.vo.House;
import com.kh.dungjip.house.model.vo.HouseImg;
import com.kh.dungjip.house.model.vo.Jjim;
import com.kh.dungjip.member.model.vo.Member;
import com.kh.dungjip.residentReview.model.vo.ResidentReview;
import com.kh.dungjip.residentReview.model.vo.ReviewImg;

@Repository
public class HouseDao {

	public int insertHouseJSON(SqlSessionTemplate sqlSession, House house) {
		return sqlSession.insert("houseMapper.insertHouseJSON", house);
	}

	public ArrayList<House> selectLocations(SqlSessionTemplate sqlSession) {
		ArrayList<House> list = (ArrayList) sqlSession.selectList("houseMapper.selectLocations");
		return list;
	}

	public ArrayList<House> selectHouse(SqlSessionTemplate sqlSession, String type) {
		ArrayList<House> list = (ArrayList) sqlSession.selectList("houseMapper.selectHouse", type);
		return list;
	}

	//찜하기
	public int insertJjim(SqlSessionTemplate sqlSession, Jjim jj) {
		return sqlSession.insert("houseMapper.insertJjim",jj);
		
	}

	//찜데이터확인
	public Jjim selectJjim(SqlSessionTemplate sqlSession, Jjim jj) {
		return sqlSession.selectOne("houseMapper.selectJjim",jj);
	}

	//찜취소
	public int deleteJjim(SqlSessionTemplate sqlSession, Jjim jj) {
		return sqlSession.delete("houseMapper.deleteJjim",jj);
	}
	
	public ArrayList<HouseImg> selectHouseThumnail(SqlSessionTemplate sqlSession, String type) {
		ArrayList<HouseImg> hImgList = (ArrayList) sqlSession.selectList("houseMapper.selectHouseThumnail", type);
		return hImgList;
	}

		
	//부동산 집 리스트
	public ArrayList<House> selectHouseList(SqlSessionTemplate sqlSession, int esNo, PageInfo pi) {
		
		//몇개씩 보여줄지
		int limit = pi.getBoardLimit();
		
		//몇개씩 건너뛸지
		int offset = (pi.getCurrentPage()-1) * limit;
		
		RowBounds rowBounds = new RowBounds(offset,limit);
		
		return (ArrayList)sqlSession.selectList("houseMapper.selectHouseList",esNo,rowBounds);
	}

	//부동산 집 이미지
	public ArrayList<HouseImg> selectHouseImg(SqlSessionTemplate sqlSession, int esNo) {
		
		return (ArrayList)sqlSession.selectList("houseMapper.selectHouseImg",esNo);
	}

	//부동산이 갖고있는 집 개수
	public int selectHouseListCount(SqlSessionTemplate sqlSession, int esNo) {
		
		return sqlSession.selectOne("houseMapper.selectHouseListCount",esNo);
	}
	
	public ArrayList<House> selectHouseMain(SqlSessionTemplate sqlSession, String type){
		return (ArrayList)sqlSession.selectList("houseMapper.selectHouseMain", type);
	}

	public HouseImg selectHouseMainThumnail(SqlSessionTemplate sqlSession, int houseNo) {
		return sqlSession.selectOne("houseMapper.selectHouseMainThumnail", houseNo);
	}

	public ArrayList<House> memberMypageHousejjimForm(SqlSessionTemplate sqlSession, Member m,PageInfo pi) {
		
		//몇개를 보여줄지
		int limit = pi.getBoardLimit();
		//몇개를 건너뛸지
		int offset = (pi.getCurrentPage()-1)* limit;		
		
		RowBounds rowBounds = new RowBounds(offset,limit);
		
		return (ArrayList)sqlSession.selectList("houseMapper.memberMypageHousejjimForm",m,rowBounds);
	}

	public HouseImg memberMypageHousejjimImg(SqlSessionTemplate sqlSession, int houseNo) {
		// TODO Auto-generated method stub
		return sqlSession.selectOne("houseMapper.selectHouseMainThumnail",houseNo);
	}	

	public ArrayList<House> selectSubscribeHouseList(SqlSessionTemplate sqlSession, Map<String, Object> map) {
		return (ArrayList) sqlSession.selectList("houseMapper.selectSubscribeHouseList", map);
	}

	//부동산 집 리스트(모달창)
	public ArrayList<House> selectHouseModal(SqlSessionTemplate sqlSession, int esNo) {
	
		return (ArrayList)sqlSession.selectList("houseMapper.selectHouseModal",esNo);
	}

	//집 상세보기
	public House selectHouseDetail(SqlSessionTemplate sqlSession, int houseNo) {
		return sqlSession.selectOne("houseMapper.selectHouseDetail", houseNo);
	}

	//상세보기 집 이미지
	public ArrayList<HouseImg> selectHouseImgDetail(SqlSessionTemplate sqlSession, int houseNo) {
		return (ArrayList)sqlSession.selectList("houseMapper.selectHouseImgDetail", houseNo);
	}

	//비슷한 매물 찾기 list
	public ArrayList<House> houseLikeList(SqlSessionTemplate sqlSession, House house,PageInfo pi) {
		//몇개씩 보여줄지
		int limit = pi.getBoardLimit();
		
		//몇개씩 건너뛸지
		int offset = (pi.getCurrentPage()-1) * limit;
		
		RowBounds rowBounds = new RowBounds(offset,limit);
				
		return (ArrayList)sqlSession.selectList("houseMapper.houseLikeList",house,rowBounds);
	}

	//비슷한 매물 찾기 img
	public ArrayList<HouseImg> houseImgLike(SqlSessionTemplate sqlSession, House house) {
		return (ArrayList)sqlSession.selectList("houseMapper.houseImgLike",house);

	}

	//거주자 리뷰 리스트
	public ArrayList<ResidentReview> selectResidentReviewList(SqlSessionTemplate sqlSession, int houseNo) {
		
		return (ArrayList)sqlSession.selectList("houseMapper.selectResidentReviewList",houseNo);
	}

	//거주자 리뷰 총점
	public int selectResidentReviewSum(SqlSessionTemplate sqlSession, int houseNo) {
	
		return sqlSession.selectOne("houseMapper.selectResidentReviewSum",houseNo);
	}

	//거주자 리뷰 수
	public int selectResidentReviewCount(SqlSessionTemplate sqlSession, int houseNo) {
		
		return sqlSession.selectOne("houseMapper.selectResidentReviewCount",houseNo);
	}

	//매물 리뷰 작성
	public int insertResidentReview(SqlSessionTemplate sqlSession, ResidentReview rr) {
		

		return sqlSession.insert("houseMapper.insertResidentReview",rr);
	}

	public void enrollReviewImg(SqlSessionTemplate sqlSession, ReviewImg reviewImg) {
		
		sqlSession.insert("houseMapper.enrollReviewImg",reviewImg);
		
	}

	public int insertMemberKeyword(SqlSessionTemplate sqlSession, Map<String, Object> map) {
		// TODO Auto-generated method stub
		return sqlSession.insert("houseMapper.insertMemberKeyword",map);
	}

	//매물 리뷰 수정 상세뷰 
	public ResidentReview ResidentReviewDetail(SqlSessionTemplate sqlSession, int reReviewNo) {
		
		return sqlSession.selectOne("houseMapper.ResidentReviewDetail",reReviewNo);
	}

	public int selectBuilding(SqlSessionTemplate sqlSession, int houseNo) {
		
		return sqlSession.selectOne("houseMapper.selectBuilding",houseNo);
	}

	public int selectBuildingCount(SqlSessionTemplate sqlSession, int houseNo) {
	
		return sqlSession.selectOne("houseMapper.selectBuildingCount",houseNo);
	}

	public int selectTraffic(SqlSessionTemplate sqlSession, int houseNo) {
		
		return sqlSession.selectOne("houseMapper.selectTraffic",houseNo);
	}

	public int selectTrafficCount(SqlSessionTemplate sqlSession, int houseNo) {
		
		return sqlSession.selectOne("houseMapper.selectTrafficCount",houseNo);
	}

	public int selectInterior(SqlSessionTemplate sqlSession, int houseNo) {
		
		return sqlSession.selectOne("houseMapper.selectInterior",houseNo);
	}

	public int selectInteriorCount(SqlSessionTemplate sqlSession, int houseNo) {
		
		return sqlSession.selectOne("houseMapper.selectInteriorCount",houseNo);
	}

	public int selectSafety(SqlSessionTemplate sqlSession, int houseNo) {
		
		return sqlSession.selectOne("houseMapper.selectSafety",houseNo);
	}

	public int selectSafetyCount(SqlSessionTemplate sqlSession, int houseNo) {
		
		return sqlSession.selectOne("houseMapper.selectSafetyCount",houseNo);
	}

	public int selectLife(SqlSessionTemplate sqlSession, int houseNo) {
	
		return sqlSession.selectOne("houseMapper.selectLife",houseNo);
	}

	public int selectLifeCount(SqlSessionTemplate sqlSession, int houseNo) {
	
		return sqlSession.selectOne("houseMapper.selectLifeCount",houseNo);
	}

	//마이페이지 찜 목록에서 찜 해제
	public int mypageHjjimdelete(SqlSessionTemplate sqlSession, int houseNo) {
		// TODO Auto-generated method stub
		return sqlSession.delete("houseMapper.mypageHjjimdelete",houseNo);
	}

	//비슷한 매물 전체 개수
	public int selectHouseLikeCount(SqlSessionTemplate sqlSession, House house) {
		return sqlSession.selectOne("houseMapper.selectHouseLikeCount",house);
	}
	
	//마이페이지 집 찜 페이징
	public int selectListCount(SqlSessionTemplate sqlSession, Member m) {
		// TODO Auto-generated method stub
		return sqlSession.selectOne("houseMapper.selectListCount",m);
	}

	public ArrayList<House> memberMypageEstateHouseList(SqlSessionTemplate sqlSession, Integer esNo, PageInfo pi) {
		
		//몇개를 보여줄지
		int limit = pi.getBoardLimit();
		//몇개를 건너뛸지
		int offset = (pi.getCurrentPage()-1)* limit;		
		
		RowBounds rowBounds = new RowBounds(offset,limit);
		
		return (ArrayList)sqlSession.selectList("houseMapper.memberMypageEstateHouseList", esNo, rowBounds);
	}

	//마이페이지 매물내역 페이징
	public int selectEsHouseListCount(SqlSessionTemplate sqlSession) {
		// TODO Auto-generated method stub
		return sqlSession.selectOne("houseMapper.selectEsHouseListCount");
	}

	//마이페이지 임대인 매물내역 페이징
	public int mypageImdaHouseListCount(SqlSessionTemplate sqlSession) {
		return sqlSession.selectOne("houseMapper.mypageImdaHouseListCount");
	}
	
	//마이페이지 임대인 매물내역
	public ArrayList<House> mypageImdaHouseList(SqlSessionTemplate sqlSession,PageInfo pi, Member m) {
		
		//몇개를 보여줄지
		int limit = pi.getBoardLimit();
		//몇개를 건너뛸지
		int offset = (pi.getCurrentPage()-1)* limit;		
		
		RowBounds rowBounds = new RowBounds(offset,limit);
		
		return (ArrayList)sqlSession.selectList("houseMapper.mypageImdaHouseList", m,rowBounds);
	}

	//마이페이지 임대인 매물내역 삭제
	public int myImdaHouseDelete(SqlSessionTemplate sqlSession, int houseNo) {
		// TODO Auto-generated method stub
		return sqlSession.delete("houseMapper.myImdaHouseDelete", houseNo);
	}

	//매물 리뷰 수정
	public int updateResidentReview(SqlSessionTemplate sqlSession, Map<String, Object> paramMap) {
		
		return sqlSession.update("houseMapper.updateResidentReview",paramMap);
	}

	public int updateKeywords(SqlSessionTemplate sqlSession, Map<String, Object> paramMap) {
		
		
		
		return sqlSession.insert("houseMapper.insertKeyword",paramMap);
	}

	public int deleteKeywords(SqlSessionTemplate sqlSession, Map<String, Object> paramMap) {
		// TODO Auto-generated method stub
		return sqlSession.delete("houseMapper.deleteKeywords",paramMap);
	}


	public int updateReviewImg(SqlSessionTemplate sqlSession, Map<String, Object> paramMap) {
		// TODO Auto-generated method stub
		return sqlSession.update("houseMapper.updateReviewImg",paramMap);
	}

	public int selectResidentEmoCount(SqlSessionTemplate sqlSession, int reReviewNo) {
		// TODO Auto-generated method stub
		return sqlSession.selectOne("houseMapper.selectResidentEmoCount", reReviewNo);
	}

	public int selectResidentReviewLikeCount(SqlSessionTemplate sqlSession, Map<String, Object> numMap) {
		// TODO Auto-generated method stub
		int count = 0;
		try {
			sqlSession.selectOne("houseMapper.selectResidentReviewLikeCount", numMap);
			if(count > 0) {
				count = 1;
			}
		} catch(Exception e) {
			count = 0;
		}
		
		return count;
	}

	public int selectReviewLikeCount(SqlSessionTemplate sqlSession, Map<String, Object> map) {
		// TODO Auto-generated method stub
		int count = 0;
		try {
			count = sqlSession.selectOne("houseMapper.selectReviewLikeCount", map);

			System.out.println("controller count");
			System.out.println(count);
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
		return sqlSession.delete("houseMapper.decreaseCount", map);
	}

	public int increaseReReLikeCount(SqlSessionTemplate sqlSession, Map<String, Object> map) {
		// TODO Auto-generated method stub
		return sqlSession.insert("houseMapper.increaseReReLikeCount", map);
	}
	//중개인 예약내역 페이징
	public int mypagemypageEsReservationCount(SqlSessionTemplate sqlSession, Integer esNo) {
		// TODO Auto-generated method stub
		return sqlSession.selectOne("houseMapper.mypagemypageEsReservationCount",esNo);

	}

}
