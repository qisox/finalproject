package com.kh.dungjip.house.model.dao;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.stereotype.Repository;

import com.kh.dungjip.house.model.vo.House;
import com.kh.dungjip.house.model.vo.HouseImg;

@Repository
public class HouseEnrollDao {

	public int enrollHouse(SqlSessionTemplate sqlSession, House house) {
		System.out.println(house);
		return sqlSession.insert("houseMapper.enrollHouse", house);
	}
	public void enrollHouseImg(SqlSessionTemplate sqlSession, HouseImg houseImg) {

		sqlSession.insert("houseMapper.enrollHouseImg", houseImg);
	}

}
