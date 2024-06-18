package com.kh.dungjip.estate.model.vo;

import java.sql.Date;

import com.kh.dungjip.member.model.vo.Member;
import com.kh.dungjip.estate.model.vo.EsReLike;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

@NoArgsConstructor
@AllArgsConstructor
@Data
public class Estate {

	private int esNo;
	private int userNo;//회원번호
	private String esName;
	private String esCeo;
	private String esPhone;
	private String esNum;
	private String esRegisterNum;
	private String esAddress;
	private String esContent;
	private String esImage;
	private int esCount;
	private String esStatus;
	private Date enrollDate;
	private String esIntro;

	
	private Member member;

    // Member 속성에 접근할 수 있는 getter 메서드
    public Member getMember() {
        return member;
    }

    // Member 속성에 값을 설정할 수 있는 setter 메서드
    public void setMember(Member member) {
        this.member = member;
    }
    
    private EsReLike esReLike;
    
    public EsReLike getEsReLike() {
    	return esReLike;
    }
    
    public void setEsReLike(EsReLike esReLike) {
    	this.esReLike = esReLike;
    }
    
    private int esReNo;

    public int getEsReNo() {
        return esReNo;
    }

    public void setEsReNo(int esReNo) {
        this.esReNo = esReNo;
    }
}
