package com.kh.dungjip.common.report.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.kh.dungjip.common.report.model.service.ReportEstateService;
import com.kh.dungjip.common.report.model.vo.ReportEstate;
import com.kh.dungjip.common.websocket.model.vo.ChatMessage;

@Controller
@RequestMapping("/admin")
public class ReportEstateController {
	
	@Autowired
	private ReportEstateService reportEstateService;

	@GetMapping("/reportList") 
	public String selectReportList(Model model) {
		List<ReportEstate> reportList = reportEstateService.selectReportList();
		
		System.out.println(reportList);
		
		model.addAttribute("reportList", reportList);
		
		return "websocket/reportListView";
	}
	
	@GetMapping("/chatHistory")
	@ResponseBody
	public List<ChatMessage> selectChatHistory(@RequestParam int chatRoomNo, Model model) {
		System.out.println(chatRoomNo);
	    List<ChatMessage> chatHistory = reportEstateService.selectChatHistory(chatRoomNo);
	    System.out.println(chatHistory);

	    return chatHistory;
	}
	
	@PostMapping("/approveReport")
    @ResponseBody
    public void approveReport(@RequestParam int chatRoomNo) {
        // 피신고자의 userNo를 이용하여 member 테이블의 count를 1 증가
        reportEstateService.increaseMemberCount(chatRoomNo);
        reportEstateService.updateReportStatus(chatRoomNo);
    }

    @PostMapping("/cancelReport")
    @ResponseBody
    public void cancelReport(@RequestParam int chatRoomNo) {
        reportEstateService.updateReportStatus(chatRoomNo);
    }
	
}

