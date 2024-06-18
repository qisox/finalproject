package com.kh.dungjip.estate.model.service;

import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.kh.dungjip.estate.model.dao.EstateAdminDao;
import com.kh.dungjip.estate.model.vo.Estate;

@Service
public class EstateAdminServiceImpl implements EstateAdminService {

	@Autowired EstateAdminDao estateAdminDao;
	
	@Autowired SqlSessionTemplate sqlSession;
	
	@Override
	public List<Estate> selectEstateLists() {
		
		return estateAdminDao.selectEstateLists(sqlSession);
	}

	@Override
	public int banEstate(Estate estate) {
		
		return estateAdminDao.banEstate(sqlSession, estate);
	}

	@Override
	public int permitEstate(Estate estate) {
		
		return estateAdminDao.permitEstate(sqlSession, estate);
	}

}
