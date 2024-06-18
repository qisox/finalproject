package com.kh.dungjip.house.model.vo;

import java.sql.Date;

import com.kh.dungjip.member.model.vo.Member;

import lombok.AllArgsConstructor;
import lombok.Builder;
import lombok.Data;
import lombok.NoArgsConstructor;

@NoArgsConstructor
@AllArgsConstructor
@Data
@Builder
public class House {

	private int houseNo;
	private String housePrice;
	private int houseRent;
	private Double houseSquare;
	private String houseStyle;
	private String houseTitle;
	private String houseDetails;
	private String houseType;
	private Double houseLatitude;
	private Double houseLongitude;
	private Date houseUploadTime;
	private String houseAddress;
	private int houseFloor;
	private int houseBuildingFloor;
	private int houseToilet;
	private int houseRooms;
	private int houseParkAble;
	private String houseBalcony;
	private int houseMaintainCost;
	private String houseDoItNow;
	private String houseBuildDate;
	private String houseAnimals;
	private String houseName;
	private int userNo;
	private String status;
	
	private Member member;

    // Member 속성에 접근할 수 있는 getter 메서드
    public Member getMember() {
        return member;
    }

    // Member 속성에 값을 설정할 수 있는 setter 메서드
    public void setMember(Member member) {
        this.member = member;
    }

    //비슷한 매물 보기
	public House(String houseType, String houseAddress) {
		super();
		this.houseType = houseType;
		this.houseAddress = houseAddress;
	}
	
	
	
}
