
package com.kh.dungjip.common.websocket.controller;

import java.io.IOException;
import java.nio.file.Files;
import java.nio.file.Paths;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;
import java.util.stream.Collectors;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.kh.dungjip.common.report.model.vo.ReportEstate;
import com.kh.dungjip.common.websocket.model.service.ChatService;
import com.kh.dungjip.common.websocket.model.vo.ChatMessage;
import com.kh.dungjip.common.websocket.model.vo.ChatRoom;
import com.kh.dungjip.common.websocket.model.vo.JoinChat;
//import com.kh.dungjip.common.websocket.model.service.ChatService;
import com.kh.dungjip.member.model.vo.Member;

@Controller
@RequestMapping("/websocket")
public class WebsocketController {

	@Autowired
	private ChatService chatService;

	private List<String> badWords;// 욕설필터링

	public WebsocketController() {// 생성자에서 파일을 읽어온다.

		try {

			badWords = Files.lines(Paths
					.get("C:\\Users\\easyoh\\git\\DungJip\\Dungjip\\src\\main\\resources\\badWords\\BadWordsList.txt"))
					.collect(Collectors.toList());// txt파일을 읽어들여 list에 담는다.

		} catch (IOException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();

		}
	}

	@GetMapping("/ask")
	public String ask(HttpSession session, int estateUserNo, Model m) {
		// 이제 채팅창이 중복안되게 loginUserNo랑 estateUserNo랑 만들어진 채팅방이 있을때 바로 return값으로 넘아가게 하자

		// 현재 채팅방의 공인중개사 정보 띄우기
		Member estate = chatService.clickIndividualEstate(estateUserNo);// 현재 클릭한 공인중개사의 userNo를 가지고 공인중개사의 정보를 가지고온다.
		m.addAttribute("estate", estate);// ask.jsp에 넘겨줌

		Member loginUser = (Member) session.getAttribute("loginUser");// 현재 세션에 저장되어있는 loginUser의 정보를 가지고온다.

		int loginUserNo = loginUser.getUserNo();

		String estateUserName = estate.getUserName();

		JoinChat createRoom = new JoinChat(loginUserNo, estateUserName);// 채팅방을 만들 유저의 넘버와 채팅방의 이름을 설정

		JoinChat c = new JoinChat(loginUserNo, estateUserNo);
		// chatService.alreadyUsedChatRoomCheck//채팅방이 이미 존재하면 안만들어지게 한다.

		int count = chatService.alreadyUsedChatRoomCheck(c);

		if (count == 0 && loginUserNo != estateUserNo) {// 기존에 존재하지 않는 채팅방이면 만들고 존재 하면 if문을 채팅방을 생성하지 말거라

			int createChatRoom = chatService.createChatRoom(createRoom);// 유저가 채팅방을 만든다

			if (createChatRoom > 0) {

				int nowCreateChatRoomMe = chatService.nowCreateChatRoomMe(loginUserNo);// 유저가 방금만든채팅방에 들어간다

				if (nowCreateChatRoomMe > 0) {

					chatService.joinNowCreateChatRoom(estateUserNo);// 상대유저가 유저가 만든 채팅방에 들어간다

				}
			}
		}

		ArrayList<ChatRoom> chatList = chatService.chatRoomList(loginUserNo);// 현재 유저가 채팅하고있는 방의 리스트를 가지고온다.


		m.addAttribute("chatList", chatList);

		return "websocket/ask";
	}
	
	@ResponseBody
	@GetMapping("/nowFileUpMsg.ch")
	public ArrayList<Integer> nowFileUpMsg(@RequestParam("cnoList[]") int[] cnoList, int mno) {
	
		Map<String, Object> map = new HashMap();
		
		map.put("mno", mno);
		
		ArrayList<Integer> intArr = new ArrayList<>();
		
		for(int i = 0; i < cnoList.length; i++) {//반복문을 돌때마다 값을 조회
			map.put("cno", cnoList[i]);//방번호를 집어넣는다

			int count = chatService.nowFileUpMsg(map);//dao같다옴
			
			map.remove("cno");//1번인덱스인 .cno를 지우고 다시 다른 방번호 받아옴
			
			intArr.add(count);//ArrayList에 추가
		}
			return intArr;
	}
	
	
	 @ResponseBody
	  @GetMapping("/pileUpMsg.ch")// 쌓인 메세지 읽는 메소드 public int pileUpMsg(int cno,
	 public int pileUpMsg(int cno, int mno) {
	  
	  ChatMessage cm = new ChatMessage(cno,mno);
	  
	  int result =chatService.pileUpMsg(cm);
	  
	  return result; 
	  
	  }
	 

	@ResponseBody
	@PostMapping(value = "/selectChatMsg.ch", produces = "application/json; charset=UTF-8")
	public ArrayList<ChatMessage> selectChatMsg(int cno, Model m) {

		ArrayList<ChatMessage> chatMsg = chatService.selectChatMsg(cno);

		for (ChatMessage message : chatMsg) { // ChatMessage vo 클래스에서 chatMsg를 비교한다.
			String content = message.getContentMessage();//
			for (String badWord : badWords) {
				if (content.contains(badWord)) {
					message.setContentMessage("부적절한 메시지가 담겨있습니다");
				}
			}
		} // DB에 욕설이 담겨있는 그자체로 저장을 했는데 다시 채팅방이 로드 될때 db에 저장되어있는 그대로 나와서 필터링 작업을 다시해줍니다

		return chatMsg;

	}

	@ResponseBody
	@RequestMapping("/findChat.ch")
	public ArrayList<ChatRoom> findChat(@RequestParam("findChat") String findChat,
			@RequestParam("loginUserNo") int loginUserNo) {

		ChatRoom c = new ChatRoom(loginUserNo, findChat);

		ArrayList<ChatRoom> cr = chatService.findChat(c);

		return cr;

	}

	@ResponseBody
	@PostMapping("/report.ch")
	public int reportEstate(int userNo, int chatRoomNo, int estateNo, String reportReason) {

		ReportEstate reportEstate = new ReportEstate(userNo, chatRoomNo, estateNo, reportReason);

		int result = chatService.updateReportEstate(reportEstate);

		return result;

	}

	@ResponseBody
	@GetMapping("/deleteChatRoom.ch")
	public int deleteChatRoom(int chatNo) {

		int result1 = chatService.deleteJoinChatRoom(chatNo);

		if (result1 > 0) {
			
			int result2 = chatService.deleteChatMsg(chatNo);

			if (result2 > 0) {

				int result3 = chatService.deleteChatRoom(chatNo);

				

			}

		}

		return 0;
	}
	
	@ResponseBody
	@GetMapping("/reportCount.ch")
	public int reportCount(int eno) {
	
		
		int count = chatService.reportCount(eno);
		
		return count;
	}
	
	

}