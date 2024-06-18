package com.kh.dungjip.house.controller;

import java.io.File;
import java.io.FileReader;
import java.io.IOException;
import java.io.Reader;
import java.sql.Date;
import java.text.SimpleDateFormat;
import java.time.LocalDateTime;
import java.time.ZonedDateTime;
import java.time.format.DateTimeFormatter;
import java.util.ArrayList;
import java.util.Arrays;
import java.util.HashMap;
import java.util.List;
import java.util.Map;
import java.util.Random;
import java.util.stream.IntStream;

import javax.servlet.http.HttpSession;

import org.apache.ibatis.binding.MapperMethod.ParamMap;
import org.json.simple.JSONArray;
import org.json.simple.JSONObject;
import org.json.simple.parser.JSONParser;
import org.json.simple.parser.ParseException;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.ModelAndView;

import com.kh.dungjip.house.model.vo.House;
import com.kh.dungjip.house.model.vo.HouseImg;
import com.kh.dungjip.member.model.vo.Member;
import com.kh.dungjip.residentReview.model.vo.ResidentReview;
import com.kh.dungjip.residentReview.model.vo.ReviewImg;

import com.kh.dungjip.common.model.vo.PageInfo;
import com.kh.dungjip.common.template.Pagination;
import com.kh.dungjip.estate.model.service.EstateService;
import com.kh.dungjip.estate.model.vo.Estate;
import com.kh.dungjip.house.model.service.HouseService;
import com.kh.dungjip.house.model.vo.House;
import com.kh.dungjip.house.model.vo.Jjim;
import com.kh.dungjip.member.model.vo.Member;

@Controller
public class HouseController {

	@Autowired
	private HouseService houseService;

	@Autowired
	private EstateService estateService;

	@RequestMapping("insert.house")
	public String insertHouse(HttpSession session) throws IOException, ParseException {

		Reader reader = new FileReader(
				"C:\\Users\\easyoh\\git\\DungJip\\Dungjip\\src\\main\\webapp\\WEB-INF\\resources\\jik.json");

		JSONParser parser = new JSONParser();
		Object obj = parser.parse(reader);
		JSONObject jsonMain = (JSONObject) obj;
		JSONArray jsonArr = (JSONArray) jsonMain.get("items");

		ArrayList<House> hlist = new ArrayList<>();

		for (int i = 0; i < jsonArr.size(); i++) {
			JSONObject object = (JSONObject) jsonArr.get(i);
			JSONObject sqrtP = (JSONObject) object.get("sqrtP");
			JSONObject location = (JSONObject) object.get("random_location");

			String isoDate = String.valueOf(object.get("reg_date"));
			String buildDate = String.valueOf(object.get("build_date"));
			ZonedDateTime zonedDateTime = ZonedDateTime.parse(isoDate, DateTimeFormatter.ISO_DATE_TIME);
			ZonedDateTime zonedBuildDateTime = ZonedDateTime.parse(buildDate, DateTimeFormatter.ISO_DATE_TIME);
			LocalDateTime localDateTime = zonedDateTime.toLocalDateTime();
			LocalDateTime localBuildDateTime = zonedBuildDateTime.toLocalDateTime();

			Date sqlDate = Date.valueOf(localDateTime.toLocalDate());
			Date sqlBuildDate = Date.valueOf(localBuildDateTime.toLocalDate());
			System.out.println("qwer");
			System.out.println(Integer.parseInt(String.valueOf(object.get("user_no"))));
			
					House house = House.builder().housePrice(String.valueOf(object.get("deposit")))
											.houseRent(Integer.parseInt(String.valueOf(object.get("rent"))))
											.houseSquare(Double.parseDouble(String.valueOf(sqrtP.get("p"))))
											.houseStyle((String)object.get("sales_type"))
											.houseTitle((String)object.get("title"))
											.houseDetails((String)object.get("details"))
											.houseType((String)object.get("service_type"))
											.houseLatitude((Double)location.get("lat"))
											.houseLongitude((Double)location.get("lng"))
											.houseUploadTime(sqlDate)
											.houseAddress((String)object.get("address1"))
											.houseFloor(Integer.parseInt(String.valueOf(object.get("floor"))))
											.houseBuildingFloor(Integer.parseInt(String.valueOf(object.get("building_floor"))))
											.houseToilet(Integer.parseInt(String.valueOf(object.get("toilet"))))
											.houseRooms(Integer.parseInt(String.valueOf(object.get("rooms"))))
											.houseParkAble(Integer.parseInt(String.valueOf(object.get("park_able"))))
											.houseBalcony((String)object.get("balcony"))
											.houseMaintainCost(Integer.parseInt(String.valueOf(object.get("maintain_cost"))))
											.houseDoItNow((String)object.get("doItNow"))
//											.houseBuildDate(sqlBuildDate)
											.houseAnimals((String)object.get("animals"))
											.houseName((String)object.get("name"))
											.userNo(Integer.parseInt(String.valueOf(object.get("user_no"))))
											.status("Y")
											.build();
			
			hlist.add(house);
		}

		int result = 1;

		int index = 1;
		for (House house : hlist) {
			int count = houseService.insertHouseJSON(house);

			if (result * count == 0) {
				session.setAttribute("errorMsg", "집 등록 실패");
				return "common/errorPage";
			}

			index++;
		}

		session.setAttribute("alertMsg", "집 등록 성공");
		return "main";

	}

	@ResponseBody
	@RequestMapping("select.location")
	public ArrayList<House> selectLocation() {
		ArrayList<House> lList = houseService.selectLocations();
		return lList;
	}

	// 집 상세페이지
	@RequestMapping("detail.ho")
	public String houseDetail(HttpSession session, int houseNo, String houseAddress, Model model) {

		Member member = new Member();
		// 부동산 목록 조회해서 보여주기
		ArrayList<Estate> elist = estateService.selectEstateList(houseNo);
		model.addAttribute("elist", elist);
		model.addAttribute("member", member);
		
		//집 상세보기
		House house = houseService.selectHouseDetail(houseNo);
		model.addAttribute("house", house);
	
		//상세보기 집 이미지
		ArrayList<HouseImg> houseImg = houseService.selectHouseImgDetail(houseNo);
		model.addAttribute("houseImg",houseImg);
		
		//찜 데이터 있는지 없는지 확인
		Member loginUser = ((Member) session.getAttribute("loginUser"));
		if (loginUser == null) {
			return "house/houseDetail";
		} else {
			Jjim jjim = Jjim.builder().houseNo(houseNo).userNo(loginUser.getUserNo()).build();
			Jjim jj = houseService.selectJjim(jjim);
			model.addAttribute("jj", jj);
			return "house/houseDetail";
		}
	}

	// 집 리스트
	@RequestMapping("villa.map")

	public ModelAndView villaMap(String locate, String type, ModelAndView mv) {
		ArrayList<House> lList = houseService.selectHouse(type);
		ArrayList<HouseImg> hImgList = houseService.selectHouseThumnail(type);

		mv.addObject("lList", lList).addObject("locate", locate).addObject("hImgList", hImgList).addObject("type", type)
				.setViewName("house/houseMap");

		return mv;
	}

	// 찜하기
	@RequestMapping("insertJjim.de")
	public ModelAndView insertJjim(Jjim jj, HttpSession session, ModelAndView mv) {
		int result = houseService.insertJjim(jj);
		if (result > 0) {
			session.setAttribute("alertMsg", "찜하기 성공");
			mv.setViewName("redirect:detail.ho?houseNo=" + jj.getHouseNo());
		} else {
			session.setAttribute("errorMsg", "찜하기 실패");
			mv.setViewName("redirect:detail.ho");
	}
		return mv;
	}
	
	// 찜취소
	@RequestMapping("deleteJjim.de")
	public String deleteJjim(Jjim jj, HttpSession session) {
		int result = houseService.deleteJjim(jj);
		if (result > 0) {
			session.setAttribute("alertMsg", "찜 취소 성공");
			return "redirect:detail.ho?houseNo=" + jj.getHouseNo();
		} else {
			session.setAttribute("errorMsg", "찜 취소 실패");
			return "redirect:detail.ho?houseNo=" + jj.getHouseNo();
		}
	}
	
	//비슷한 매물 찾기
	@ResponseBody
	@RequestMapping(value="houseLikeList.ho",produces="application/json; charset=UTF-8")
	public Map<String, Object> houseLikeList(String houseAddress, String houseType,
			@RequestParam(value = "currentPage", defaultValue = "1") int currentPage) {
		
	    Map<String, Object> resultMap = new HashMap<>();
	    
	    House house = new House(houseType, houseAddress);
	    
		//전체 집 개수
		int listCount = houseService.selectHouseLikeCount(house);
		int pageLimit = 10;
		int boardLimit = 8;
		PageInfo pi = Pagination.getPageInfo(listCount, currentPage, pageLimit, boardLimit);
		resultMap.put("pi", pi);
		
		//집 list
		ArrayList<House> houseLike = houseService.houseLikeList(house,pi);
		resultMap.put("houseLike", houseLike);

		//집 img
		ArrayList<HouseImg> houseImgLike = houseService.houseImgLike(house);
		resultMap.put("houseImgLike", houseImgLike);

		return resultMap;

	}	
	
	@ResponseBody
	@RequestMapping("select.house")
	public Map<String, Object> selectHouse(String type) {
		//타입별 집 리스트
		ArrayList<House> mainList = houseService.selectHouseMain(type);
		//타입별 집 이미지 리스트
		ArrayList<HouseImg> imgList = new ArrayList<>();
		for(House h : mainList) {
			HouseImg img = houseService.selectHouseMainThumnail(h.getHouseNo());
			
			imgList.add(img);
		}
		//구독한 중개인 리스트
		List<Integer> subscribeUser = estateService.selectSubscribeEstateList();
		
		//랜덤 중개인 번호
		Integer randomUser = pickRandomNumber(subscribeUser);
		
		Map<String, Object> map = new HashMap();
		
		map.put("type", type);
		map.put("randomUser", randomUser);
		//랜덤 중개인 집 리스트
		ArrayList<House> subscribeHouseList = houseService.selectSubscribeHouseList(map);
		
		//랜덤 중개인 랜덤 집 번호
		Integer randomIndex = pickRandomNumber(subscribeHouseList);
		
		//랜덤 중개인 랜덤 집
		House randomSubscribeHouse = new House();
		if(randomIndex != null) {
			randomSubscribeHouse = subscribeHouseList.get(randomIndex);
		}
		//랜덤 중개인 랜덤 집 이미지
		HouseImg subscribeImg = houseService.selectHouseMainThumnail(randomSubscribeHouse.getHouseNo());
		
		Map<String, Object> recomendHouse = new HashMap();
		recomendHouse.put("mainList", mainList);
		recomendHouse.put("imgList", imgList);
		recomendHouse.put("randomSubscribeHouse", randomSubscribeHouse);
		recomendHouse.put("subscribeImg", subscribeImg);
		
		return recomendHouse;
	}
	
	public static Integer pickRandomNumber(List<Integer> numbers) {
        if (numbers == null || numbers.isEmpty()) {
            return null;
        }

        Random random = new Random();
        int randomIndex = random.nextInt(numbers.size());
        return numbers.get(randomIndex);
    }
	
	public static Integer pickRandomNumber(ArrayList<House> numbers) {
        if (numbers == null || numbers.isEmpty()) {
            return null;
        }

        Random random = new Random();
        int randomIndex = random.nextInt(numbers.size());
        return randomIndex;
    }
	
	//거주자 리뷰리스트
	@ResponseBody
	@RequestMapping(value="resi.re",produces="application/json; charset=UTF-8")
	public Map<String,Object> selectResidentReviewList(int houseNo, int userNo){
		ArrayList<ResidentReview> rlist = houseService.selectResidentReviewList(houseNo);
		
		List<Integer> residentArr = new ArrayList<>();
		List<Integer> reviewBooleanArr = new ArrayList<>();
		for(ResidentReview re : rlist) {
			int num = houseService.selectResidentEmoCount(re.getReReviewNo());
			
			Map<String, Object> numMap = new HashMap<>();
			numMap.put("reReNo", re.getReReviewNo());
			numMap.put("userNo", userNo);
			
			int result = houseService.selectResidentReviewLikeCount(numMap);
			
			residentArr.add(num);
			reviewBooleanArr.add(result);
		}
		
		//리뷰 총점
		int sum = houseService.selectResidentReviewSum(houseNo);
		
		//리뷰개수
		int count = houseService.selectResidentReviewCount(houseNo);
		
		
		//건물총점
		int building = houseService.selectBuilding(houseNo);
		
		//건물 카운트
		int buildingCount = houseService.selectBuildingcount(houseNo);
		
		//교통총점
		int traffic = houseService.selectTraffic(houseNo);
		
		//교통 카운트
		int trafficCount = houseService.selectTrafficCount(houseNo);
		
		//내부 총점
		int interior = houseService.selectInterior(houseNo);
		
		//내부 카운트
		int interiorCount = houseService.selectInteriorCount(houseNo);
		
		//치안 총점
		int safety = houseService.selectSafety(houseNo);
		
		//치안 카운트
		int safetyCount = houseService.selectSafetyCount(houseNo);
		
		//생활 총점
		int life = houseService.selectLife(houseNo);
		
		//생활 카운트
		 int lifeCount = houseService.selectLifeCount(houseNo);
		 
		
		Map<String,Object> map = new HashMap<>();
		map.put("rlist", rlist);
		map.put("sum", sum);
		map.put("count", count);
		map.put("buildingCount", buildingCount);
		map.put("building", building);
		map.put("trafficCount", trafficCount);
		map.put("traffic", traffic);
		map.put("interiorCount", interiorCount);
		map.put("interior", interior);
		map.put("safetyCount", safetyCount);
		map.put("safety", safety);
		map.put("lifeCount", lifeCount);
		map.put("life", life);
		map.put("residentArr", residentArr);
		map.put("reviewBooleanArr", reviewBooleanArr);
		
		return map;
		
	}
	
	//부동산 리뷰
		@ResponseBody
		@RequestMapping("resident.like")
		public Map<String, Object> selectReviewLikeCount(String reReNo, String userNo){

			Map<String, Object> map = new HashMap<>();
			map.put("reReNo", reReNo);
			map.put("userNo", userNo);
			
			int count = houseService.selectReviewLikeCount(map);

			int result = 0;
			
			int bool = 0;
			
			if(count > 0) {
				result = houseService.decreaseCount(map);
				bool = 1;
			} else {
				result = houseService.increaseReReLikeCount(map);
				bool = 2;
			}
			
			Map<String, Object> resultMap = new HashMap<>();
			
			resultMap.put("emoCount", result);
			resultMap.put("result", bool);
			resultMap.put("reReNo", reReNo);
			
			
			return resultMap;
		}
	
	
	//매물 리뷰 작성
	@GetMapping("insert.rere")
	public String insertResidentReview(int houseNo, HttpSession session, Model model) {
		
		Member loginUser = (Member) session.getAttribute("loginUser");
		model.addAttribute("houseNo", houseNo);
		model.addAttribute("loginUser", loginUser);
		return "review/residentReviewInsert";
	}
	
	@PostMapping("insert.rere")
	public String insertResidentReview(int houseNo, HttpSession session,ResidentReview rr, Model model,@RequestParam("reviewImage") MultipartFile file, @RequestParam String prosKeywords, @RequestParam String consKeywords){

		String keywordString = prosKeywords + "," + consKeywords;
		String[] keywordNo = keywordString.split(",");
		Member loginUser = (Member) session.getAttribute("loginUser");
		Map<String, Object> map = new HashMap<>();
		map.put("rr", rr);
		if(loginUser !=null && rr!=null) {
			rr.setUserNo(loginUser.getUserNo());
			int reReviewNo = houseService.insertResidentReview(rr);
			for(int i = 0; i < keywordNo.length; i++) {
				map.put("keyword", keywordNo[i]);
				houseService.insertMemberKeyword(map);
				map.remove("keyword");
			}
		
			String uploadPath ="src/main/resources/review/";
			 
			    if (file != null && !file.isEmpty()) {
			        String originName = file.getOriginalFilename();
			        String currentTime = new SimpleDateFormat("yyyyMMddHHmmss").format(new java.util.Date());
			        int ranNum = (int) (Math.random() * 90000 + 10000);
			        String ext = originName.substring(originName.lastIndexOf("."));
			        String changeName = currentTime + ranNum + ext;
			        String savePath = session.getServletContext().getRealPath("/resources/review/");

			        try {
			            File dir = new File(uploadPath);
			            if (!dir.exists()) {
			                dir.mkdirs();
			            }
			            File uploadFile = new File(dir, changeName);
			          
			            file.transferTo(new File(savePath+changeName));
			           
			        } catch (Exception e) {
			            e.printStackTrace();
			        }
			        ReviewImg reviewImg = new ReviewImg();
		            reviewImg.setReReviewNo(reReviewNo);
		            reviewImg.setOriginName(originName);
		            reviewImg.setChangeName("resources/review/"+changeName);
		            houseService.enrollReviewImg(reviewImg);
			    }
			   
			if(reReviewNo>0) {
				session.setAttribute("alertMsg", "매물 리뷰 등록 성공");
				
				return "redirect:detail.ho?houseNo="+houseNo;
				
			}else {
				session.setAttribute("alertMsg", "매물 리뷰 등록 실패");
				
				return "";
			}
		}else {
			session.setAttribute("alertMsg", "매물 리뷰 등록 실패");
			return "";
		}
		
	}
	
	//매물 리뷰 수정
	@GetMapping("update.rere")
	public String updateResidentReview(int reReviewNo, int houseNo, Model model, HttpSession session ) {
		
		ResidentReview rr = houseService.ResidentReviewDetail(reReviewNo);
		
		model.addAttribute("rr", rr);
		
		Member loginUser = (Member) session.getAttribute("loginUser");
		
		
		return "review/residentReviewUpdate";
	}
	
	
	@PostMapping("update.rere")
	public String updateResident(ReviewImg ri, int reReviewNo,int houseNo,  @RequestParam("reviewImage") MultipartFile file,ResidentReview rr, Model model, HttpSession session, @RequestParam String prosKeywords, @RequestParam String consKeywords){
	
		Member loginUser = (Member) session.getAttribute("loginUser");
		

		

		if(loginUser != null && rr!= null) {
			
			if(!file.getOriginalFilename().equals("")) {
				String changeName = saveFile(file,session);
				
				if(!ri.getOriginName().equals("")) {
					new File(session.getServletContext().getRealPath(ri.getChangeName())).delete();
				}
				
				ri.setOriginName(file.getOriginalFilename());
				ri.setChangeName("resources/review/"+changeName);
			}
			
			
			 Map<String, Object> paramMap = new HashMap<>();
		     paramMap.put("rr", rr);
		     paramMap.put("ri",ri);
		     paramMap.put("loginUser", loginUser);
		     int result = houseService.updateResidentReview(paramMap);
		     
		     houseService.deleteKeywords(paramMap);
		     
		     String keywordString = prosKeywords + "," + consKeywords;
		     
		     
		     String[] keywordNo = keywordString.split(",");
		     for(int i = 0; i < keywordNo.length; i++) {
		    	 paramMap.put("keyword", keywordNo[i]);
					 houseService.updateKeywords(paramMap);
					paramMap.remove("keyword");
				}
		     houseService.updateReviewImg(paramMap);
		    
		     
		     
		     if(result>0) {
		    	 session.setAttribute("alertMsg", "매물 리뷰 수정 성공");
					
					return "redirect:detail.ho?houseNo="+houseNo;
		     }else {
		    	 session.setAttribute("alertMsg", "매물 리뷰 수정 실패");
					
					return "common/errorPage";
		     }
		}else {
			session.setAttribute("alertMsg", "매물 리뷰 수정 실패");
			
			return "common/errorPage";
		}
		
		
	}
	
	public String saveFile(@RequestParam("reviewImage") MultipartFile file, HttpSession session) {
		
		String originName = file.getOriginalFilename();
        String currentTime = new SimpleDateFormat("yyyyMMddHHmmss").format(new java.util.Date());
        int ranNum = (int) (Math.random() * 90000 + 10000);
        String ext = originName.substring(originName.lastIndexOf("."));
        String changeName = currentTime + ranNum + ext;
        String savePath = session.getServletContext().getRealPath("/resources/review/");

        try {
          
        		  File uploadFile = new File(savePath+changeName);
        		  file.transferTo(uploadFile); 
            }catch (Exception e) {
            e.printStackTrace();
        }
       
		return changeName;
	}
	
	//마이페이지에서 집 찜해제
	@RequestMapping("house/hjjimdelete.me")
	public String mypageHjjimdelete(@RequestParam("houseNo")int houseNo,Model model,HttpSession session) {
		
		int result = houseService.mypageHjjimdelete(houseNo);
		
		if(result > 0) {
			session.setAttribute("alertMsg", "목록에서 삭제되었습니다.");
		}else {
			session.setAttribute("errorMsg", "다시 시도해주세요.");
		}
		
		return "redirect:/myHousejjim.me";
	}
	
	//임대인 매물내역 삭제
	@RequestMapping("imdaHdelete.li")
	public String myImdaHouseDelete(@RequestParam("houseNo")int houseNo,Model model, HttpSession session) {
		
		int result = houseService.myImdaHouseDelete(houseNo);
		
		if(result > 0) {
			session.setAttribute("alertMsg", "삭제가 완료되었습니다.");
		}else {
			session.setAttribute("errorMsg", "다시 시도해주세요.");
		}
		return"redirect:/imdaHouse.li";
		
	}

}





































