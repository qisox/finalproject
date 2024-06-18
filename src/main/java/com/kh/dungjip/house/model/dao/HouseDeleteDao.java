package com.kh.dungjip.house.model.dao;

import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.stereotype.Repository;

import com.kh.dungjip.house.model.vo.House;
import com.kh.dungjip.house.model.vo.HouseImg;

@Repository
public class HouseDeleteDao {

	public List<House> selectHouseList(SqlSessionTemplate sqlSession) {
		
		return sqlSession.selectList("houseMapper.selectHouseList1");
	}
	
	public List<HouseImg> selectImgList(SqlSessionTemplate sqlSession) {

		return sqlSession.selectList("houseMapper.selectImgList");
	}

	public int deleteHouse(SqlSessionTemplate sqlSession, House house) {
		
		return sqlSession.update("houseMapper.deleteHouse", house);
	}

}
