package com.kh.dungjip.member.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.kh.dungjip.member.model.service.AdminService;
import com.kh.dungjip.member.model.vo.Member;

@Controller
@RequestMapping("/admin")
public class AdminController {
	
	@Autowired
	private AdminService adminService;
	
	@GetMapping("/list")
	public String selectMemberList(Model model) {
		List<Member> memberList = adminService.selectMemberList();
		
		model.addAttribute("memberList", memberList);
	
		return "member/memberListView";
	}

	@PostMapping("/banMember")
	@ResponseBody
	public ResponseEntity<String> banMember(@RequestBody Member member) {
		int result = adminService.banMember(member);
		
		if (result > 0) {
            return new ResponseEntity<>("Success", HttpStatus.OK);
        } else {
            return new ResponseEntity<>("Fail", HttpStatus.INTERNAL_SERVER_ERROR);
        }
	}
	
	@PostMapping("/permitMember")
	@ResponseBody
	public ResponseEntity<String> permitMember(@RequestBody Member member) {
		int result = adminService.permitMember(member);
		
		if (result > 0) {
            return new ResponseEntity<>("Success", HttpStatus.OK);
        } else {
            return new ResponseEntity<>("Fail", HttpStatus.INTERNAL_SERVER_ERROR);
        }
	}
	
	
	
	
}
