package com.kh.dungjip.house.model.vo;

import lombok.AllArgsConstructor;
import lombok.Builder;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@AllArgsConstructor
@NoArgsConstructor
@Builder
//찜하기
public class Jjim {
	private int houseNo; //HOUSE_NO	NUMBER
	private int userNo; //USER_NO	NUMBER
}
