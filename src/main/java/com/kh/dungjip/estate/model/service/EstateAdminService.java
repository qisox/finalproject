package com.kh.dungjip.estate.model.service;

import java.util.List;

import com.kh.dungjip.estate.model.vo.Estate;

public interface EstateAdminService {

	List<Estate> selectEstateLists();

	int banEstate(Estate estate);

	int permitEstate(Estate estate);

}
