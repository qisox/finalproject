package com.kh.dungjip.estate.model.vo;

import java.sql.Date;

import com.kh.dungjip.house.model.vo.House;
import com.kh.dungjip.house.model.vo.Reservation;
import com.kh.dungjip.member.model.vo.Member;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

@NoArgsConstructor
@AllArgsConstructor
@Data
public class EstateReview {

	private int esReNo;
	private int esNo;
	private int userNo;
	private int esReScore;
	private String esReContent;
	private String esReCreateDate;
	private String esReType;
	private String esReStatus;
	private int houseNo;
	
	private Member member;
	private House house;
	private Own own;
	private Reservation reservation;

    // Member 속성에 접근할 수 있는 getter 메서드
    public Member getMember() {
        return member;
    }

    // Member 속성에 값을 설정할 수 있는 setter 메서드
    public void setMember(Member member) {
        this.member = member;
    }
    
    // Member 속성에 접근할 수 있는 getter 메서드
    public House getHouse() {
        return house;
    }

    // Member 속성에 값을 설정할 수 있는 setter 메서드
    public void setHouse(House house) {
        this.house = house;
    }
    
    // Member 속성에 접근할 수 있는 getter 메서드
    public Own getOwn() {
        return own;
    }

    // Member 속성에 값을 설정할 수 있는 setter 메서드
    public void setOwn(Own own) {
        this.own = own;
    }
    
    public Reservation getReservation() {
    	return reservation;
    }
    
    public void setReservation(Reservation reservation) {
    	this.reservation = reservation;
    }
}
