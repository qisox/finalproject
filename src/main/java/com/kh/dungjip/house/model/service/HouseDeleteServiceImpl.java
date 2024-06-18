package com.kh.dungjip.house.model.service;

import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.kh.dungjip.house.model.dao.HouseDeleteDao;
import com.kh.dungjip.house.model.vo.House;
import com.kh.dungjip.house.model.vo.HouseImg;

@Service
public class HouseDeleteServiceImpl implements HouseDeleteService {

	@Autowired
	private HouseDeleteDao houseDeleteDao;
	
	@Autowired
	private SqlSessionTemplate sqlSession;
	
	
	@Override
	public List<House> selectHouseList() {
		
		return houseDeleteDao.selectHouseList(sqlSession);
	}

	@Override
	public List<HouseImg> selectImgList() {
		
		return houseDeleteDao.selectImgList(sqlSession);
	}

	@Override
	public int deleteHouse(House house) {
		
		return houseDeleteDao.deleteHouse(sqlSession, house);
	}



}
