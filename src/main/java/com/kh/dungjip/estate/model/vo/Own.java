package com.kh.dungjip.estate.model.vo;

import java.sql.Date;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

@NoArgsConstructor
@AllArgsConstructor
@Data
public class Own {

	private int esNo;
	private int houseNo;
	private Date enrollDate;
	private String status;
}
