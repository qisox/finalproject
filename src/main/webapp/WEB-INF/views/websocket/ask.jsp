<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ include file="../common/sweetAlert.jsp" %>
<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=
    , initial-scale=1.0">
<title>Document</title>
<!-- 제이쿼리 등록 -->
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.1/jquery.min.js"></script>
<!-- 구글 폰트 등록 -->
<link rel="preconnect" href="https://fonts.googleapis.com">
<link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
<link
	href="https://fonts.googleapis.com/css2?family=Noto+Sans+KR:wght@100;200;300;400;500;600;700;800;900&display=swap"
	rel="stylesheet">

</head>
<style>
* {
	box-sizing: border-box;
	font-family: 'Noto Sans KR', sans-serif;
}

body {
	background-image: url('../resources/img/chatImg/backImg.png');
	margin: 0;
	padding: 0;
	display: flex;
	justify-content: center;
	align-items: center;
	height: 100vh;
}

#container {
	width: 100%;
	max-width: 1600px;
	background: #fff;
	box-shadow: 0 0 10px rgba(0, 0, 0, 0.1);
	overflow: hidden;
	display: flex;
	border-radius: 8px;
	box-shadow: 0px 0px 40px rgba(50, 50, 93, 0.25), 0px 30px 60px
		rgba(0, 0, 0, 0.3), 0px -2px 10px rgba(10, 37, 64, 0.35) inset;
}

aside {
	width: 30%;
	background-color: #3b3e49;
	color: white;
	overflow-y: auto;
}

main {
	width: 70%;
	overflow-y: auto;
}

aside header {
	padding: 30px 20px;
}

aside input {
	width: 100%;
	height: 50px;
	line-height: 50px;
	padding: 0 50px 0 20px;
	background-color: #5e616a;
	border: none;
	border-radius: 3px;
	color: #fff;
	background-image:
		url(https://s3-us-west-2.amazonaws.com/s.cdpn.io/1940306/ico_search.png);
	background-repeat: no-repeat;
	background-position: 510px;
	background-size: 55px;
}

aside input::placeholder {
	color: #fff;
	font-size: 20px;
}

aside ul {
	padding-left: 0;
	margin: 0;
	list-style-type: none;
	overflow-y: scroll;
	height: 690px;
}

aside li {
	padding: 10px 0;
}

aside li:hover {
	background-color: #5e616a;
}

h2, h3 {
	margin: 0;
}

aside li img {
	border-radius: 50%;
	margin-left: 20px;
	margin-right: 8px;
}

aside li div {
	display: inline-block;
	vertical-align: top;
	margin-top: 12px;
}

aside li h2 {
	font-size: 14px;
	color: #fff;
	font-weight: normal;
	margin-bottom: 5px;
}

aside li h3 {
	font-size: 12px;
	color: #7e818a;
	font-weight: normal;
}

.status {
	width: 8px;
	height: 8px;
	border-radius: 50%;
	display: inline-block;
	margin-right: 7px;
}

.green {
	background-color: #58b666;
}

.orange {
	background-color: #ff725d;
}

.blue {
	background-color: #6fbced;
	margin-right: 0;
	margin-left: 7px;
}

main header {
	height: 110px;
	padding: 30px 20px 30px 40px;
	background-color: #F3FBFF;
}

main header>* {
	display: inline-block;
	vertical-align: top;
}

main header img:first-child {
	border-radius: 50%;
}

main header img:last-child {
	width: 24px;
	margin-top: 8px;
}

main header div {
	margin-left: 10px;
	margin-right: 145px;
}

main header h2 {
	font-size: 16px;
	margin-bottom: 5px;
}

main header h3 {
	font-size: 14px;
	font-weight: normal;
	color: #7e818a;
}

#chat {
	padding-left: 0;
	margin: 0;
	list-style-type: none;
	overflow-y: scroll;
	height: 535px;
	border-top: 2px solid #fff;
	border-bottom: 2px solid #fff;
}

#chat li {
	padding: 10px 30px;
}

#chat h2, #chat h3 {
	display: inline-block;
	font-size: 13px;
	font-weight: normal;
}

#chat h3 {
	color: #bbb;
}

#chat .entete {
	margin-bottom: 5px;
}

#chat .message {
	padding: 20px;
	color: #fff;
	line-height: 25px;
	max-width: 90%;
	display: inline-block;
	text-align: left;
	border-radius: 5px;
}

#chat .me {
	text-align: right;
}

#chat .you .message {
	background-color: #58b666;
}

#chat .me .message {
	background-color: #6fbced;
}

#chat .triangle {
	width: 0;
	height: 0;
	border-style: solid;
	border-width: 0 10px 10px 10px;
}

#chat .you .triangle {
	border-color: transparent transparent #58b666 transparent;
	margin-left: 15px;
}

#chat .me .triangle {
	border-color: transparent transparent #6fbced transparent;
	margin-left: 955px;
}

main footer {
	height: 155px;
	padding: 20px 30px 10px 20px;
}

main footer textarea {
	resize: none;
	border: #ff725d;
	display: block;
	width: 100%;
	height: 80px;
	border-radius: 3px;
	padding: 20px;
	font-size: larger;
	margin-bottom: 13px;
	background-color: #F3FBFF;
}

main footer textarea::placeholder {
	font-size: larger;
}

main footer img {
	height: 30px;
	cursor: pointer;
}

main footer a {
	text-decoration: none;
	text-transform: uppercase;
	font-weight: bold;
	color: #6fbced;
	vertical-align: top;
	float: right;
	margin-top: 5px;
	display: inline-block;
}

aside ul::-webkit-scrollbar-track {
	background-color:; /* 스크롤바 트랙의 배경색 */
}

.active {
	background-color: #5e616a;
}

.chat-toggle-button:hover {
	background-color: #cca427;
}

/* 챗봇몸체 */
.chat-body {
	max-height: 400px;
	overflow-y: auto;
}

/* 버튼 박스(챗봇이 열리면 버튼들의 css입니다) */
.button-container {
	font-size: 24px;
	margin: 20px;
	padding: 20px;
	box-shadow: rgba(50, 50, 93, 0.25) 0px 50px 100px -20px,
		rgba(0, 0, 0, 0.3) 0px 30px 60px -30px, rgba(10, 37, 64, 0.35) 0px
		-2px 6px 0px inset;
	border-radius: 20px;
	background-color: #f9f9f9;
	font-weight: bolder;
}

/* 버튼 CSS */
.button-container button {
	width: 100%;
	padding: 10px;
	margin: 10px 0;
	border: none;
	border-radius: 10px;
	background-color: #cca427;
	color: white;
	cursor: pointer;
	font-size: 15px;
}

.chat-container {
	display: none;
	position: fixed;
	top: 50%;
	left: 50%;
	transform: translate(-50%, -50%);
	width: 500px;
	z-index: 1500;
	margin-right: 20px;
}

.chat-container.visible {
	display: block;
}

* {
	font-family: 'Noto sans KR', sans-serif;
}

.blur-effect {
	filter: blur(8px); /* Adjust the blur level as needed */
}

button.clickBtn2 {
	background-color: red;
}

#hrDiv {
	background-color: gray;
	height: 3px;
	width: 100%;
	margin: 20px 0;
}

* {
	-webkit-box-sizing: border-box;
	-moz-box-sizing: border-box;
	box-sizing: border-box;
}

html, body {
	margin: 0;
	padding: 0;
	font-family: 'Merriweather', serif;
}

h1 { 2
	position: absolute;
	top: 50%;
	left: 50%;
	-webkit-transform: translate(-50%, -50%);
	-ms-transform: translate(-50%, -50%);
	-o-transform: translate(-50%, -50%);
	transform: translate(-50%, -50%);
	padding: 1em;
	font-size: 2em;
	letter-spacing: .3em;
	color: #FFFFFF;
	text-align: center;
	border-top: 2px solid #E6EE9C;
	border-bottom: 2px solid #E6EE9C;
}

.contextmenu {
	display: none;
	position: absolute;
	width: 200px;
	margin: 0;
	padding: 0;
	background: #FFFFFF;
	border-radius: 5px;
	list-style: none;
	box-shadow: 0 15px 35px rgba(50, 50, 90, 0.1), 0 5px 15px
		rgba(0, 0, 0, 0.07);
	overflow: hidden;
	z-index: 999999;
}

.contextmenu li {
	border-left: 3px solid transparent;
	transition: ease .2s;
}

.contextmenu li a {
	display: block;
	padding: 10px;
	color: #B0BEC5;
	text-decoration: none;
	transition: ease .2s;
}

.contextmenu li:hover {
	background: #CE93D8;
	border-left: 3px solid #9C27B0;
}

.contextmenu li:hover a {
	color: #FFFFFF;
}

.fileUpMsg {
	right: 25px;
	width: 35px;
	height: 35px;
	color: #ffffff;
	background-color: #FC9B8F;
	border-radius: 50%;
	text-align: center;
	line-height: 32px;
	font-size: 15px;
	z-index: 2000;
	box-shadow: 0px 0px 40px rgba(50, 50, 93, 0.25), 0px 30px 60px
		rgba(0, 0, 0, 0.3), 0px -2px 10px rgba(10, 37, 64, 0.35) inset;
}
}
</style>

<body>

	<%-- <%@ include file="../common/chatbot.jsp"%> --%>
	<div id="main-content" style="width: 80%;">
		<div id="container">

			<aside>
				<header>
					<input id="findChat" type="text" placeholder="search"
						name="findChat">
				</header>
				<ul id="findChatList">
					<c:choose>
						<c:when test="${not empty chatList}">
							<c:forEach items="${chatList}" var="chatRoom" varStatus="status">
								<li onclick="whatEvent(this);">
								<c:forEach items="${chatRoom.members}" var="member">
								<c:forEach items="${chatRoom.estates }" var="estate">
								<input type="hidden" name="esIntro" value="${estate.esIntro }"> 
								</c:forEach> 
										<img id="${member.changeName }" src="../${member.changeName }"alt="" style="width: 50px; height: 50px;">
										<div style="width: 74%;">
											<input type="hidden" name="cno" value="${chatRoom.chatRoomNo}">
											<!-- 각 채팅방의 멤버에 대해 루프를 돌면서 userName을 표시 -->
											<div id="${member.userNo }" style="width: 100%; display: flex; justify-content: space-between;">
												<h2>&nbsp;&nbsp;&nbsp;&nbsp;${member.userNickName}</h2>
												<input type="hidden" name="nickName" value="${member.userNickName}">
												<span class="fileUpMsg" id="fileUpMsg${status.index }"style="margin-right: 10px;"></span> 
												<input type="hidden" name="eno" value="${member.userNo }">
											</div>
											<c:choose>
												<c:when test="${member.active}">
													<h3>
														&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<span class="status green"></span>
														현재 활동중
													</h3>
												</c:when>
												<c:otherwise>
													<h3 id="logoutTime">
														&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<span class="status orange"></span>
														<span>${member.calculateTimeAgo()}</span>
													</h3>
												</c:otherwise>
											</c:choose>
										</div>
										 
									</c:forEach></li>
							</c:forEach>



						</c:when>
						<c:otherwise>
							<h2 align="center">채팅방이 존재 하지 않습니다</h2>
						</c:otherwise>
					</c:choose>
					<!-- 쌓인 메세지 확인하는 용도 -->
					<script type="text/javascript">
					
					function readFileUpMsg(){
						var cnoList = [];
						document.querySelectorAll('input[name="cno"]').forEach(function(input) {
						  cnoList.push(input.value);
						});
					
						//쌓인 메세지 개수					
						$.ajax({
							url:'nowFileUpMsg.ch',
							data : {
								cnoList : cnoList,
								mno : '${loginUser.userNo}'
							},
							success : function(countList){
							
								for(var i = 0; i < countList.length; i++){
									var divId = "fileUpMsg"+i;
									var countDiv = document.getElementById(divId);
								
									if(countList[i] == 0){
										$("#"+divId).css("display", "none"); 
										continue;
									}
									countDiv.innerHTML = countList[i];
									countDiv.displya = 'none';
								}
							},

						});
					}
					readFileUpMsg();
					</script>
				</ul>
			</aside>
			<main>
				<header style="display: flex; justify-content: space-between;">
					<div style="display: flex;">
						<img id="userProfileImage" src="기본 이미지 경로" alt="사용자 프로필"
							style="width: 50px; height: 50px;" />
						<div style="display: flex;">
						<div>
							<h2 id="otherUser"></h2>
							<h3 id="esIntro"></h3>
						</div>
						</div>
					</div>
					<div style="margin-right: 10px; display: flex;">
					
							<h4 id="reportCount"></h4>
						<c:if test="${loginUser.userType eq '임차인'}">
							<button class="chat-toggle-button" onclick="toggleChat();">신고</button>
						</c:if>
					</div>

				</header>
		
				

				<ul id="chat">


				</ul>
				<footer>
					<span id="currentTyping"></span>
					<textarea placeholder="Type your message" id="sendChat"></textarea>
					<a
						href="#" id="send" onclick="send();">Send</a>
				</footer>
			</main>
		</div>
	</div>
	<div class="chat-body">
		<!-- 챗봇 대화창 컨테이너 -->
		<div class="chat-container" id="chat-container">
			<!-- 챗봇 헤더 -->
			<!-- 버튼 컨테이너 -->
			<div class="button-container" id="button-container">
				<h6>
					<pre id="textToReveal"
						style="font-family: 'Noto sans KR', sans-serif;">

공인중개사와의 상담이 불만족 하셨나요?

밑에 신고 사유를 선택하셔서 

제출해주세요 ! 

둥집의 매니저들이 실시간으로 모니터 중이니 

빠르게 해결을 하겠습니다 !

이용에 불편을 끼쳐 죄송합니다.
                </pre>
				</h6>
				<button class="reportBtn" name="" value="과대광고를 합니다.">과대광고를
					합니다.</button>
				<button class="reportBtn" name="" value="허위매물이 의심 됩니다.">허위매물
					의심이 됩니다.</button>
				<button class="reportBtn" name="" value="매물 주소와 등록된 사진이 다릅니다.">매물
					주소와 등록된 사진이 다릅니다.</button>
				<button class="reportBtn" name="" value="매물의 용도,구조,옵션 등 정보가 다릅니다.">매물의
					용도,구조,옵션 등 정보가 다릅니다.</button>
				<button class="reportBtn" name="" value="부적절한 언어를 사용하였습니다.">부적절한
					언어를 사용하였습니다.</button>
				<button onclick="goHotBoardArea()">직접입력</button>
				<div id="hrDiv"></div>
				<button id="subBtn">제출하기</button>
			</div>
		</div>
		<div class="chat-container" id="goHotBoardForm" style="display: none;">

			<div class="button-container" id="button-container-introduce">
				<h6>
					<pre id="text7" style="font-family: 'Noto sans KR', sans-serif;">

이 이외의 기타 항목이 있으신가요?

밑에 신고란을 만들어 두었으니 

자세하게 적어주세요 !

둥집 매니저들이 빠르게 확인하고 

불편사항을 해결해드리겠습니다
</pre>
				</h6>
				<legend>
					신고 사유
					<textarea name="" id="reportReason" cols="55" rows="10"
						style="resize: none;"></textarea>
				</legend>
				<button id="subBtn2">제출하기</button>
				<button onclick="toggleChat()" id="backsite6">이전 목록으로</button>
			</div>
		</div>
	</div>


	<ul class="contextmenu">
		<li><a id="deleteChatRoom">삭제하기</a></li>
	</ul>

</body>


<script>

//채팅방이 선택될 때 이 함수가 트리거됩니다.
function onChatRoomSelect(chatRoomNo) {
    // WebSocket 연결 설정
    connectToWebSocket(chatRoomNo);
    // 채팅 메시지 또는 다른 필요한 데이터 로드
    loadChatRoomData(chatRoomNo);
}


$("#subBtn").click(function(){
	
	var reportReason = $(".clickBtn2").val();
	$.ajax({
		
		url : "../websocket/report.ch",
		type : "post",
		data : {
			userNo : ${loginUser.userNo},
			chatRoomNo : chatRoomNo,
			estateNo : estateNo,
			reportReason : reportReason
			
		},
		success : function(result){
			 showSuccess("성공","신고가 정상적으로 제출되었습니다","확인"); 
			 $(".chat-container").css("display", "none");
			 $("#main-content").removeClass("blur-effect");
		},
		error : function(){
			
			
			
		}
	});
});
$("#subBtn2").click(function(){
	
	var reportReason = $("#reportReason").val();
	$.ajax({
		
		url : "../websocket/report.ch",
		type : "post",
		data : {
			estateNo : estateNo,
			loginUserNo : ${loginUser.userNo},
			chatRoomNo : chatRoomNo,
			reportReason : reportReason
			
		},
		success : function(result){

			 showSuccess("성공","신고가 정상적으로 제출되었습니다","확인");
			 $(".chat-container").css("display", "none");
			 $("#main-content").removeClass("blur-effect");
			
		},
		error : function(){
			
			
			
		}
	});
	
});



$(document).ready(function(){ //신고하기 버튼 누르면 나오는 버튼 항목중에서 그 버튼을 클릭시 색깔이 바뀌게
	  $('.reportBtn').click(function(){
	    // 모든 버튼에서 'active' 클래스 제거
	    $('.reportBtn').removeClass('clickBtn2');

	    // 클릭한 버튼에만 'active' 클래스 추가
	    $(this).addClass('clickBtn2');
	  });
	});
$("#backsite6").click(function(){

   $("#goHotBoardForm").css("display", "none");
   $("#chatContainer").css("display", "block");
    });


// 토글하는 함수(버튼 클릭시 챗봇 영역이 나오게)
function toggleChat() {
    var chatContainer = $("#chat-container");
    var mainContent = $("#main-content");
    var openChat = $("#openChat");
    var textToReveal = $("#textToReveal, #textToReveal-open");
    var chatBody = $(".chat-body");

    var introduce = $("#introduce");
    var whatSubscribe = $("#whatSubscribe");
    var goEnrollForm = $("#goEnrollForm");
    var goFindPwdForm = $("#goFindPwdForm");
    var goSubscribeForm = $("#goSubscribeForm");
    var goHotBoardForm = $("#goHotBoardForm");
  
    if (chatContainer.css("display") === "none") {
        // 채팅창 열기
        chatContainer.css("display", "block");
        mainContent.addClass("blur-effect");
        textToReveal.each(function () {
            revealText($(this));
        });
    } else {//열려있을때는 한번더 클릭하여 없에기 
    	  $(".chat-container").css("display", "none");
    	  mainContent.removeClass("blur-effect");
    	
   
    	  
    }
    	  
    }
    
function goHotBoardArea() {
    var chatContainer = $("#chat-container");
    var goHotBoardForm = $("#goHotBoardForm");
    var text7 = $("#text7");

    chatContainer.css("display", "none");
    goHotBoardForm.css("display", "block");
    text7.each(function () {
        revealText($(this));
    });
} 
//일일히 문자를 타이핑 하듯이 나열해주는 함수입니다.
function revealText(element) {
    var text = element.html();
    element.html("");//처음에는 빈문자열로 시작합니다
    var index = 0;//시작할 인덱스입니다
    var timer = setInterval(function () {
        element.html(element.html() + text.charAt(index));//빈문자열부터 시작해서 인덱스를 하나하나씩 올려주며 작성한 글들을 뽑습니다
        index++;
        if (index === text.length) {//모든 글자가 다 출력 되면 시간이 멈춘다
            clearInterval(timer);//
        
        }
    }, 30);//30ms로 설정 0.03초
}




//현재 챗봇 이외의 영역을 클릭할시 다 사리지게 하는 옵션입니다
$(document).on('click', function(e) {
    // 클릭된 요소가 채팅 창 또는 관련된 영역인지 확인
    if (!$(e.target).closest('.chat-container, .chat-toggle-button').length) {
        // 클릭된 영역이 채팅 창 또는 관련된 영역이 아니면 채팅 창을 숨김
        $(".chat-container").css("display", "none");
        $("#main-content").removeClass("blur-effect");
    }
});

// 위 함수에 대한 gpt 설명 
/*  !$(e.target).closest('.chat-container, .chat-toggle-button').length는 
jQuery를 사용하여 클릭된 요소의 부모 중에서 .chat-container 또는 .chat-toggle-button 클래스를 가진 요소를 찾는 것입니다.

e.target은 클릭된 요소를 나타냅니다.
.closest('.chat-container, .chat-toggle-button')은 클릭된 요소부터 시작해서 상위로 올라가며 주어진 선택자들 중에서 가장 가까운 부모를 찾습니다.
!는 논리 NOT 연산자로, 결과를 부정합니다.
.length는 선택된 요소의 개수를 나타냅니다.
따라서 !$(e.target).closest('.chat-container, .chat-toggle-button').length는
클릭된 요소의 부모 중에서 .chat-container 또는 .chat-toggle-button 클래스를 가진 요소가 없을 경우를 나타냅니다. 
이 경우, 클릭된 요소가 채팅 창 또는 토글 버튼 영역 외부에 있다는 의미이며, 이때 채팅 창을 숨기는 동작을 수행합니다.
 */


var currentChatRoomNo;//현재 사용자가 참여하고 있는 채팅방의 번호를 저장하는 변수

$("#findChat").on("input",function(){

	if($("#findChat").val() === ""){
		location.reload();
	
	}else{
	$.ajax({
		
		url:"../websocket/findChat.ch",
		data :{
			findChat : $("#findChat").val(),
			loginUserNo : ${loginUser.userNo}
		},
		success : function(chatList){
			
			 var findChatHtml = "";
			    chatList.forEach(function(chatRoom) {
			        // chatRoom과 chatRoom.members의 유효성 검사
			        if (chatRoom && chatRoom.members) {
			            findChatHtml += "<li onclick='whatEvent(this);'>"

						var a = 0;
			            chatRoom.members.forEach(function(member) {
			                if (member) {
							                    // member 객체의 유효성 검사
			                    findChatHtml += "<img id='" + member.changeName + "' src='../" + member.changeName + "' alt='' style='width:50px; height:50px;'>";
			                    findChatHtml += '<div style="width:74%;">';
			                    findChatHtml += "<input type='hidden' name='cno' value='" + chatRoom.chatRoomNo + "'>";
			                    findChatHtml += '<div id="'+member.userNickName+'" style="width:100%; display:flex; justify-content: space-between;">';
			                    findChatHtml += "<h2>&nbsp;&nbsp;&nbsp;&nbsp;" + member.userNickName + "</h2>";
			                    findChatHtml += '<span class="fileUpMsg" id="fileUpMsg'+a+'" style="margin-right:10px;"></span>';
			                    findChatHtml += "</div>";
			                    if (member.active) {
			                        findChatHtml += "<h3>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<span class='status green'></span>현재 활동중</h3>";
			                    } else {
			                        findChatHtml += "<h3 id='logoutTime'>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<span class='status orange'></span>로그아웃</h3>"; 
			                    }
			                    findChatHtml += "</div>";
			                }
			                a++;
			            });
			            findChatHtml += "</li>";
			        }
			    });

				readFileUpMsg();
			    $("#findChatList").html(findChatHtml);

			    $('aside ul li').click(function(){//새롭게 변했기때문에 다시 클릭하면 메세지를 받아오게 한다
			    	
					   $('aside ul li').removeClass('active');//원래 클릭된 배경 색깔을 지워주고

					    $(this).addClass('active');//새롭게 클릭된걸 다시 배경색깔을 바꿔준다
					    // 채팅방 리스트에서 해당 방을 클릭하면 클릭된 채팅방이 
					    //클릭된걸 알게 해주는 css 요소
					    currentChatRoomNo = $(this).find("input[name='cno']").val();
					   
					   //lastElementChild.children[1].id
				     // 클릭된 부동산의 인덱스를 가져옵니다
					chatRoomNo = $(this).find("input[name='cno']").val();//this는 li요소 find는 li 안에 있는 input[name='cno'] 이걸 가져온다
			
					$.ajax({
						url : "../websocket/pileUpMsg.ch",
						data : {
							cno : chatRoomNo,
							mno : '${loginUser.userNo}'
							
						},
						success: function(result){
					
							readFileUpMsg();
							
						}
	
						});
					$.ajax({
						url: "../websocket/selectChatMsg.ch",
						method:"POST",
						data :{cno : chatRoomNo},
						
						success:function(chatRoomMsg){
							var chatHtml = "";
							if(chatRoomMsg !=""){
							for (var i in chatRoomMsg){
						if("${loginUser.userNo}" == chatRoomMsg[i].userNo){
							chatHtml += "<li class='me'>"+
					        "<div class='entete'>" +
					        "<h3>" + chatRoomMsg[i].sendMessageTime + "</h3>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;" +
					        "<h2>" + chatRoomMsg[i].userName + "</h2>" +
					        "<span class='status blue'></span>" +
					        "</div>" +
					        "<div class='triangle'></div>" +
					        "<div class='message'>" +
					        chatRoomMsg[i].contentMessage +
					        "</div>" +
					        "</li>";

				    	$("#chat").html(chatHtml);	
							
						}else{
							  chatHtml += "<li class='you'>"+
						        "<div class='entete'>" +
						        "<h3>" + chatRoomMsg[i].sendMessageTime + "</h3>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;" +
						        "<h2>" + chatRoomMsg[i].userName + "</h2>" +
						        "<span class='status blue'></span>" +
						        "</div>" +
						        "<div class='triangle'></div>" +
						        "<div class='message'>" +
						        chatRoomMsg[i].contentMessage +
						        "</div>" +
						        "</li>";
						
							  $("#chat").html(chatHtml);
						}
							}
							}else{
								chatHtml = "";
								$("#chat").html(chatHtml);
							}
						$("#chat").scrollTop($("#chat").prop('scrollHeight'));//채팅을 최신순으로 내려주는 작업
						
						}
					});
				   });
			    readFileUpMsg();
	        }

	});

	}
});

 function whatEvent(e){
	  var nickName = $(e).find("input[name='nickName']").val();
	$("#otherUser").text(nickName);
	  var userProfileSrc = $(e).find('img').attr('src');
	  
	  if(e.firstElementChild.defaultValue){
		  $("#esIntro").text(e.firstElementChild.defaultValue);
	  }else{
		  $("#esIntro").text("");
	  }
      // 메인 헤더의 프로필 이미지 소스 변경
      $('#userProfileImage').attr('src', userProfileSrc);
	  let eno = $(e).find("input[name='eno']").val();
      
	  $.ajax({
		url : '../websocket/reportCount.ch',
		data : {
			eno : eno
		},
		success : function(result){
			if(result>=5){
				$("#reportCount").text("최근 5회이상 신고가 누적된 중개사");
				$("#reportCount").css("color", "red");
				$("#reportCount").css("margin-right", 10);
		  
	 		 }else{
	 			$("#reportCount").text(""); 
	 		 }
			
		},
		error : function(){
			console.log("신고기능 오류");
		}
	  });
	  
	  
	  

} 
//엔터키 누르면 메세지  전송
$(document).keyup(function(event){
	if(event.which ===13){//keyup 이벤트의 13번쨰가  엔터 키이다.
		send();//13번째인 엔터키를 누르면 send(); 함수로 이동 
	}
});

var chatRoomNo; //전역변수 채팅방 설정. 웹소켓으로 보낼때 밑에서 클릭했을때 받아오는 채팅방 순번이 필요함(식별자)


//-------------------------------왼쪽 채팅방 클릭했을때 이전 대화내역 나오는함수-------------------------------------------------------

window.onload = function() {
    var firstLi = $('aside ul li:first');
    if (firstLi.length > 0) {
        firstLi.click();
  
    }
};
	// 사이드바의 부동산을 클릭할 때
	   $('aside ul li').click(function(){

		   $('aside ul li').removeClass('active');//원래 클릭된 배경 색깔을 지워주고

		    $(this).addClass('active');//새롭게 클릭된걸 다시 배경색깔을 바꿔준다
		    // 채팅방 리스트에서 해당 방을 클릭하면 클릭된 채팅방이 
		    //클릭된걸 알게 해주는 css 요소
		    currentChatRoomNo = $(this).find("input[name='cno']").val();
		    estateNo = $(this).find("input[name='eno']").val();
		    var selectedChatRoomNo = $(this).find("input[name='cno']").val();
		    connectToWebSocket(selectedChatRoomNo);
		    
		 
		   //lastElementChild.children[1].id
	     // 클릭된 부동산의 인덱스를 가져옵니다
		chatRoomNo = $(this).find("input[name='cno']").val();//this는 li요소 find는 li 안에 있는 input[name='cno'] 이걸 가져온다
		
		//메세지 읽음처리 ajax
		$.ajax({
		url : "../websocket/pileUpMsg.ch",
		data : {
			cno : chatRoomNo,
			mno : '${loginUser.userNo}'
			
		},
		success: function(result){
			readFileUpMsg();
			
		}
			
		});
		
		
		
		
	    connectToWebSocket(chatRoomNo);//추가

		$.ajax({
			url: "../websocket/selectChatMsg.ch",
			method:"POST",
			data :{cno : chatRoomNo},
			
			success:function(chatRoomMsg){
				var chatHtml = "";
				if(chatRoomMsg !=""){
				for (var i in chatRoomMsg){
			if("${loginUser.userNo}" == chatRoomMsg[i].userNo){
				chatHtml += "<li class='me'>"+
		        "<div class='entete'>" +
		        "<h3>" + chatRoomMsg[i].sendMessageTime + "</h3>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;" +
		        "<h2>" + chatRoomMsg[i].userName + "</h2>" +
		        "<span class='status blue'></span>" +
		        "</div>" +
		        "<div class='triangle'></div>" +
		        "<div class='message'>" +
		        chatRoomMsg[i].contentMessage +
		        "</div>" +
		        "</li>";

	    	$("#chat").html(chatHtml);	
				
			}else{
				  chatHtml += "<li class='you'>"+
			        "<div class='entete'>" +
			        "<h3>" + chatRoomMsg[i].sendMessageTime + "</h3>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;" +
			        "<h2>" + chatRoomMsg[i].userName + "</h2>" +
			        "<span class='status blue'></span>" +
			        "</div>" +
			        "<div class='triangle'></div>" +
			        "<div class='message'>" +
			        chatRoomMsg[i].contentMessage +
			        "</div>" +
			        "</li>";
			
				  $("#chat").html(chatHtml);
				  
			}
				
				}
				}else{
					chatHtml = "";
					$("#chat").html(chatHtml);
				}
			$("#chat").scrollTop($("#chat").prop('scrollHeight'));//채팅을 최신순으로 내려주는 작업
			}
		});
	   });
   //------------------------------------웹소켓------------------------------------------------------------------------
  
		//웹소켓 접속 함수 
		var socket; //소켓담아놓을 변수 (접속과 종료 함수가 다르기 때문에 전역변수에 담아두고 사용한다)
		
		
		//연결함수(접속)
		function connectToWebSocket(chatRoonNo){
			//접속경로를 담아 socket을 생성한다.
			 if (socket && socket.readyState === WebSocket.OPEN && currentChatRoomNo === chatRoomNo) {

			        return;
			    }
			
			    if (socket) {
			        socket.close();
			    }
						
			var url = "ws://192.168.150.127:9999/dungjip/ask?chatRoomNo="+chatRoomNo;
			//"ws://localhost:9999/dungjip/ask?chatRoomNo="+chatRoomNo;
			// "ws://192.168.150.140:9999/dungjip/ask?chatRoomNo="+chatRoomNo;
			socket = new WebSocket(url);
			//연결이 되었을때
			socket.onopen = function(){
				  currentChatRoomNo = chatRoomNo;
			};
			//연결이 종료됐을때
			socket.onclose = function(){
			};
			//에러가 발생했을때
			socket.onerror = function(e){
			}
	
			socket.onmessage = function(event) {
					//JSON.parse(event.data) 에 대한 설명 
					// 컨트롤러에서 JSON을 toString 화 시켜서 보냈습니다
					//parse를 써서 String을 다시 객체화 시켜줬습니다
					var chatHtml= "";
					 if (event.data instanceof ArrayBuffer) {
					        // 바이너리 데이터 처리
					        var arrayBuffer = event.data;
					        // 예: 이미지를 표시
					        var blob = new Blob([arrayBuffer]);
					        var url = URL.createObjectURL(blob);
					        $('#chat').append('<img src="' + url + '">');
					    }else{
					
			    var message = JSON.parse(event.data);
			    $("#currentTyping").html(message.typing);
			    if(message.chatRoomNo == currentChatRoomNo){//내가 다른방에 있으면 다른방에 있는 사용자가 다른 채팅방에 있는데 오는 메세지를 막아준다
				if("${loginUser.userNo}" == message.userNo){//현재 로그인되어있는 사용자순번과 채팅을 친 사용자 순번이 같을경우	
			     chatHtml += "<li class='me'>"+
			        "<div class='entete'>" +
			        "<h3>" + message.date + "</h3>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;" +
			        "<h2>" + message.userName + "</h2>" +
			        "<span class='status blue'></span>" +
			        "</div>" +
			        "<div class='triangle'></div>" +
			        "<div class='message'>" +
			        message.text +
			        "</div>" +
			        "</li>";

		    	$("#chat").append(chatHtml);

					}else{//다를경우(상대방이 보낸건 왼쪽 내가보낸건 오른쪽)
						  chatHtml += "<li class='you'>"+
					        "<div class='entete'>" +
					        "<h3>" + message.date + "</h3>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;" +
					        "<h2>" + message.userName + "</h2>" +
					        "<span class='status blue'></span>" +
					        "</div>" +
					        "<div class='triangle'></div>" +
					        "<div class='message'>" +
					        message.text +
					        "</div>" +
					        "</li>";
					
						  $("#chat").append(chatHtml);
					}
			    }
					    }
				$("#chat").scrollTop($("#chat").prop('scrollHeight'));//채팅을 최신순으로 내려주는 작업

				readFileUpMsg();
			};
		}
		//접속종료 
		function disconnect(){
			socket.close();//소켓 닫기 
		}
//------------------------------------텍스트 메세지 전송--------------------------------------------------------------------------------
	function send() {
    var text = $("#sendChat").val();
    if (socket && socket.readyState === WebSocket.OPEN) {
        var data = {
            cno: chatRoomNo,
            message: text
        };
        socket.send(JSON.stringify(data));
        $("#sendChat").val("");
    } 
}
//-------------------------------파일메세지 전송 시작---------------------------------------------------------------------
// 파일이 선택되었을 때 호출되는 함수
function handleFileSelect(event) {
    var file = event.target.files[0];
    if (!file) {
        return;
    }

    // 파일 크기가 1MB를 초과하는지 확인
    if (file.size > 1048576) {
        alert("보내시려는 파일의 용량 크기가 너무 큽니다");
        return;
    }

    var reader = new FileReader();
    reader.onload = function(fileEvent) {
        var data = fileEvent.target.result;
        sendFile(data); // 데이터를 WebSocket을 통해 전송
    };
    reader.readAsArrayBuffer(file); // ArrayBuffer로 파일 읽기
}

// 파일 데이터를 전송하는 함수
function sendFile(fileData) {
    if (socket && socket.readyState === WebSocket.OPEN) {
        socket.send(fileData); // 파일 데이터 전송
    }
}

// onChange로 설정한 함수로 기능 바꾸기
document.getElementById('inputFile').addEventListener('change', handleFileSelect);


//----------------------------------------------------------------------------------------------------------------------------------

	
		
		$(document).ready(function(){
		    // 'aside' 내의 'li' 요소에 대해서만 컨텍스트 메뉴를 표시:
		    $('aside').on('contextmenu', 'li', function(e){
		        var winWidth = $(document).width();
		        var winHeight = $(document).height();
		        var posX = e.pageX;
		        var posY = e.pageY;
		        var menuWidth = $(".contextmenu").width();
		        var menuHeight = $(".contextmenu").height();
		        var secMargin = 10;

		        // 메뉴 위치 계산 및 조정
		        if(posX + menuWidth + secMargin >= winWidth
		            && posY + menuHeight + secMargin >= winHeight){
		            posLeft = posX - menuWidth - secMargin + "px";
		            posTop = posY - menuHeight - secMargin + "px";
		        }
		        else if(posX + menuWidth + secMargin >= winWidth){
		            posLeft = posX - menuWidth - secMargin + "px";
		            posTop = posY + secMargin + "px";
		        }
		        else if(posY + menuHeight + secMargin >= winHeight){
		            posLeft = posX + secMargin + "px";
		            posTop = posY - menuHeight - secMargin + "px";
		        }
		        else {
		            posLeft = posX + secMargin + "px" ;
		            posTop = posY + secMargin + "px";
		        }

		        // 컨텍스트 메뉴 위치 조정 및 표시:
		        $(".contextmenu").css({
		            "left": posLeft,
		            "top": posTop
		        }).show();
		        
		        var chatNo = this.children[1].children[0].value;						        
		         $("#deleteChatRoom").click(function(){
		        	//	 showSuccess("성공","신고가 정상적으로 제출되었습니다","확인"); 
		        	
		   
		         	$.ajax({
		        	
		        		url : "../websocket/deleteChatRoom.ch",
		        		type : "get",
		        		data : {
		        			chatNo : chatNo
		        		},
		        		success: function(result){
		        	
		        			location.reload();
		        		}
		        	}) 
		        	 
		          });
		        
		        // 브라우저 기본 컨텍스트 메뉴 방지.
		        return false;
		    });

		    $(document).contextmenu(function(e){
		        if (!$(e.target).closest('aside li').length) {
		            // 'aside li' 외부에서 우클릭한 경우 기본 컨텍스트 메뉴 허용
		            return false;
		        }
		        // 'aside li'에서 우클릭한 경우 기본 컨텍스트 메뉴 방지
		        return false;
		    });

		
		    // 문서의 어느 곳이든 클릭 시 컨텍스트 메뉴 숨기기:
		    $(document).click(function(){
		        $(".contextmenu").hide();
		    });
		});
		
		
	     </script>
</html>