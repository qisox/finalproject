package com.kh.dungjip.residentReview.model.vo;

import java.sql.Date;

import com.kh.dungjip.member.model.vo.Member;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@AllArgsConstructor
@NoArgsConstructor
public class ResidentReview {
	private int reReviewNo;	//	RE_REVIEW_NO	NUMBER
	private int userNo;	//	USER_NO	NUMBER
	private int houseNo;	//	HOUSE_NO	NUMBER	
	private int interiorScore;	//	INTERIOR_SCORE	NUMBER
	private int buildingScore;	//	BUILDING_SCORE	NUMBER
	private int trafficScore;	//	TRAFFIC_SCORE	NUMBER
	private int safetyScore;	//	SAFETY_SCORE	NUMBER
	private int lifeScore;	//	LIFE_SCORE	NUMBER
	private String reAdContent;	//	RE_AD_CONTENT	VARCHAR2(1000 BYTE)
	private String reDisContent;	//	RE_DIS_CONTENT	VARCHAR2(1000 BYTE)
	private String reCreateDate;	//	RE_CREATE_DATE	DATE
	private String rePeriod;	//	RE_PERIOD	VARCHAR2(100 BYTE)
	private String reFloor;	//	RE_FLOOR	VARCHAR2(100 BYTE)
	private String status;	//	STATUS	CHAR(1 BYTE)
	private int total;
	
	private Member member;
	
	public Member getMember() {
        return member;
    }

    // Member 속성에 값을 설정할 수 있는 setter 메서드
    public void setMember(Member member) {
        this.member = member;
    }
    
    private ReviewImg reviewImg;
    
    public ReviewImg getReviewImg() {
    	return reviewImg;
    }
    
    public void setReviewImg(ReviewImg reviewImg) {
    	this.reviewImg = reviewImg;
    }
    
    private Keyword keyword;
    
    public Keyword getKeyword() {
    	return keyword;
    }
    
    public void setKeyWord(Keyword keyword) {
    	this.keyword = keyword;
    }
    
    private MemberKeyword memberKeyword;
    
    public MemberKeyword getMemberKeyword() {
    	return memberKeyword;
    }
    
    public void setMemberKeyword(MemberKeyword memberKeyword) {
    	this.memberKeyword = memberKeyword;
    }
    
    private String positiveKeywords;
    private String negativeKeywords;

    // getters and setters
    public String getPositiveKeywords() {
        return positiveKeywords;
    }

    public void setPositiveKeywords(String positiveKeywords) {
        this.positiveKeywords = positiveKeywords;
    }

    public String getNegativeKeywords() {
        return negativeKeywords;
    }

    public void setNegativeKeywords(String negativeKeywords) {
        this.negativeKeywords = negativeKeywords;
    }
    
    private String positive;
    private String negative;

    // getters and setters
    public String getPositive() {
        return positive;
    }

    public void setPositive(String positive) {
        this.positive = positive;
    }

    public String getNegative() {
        return negative;
    }

    public void setNegative(String negative) {
        this.negative = negative;
    }
    
    
}

