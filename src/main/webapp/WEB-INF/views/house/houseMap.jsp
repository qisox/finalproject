<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="ko">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>DungJip</title>
    <style>
        * {
            box-sizing: border-box;
        }

        body {
            margin: 0;
            font-family: 'Noto Sans KR', sans-serif;
            background: #fff;
        }

        .header {
		    width: 400px;
            background-color: #ffce00;
            padding: 0 15px;
            display: flex;
            justify-content: space-between;
            align-items: center;
            position: absolute;
            margin: 20px 0 0 20px;
            z-index: 999;
        }

        .header img {
            width: 100px;
        }

        .header .search-container {
            flex-grow: 1;
            margin: 0 20px;
        }

        .header input[type="text"] {
            width: 100%;
            padding: 10px;
            margin-right: 10px;
            border: 1px solid #ddd;
        }
        
        .iconsDiv{
        	display: flex;
        }
        
        .inputWrap {
        	width: 85%;
		    position: relative;
		    height: 30px;
		    display: inline-block;
		 }
		  
		.inputWrap input {
		  width: 300px;
		  padding-right: 30px;
		  height: inherit;
		}
		
		.inputWrap .btnClear {
		  position: absolute;
		  top: 0;
		  right: 0;
		  width: 30px;
		  height: inherit;
		  background: url(https://img.icons8.com/pastel-glyph/2x/cancel.png) center center no-repeat;
		  background-size: 50%;
		  border: none;
		  outline: none;
		  cursor: pointer;
		}
        
        
        #searchIcon {
        	cursor: pointer;
        	width: 30px;
        	height: 30px;
        	margin: 10px 20px;
        }

        .main-container {
            display: flex;
        }
        
        #category {position:absolute;top:50px;left:0px;padding:0;border-radius: 5px; display: none; border:1px solid #909090;box-shadow: 0 1px 1px rgba(0, 0, 0, 0.4);background: #fff;overflow: hidden;z-index: 2;}
		#category li {float:left;list-style: none;width:50px;border-right:1px solid #acacac;padding:6px 0;text-align: center; cursor: pointer;}
		#category li.on {background: #eee;}
		#category li:hover {background: #ffe6e6;border-left:1px solid #acacac;margin-left: -1px;}
		#category li:last-child{margin-right:0;border-right:0;}
		#category li span {display: block;margin:0 auto 3px;width:27px;height: 28px;}
		#category li .category_bg {background:url(https://t1.daumcdn.net/localimg/localimages/07/mapapidoc/places_category.png) no-repeat;}
		#category li .bank {background-position: -10px 0;}
		#category li .mart {background-position: -10px -36px;}
		#category li .pharmacy {background-position: -10px -72px;}
		#category li .oil {background-position: -10px -108px;}
		#category li .cafe {background-position: -10px -144px;}
		#category li .store {background-position: -10px -180px;}
		#category li.on .category_bg {background-position-x:-46px;}
		
		.placeinfo_wrap {position:absolute;bottom:28px;left:-150px;width:300px;}
		.placeinfo {position:relative;width:100%;border-radius:6px;border: 1px solid #ccc;border-bottom:2px solid #ddd;padding-bottom: 10px;background: #fff;}
		.placeinfo:nth-of-type(n) {border:0; box-shadow:0px 1px 2px #888;}
		.placeinfo_wrap .after {content:'';position:relative;margin-left:-12px;left:50%;width:22px;height:12px;background: #fff; background: #fff url('https://t1.daumcdn.net/localimg/localimages/07/mapapidoc/vertex_white.png')}
		.placeinfo a, .placeinfo a:hover, .placeinfo a:active{color:#fff;text-decoration: none;}
		.placeinfo a, .placeinfo span {display: block;text-overflow: ellipsis;overflow: hidden;white-space: nowrap;}
		.placeinfo span {margin:5px 5px 0 5px;cursor: default;font-size:13px;}
		.placeinfo .title {font-weight: bold; font-size:14px;border-radius: 6px 6px 0 0;margin: -1px -1px 0 -1px;padding:10px; color: #fff;background: #cca427;}
		.placeinfo .tel {color:#0f7833;}
		.placeinfo .jibun {color:#999;font-size:11px;margin-top:0;}
		
		.close {position: absolute;top: 11px;right: 11px;color: #888;width: 25px;height: 25px;}

		.downArrow {
			display: flex;
			width: 30px;
			height: 50px;
			cursor: pointer;
		}
		
        .sidebar {
            background: #f4f4f4;
            overflow-y: auto;
            height: 600px;
            padding: 20px;
        }

        .listing {
            display: flex;
            background: #fff;
            margin-bottom: 10px;
            padding: 10px;
            border: 1px solid #ddd;
        }

        .listing img {
            height: 120px;
            min-width: 180px;
            margin-right: 10px;
        }
        
        .listing {
        	cursor:pointer;
        }
        
        .home-text-div {
        	display: flex;
        	flex-direction: column;
        }
        
        .home-price-span {
        	font-size: 20px;
        }
        
        .home-title-p {
        	display : -webkit-box;
			overflow: hidden;
		 	text-overflow: ellipsis;
		  	-webkit-line-clamp: 1;
		  	-webkit-box-orient: vertical;
		    padding: 0px 0px;
		    margin: 0;
        }
    </style>
</head>

<body>
	<%@ include file="../common/header.jsp"%>
	
	<script>
	    var clearInput = function(obj) {
	        obj.parentNode.querySelector('input').value = ""
	    }
	    var isClick = false;
	    function openCategory(){
	    	isClick = !isClick;
	    	
	    	if(isClick){
		    	var ceDiv = document.getElementById("category");
		    	ceDiv.style.display = "flex";
	    	} else {
		    	var ceDiv = document.getElementById("category");
		    	ceDiv.style.display = "none";
	    	}
	    }
	</script>
	
    <header class="header">
        <div class="inputWrap">
            <input type="text" id="searchLocation" placeholder="지역, 지하철역, 학교 검색" onkeypress="if( event.keyCode == 13 ){searchLocate();}">
            <button class="btnClear" onClick="clearInput(this)"></button>
        </div>
        <div class="iconsDiv">
	        <img src="${contextPath }/resources/img/icons/search.svg" alt="Placeholder for Zigbang logo" id="searchIcon" onclick="searchLocate()">
	        <div class="downArrow" onclick="openCategory()"><img src="${contextPath }/resources/img/icons/downArrow.svg"></div>
        </div>
        <ul id="category">
	        <li id="BK9" data-order="0"> 
	            <span class="category_bg bank"></span>
	            은행
	        </li>       
	        <li id="MT1" data-order="1"> 
	            <span class="category_bg mart"></span>
	            마트
	        </li>  
	        <li id="PM9" data-order="2"> 
	            <span class="category_bg pharmacy"></span>
	            약국
	        </li>  
	        <li id="OL7" data-order="3"> 
	            <span class="category_bg oil"></span>
	            주유소
	        </li>  
	        <li id="CE7" data-order="4"> 
	            <span class="category_bg cafe"></span>
	            카페
	        </li>  
	        <li id="CS2" data-order="5"> 
	            <span class="category_bg store"></span>
	            편의점
	        </li>     
	    </ul>
    </header>

    <div class="main-container">
        <div id="map" class="map-container" style="width:100%; height: 600px;">
        
        </div>
        
		<script type="text/javascript" src="//dapi.kakao.com/v2/maps/sdk.js?appkey=c9d3f1c90fc1cea85b8bb8303f360c81&libraries=services,clusterer,drawing"></script>
		<script>
			var container = document.getElementById('map'); //지도를 담을 영역의 DOM 레퍼런스
			var options = { //지도를 생성할 때 필요한 기본 옵션
				center: new kakao.maps.LatLng(37.533067592513866, 126.89622037964806), //지도의 중심좌표.
				level: 6 //지도의 레벨(확대, 축소 정도)
			};
		
			var map = new kakao.maps.Map(container, options); //지도 생성 및 객체 리턴
			
			 var positions = [
				<c:forEach var="house" items="${lList}" varStatus="status">
				{
					title: '${house.houseTitle}',
					latlng: new kakao.maps.LatLng('${house.houseLatitude}','${house.houseLongitude}'),
					houseNo: '${house.houseNo}'
				}<c:if test="${!status.last}">,</c:if>
				</c:forEach>
			];
			
			 var geocoder = new kakao.maps.services.Geocoder();
			 
			 geocoder.addressSearch('${locate}', function(result, status) {
				 
				     if (status === kakao.maps.services.Status.OK) {

				        var coords = new kakao.maps.LatLng(result[0].y, result[0].x);

				        map.setCenter(coords);
				    } 
				}); 
			 
			 function searchLocate(){
				 var ps = new kakao.maps.services.Places(); 
				 var searchLocation = document.getElementById("searchLocation").value;
				 console.log(searchLocation);

				// 키워드로 장소를 검색합니다
				ps.keywordSearch(searchLocation, placesSearchCB); 

				function placesSearchCB (data, status, pagination) {
				    if (status === kakao.maps.services.Status.OK) {

				        var bounds = new kakao.maps.LatLngBounds();

				        for (var i=0; i<data.length; i++) {
				            bounds.extend(new kakao.maps.LatLng(data[i].y, data[i].x));
				        }       

				        map.setBounds(bounds);
				    } 
				}
			 }
			 
			 
			 var clusterer = new kakao.maps.MarkerClusterer({
			        map: map, // 마커들을 클러스터로 관리하고 표시할 지도 객체
			        averageCenter: true, // 클러스터에 포함된 마커들의 평균 위치를 클러스터 마커 위치로 설정
			        minLevel: 3, // 클러스터 할 최소 지도 레벨
			        disableClickZoom: true // 클러스터 마커를 클릭했을 때 지도가 확대되지 않도록 설정한다
			    });
			
			 var markers = positions.map(function(position, i) {
		            return new kakao.maps.Marker({
		                position : position.latlng
		            });
		        });
			 
		     // 클러스터러에 마커들을 추가합니다
		     clusterer.addMarkers(markers);
		     
		     $(document).ready(function(){
		    	 
		    	 for(var i = 0; i < positions.length; i++){
					 var infowindow = new kakao.maps.InfoWindow({
						 content: '<div style="width:110%;padding:5px;z-index:1;">' + positions[i].title + '</div>'
					 })
					 var mark = markers[i];
				     var itemEl = document.getElementById(positions[i].houseNo);
				     
					 itemEl.addEventListener('mouseover', makeOverListener(map, mark, infowindow));
					 
					 
					 itemEl.addEventListener('mouseout', makeOutListener(infowindow));

				 }
		     })
		     
		     for(var i = 0; i < positions.length; i++){
					 var infowindow = new kakao.maps.InfoWindow({
						 content: '<div style="width:110%;padding:5px;z-index:1;">' + positions[i].title + '</div>'
					 })
					 var mark = markers[i];
				     var itemEl = document.getElementById(positions[i].houseNo);
					 
					 kakao.maps.event.addListener(mark, 'mouseover', makeOverListener(map, mark, infowindow));
					 kakao.maps.event.addListener(mark, 'mouseout', makeOutListener(infowindow));
					 
				 }
			 
			 
			 
			 function makeOverListener(map, mark, infowindow) {
				    return function() {
				        infowindow.open(map, mark);
				    };
				}

				// 인포윈도우를 닫는 클로저를 만드는 함수입니다 
				function makeOutListener(infowindow) {
				    return function() {
				        infowindow.close();
				    };
				}

		        	        
		        kakao.maps.event.addListener(clusterer, 'clusterclick', function(cluster) {

		            // 현재 지도 레벨에서 1레벨 확대한 레벨
		            var level = map.getLevel()-1;

		            // 지도를 클릭된 클러스터의 마커의 위치를 기준으로 확대합니다
		            map.setLevel(level, {anchor: cluster.getCenter()});
		        });
		        
		        var showInfomation = new kakao.maps.InfoWindow({zIndex:1});
		    	function showInfo(e){
		    		console.log(e);
		    		var content = '<div style="padding:5px;z-index:1;">' + e.innerText + '</div>';

		    		showInfomation.setContent(content);
		    		showInfomation.open(map, marker); 
		    	}
		    	function deleteShowInfo(e){
		    		showInfomation.close();
		    	}
		    	
		    	var placeOverlay = new kakao.maps.CustomOverlay({zIndex:1}), 
		        contentNode = document.createElement('div'), // 커스텀 오버레이의 컨텐츠 엘리먼트 입니다 
		        markeres = [], // 마커를 담을 배열입니다
		        currCategory = ''; // 현재 선택된 카테고리를 가지고 있을 변수입니다
		    	
		    	
		    	var pss = new kakao.maps.services.Places(map); 

		    	// 지도에 idle 이벤트를 등록합니다
		    	kakao.maps.event.addListener(map, 'idle', searchPlaces);

		    	// 커스텀 오버레이의 컨텐츠 노드에 css class를 추가합니다 
		    	contentNode.className = 'placeinfo_wrap';

		    	// 커스텀 오버레이의 컨텐츠 노드에 mousedown, touchstart 이벤트가 발생했을때
		    	// 지도 객체에 이벤트가 전달되지 않도록 이벤트 핸들러로 kakao.maps.event.preventMap 메소드를 등록합니다 
		    	addEventHandle(contentNode, 'mousedown', kakao.maps.event.preventMap);
		    	addEventHandle(contentNode, 'touchstart', kakao.maps.event.preventMap);

		    	// 커스텀 오버레이 컨텐츠를 설정합니다
		    	placeOverlay.setContent(contentNode);  

		    	// 각 카테고리에 클릭 이벤트를 등록합니다
		    	addCategoryClickEvent();

		    	// 엘리먼트에 이벤트 핸들러를 등록하는 함수입니다
		    	function addEventHandle(target, type, callback) {
		    	    if (target.addEventListener) {
		    	        target.addEventListener(type, callback);
		    	    } else {
		    	        target.attachEvent('on' + type, callback);
		    	    }
		    	}

		    	// 카테고리 검색을 요청하는 함수입니다
		    	function searchPlaces() {
		    	    if (!currCategory) {
		    	        return;
		    	    }
		    	    
		    	    // 커스텀 오버레이를 숨깁니다 
		    	    placeOverlay.setMap(null);

		    	    // 지도에 표시되고 있는 마커를 제거합니다
		    	    removeMarker();
		    	    
		    	    pss.categorySearch(currCategory, placesSearchCB, {useMapBounds:true}); 
		    	}

		    	// 장소검색이 완료됐을 때 호출되는 콜백함수 입니다
		    	function placesSearchCB(data, status, pagination) {
		    	    if (status === kakao.maps.services.Status.OK) {

		    	        // 정상적으로 검색이 완료됐으면 지도에 마커를 표출합니다
		    	        displayPlaces(data);
		    	    } else if (status === kakao.maps.services.Status.ZERO_RESULT) {
		    	        // 검색결과가 없는경우 해야할 처리가 있다면 이곳에 작성해 주세요

		    	    } else if (status === kakao.maps.services.Status.ERROR) {
		    	        // 에러로 인해 검색결과가 나오지 않은 경우 해야할 처리가 있다면 이곳에 작성해 주세요
		    	        
		    	    }
		    	}

		    	// 지도에 마커를 표출하는 함수입니다
		    	function displayPlaces(places) {

		    	    // 몇번째 카테고리가 선택되어 있는지 얻어옵니다
		    	    // 이 순서는 스프라이트 이미지에서의 위치를 계산하는데 사용됩니다
		    	    var order = document.getElementById(currCategory).getAttribute('data-order');

		    	    

		    	    for ( var i=0; i<places.length; i++ ) {

		    	            // 마커를 생성하고 지도에 표시합니다
		    	            var marker = addMarker(new kakao.maps.LatLng(places[i].y, places[i].x), order);

		    	            // 마커와 검색결과 항목을 클릭 했을 때
		    	            // 장소정보를 표출하도록 클릭 이벤트를 등록합니다
		    	            (function(marker, place) {
		    	                kakao.maps.event.addListener(marker, 'click', function() {
		    	                    displayPlaceInfo(place);
		    	                });
		    	            })(marker, places[i]);
		    	    }
		    	}

		    	// 마커를 생성하고 지도 위에 마커를 표시하는 함수입니다
		    	function addMarker(position, order) {
		    	    var imageSrc = 'https://t1.daumcdn.net/localimg/localimages/07/mapapidoc/places_category.png', // 마커 이미지 url, 스프라이트 이미지를 씁니다
		    	        imageSize = new kakao.maps.Size(27, 28),  // 마커 이미지의 크기
		    	        imgOptions =  {
		    	            spriteSize : new kakao.maps.Size(72, 208), // 스프라이트 이미지의 크기
		    	            spriteOrigin : new kakao.maps.Point(46, (order*36)), // 스프라이트 이미지 중 사용할 영역의 좌상단 좌표
		    	            offset: new kakao.maps.Point(11, 28) // 마커 좌표에 일치시킬 이미지 내에서의 좌표
		    	        },
		    	        markerImage = new kakao.maps.MarkerImage(imageSrc, imageSize, imgOptions),
		    	            marker = new kakao.maps.Marker({
		    	            position: position, // 마커의 위치
		    	            image: markerImage 
		    	        });

		    	    marker.setMap(map); // 지도 위에 마커를 표출합니다
		    	    markeres.push(marker);  // 배열에 생성된 마커를 추가합니다

		    	    return marker;
		    	}

		    	// 지도 위에 표시되고 있는 마커를 모두 제거합니다
		    	function removeMarker() {
		    	    for ( var i = 0; i < markeres.length; i++ ) {
		    	    	markeres[i].setMap(null);
		    	    }   
		    	    markeres = [];
		    	}

		    	// 클릭한 마커에 대한 장소 상세정보를 커스텀 오버레이로 표시하는 함수입니다
		    	function displayPlaceInfo (place) {
		    	    var content = '<div class="placeinfo">' + '<div class="infoDiv">' +
		    	                    '   <a class="title" href="' + place.place_url + '" target="_blank" title="' + place.place_name + '">' + place.place_name + '</a>' +
		    	                    '<div class="close" onclick="closeOverlay()" title="닫기"><img src="${contextPath}/resources/img/icons/x.svg"></div>' + '</div>';   

		    	    if (place.road_address_name) {
		    	        content += '    <span title="' + place.road_address_name + '">' + place.road_address_name + '</span>' +
		    	                    '  <span class="jibun" title="' + place.address_name + '">(지번 : ' + place.address_name + ')</span>';
		    	    }  else {
		    	        content += '    <span title="' + place.address_name + '">' + place.address_name + '</span>';
		    	    }                
		    	   
		    	    content += '    <span class="tel">' + place.phone + '</span>' + 
		    	                '</div>' + 
		    	                '<div class="after"></div>';

		    	    contentNode.innerHTML = content;
		    	    placeOverlay.setPosition(new kakao.maps.LatLng(place.y, place.x));
		    	    placeOverlay.setMap(map);  
		    	}


		    	// 각 카테고리에 클릭 이벤트를 등록합니다
		    	function addCategoryClickEvent() {
		    	    var category = document.getElementById('category'),
		    	        children = category.children;

		    	    for (var i=0; i<children.length; i++) {
		    	        children[i].onclick = onClickCategory;
		    	    }
		    	}

		    	// 카테고리를 클릭했을 때 호출되는 함수입니다
		    	function onClickCategory() {
		    	    var id = this.id,
		    	        className = this.className;

		    	    placeOverlay.setMap(null);

		    	    if (className === 'on') {
		    	        currCategory = '';
		    	        changeCategoryClass();
		    	        removeMarker();
		    	    } else {
		    	        currCategory = id;
		    	        changeCategoryClass(this);
		    	        searchPlaces();
		    	    }
		    	}

		    	// 클릭된 카테고리에만 클릭된 스타일을 적용하는 함수입니다
		    	function changeCategoryClass(el) {
		    	    var category = document.getElementById('category'),
		    	        children = category.children,
		    	        i;

		    	    for ( i=0; i<children.length; i++ ) {
		    	        children[i].className = '';
		    	    }

		    	    if (el) {
		    	        el.className = 'on';
		    	    } 
		    	}
		    	
		    	function closeOverlay() {
		    		placeOverlay.setMap(null);     
		    	}
		    	
		</script>

        <div class="sidebar">
        <c:forEach var="home" items="${lList}" varStatus="status">
            <div class="listing" id="${home.houseNo }" onclick="detailHouse(this)">
                <img class="homeImg" src="${hImgList[status.index].changeName }" alt="Placeholder for real estate image">
                <div class="home-text-div">
	                <span>${home.houseName }</span>
	                <c:if test="${home.houseStyle eq '월세' }">
	                	<span class="home-price-span">월세 ${home.housePrice } / ${home.houseRent }</span>
	                </c:if>
	                <c:if test="${home.houseStyle eq '전세' }">
	                	<span class="home-price-span">전세 ${home.housePrice }</span>
	                </c:if>
	                <p>${home.houseFloor }층, ${home.houseSquare }평, 관리비 ${home.houseMaintainCost }만</p>
	                <p class="home-title-p">${home.houseTitle }</p>
                </div>
            </div>
        </c:forEach>
        </div>
    </div>
    <script>
    	function detailHouse(e){
    		location.href="detail.ho?houseNo="+e.id;
    	}
    </script>
    
	<%@ include file="../common/footer.jsp"%>
</body>

</html>