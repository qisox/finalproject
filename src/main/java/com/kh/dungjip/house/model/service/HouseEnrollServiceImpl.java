package com.kh.dungjip.house.model.service;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.kh.dungjip.house.model.dao.HouseEnrollDao;
import com.kh.dungjip.house.model.vo.House;
import com.kh.dungjip.house.model.vo.HouseImg;

@Service
public class HouseEnrollServiceImpl implements HouseEnrollService {
	
	@Autowired
	private HouseEnrollDao houseEnrollDao;
	
	@Autowired
	private SqlSessionTemplate sqlSession;

	@Transactional
	@Override
	public int enrollHouse(House house) {

		int hno = houseEnrollDao.enrollHouse(sqlSession, house);
		System.out.println("서비스"+hno);
		return house.getHouseNo();
	}

	@Override
	public void enrollHouseImg(HouseImg houseImg) {

		houseEnrollDao.enrollHouseImg(sqlSession, houseImg);
	}


}
