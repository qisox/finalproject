package com.kh.dungjip.house.controller;

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

import com.kh.dungjip.house.model.service.HouseDeleteService;
import com.kh.dungjip.house.model.vo.House;
import com.kh.dungjip.house.model.vo.HouseImg;

@Controller
@RequestMapping("/admin")
public class HouseDeleteController {
	
	@Autowired
	HouseDeleteService houseDeleteService;
	
	@GetMapping("/houseList") 
	public String selectHouseList(Model model) {
		List<House> houseList = houseDeleteService.selectHouseList();
		List<HouseImg> imgList = houseDeleteService.selectImgList();
		
		model.addAttribute("houseList", houseList);
		model.addAttribute("imgList", imgList);
		
		return "house/houseListView";
		
	}
	
	@PostMapping("/deleteHouse")
	public ResponseEntity<String> deleteHouse(@RequestBody House house) {
		int result = houseDeleteService.deleteHouse(house);
		
		if (result > 0) {
            return new ResponseEntity<>("Success", HttpStatus.OK);
        } else {
            return new ResponseEntity<>("Fail", HttpStatus.INTERNAL_SERVER_ERROR);
        }
	}
	
	
	
}
