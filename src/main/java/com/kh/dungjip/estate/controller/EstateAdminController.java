package com.kh.dungjip.estate.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.kh.dungjip.estate.model.service.EstateAdminService;
import com.kh.dungjip.estate.model.vo.Estate;

@Controller
@RequestMapping("/admin")
public class EstateAdminController {
	
	@Autowired EstateAdminService estateAdminService;
	
	@GetMapping("/estateList") 
	public String selectEstateList(Model model) {
		List<Estate> estateList = estateAdminService.selectEstateLists();
		
		model.addAttribute("estateList", estateList);
		
		return "estate/estateListView";
	}
	
	@PostMapping("/banEstate")
	@ResponseBody
	public ResponseEntity<String> banEstate(@RequestBody Estate estate) {
		int result = estateAdminService.banEstate(estate);
		
		if (result > 0) {
            return new ResponseEntity<>("Success", HttpStatus.OK);
        } else {
            return new ResponseEntity<>("Fail", HttpStatus.INTERNAL_SERVER_ERROR);
        }
		
	}
	
	@PostMapping("permitEstate")
	@ResponseBody
	public ResponseEntity<String> permitEstate(@RequestBody Estate estate) {
		int result = estateAdminService.permitEstate(estate);
		
		if (result > 0) {
            return new ResponseEntity<>("Success", HttpStatus.OK);
        } else {
            return new ResponseEntity<>("Fail", HttpStatus.INTERNAL_SERVER_ERROR);
        }
	}
	
	

}
