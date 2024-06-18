package com.kh.dungjip.member.controller;

import java.io.File;

import java.io.IOException;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Date;

import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import org.apache.commons.lang3.RandomStringUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.ModelAndView;

import com.kh.dungjip.common.model.vo.PageInfo;
import com.kh.dungjip.common.report.model.service.ReportEstateService;
import com.kh.dungjip.common.report.model.vo.ReportEstate;
import com.kh.dungjip.common.template.Pagination;
import com.kh.dungjip.enquiry.model.service.EnquiryService;
import com.kh.dungjip.enquiry.model.vo.Enquiry;
import com.kh.dungjip.estate.model.service.EstateService;
import com.kh.dungjip.estate.model.vo.EsReLike;
import com.kh.dungjip.estate.model.vo.Estate;

import com.kh.dungjip.house.model.vo.Reservation;

import com.kh.dungjip.estate.model.vo.EstateReview;
import com.kh.dungjip.house.model.service.HouseService;
import com.kh.dungjip.house.model.vo.House;
import com.kh.dungjip.house.model.vo.HouseImg;
import com.kh.dungjip.house.model.vo.Reservation;
import com.kh.dungjip.member.model.service.MemberService;
import com.kh.dungjip.member.model.vo.Member;
import com.kh.dungjip.residentReview.model.service.ResidentReviewService;
import com.kh.dungjip.residentReview.model.vo.ReReLike;
import com.kh.dungjip.residentReview.model.vo.ResidentReview;


@Controller
public class MemberController {
	
	@Autowired
	private MemberService memberService;
	
	@Autowired
	private BCryptPasswordEncoder bcryptPasswordEncoder; 	
	
	@Autowired
	private EnquiryService enquiryService;
	
	@Autowired
	private EstateService estateService;
	
	@Autowired
	private ResidentReviewService residentReviewService;
	
	@Autowired
	private ReportEstateService reportEstateService;
	
	@Autowired
	private HouseService houseService;
	
	  @RequestMapping("login.be") 
	  public String loginMember () {
	  
	  return "member/memberLoginForm"; 
	  
	}
	 	
	//로그인 
	@RequestMapping("login.me")
	public ModelAndView loginMember (Member m, HttpSession session, ModelAndView mv, HttpServletResponse response ,HttpServletRequest request) {
		
		//아이디 추출
		String userId = request.getParameter("userId");
		
		String saveId = request.getParameter("saveId");
		//쿠키준비
		Cookie cookies = null;
		
		//만약 체크가 되어 넘어왔다면
		if(saveId != null && saveId.equals("on")) {
			//쿠키의 이름과 값을 넣어서 생성하기
			cookies = new Cookie("userId",userId);
			//쿠키의 수명을 정해서 추가한다.
			cookies.setMaxAge(60*60*24); //하루 : 60*60*24 (초단위)
			//응답객체인 response에 쿠키 추가하기
			response.addCookie(cookies);
		}else {//체크가 되지 않았다면
			//쿠키 지워주기
			cookies = new Cookie("userId",null);
			//수명을 0으로 만들어주기
			cookies.setMaxAge(0);
			//응답객체에 쿠키 담기
			response.addCookie(cookies);
		}
		
		
		//아이디를 가지고 db에서 일치하는 회원정보 조회 
		Member beginLoginUser = memberService.loginMember(m);
	
		if(beginLoginUser != null && bcryptPasswordEncoder.matches(m.getUserPwd(), beginLoginUser.getUserPwd())) { //성공시


			memberService.updateLastLoginTime(beginLoginUser);//현재 시간 추가 
			
			//굳이 if문 추가안함 
			//현재시간이 추가안되었다고 로그인을 막아버리는 예외가 있으면 안된다고 판단
				Member loginUser = memberService.loginMemberPlusCurrentTime(beginLoginUser);
				
				//값 담아주고 메인페이지로 이동시키기 
				session.setAttribute("loginUser", loginUser);				
				mv.setViewName("main");
		}else {
			mv.addObject("errorMsg","로그인 실패"); 			
			mv.setViewName("common/errorPage");
		}
		return mv;
	}
	//로그아웃 
	@RequestMapping("logout.me")
	public String loginMember(@RequestParam ("userNo") int userNo,HttpSession session) {//로그아웃 버튼에 파라미터 영역으로 userNo를 보내주었습니다.
		
		memberService.LastLogoutTime(userNo);
		
		//세션에 담겨있는 logoutUser정보 지우기 
		session.removeAttribute("loginUser");
		
		//로그아웃 처리 후 메인 페이지 재 요청 
		return "redirect:/";
	}
		
	//이용동의
	@RequestMapping("agree.me")
	public String memberAgree () {
		
		return "member/memberagreeForm";
	}
	
	//회원가입 type 페이지로 이동 
	@RequestMapping("enrollType.me")
	public String memberEnrollType () {
		
		return "member/memberEnrollTypeForm";
	}

	//회원가입 (임대인/임차인) 폼으로 이동 
	@RequestMapping("enroll.me")
	public String memberEnroll () {
		return "member/memberEnrollForm";
	}
	
	//아이디 찾는 홈페이지로 이동 
	@RequestMapping("findIdCheck")
	public String memberFindIdCheck() {
		return "member/memberFindIdForm";
	}
	
	//아이디 찾기
	@PostMapping("findId.bo")
	public String memberFindId(@RequestParam("userName") String userName,@RequestParam("phone") String phone, HttpServletResponse resp,Model model,Member m) {
		
		m.setUserName(userName);
		m.setPhone(phone);
		Member findId = memberService.memberFindId(m);
		
		
		if(findId != null) { //일치할때
			model.addAttribute("findId", findId);
			return "member/memberFindIdResultForm";
		
		}else { //일치하지 않을때 
					
			return "member/memberFindIdResultForm";		
		}
		
	}
	
	//비밀번호 찾기 
	
	@PostMapping("findPwd.bo")
	public String memberFindPwd(@RequestParam("userId") String userId,@RequestParam("userName") String userName,@RequestParam("email") String email, Model model,Member m) {
		
		m.setUserId(userId);
		m.setUserName(userName);
		m.setEmail(email);
		int findPwd = memberService.memberFindPwd(m);
		
		if(findPwd == 0) { //입력한 정보가 없을 때 			
			
			model.addAttribute("findPwd", findPwd);
			return "member/memberFindPwdResultForm";
		
		}else { //입력한 정보가 있을 때
			
			String newPwd = RandomStringUtils.randomAlphanumeric(10);
			String encryptPassword = bcryptPasswordEncoder.encode(newPwd);
			
			m.setUserPwd(encryptPassword); //새로운 암호화된 비밀번호
			
			memberService.updateMemberPwd(m);
			
			model.addAttribute("newPwd", newPwd);
			
			return "member/memberFindPwdResultForm";		
			
		}
		
	}
	
	

	//아이디찾기 결과
	@RequestMapping("findIdresult")
	public String memberFindIdResult() {
		return "member/memberFindIdResultForm";
	}
	
	//비밀번호 찾는 홈페이지로 이동 
	@RequestMapping("findPwdCheck")
	public String memberFindPwdCheck() {
		return "member/memberFindPwdForm";
	}
	
	
	
	//회원등록 (임대인/임차인)
	@PostMapping("insert.me")	
	public String insertMember(Member m, Model model, HttpSession session, MultipartFile upfile) {
		
		
		//비밀번호 암호화
		String encPwd = bcryptPasswordEncoder.encode(m.getUserPwd());
		
		if(!upfile.getOriginalFilename().equals("")) { //첨부파일이 있을 때
			//전달받은 파일이 있을 경우 - 서버에 업로드 (파일명 수정 후) - 데이터베이스에 정보 등록 

			//파일명 수정하기 
			//1. 원본 파일 명 추출 
			String originName = upfile.getOriginalFilename();
			
			//2. 시간 추출하기
			String currentTime = new SimpleDateFormat("yyyyMMddHHmmss").format(new Date());
		
			//3. 뒤에 붙이 랜덤값 5자리 추출하기 
			int ranNum = (int)(Math.random()*90000 + 10000);
			
			//4. 원본파일명에서 확장자 추출하기 test.txt - 뒤에서부터 . 을 찾고(lastIndexOf) 그 뒤로 잘라내기(substring)
			String ext = originName.substring(originName.lastIndexOf("."));
			
			//5. 2,3,4 이어붙여서 변경이름 만들기  (업로드 이름)
			String changeName = currentTime + ranNum + ext;
			
			//6. 저장시킬 실직적인 물리적 경로 추출하기 
			String savePath = session.getServletContext().getRealPath("resources/img/person/");
			
			try {
				//7. 경로와 수정파일명으로 파일 업로드 하기 (경로 + 파일명) 파일객체를 생성한 뒤 해당 파일 객체를 업로드시킨다.
				upfile.transferTo(new File(savePath + changeName));				
				
			} catch (IllegalStateException | IOException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
			
			
			//8. 데이터 베이스에 등록할 변경이름, 원본이름 member VO에 담기 
			m.setOriginName(originName);
			m.setChangeName("resources/img/person/"+changeName);			
			
		}else {
			
			String defaultImagePath = "resources/img/person/person.jpg";
			
			m.setChangeName(defaultImagePath);
			
		}
			
		m.setUserPwd(encPwd); //암호화된 비번
		
		int insertUser = memberService.insertMember(m);
		
		if(insertUser > 0) { //성공 시 
			
			return "redirect:/esResult.es";
			
		}else {
			model.addAttribute("errorMsg", "회원가입 실패");
			return "common/errorPage"; //포워딩 
		}
		
	}
		
	//아이디 중복 체크 (임대인/임차인)
	@ResponseBody
	@RequestMapping("ajaxId.do")
	public int ajaxIdMethod(@RequestParam("userId") String userId, HttpServletResponse resp) {
				
		int result = memberService.ajaxIdMethod(userId);
		
		return result;		
	}
	
	//회원가입 (중개인) 폼으로 이동 (사용자 폼)
	@RequestMapping("enroll.es")
	public String memberEsEnroll () {
		return "member/memberEsEnrollForm";
	}
	
	//회원등록 (중개인)
	@PostMapping("esinsert.me")	
	public String esInsertMember(Member m, Model model, HttpSession session, MultipartFile upfile) {

		String encPwd = bcryptPasswordEncoder.encode(m.getUserPwd());
		
		//첨부파일 
		if(!upfile.getOriginalFilename().equals("")) { //첨부파일이 있을 때
			//전달받은 파일이 있을 경우 - 서버에 업로드 (파일명 수정 후) - 데이터베이스에 정보 등록 

			//파일명 수정하기 
			//1. 원본 파일 명 추출 
			String originName = upfile.getOriginalFilename();
			
			//2. 시간 추출하기
			String currentTime = new SimpleDateFormat("yyyyMMddHHmmss").format(new Date());
		
			//3. 뒤에 붙이 랜덤값 5자리 추출하기 
			int ranNum = (int)(Math.random()*90000 + 10000);
			
			//4. 원본파일명에서 확장자 추출하기 test.txt - 뒤에서부터 . 을 찾고(lastIndexOf) 그 뒤로 잘라내기(substring)
			String ext = originName.substring(originName.lastIndexOf("."));
			
			//5. 2,3,4 이어붙여서 변경이름 만들기  (업로드 이름)
			String changeName = currentTime + ranNum + ext;
			
			//6. 저장시킬 실직적인 물리적 경로 추출하기 
			String savePath = session.getServletContext().getRealPath("resources/img/person/");
			
			try {
				//7. 경로와 수정파일명으로 파일 업로드 하기 (경로 + 파일명) 파일객체를 생성한 뒤 해당 파일 객체를 업로드시킨다.
				upfile.transferTo(new File(savePath + changeName));				
				
			} catch (IllegalStateException | IOException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
			
			
			//8. 데이터 베이스에 등록할 변경이름, 원본이름 member VO에 담기 
			m.setOriginName(originName);
			m.setChangeName("resources/img/person/"+changeName);			
			
		}else {
			
			String defaultImagePath = "resources/img/person/person.jpg";
			
			m.setChangeName(defaultImagePath);
			
		}
		
		m.setUserPwd(encPwd); //암호화된 비번			

		int esInsertUser = memberService.esInsertMember(m);
		
		if(esInsertUser > 0) { //성공 시 
			
			//회원등록된 정보 불러오기 (중개인 등록페이지에서 userNo가 필요하기때문에)
			m = memberService.loginMember(m); //로그인유저 매퍼구문 말고 userNo 조회하는 구문으로 변경할것 
			
			model.addAttribute("memberInfo", m);
			
			return "member/memberEsInsertEnrollForm";
			
		}else {
			model.addAttribute("errorMsg", "회원가입 실패");
			return "common/errorPage"; //포워딩 
		}
		
	}
	
	//아이디 중복 체크 (중개인)
	@ResponseBody
	@RequestMapping("esajaxId.do")
	public int esajaxIdMethod(@RequestParam("userId") String userId, HttpServletResponse resp) {
				
		int result = memberService.esajaxIdMethod(userId);
		
		return result;		
	}
	
	//번호 중복 체크 (중개인)
	@ResponseBody
	@RequestMapping("exajaxphone.do")
	public int exajaxphoneMethod(@RequestParam("phone") String phone, HttpServletResponse resp) {
				
		int result = memberService.exajaxphoneMethod(phone);
		
		return result;		
	}
		
	//번호 중복 체크 (임차인/임대인)
	@ResponseBody
	@RequestMapping("ajaxphone.do")
	public int ajaxphoneMethod(@RequestParam("phone") String phone, HttpServletResponse resp) {
				
		int result = memberService.ajaxphoneMethod(phone);
		
		return result;		
	}
	
	//닉네임 중복 체크
	@ResponseBody
	@RequestMapping("ajaxNickName.do")
	public int ajaxnickname (@RequestParam("userNickName") String userNickName, HttpServletResponse resp) {
		
		int result = memberService.ajaxnickname(userNickName);
		
		return result;
	}
		
	//회원등록 (중개인 폼)
	@PostMapping("insertenroll.es")	
	public String insertEsMember(String userId,Estate e, Model model, HttpSession session) {
		
		int uno = memberService.userNum(userId);
		
		e.setUserNo(uno);

		int insertEsUser = memberService.insertEsMember(e);
		
		if(insertEsUser > 0) { //성공 시 
			
			return "redirect:/esResult.es";
			
		}else {
			model.addAttribute("errorMsg", "회원가입 실패");
			return "common/errorPage"; //포워딩 
		}
		
	}
	
	//중개인 회원가입 완료시 
	@GetMapping("esResult.es")
	public String esResult() {
		
		return "member/memberEnrollResult";
	}
	
	//mypage 이동
	@RequestMapping("myPage.me")
	public String memberMypage () {
		return "member/memberMypageForm";
	}
	
	//mypage에서 내프로필 수정하는 페이지로 이동 
	@RequestMapping("mypageupdate.me")
	public String memberMypageUpdate () {
		return "member/memberMypageUpdateForm";
	}


	//회원탈퇴
	@RequestMapping("mdelete.me")
	public String memberDelete(String userPwdChk, HttpSession session, Model model) {
		
		Member loginUser = (Member)session.getAttribute("loginUser");
		
		String userId = loginUser.getUserId();
		String loginUserPwd = loginUser.getUserPwd();
		
		
		if(bcryptPasswordEncoder.matches(userPwdChk, loginUserPwd)) { //비밀번호가 같을때
			
			
			int result = memberService.memberDelete(userId);
			
			if(result > 0) { //탈퇴 성공
			
				session.setAttribute("alertMsg", "그동안 저희 사이트를 이용해 주셔서 감사합니다.");
				session.removeAttribute("loginUser"); 
				return "redirect:/";
				
			}else { //탈퇴 실패 
				
				model.addAttribute("errorMsg", "회원 탈퇴 실패");
				return "common/errorPage";
				
			}
			
		}else { //비밀번호가 다를 때 
			
			session.setAttribute("errorMsg", "비밀번호를 잘못 입력하셨습니다.");
			return "redirect:myPage.me";
		}

	}


	@RequestMapping("changePwd.me")
	public String memberPwdUpdate(Member m, Model model, HttpSession session,HttpServletRequest request) {
		
		String userPwd = request.getParameter("userPassword");//친거(현재비밀번호)
		String newPwd = request.getParameter("userNewPassword");//바꿀거
		
		Member member = (Member)session.getAttribute("loginUser");
		
		if(member != null && bcryptPasswordEncoder.matches(userPwd, member.getUserPwd())) { //일치할때
			
			String encryptNewPassword = bcryptPasswordEncoder.encode(newPwd);
			
			member.setUserPwd(encryptNewPassword);	
			
			int memberPwdUpdate = memberService.memberPwdUpdate(member);
		
			if (memberPwdUpdate > 0) { // 비밀번호 변경 성공
				
	            session.setAttribute("alertMsg", "비밀번호 변경이 완료되었습니다.");
	            return "redirect:/";
	            
	        } else { // DB 업데이트 실패
	        	
	            session.setAttribute("errorMsg", "비밀번호 변경에 실패하셨습니다.");
	            return "redirect:myPage.me";
	            
	        }
			
		}else {
			
			session.setAttribute("errorMsg", "비밀번호 수정에 실패하셨습니다.");
			return "redirect:myPage.me";
		}
				
	}

	
	//회원 정보 수정
	@RequestMapping("mupdate.me")
	public ModelAndView mypageUpdate(Member m,Model model, HttpSession session,ModelAndView mv ) {
		
		int result = memberService.mypageUpdate(m); //처리 된 행 수 전달
		
		if(result > 0) { //성공
			
			Member loginUser = memberService.loginMember(m);
			
			session.setAttribute("loginUser", loginUser); //조회한 데이터 세션에 갱신
			
			session.setAttribute("alertMsg", "정보 수정이 완료되었습니다.");
			
			mv.setViewName("redirect:/myPage.me"); //임차인
			
		 if ("중개인".equals(loginUser.getUserType())) {
	            mv.setViewName("redirect:/myEsPage.me");
	        } else if ("임대인".equals(loginUser.getUserType())) {
	            mv.setViewName("redirect:/myImdaPage.me");
	        } else {
	            mv.setViewName("redirect:/myPage.me");
	        }
			
			
		} else { //수정 실패
			
			mv.addObject("errorMsg", "회원 정보 수정 실패").setViewName("common/errorPage");
		}
		
		return mv;
		
	}
	
	@RequestMapping("esupdate.me")
	public ModelAndView mypageEstateUpdate(Member m,Estate elist,Model model, HttpSession session,ModelAndView mv) {
		
		int result = memberService.mypageEstateUpdate(elist);
		
		if(result > 0) { //성공
			
			session.setAttribute("alertMsg", "정보 수정이 완료되었습니다.");	
			
			mv.setViewName("redirect:/myEsPage.me"); //중개인
			
		}else {
			mv.addObject("errorMsg", "회원 정보 수정 실패").setViewName("common/errorPage");
		}
		return mv;
	}
	
	//프로필 사진 변경
	@PostMapping("/changefile")
	public String fileajaxmethod (@RequestParam("titleImg") MultipartFile titleImg) {
		
		String uploadPath = "resources/img/person/";
		
		return "success";
	}

	@PostMapping("changefile.me")
	public void fileAjaxMethod (Model model,MultipartFile upfile, HttpSession session) {
		
		Member m = (Member)session.getAttribute("loginUser"); 
		
		if(!upfile.getOriginalFilename().equals("")) {
			
			//새로운 첨부파일 있고 기존 첨부파일 있는 경우 기존 첨부파일 삭제 작업 
			//새로운 첨부파일 서버에 업로드 하는 작업
			String changeName = saveFile(upfile,session);
			
			//기존에 파일이 있다면 
			if(!m.getChangeName().equals("")) { //빈문자열이 아니면
				
				//new File 객체로 해당 경로 파일 delete메소드로 지우기
				new File(session.getServletContext().getRealPath(m.getChangeName())).delete();				
			}
			
			m.setOriginName(upfile.getOriginalFilename());
			m.setChangeName("resources/img/person/" + changeName);
			
		}
		
		//전달된 파일이 있다면 해당 정보 DB에 전달하기 

		memberService.fileAjaxMethod(m);

	
	}
	
	//파일명 수정 모듈
	private String saveFile(MultipartFile upfile, HttpSession session) {
		
		//파일명 수정하기 
		//1. 원본 파일 명 추출 
		String originName = upfile.getOriginalFilename();
		
		//2. 시간 추출하기
		String currentTime = new SimpleDateFormat("yyyyMMddHHmmss").format(new Date());
	
		//3. 뒤에 붙이 랜덤값 5자리 추출하기 
		int ranNum = (int)(Math.random()*90000 + 10000);
		
		//4. 원본파일명에서 확장자 추출하기 test.txt - 뒤에서부터 . 을 찾고(lastIndexOf) 그 뒤로 잘라내기(substring)
		String ext = originName.substring(originName.lastIndexOf("."));
		
		//5. 2,3,4 이어붙여서 변경이름 만들기  (업로드 이름)
		String changeName = currentTime + ranNum + ext;
		
		//6. 저장시킬 실직적인 물리적 경로 추출하기 
		String savePath = session.getServletContext().getRealPath("resources/img/person/");
		
		try {
			//7. 경로와 수정파일명으로 파일 업로드 하기 (경로 + 파일명) 파일객체를 생성한 뒤 해당 파일 객체를 업로드시킨다.
			upfile.transferTo(new File(savePath + changeName));				
			
		} catch (IllegalStateException | IOException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		
		return changeName;
	}

	//mypage에서 예약내역 페이지로 이동 
	@RequestMapping("mReservation.me")
	public String selectReservation (HttpSession session, Model model) {
		
		Member loginUser = (Member)session.getAttribute("loginUser");
			
		ArrayList<Reservation> rlist = memberService.selectReservation(loginUser);
		
		model.addAttribute("rlist", rlist);

		return "member/memberMypageReservationForm";
	}
	                                     
	@ResponseBody
	@RequestMapping("subscribe.pay")
	public int userSubscribe(int userNo, HttpSession session) {
		
		int result = memberService.userSubscribe(userNo);
		
		if(result > 0) {
			Member m = memberService.findSubscribeUser(userNo);
			
			session.setAttribute("loginUser", m);
		}
		
		return result;
	}
	

	@ResponseBody
	@RequestMapping("subscribe.no")
	public int noSubscribe(int userNo, HttpSession session) {
		
		int result = memberService.noSubscribe(userNo);
		
		if(result > 0) {
			Member m = memberService.findSubscribeUser(userNo);
			
			session.setAttribute("loginUser", m);
		}
		
		return result;
	}
	

	//mypage에서 문의내역 페이지로 이동 
	@RequestMapping("myQnA.me")
	public String selectEnquiryList(HttpSession session ,Model model) {
		
		Member m = (Member)session.getAttribute("loginUser");
		
		ArrayList <Enquiry> qlist = enquiryService.selectEnquiryList(m);
		
		model.addAttribute("qlist", qlist);
		
		return "member/memberMypageQnAForm";
	}

	//mypage에서 문의내역 페이지로 이동 
	@GetMapping("myPage.me")
	public String selectqList(HttpSession session ,Model model) {
		
		Member m = (Member)session.getAttribute("loginUser");
		
		ArrayList <Enquiry> qlist = enquiryService.selectqList(m);
		
		ArrayList<Reservation> rrlist = memberService.selectReservationList(m);
		
		model.addAttribute("rrlist", rrlist);
				
		model.addAttribute("qlist", qlist);
		
		return "member/memberMypageForm";
	}
	
	//mypage에서 집리뷰내역 페이지로 이동
	@GetMapping("myHReview.me")
	public String memberMypageHouseReviewForm(@RequestParam(value="currentPage",defaultValue = "1")int currentPage,HttpSession session, Model model) {
		
		Member m = (Member)session.getAttribute("loginUser");
		
		//전체 게시글 개수 (listCount) - seleteListCount() 메소드명
		int listCount = residentReviewService.selectListCount();		
		//한 페이지에서 보여줘야하는 게시글 개수 (boardLimit) 5
		int boardLimit = 3;
		//페이징 바 개수 (pageLimit) 10
		int pageLimit = 5;				
				
		PageInfo pi = Pagination.getPageInfo(listCount, currentPage, pageLimit, boardLimit);
		
		ArrayList<ResidentReview> hlist = residentReviewService.selectResidentReview(m,pi);
		
		model.addAttribute("hlist", hlist);
		model.addAttribute("pi", pi);
		
		return"member/memberMypageHouseReviewForm";
	}
	
	//mypage에서 부동산리뷰내역 페이지로 이동
	@RequestMapping("myEsReview.me")
	public String memberMypageEstateReviewForm() {
		return"member/memberMypageEstateReviewForm";
	}
	
	
	
	@GetMapping("myEsReview.me")
	public String selectEstateReview(@RequestParam(value="currentPage",defaultValue = "1")int currentPage,HttpSession session, Model model) {
		
		Member m = (Member)session.getAttribute("loginUser");
		
		//전체 게시글 개수 (listCount) - seleteListCount() 메소드명
		int listCount = estateService.selectListCount();		
		//한 페이지에서 보여줘야하는 게시글 개수 (boardLimit) 5
		int boardLimit = 4;
		//페이징 바 개수 (pageLimit) 10
		int pageLimit = 5;				
				
		PageInfo pi = Pagination.getPageInfo(listCount, currentPage, pageLimit, boardLimit);
		
		ArrayList<EstateReview> elist = estateService.selectEstateReview(m,pi);
		
		model.addAttribute("elist", elist);	
		model.addAttribute("pi", pi);
		
		return "member/memberMypageEstateReviewForm";
				
	}

	@RequestMapping("myHousejjim.me")
	public String memberMypageHousejjimForm (@RequestParam(value="currentPage",defaultValue = "1")int currentPage,HttpSession session, Model model) {
		
		Member m = (Member)session.getAttribute("loginUser");
		
		//전체 게시글 개수 (listCount)
		int listCount = houseService.selectListCount(m);	
		
		//한 페이지에서 보여줘야하는 게시글 개수 
		int boardLimit = 6;
		//페이징 바 개수 (pageLimit)
		int pageLimit = 3;				
				
		PageInfo pi = Pagination.getPageInfo(listCount, currentPage, pageLimit, boardLimit);
		
		ArrayList<House> hlike = houseService.memberMypageHousejjimForm(m,pi);
		
		ArrayList<HouseImg> himg = new ArrayList<>();
		
		for( House i : hlike ) {
			
			HouseImg j = houseService.memberMypageHousejjimImg(i.getHouseNo());
			
			himg.add(j); //하나씩 뽑은 j를 himg에 담아주기
			
		}
		
		model.addAttribute("hlike", hlike);
		model.addAttribute("himg", himg);
		model.addAttribute("pi", pi);
		
		return "member/memberMypageHousejjimForm";
	}
	
	//후순위라서 일딴 연결만
	@RequestMapping("myEsjjim.me")
	public String memberMypageEstatejjimForm (HttpSession session, Model model) {
		
		return "member/memberMypageEstatejjimForm";
	}

	
	//중개사 리뷰 공감 조회
	@RequestMapping("myReviewLike.me")
	public String memberMypageReviewLike(@RequestParam(value="currentPage",defaultValue = "1")int currentPage,HttpSession session, Model model) {
		
		Member m = (Member)session.getAttribute("loginUser");
			
		 // 중개사 리뷰 총 개수
	    int ListCount = estateService.selectEstateListCountByMember(m);	   

	    // 한 페이지에서 보여줘야하는 게시글 개수 
	    int boardLimit = 5;
	    // 페이징 바 개수 
	    int pageLimit = 5;

	    PageInfo pi = Pagination.getPageInfo(ListCount, currentPage, pageLimit, boardLimit);		
		
		ArrayList<EsReLike> esRelike = estateService.memberMypageReviewLike(m,pi);
		
		model.addAttribute("esRelike", esRelike);		
		model.addAttribute("pi", pi);

		return "member/memberMypageReviewLikeForm";
	}
	
	//거주자 리뷰 공감 조회
	@RequestMapping("myReReviewLike.me")
	public String memberMypageReReviewLike(@RequestParam(value="currentPage",defaultValue = "1")int currentPage,HttpSession session, Model model) {
		
		Member m = (Member)session.getAttribute("loginUser");

	    // 거주자 리뷰 총 개수
	    int ListCount = residentReviewService.selectResidentListCountByMember(m);

	    // 한 페이지에서 보여줘야하는 게시글 개수 
	    int boardLimit = 5;
	    // 페이징 바 개수 
	    int pageLimit = 5;

	    PageInfo pi = Pagination.getPageInfo(ListCount, currentPage, pageLimit, boardLimit);		
		
		ArrayList<ReReLike> reRelike = residentReviewService.memberMypageReviewLike(m,pi);
		
		model.addAttribute("reRelike", reRelike);
		model.addAttribute("pi", pi);

		return "member/memberMypageReReviewLikeForm";
	}
	
	//중개인페이지이동
	@RequestMapping("myEsPage.me")
	public String myEspage(HttpSession session, Model model) {
		
		Member m = (Member)session.getAttribute("loginUser");
		
		int esNo = estateService.getEsNo(m.getUserNo());
		
		ArrayList<Estate> myeslist = estateService.myEspage(m);
		
		session.setAttribute("esNo", esNo);
		session.setAttribute("myeslist", myeslist);
		
		return "member/memberMypageEsForm";
	}
	
	//중개인 매물내역
	@RequestMapping("esHouse.li")
	public String memberMypageEstateHouseList(@RequestParam(value = "esNo") Integer esNo,
											@RequestParam(value="currentPage",defaultValue = "1")int currentPage,HttpSession session, Model model) {
		
		int listCount = houseService.selectEsHouseListCount();
		
		//한 페이지에서 보여줘야하는 게시글 개수 
		int boardLimit = 3;
		//페이징 바 개수 (pageLimit)
		int pageLimit = 3;								
		
		PageInfo pi = Pagination.getPageInfo(listCount, currentPage, pageLimit, boardLimit);
		
		ArrayList<House> hlike = houseService.memberMypageEstateHouseList(esNo,pi);
		
		ArrayList<HouseImg> himg = new ArrayList<>();
		
		for( House i : hlike ) {
			
			HouseImg j = houseService.memberMypageHousejjimImg(i.getHouseNo());			
			
			himg.add(j); //하나씩 뽑은 j를 himg에 담아주기
		}		
		
		model.addAttribute("hlike", hlike);		
		
		model.addAttribute("himg", himg);
		model.addAttribute("pi", pi);
		model.addAttribute("esNo", esNo);
		
		return "member/memberMypageEstateHouseList";
	}
	
	@RequestMapping("reportList_es")
	public String memberMypageReportEstateList (@RequestParam(value="currentPage",defaultValue = "1")int currentPage,HttpSession session, Model model) {
		
		Member m = (Member)session.getAttribute("loginUser");
		
		int listCount = estateService.selectReportEstateListCount();	
		
		//한 페이지에서 보여줘야하는 게시글 개수 
		int boardLimit = 3;
		//페이징 바 개수 (pageLimit)
		int pageLimit = 3;								
		
		PageInfo pi = Pagination.getPageInfo(listCount, currentPage, pageLimit, boardLimit);
		
		ArrayList<ReportEstate> repolist = reportEstateService.memberMypageReportEstateList(m,pi);
		
		model.addAttribute("repolist", repolist);
		model.addAttribute("pi", pi);
				
		return "member/memberMypageReportEstateList";
	}
	
	@RequestMapping("mypageEsUpdate.me")
	public String mypageEstateUpdate(HttpSession session, Model model) {
		
		Member m = (Member)session.getAttribute("loginUser");
		
		ArrayList<Estate> elist = estateService.mypageEstateUpdate(m);
		
		model.addAttribute("elist", elist);
		
		return "member/memberMypageEstateUpdateForm";
	}
	
	//중개인 예약내역
	@RequestMapping("reser.es")
	public String membermypageEsReservation(@RequestParam(value="currentPage",defaultValue="1")int currentPage,@RequestParam(value = "esNo", required = false) Integer esNo,HttpSession session, Model model) {
		
		//Member m = (Member)session.getAttribute("loginUser");
		int listCount = houseService.mypagemypageEsReservationCount(esNo);		

		//한 페이지에서 보여줘야하는 게시글 개수 
		int boardLimit = 6;
		//페이징 바 개수 (pageLimit)
		int pageLimit = 3;								
		
		PageInfo pi = Pagination.getPageInfo(listCount, currentPage, pageLimit, boardLimit);
		
		ArrayList<Reservation> relist = memberService.membermypageEsReservation(esNo,pi);
		
		model.addAttribute("relist",relist);
		model.addAttribute("pi",pi);
		
		return "member/memberEspageReservation";
	}
	
	//임대인 페이지 이동 
	@RequestMapping("myImdaPage.me")
	public String mypageImdaPage() {
		return "member/memberMypageImdaForm";
	}
	
	//임대인 매물내역
	@RequestMapping("imdaHouse.li")
	public String mypageImdaHouseList(@RequestParam(value="currentPage",defaultValue = "1")int currentPage,HttpSession session, Model model) {
		
		Member m = (Member)session.getAttribute("loginUser");
		
		int listCount = houseService.mypageImdaHouseListCount();		
		//한 페이지에서 보여줘야하는 게시글 개수 
		int boardLimit = 3;
		//페이징 바 개수 (pageLimit)
		int pageLimit = 3;								
		
		PageInfo pi = Pagination.getPageInfo(listCount, currentPage, pageLimit, boardLimit);
		
		ArrayList<House> imdalike = houseService.mypageImdaHouseList(pi,m);
		
		ArrayList<HouseImg> imdaimg = new ArrayList<>();		
		
		for( House i : imdalike ) {
			
			HouseImg j = houseService.memberMypageHousejjimImg(i.getHouseNo());			
			
			imdaimg.add(j); //하나씩 뽑은 j를 himg에 담아주기
		}		
		
		model.addAttribute("imdalike", imdalike);				
		model.addAttribute("imdaimg", imdaimg);
		model.addAttribute("pi", pi);
		
		return "member/memberMypageImdaHouseList";
	}
	

	
}
