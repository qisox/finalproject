package com.kh.dungjip.house.model.vo;
import java.sql.Date;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

@NoArgsConstructor
@AllArgsConstructor
@Data
public class ReservationNew {
	private int reservationNo;
	private int selectEsNo;
	private int selectUserNo;
	private String clickedYMD;
	private int selectTime;

}
