package com.kh.dungjip.residentReview.controller;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import com.kh.dungjip.residentReview.model.service.ResidentReviewService;

@Controller
public class ResidentReviewController {

	@Autowired
	private ResidentReviewService residentReviewService;
	
	//삭제
	@RequestMapping("/residentReview/delete.re")
	public String residentRebiewDelete(@RequestParam("reReviewNo")int reReviewNo,Model model,HttpSession session) {
		
		int result = residentReviewService.esReviewDelete(reReviewNo);
		
		if(result > 0) {
			
			session.setAttribute("alertMsg", "삭제가 완료되었습니다.");
			
		}else {
			
			session.setAttribute("errorMsg", "다시 시도해주세요.");	
			
		}
		
		return "redirect:/myHReview.me";
		
	}
	
	//수정
	@RequestMapping("updateReReview.es")
	public String updateReReview(@RequestParam("reReviewNo")int reReviewNo,@RequestParam("interiorScore")int interiorScore,
			@RequestParam("buildingScore")int buildingScore,@RequestParam("trafficScore")int trafficScore,
			@RequestParam("safetyScore")int safetyScore,@RequestParam("lifeScore")int lifeScore,
			@RequestParam("reAdContent")String reAdContent,@RequestParam("reDisContent")String reDisContent,Model model, HttpSession session) {
		
		
		
		int result = residentReviewService.updateReReview(reReviewNo,interiorScore,buildingScore,trafficScore,safetyScore,lifeScore,reAdContent,reDisContent);
		
		if(result > 0) {
			session.setAttribute("alertMsg", "수정이 완료되었습니다.");
			return "redirect:/myHReview.me";
		}else {
			session.setAttribute("errorMsg", "다시 시도해주세요.");
			return "common/errorPage";
		}
		
	}
	
	//공감삭제
	@RequestMapping("residentReview/reRedelete.me")
	public String myReReviewDelete(@RequestParam("reReviewNo")int reReviewNo,Model model,HttpSession session) {
		
		int result = residentReviewService.myReReviewDelete(reReviewNo);
		
		if(result > 0) {
			
			session.setAttribute("alertMsg", "삭제가 완료되었습니다.");
			
		}else {
			
			session.setAttribute("errorMsg", "다시 시도해주세요.");	
			
		}
		
		return "redirect:/myReReviewLike.me";
	}
	
}
