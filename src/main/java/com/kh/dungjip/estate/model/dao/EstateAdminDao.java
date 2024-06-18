package com.kh.dungjip.estate.model.dao;

import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.stereotype.Repository;

import com.kh.dungjip.estate.model.vo.Estate;

@Repository
public class EstateAdminDao {

	public List<Estate> selectEstateLists(SqlSessionTemplate sqlSession) {
		
		return sqlSession.selectList("estateMapper.selectEstateLists");
	}

	public int banEstate(SqlSessionTemplate sqlSession, Estate estate) {
		
		return sqlSession.update("estateMapper.banEstate", estate);
	}

	public int permitEstate(SqlSessionTemplate sqlSession, Estate estate) {
		
		return sqlSession.update("estateMapper.permitEstate", estate);
	}

}
