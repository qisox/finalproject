package com.kh.dungjip.notice.controller;

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

import com.kh.dungjip.notice.model.service.NoticeService;
import com.kh.dungjip.notice.model.vo.Notice;

@Controller
@RequestMapping("/notice")
public class NoticeController {

@Autowired
private NoticeService noticeService;
	
	@GetMapping("/list")
	public String selectNoticeList(Model model) {
	    List<Notice> noticeList = noticeService.selectList();
	    
	    model.addAttribute("noticeList", noticeList);
	    
	    return "notice/noticeListView";
	}

	@GetMapping("/increaseCount/{noticeNo}")
    @ResponseBody
    public ResponseEntity<String> increaseCount(@PathVariable("noticeNo") int noticeNo) {
        
		noticeService.increaseCount(noticeNo);
        
        return new ResponseEntity<>("Success", HttpStatus.OK);
	
	}
	
    @GetMapping("/detail/{noticeNo}")
    @ResponseBody
    public Notice noticeDetail(@PathVariable("noticeNo") int noticeNo) {
        return noticeService.getNoticeByNo(noticeNo);
    }
	
    @PostMapping("/insert")
    @ResponseBody
    public ResponseEntity<String> insertNotice(@RequestBody Notice notice) {
        int result = noticeService.insertNotice(notice);
        
        if (result > 0) {
            return new ResponseEntity<>("Success", HttpStatus.OK);
        } else {
            return new ResponseEntity<>("Fail", HttpStatus.INTERNAL_SERVER_ERROR);
        }
    }
    
    @GetMapping("/update/{noticeNo}")
    public ResponseEntity<Notice> getNoticeForUpdate(@PathVariable int noticeNo) {
        try {
            // noticeNo를 사용하여 해당 번호의 공지사항 정보를 가져옴
            Notice notice = noticeService.getNoticeByNoticeNo(noticeNo);

            if (notice != null) {
                return new ResponseEntity<>(notice, HttpStatus.OK);
            } else {
                return new ResponseEntity<>(HttpStatus.NOT_FOUND);
            }
        } catch (Exception e) {
            e.printStackTrace();
            return new ResponseEntity<>(HttpStatus.INTERNAL_SERVER_ERROR);
        }
    }
    

    @PostMapping("/update")
    @ResponseBody
    public ResponseEntity<String> updateNotice(@RequestBody Notice notice) {
        int result = noticeService.updateNotice(notice);

        if (result > 0) {
            return new ResponseEntity<>("Success", HttpStatus.OK);
        } else {
            return new ResponseEntity<>("Fail", HttpStatus.INTERNAL_SERVER_ERROR);
        }
    }

    @PostMapping("/delete")
    @ResponseBody
    public ResponseEntity<String> deleteNotice(@RequestBody Notice notice) {
        int result = noticeService.deleteNotice(notice);
        
        if (result > 0) {
            return new ResponseEntity<>("Success", HttpStatus.OK);
        } else {
            return new ResponseEntity<>("Fail", HttpStatus.INTERNAL_SERVER_ERROR);
        }
    }
	
}
