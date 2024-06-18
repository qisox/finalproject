package com.kh.dungjip.house.model.service;

import java.util.List;

import com.kh.dungjip.house.model.vo.House;
import com.kh.dungjip.house.model.vo.HouseImg;

public interface HouseDeleteService {

	List<House> selectHouseList();

	List<HouseImg> selectImgList();

	int deleteHouse(House house);


}
