<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ include file="../common/sweetAlert.jsp" %>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>집 매물 등록 폼</title>
    <script src="//t1.daumcdn.net/mapjsapi/bundle/postcode/prod/postcode.v2.js"></script>
    <script src="//dapi.kakao.com/v2/maps/sdk.js?appkey=c9d3f1c90fc1cea85b8bb8303f360c81&libraries=services,clusterer,drawing"></script>
    <style>
        h2 {
            text-align: center;
            margin-top: 20px; 
        }
         
        .container {
            max-width: 4xl;
            margin-left: auto;
            margin-right: auto;
            padding: 24px;
            background-color: white;
        }
        .header {
            display: flex;
            justify-content: space-between;
            align-items: center;
            border-bottom: 1px solid #eaeaea;
            padding-bottom: 16px;
        }
        .title {
            font-size: 15px;
            font-weight: bold;
        }
        .button1 {
            display: flex;
            height: 40px;
            width: 100%;
            align-items: center;
            justify-content: space-between;
            border-radius: 8px;
            border: 1px solid #eaeaea;
            background-color: #f7f7f7;
            padding: 8px 12px;
            font-size: 14px;
        }
        .button svg {
            height: 16px;
            width: 16px;
            opacity: 0.5;
        }
        .grid {
            display: grid;
            gap: 16px;
        }
        .grid-cols-2 {
            grid-template-columns: repeat(2, 1fr);
        }
        .grid-cols-1 {
            grid-template-columns: repeat(1, 1fr);
        }
        .grid-cols-3 {
            grid-template-columns: repeat(3, 1fr);
        }
        .col-span-1 {
            grid-column: span 1 / span 1;
        }
        .label {
            display: block;
            font-size: 14px;
            font-weight: medium;
            margin-bottom: 4px;
        }
        .input {
            display: flex;
            height: 40px;
            width: 50%;
            border-radius: 8px;
            border: 1px solid #eaeaea;
            background-color: #f7f7f7;
            padding: 8px 12px;
            font-size: 14px;
        }
        .border-t {
            border-top: 1px solid #eaeaea;
        }
        .pt-4 {
            padding-top: 16px;
        }
        .mb-1 {
            margin-bottom: 4px;
        }
        .mb-4 {
            margin-bottom: 16px;
        }
        .text-xl {
            font-size: 24px;
        }
        .font-semibold {
            font-weight: 600;
        }
        .text-sm {
            font-size: 14px;
        }
        .text-xs {
            font-size: 12px;
        }
        .rounded-full {
            border-radius: 9999px;
        }
        .w-fit {
            width: fit-content;
        }
        .bg-primary {
            background-color: #007bff;
        }
        .bg-secondary {
            background-color: #6c757d;
        }
        .text-primary-foreground {
            color: white;
        }
        .text-secondary-foreground {
            color: white;
        }
        .hover\:bg-primary\/80:hover {
            background-color: rgba(0, 123, 255, 0.8);
        }
        .hover\:bg-secondary\/80:hover {
            background-color: rgba(108, 117, 125, 0.8);
        }
        .focus\:outline-none:focus {
            outline: none;
        }
        .focus\:ring-2:focus {
            box-shadow: 0 0 0 2px #007bff;
        }
        .focus\:ring-ring:focus {
            box-shadow: 0 0 0 2px #007bff;
        }
        .focus\:ring-offset-2:focus {
            outline-offset: 2px;
        }
        .disabled\:cursor-not-allowed:disabled {
            cursor: not-allowed;
        }
        .disabled\:opacity-50:disabled {
            opacity: 0.5;
        }
        .grid-single,
        .grid-double {
            display: grid;
            gap: 16px;
            padding-top: 16px;
        }
        .grid-double {
            grid-template-columns: 1fr 1fr;
        }
        .input-group {
            margin-bottom: 16px;
        }
        .label {
            margin-bottom: 4px;
            font-weight: bold;
        }
        .input {
            width: 50%;
            padding: 8px;
            border: 1px solid #ccc;
            border-radius: 4px;
        }
        .badge-container {
            display: flex;
            flex-wrap: wrap;
            flex-direction: column;
        }
        .badge {
            padding: 4px 8px;
            background-color: #007bff;
            color: white;
            border-radius: 20px;
            font-size: 14px;
        }
        .badge-secondary {
            background-color: #6c757d;
        }
        .select-container {
            position: relative;
            width: 100%;
        }
        select {
            width: 50%;
            padding: 8px;
            border: 1px solid #ccc;
            border-radius: 4px;
            margin-bottom: 16px;
        }
        .select-dropdown {
            position: absolute;
            top: 100%;
            left: 0;
            right: 0;
            border: 1px solid #ccc;
            border-radius: 4px;
            background-color: white;
            z-index: 10;
            display: none;
        }
        .select-dropdown.open {
            display: block;
        }
        .select-option {
            padding: 8px;
            cursor: pointer;
        }
        .select-option:hover {
            background-color: #f0f0f0;
        }
        .form-container .col,
        .form-container div,
        .form-container .grid.grid-1,
        .form-container label,
        .form-container .fieldset {
            margin-bottom: 16px; /* 조절 가능한 마진 값을 적용 */
        }
        
        select, .input{
        	width:100%;
        }
    </style>
</head>
<body>
    <%@ include file="../common/header.jsp" %>
    
    <div class="page-head">
		<div class="container1">
		</div>
	</div>

    <h2>매물 등록</h2>

    <form action="enroll" method="post" enctype="multipart/form-data">
        <div class="container" style="width:40%;">
            <div class="grid grid-2 py-4">
                <div class="col">
                    <label class="label">집 스타일</label>
                    <div class="select-container">
                        <select id="houseType" name="houseType">
                            <option value="" disabled selected hidden>선택해주세요.</option>
                            <option value="원룸">원룸</option>
                            <option value="빌라">빌라</option>
                            <option value="오피스텔">오피스텔</option>
                        </select>
                    </div>
                </div>
                <div class="col">
                    <label class="label">거래 유형</label>
                    <div class="select-container">
                        <select id="houseStyle" name="houseStyle">
                            <option value="" disabled selected hidden>선택해주세요.</option>
                            <option value="월세">월세</option>
                            <option value="전세">전세</option>
                        </select>
                    </div>
                </div>
                <div class="col">
                    <label class="label">월세 가격(전세일 경우 0입력)</label>
                    <input class="input" placeholder="가격" id="houseRent" name="houseRent" />
                </div>
                <div class="col">
                    <label class="label">보증금/전세 가격</label>
                    <input class="input" placeholder="가격" id="housePrice" name="housePrice"/>
                </div>
                <div>
          <label class="label">집 이름</label>
          <input class="input" id="houseName" name="houseName" placeholder="집의 이름을 써주세요." required />
        </div>
        <div>
          <label class="label">집 한줄 소개</label>
          <input class="input" id="houseTitle" name="houseTitle" placeholder="판매할 집을 소개해주세요." required />
        </div>
        <div>
          <label class="label">집 상세 소개</label>
          <input class="input" id="houseDetails" name="houseDetails" placeholder="판매할 집의 상세사항을 소개해주세요." required />
        </div>
        <div>
			<label class="label">주소</label>
			<input type="text" id="address_kakao" name="houseAddress" placeholder="주소(클릭해주세요.)" class="input" required>
			<span class="placeholder"></span>
		</div>
        <!-- 카카오 지도를 표시할 영역 -->
      <div class="grid grid-1">
		<div id="map" style="width: 100%; height: 400px;"></div>
			<div class="grid grid-2">
				<div class="col">
					<label class="label">위도</label>
					<input type="text" id="houseLatitude" name="houseLatitude" class="input" required readonly>
				</div>
				<div class="col">
					<label class="label">경도</label>
					<input type="text" id="houseLongitude" name="houseLongitude" class="input" required readonly>
				</div>
			</div>
      </div>
        <div class="col">
          <label class="label">건물 크기(평)</label>
          <input class="input" id="houseSquare" name="houseSquare" placeholder="건물 크기" />
        </div>  
        <div class="col">
          <label class="label">집 층수</label>
          <input class="input" id="houseFloor" name="houseFloor" placeholder="집 층수" />
        </div>
        <div class="col">
          <label class="label">건물 층수</label>
          <input class="input" id="houseBuildingFloor" name="houseBuildingFloor" placeholder="건물 층수" />
        </div>
        <div class="grid grid-2">
          <div class="col">
            <label class="label">관리비</label>
            <input class="input" id="houseMaintainCost" name="houseMaintainCost" placeholder="관리비" />
          </div>
          <div class="col">
            <label class="label">화장실 개수</label>
            <input class="input" id="houseToilet" name="houseToilet" placeholder="화장실 개수" />
          </div>
          <div class="col">
            <label class="label">방 개수</label>
            <input class="input" id="houseRooms" name="houseRooms" placeholder="방 개수" />
          </div>
        </div>
    <div class="option-container">
        <div class="option-item">
            <label class="label">주차 가능 여부:</label>
            <br>
            <select id="houseParkAble" name="houseParkAble">
                <option value="" disabled selected hidden>선택해주세요.</option>
                <option value=1>가능</option>
                <option value=0>불가능</option>
            </select>
        </div>
		<br>
        <div class="option-item">
            <label class="label">베란다 여부:</label>
            <br>
            <select id="houseBalcony" name="houseBalcony">
                <option value="" disabled selected hidden>선택해주세요.</option>
                <option value="Y">O</option>
                <option value="N">X</option>
            </select>
        </div>
		<br>
        <div class="option-item">
            <label class="label">즉시 입주 가능 여부:</label>
            <br>
            <select id="houseDoItNow" name="houseDoItNow">
                <option value="" disabled selected hidden>선택해주세요.</option>
                <option value="Y">가능</option>
                <option value="N">불가능</option>
            </select>
        </div>
		<br>
        <div class="option-item">
            <label class="label">반려동물 가능 여부:</label>
            <br>
            <select id="houseAnimals" name="houseAnimals">
                <option value="" disabled selected hidden>선택해주세요.</option>
                <option value="Y">가능</option>
                <option value="N">불가능</option>
            </select>
        </div>
        <br>
		<div class="option-item">
		    <label class="label">준공 날짜</label>
		    <br>
		    <input class="input" type="date" id="houseBulidDate" name="houseBuildDate" placeholder="준공 날짜(YY/MM/dd)" />
		</div>
		<br>
    </div>

	<div class="fieldset">
	    <!-- 파일 첨부 -->
	    <label class="label" for="files">이미지 파일:</label>
	    <input type="file" id="files" name="files" multiple="multiple" accept="image/*"><br>
	    <small>최대 4개까지 업로드 가능합니다.</small>
	</div>
    <button type="submit">등록</button>
     </div>
    </div>
    
    <script>

    window.onload = function () {
        // 지도 초기화
        var mapContainer = document.getElementById('map');
        var mapOptions = {
            center: new kakao.maps.LatLng(37.533067592513866, 126.89622037964806),
            level: 6
        };
        var map = new kakao.maps.Map(mapContainer, mapOptions);
        var marker = new kakao.maps.Marker({ map: map, clickable: false });

        // 지도 클릭 이벤트 처리
        kakao.maps.event.addListener(map, 'click', function (mouseEvent) {
            var latlng = mouseEvent.latLng;

            // 클릭한 위치의 위도, 경도를 입력 폼에 설정
            document.getElementById("houseLatitude").value = latlng.getLat();
            document.getElementById("houseLongitude").value = latlng.getLng();

            marker.setPosition(latlng);
        });

        // 주소 입력창 클릭 이벤트 처리
        document.getElementById("address_kakao").addEventListener("click", function (event) {
            event.preventDefault();
            new daum.Postcode({
                oncomplete: function (data) {
                    // 주소를 클릭하면 해당 위치로 지도 이동
                    var geocoder = new kakao.maps.services.Geocoder();
                    geocoder.addressSearch(data.address, function (result, status) {
                        if (status === kakao.maps.services.Status.OK) {
                            var coords = new kakao.maps.LatLng(result[0].y, result[0].x);

                            // 입력 폼에 주소 설정
                            document.getElementById("address_kakao").value = data.address;
                            document.getElementById("houseLatitude").value = result[0].y;
                            document.getElementById("houseLongitude").value = result[0].x;

                            // 지도 이동 및 마커 위치 설정	
                            map.setCenter(coords);
                            marker.setPosition(coords);
                        }
                    });
                }
            }).open();
        });

    };
	</script>

</form>
	<jsp:include page="../common/footer.jsp" />
</body>
</html>