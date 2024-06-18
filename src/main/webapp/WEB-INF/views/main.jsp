<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.1/jquery.min.js"></script>
<title>DungJip</title>
<style>
      * {
        box-sizing: border-box;
      }

      body {
        margin: 0;
        font-family: "Noto Sans KR", sans-serif;
      }

      .search-bar {
        background: url("resources/img/mainPage.jpg") no-repeat center center;
        background-size: cover;
        display: flex;
        align-items: center;
        justify-content: center;
        flex-direction: column;
        height: 460px;
        padding: 20px;
        text-align: center;
        color: #fff;
      }

      .search-bar-title {
        font-size: 40px;
        font-weight: bold;
        margin-bottom: 72px;
      }

      .search-bar-input {
        width: 100%;
        height: 60px;
        display: flex;
        justify-content: center;
      }

      .search-bar input {
        width: 560px;
        border-radius: 8px 0 0 8px;
        font-size: 16px;
        padding-left: 15px;
        border: none;
      }

      .search-bar button {
        padding: 10px;
        width: 80px;
        font-size: 16px;
        background-color: #cca427;
        color: white;
        font-weight: bold;
        border-radius: 0 8px 8px 0;
        border: none;
        cursor: pointer;
        transition: font-size 0.2s ease;
      }
      
      .search-bar button:hover {
        padding: 10px;
        width: 80px;
        font-size: 20px;
        background-color: #cca427;
        color: white;
        border-radius: 0 8px 8px 0;
        border: none;
        cursor: pointer;
      }
      
      .recommend-div{
      	margin-left: 40px;
      }

      .main-content {
        display: flex;
        margin: 20px;
      }
      
      .card-container{
      	display: flex;
        overflow: hidden;
        scroll-behavior: smooth;
      }

      .card {
            flex: none;
            width: 313px;
            margin-right: 16px;
            border: none;
            padding: 16px;
            background-color: #fff;
        }
        #left-btn {
            width: 50px;
		    height: 50px;
		    border: 0px;
		    position: absolute;
		    top: 54%;
		    transform: translateY(-50%);
		    z-index: 1;
		    opacity: 0.35;
		    transition: opacity 100ms ease-in-out 0s;
		    background: url(resources/img/icons/prev.svg) center center / cover no-repeat;
		    left: 15px;
        }
        #right-btn {
        	width: 50px;
		    height: 50px;
		    border: 0px;
		    position: absolute;
		    top: 54%;
		    transform: translateY(-50%);
		    z-index: 1;
		    opacity: 0.35;
		    transition: opacity 100ms ease-in-out 0s;
		    background: url(resources/img/icons/next.svg) center center / cover no-repeat;
		    right: 15px;
        }
        #left-btn:hover {
			opacity: 0.8;
        }
        
        #right-btn:hover {
			opacity: 0.8;
        }

      .card img {
        width: 280px;
        height: 200px;
      }

		#menu {
			width: 640px;
            display: flex;
            justify-content: space-around;
            background-color: #cca427;
            padding: 0;
            list-style-type: none;
            margin: 0 0 20px 0;
            border-radius: 10px;
            opacity : 0.9;
            overflow: hidden;
        }
        #menu li {
            color: white;
            display: block;
            font-size: 18px;
            text-align: center;
            padding: 8px 82.6px;
            text-decoration: none;
            font-weight: 500;
            cursor: pointer;
            transition: background 0.3s ease;
        }
        #menu li.active {
            background-color: #fff;
            color: #cca427;
            border-radius: 10px;
            font-weight: 800;
        }
        
        .recommend-span{
        	font-size: 20px;
        }

		.list-title {
			display : -webkit-box;
			overflow: hidden;
		 	text-overflow: ellipsis;
		  	-webkit-line-clamp: 1;
		  	-webkit-box-orient: vertical;
		    padding: 0px 0px;
		    margin: 0;
		}
		#userBoldName {
			color: #cca427;
			font-weight: 800;
		}
    </style>
</head>
<body>
	<%@ include file="common/header.jsp"%>
	<%@ include file="common/chatbot.jsp"%>
	<script>
		$.ajax({
			url:"select.location",
			success: function(result){
				var str = "";
				for(var i = 0; i < result.length; i++){
					str += '<option value="'+result[i].houseAddress+'"/>'
				}
				$("#locations").html(str);
			},error:function(){
				console.log("통신 에러");
			}
		})
    
		$("#goChat").click(function(){
			location.href="websocket/ask";
			
			
		});
	</script>
	<div class="search-bar">
      <div class="search-bar-title">어떤 집을 찾고 계세요?</div>
      <ul id="menu">
        <li class="active">원룸</li>
        <li>빌라</li>
        <li>오피스텔</li>
    </ul>
      <div class="search-bar-input">
        <input type="text" list="locations" id="locationInput" placeholder="검색어를 입력하세요" />
        <datalist id="locations">
        	
        </datalist>
        <button onclick="moveToMap();">검색</button>
      </div>
    </div>
    
    <script>
        var menuItems = document.querySelectorAll('#menu li');
        selectHouseType('원룸');
        
        function removeActiveClasses() {
            menuItems.forEach(function(item) {
                item.classList.remove('active');
            });
        }

        function setActiveClass(clickedItem) {
            removeActiveClasses();
            clickedItem.classList.add('active');
        }

        menuItems.forEach(function(item) {
            item.addEventListener('click', function() {
                setActiveClass(item);
                
               	selectHouseType(item.textContent);
            });
        });
        
        function selectHouseType(type){
        	$.ajax({
    			url: 'select.house',
    			data:{
    				type: type,
    			},success: function(result){
    				$("#cardContainer").html('');
    				var str = "";
    				const imgList = result.imgList;
    				const mainList = result.mainList;
    				const randomSubscribeHouse = result.randomSubscribeHouse;
    				const subscribeImg = result.subscribeImg;
    				
    				if(subscribeImg){
	    				str += '<div class="card" id="' + randomSubscribeHouse.houseNo + '" onclick="detailHouse(this)" style="cursor:pointer; position: relative;">' +
	    			       '<div style="position: relative;">' +
	    			       '<img class="house-image" src="' + subscribeImg.changeName + '" style="display: block; width: 100%;"/>' +
	    			       '<img class="premium" src="resources/img/icons/premiumMark.svg" style="width:50px; height:50px; position: absolute; top: -10px; left: -15px; z-index: 2;"/>' +
	    			       '</div>' +
	    			       '<p>' + randomSubscribeHouse.houseName + '</p>';
	    			       if(randomSubscribeHouse.houseStyle == '월세'){
	    			    	   str += '<span class="recommend-span">월세 ' + randomSubscribeHouse.housePrice + '/' + randomSubscribeHouse.houseRent + '</span>';
	    			       } else {
	    			    	   str += '<span class="recommend-span">전세 ' + randomSubscribeHouse.housePrice + '</span>';
	    			       }
	    			       str += '<p>' + randomSubscribeHouse.houseFloor + '층, ' + randomSubscribeHouse.houseSquare + '평, 관리비 '+ randomSubscribeHouse.houseMaintainCost+'만</p>' +
	    			       		  '<p class="list-title">' + randomSubscribeHouse.houseTitle + '</p>' +
   								  '</div>';
    				}
    				
    				for(var i = 0; i < mainList.length; i++){
    					str += '<div class="card" id="'+mainList[i].houseNo+'" onclick="detailHouse(this)" style="cursor:pointer;">' + 
    						   '<img src="'+imgList[i].changeName+'"/> <p>'+mainList[i].houseName+'</p>';
    					if(mainList[i].houseStyle == '월세'){
	    			    	   str += '<span class="recommend-span">월세 ' + mainList[i].housePrice + '/' + mainList[i].houseRent + '</span>';
	    			       } else {
	    			    	   str += '<span class="recommend-span">전세 ' + mainList[i].housePrice + '</span>';
	    			       }
    						str += '<p>' + mainList[i].houseFloor + '층, ' + mainList[i].houseSquare + '평, 관리비 '+ mainList[i].houseMaintainCost+'만</p>' +
    							   '<p class="list-title">' + mainList[i].houseTitle + '</p>' +
    							   '</div>';
    				}
    				
    				$("#cardContainer").append(str);
    			},error: function(){
    				console.log("통신에러");
    			}
        	})
        };
        
        function detailHouse(e){
        	location.href="detail.ho?houseNo="+e.id;
        }
    </script>
    
    <script>
	const activeMenuItem = document.querySelector('#menu li.active');
    	function moveToMap(){
        	const locationValue = document.getElementById('locationInput').value;
            // 선택된 메뉴 항목의 텍스트 값 가져오기
            const type = activeMenuItem.textContent.trim();
			
            if(locationValue == null || locationValue == ""){
            	location.href="villa.map?type="+type+"&locate=서울%영등포구%양평동4가%2";   
            } else {            	
	        	location.href="villa.map?type="+type+"&locate="+locationValue;            	
            }
    	}
    </script>
    
    <div class="recommend-div">
    	<c:choose>
			<c:when test="${loginUser == null }">
	    		<h2>이런 매물들을 추천드려요!</h2>
	    	</c:when>
	    	<c:otherwise>
	    		<h2><b id="userBoldName">${loginUser.userNickName }</b>님의 지역 주변 매물들을 추천드려요!</h2>
	    	</c:otherwise>
    	</c:choose>
    </div>
    
    <div class="main-content">
		<button id="left-btn" class="scroll-button" onclick="scroll(-200)"></button>
			<div class="card-container" id="cardContainer">

	      </div>
      
		<button id="right-btn" class="scroll-button" onclick="scroll(200)"></button>
    </div>
     <script>
	    let isDown = false;
	    let startX;
	    let scrollLeft;
	    const slider = document.querySelector('.card-container');
	
	    function scroll(offset) {
	        slider.scrollLeft += offset;
	    }
	
	    document.querySelectorAll('.scroll-button').forEach(button => {
	        button.addEventListener('click', (e) => {
	            const direction = button.id === 'right-btn' ? 1 : -1;
	            scroll(direction * 200);
	        });
	    });
	
	    slider.addEventListener('mousedown', (e) => {
	        isDown = true;
	        slider.classList.add('active');
	        startX = e.pageX - slider.offsetLeft;
	        scrollLeft = slider.scrollLeft;
	    });
	
	    slider.addEventListener('mouseleave', () => {
	        isDown = false;
	        slider.classList.remove('active');
	    });
	
	    slider.addEventListener('mouseup', () => {
	        isDown = false;
	        slider.classList.remove('active');
	    });
	
	    slider.addEventListener('mousemove', (e) => {
	        if (!isDown) return;
	        e.preventDefault();
	        const x = e.pageX - slider.offsetLeft;
	        const walk = (x - startX);
	        slider.scrollLeft = scrollLeft - walk;
	    });
    </script>
	      
	<%@ include file="common/footer.jsp"%>
</body>
</html>