package com.kh.dungjip.house.model.vo;

import java.sql.Date;

import lombok.AllArgsConstructor;
import lombok.Builder;
import lombok.Data;
import lombok.NoArgsConstructor;

@NoArgsConstructor
@AllArgsConstructor
@Data
@Builder
public class HouseImg {
	private int fileNo;
	private int houseNo;
	private String originName;
	private String changeName;
	private Date uploadDate;
	private String status;
}
	