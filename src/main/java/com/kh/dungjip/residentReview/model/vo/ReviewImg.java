package com.kh.dungjip.residentReview.model.vo;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

@NoArgsConstructor
@AllArgsConstructor
@Data
public class ReviewImg {

	private int reviewImgNo;
	private int reReviewNo;
	private String originName;
	private String changeName;
	private String uploadDate;
	private String status;
}
