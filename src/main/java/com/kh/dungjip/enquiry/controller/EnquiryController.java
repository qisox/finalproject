package com.kh.dungjip.enquiry.controller;

import java.io.File;
import java.io.IOException;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Date;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.bind.support.SessionStatus;
import org.springframework.web.multipart.MultipartFile;

import com.google.gson.Gson;
import com.kh.dungjip.enquiry.model.service.EnquiryService;
import com.kh.dungjip.enquiry.model.vo.Enquiry;
import com.kh.dungjip.member.model.vo.Member;

@Controller
public class EnquiryController {
	@Autowired
	private EnquiryService enquiryService;
	
	//문의하기 메인 (1:1문의)
	@RequestMapping("enquiry.en")
	public String enquiryMain() {
		return "enquiry/enquiryMain";
	}
	
	//문의하기 메인 (1:1문의 내역)
	@RequestMapping("enList.en")
	public String enquiryList() {
		return "enquiry/enquiryList";
	}
	
	//1:1문의 등록
	@PostMapping("insert.en")
	public String insertEnquiry(Enquiry en
							   ,MultipartFile enfile
							   ,HttpSession session) {
		
		if(!enfile.getOriginalFilename().equals("")){
			String enquiryImage = enfile.getOriginalFilename();
			String currentTime = new SimpleDateFormat("yyyyMMddHHmmss").format(new Date());
			int ranNum = (int)(Math.random()*90000+10000);
			String ext = enquiryImage.substring(enquiryImage.lastIndexOf("."));
			String changeName = currentTime+ranNum+ext;
			String savePath = session.getServletContext().getRealPath("/resources/enquiryUpfiles/");
			
			try {
				enfile.transferTo(new File(savePath+changeName));
			} catch (IllegalStateException | IOException e) {
				e.printStackTrace();
			}
			
			en.setEnquiryImage(enfile.getOriginalFilename());
			en.setChangeName("resources/enquiryUpfiles/"+changeName);
		}
		
		int result = enquiryService.insertEnquiry(en);
		
		if(result>0) {
			session.setAttribute("alertMsg", "문의하기 등록 성공");
			return "redirect:enquiry.en";
		}else {
			session.setAttribute("errorMsg", "문의하기 등록 실패");
			return "redirect:enquiry.en";
		}
	}
	
	//관리자 댓글 등록
	@PostMapping("reply.en")
	public String insertReply(Enquiry en
							 ,HttpSession session) {
		
		int result = enquiryService.insertReply(en);
		if(result>0) {
			session.setAttribute("alertMsg", "댓글 등록 성공");
			return "redirect:enList.en";
		}else {
			session.setAttribute("errorMsg", "댓글 등록 실패");
			return "redirect:enList.en";
		}
	}
	
	//더보기 버튼
	@ResponseBody
	@RequestMapping(value="moreEnquiry.en",produces="application/json; charset=UTF-8")
	public ArrayList<Enquiry> moreEnquiry(int enquiryList, int page) {
		int defaultPage = 5;
		int startIndex = (page - 1) * defaultPage + 1;
		enquiryList = startIndex + enquiryList - 1;
		Enquiry en = new Enquiry(enquiryList,startIndex);
		
		System.out.println(startIndex);
		System.out.println(enquiryList);
		System.out.println(page);
		
		ArrayList<Enquiry> enList = enquiryService.moreEnquiry(en);
		
		return enList;
	}
	
	@RequestMapping("/enquiry/delete.bo")
	public String myQnAdelete(@RequestParam("enquiryNo") int enquiryNo, Model model, HttpSession session) {	
		
		int result = enquiryService.myQnAdelete(enquiryNo);
		
		System.out.println(enquiryNo);	
		
		if(result > 0) {
			
			session.setAttribute("alertMsg", "삭제가 완료되었습니다.");
			
		}else {

			session.setAttribute("errorMsg", "다시 시도해주세요.");	
			
		}
		
		return "redirect:/myQnA.me";
	}
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
}