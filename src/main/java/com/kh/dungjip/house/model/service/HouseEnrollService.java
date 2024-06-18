package com.kh.dungjip.house.model.service;

import com.kh.dungjip.house.model.vo.House;
import com.kh.dungjip.house.model.vo.HouseImg;

public interface HouseEnrollService {

	int enrollHouse(House house);

	void enrollHouseImg(HouseImg houseImg);

}
