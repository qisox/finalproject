<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
<head>
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.7.1/jquery.min.js"></script>
    <link rel="preconnect" href="https://fonts.googleapis.com">
	<link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
	<link href="https://fonts.googleapis.com/css2?family=Noto+Sans+KR:wght@100;200;300;400;500;600;700;800;900&display=swap" rel="stylesheet">
  <link rel="stylesheet" href="https://fonts.googleapis.com/css2?family=Material+Symbols+Outlined:opsz,wght,FILL,GRAD@20..48,100..700,0..1,-50..200" />
  
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>둥집</title>
  <style>
     
     /*버튼 css입니다*/   
.chat-toggle-button {
    position: fixed;
    bottom: 35px;
    right: 25px;
    width: 80px;
    height: 80px;
    color: #ffffff;
    border-radius: 50%;
    text-align: center;
    line-height: 50px;
    font-size: 24px;
    cursor: pointer;
    transition: all 0.3s ease;
    float: right;
    z-index: 2000;
	 box-shadow: 
        0px 0px 40px rgba(50, 50, 93, 0.25),
        0px 30px 60px rgba(0, 0, 0, 0.3),
        0px -2px 10px rgba(10, 37, 64, 0.35) inset;
        }
      
/*버튼 호버시 변하는 css입니다*/

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
            box-shadow: rgba(50, 50, 93, 0.25) 0px 50px 100px -20px, rgba(0, 0, 0, 0.3) 0px 30px 60px -30px, rgba(10, 37, 64, 0.35) 0px -2px 6px 0px inset;
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
            bottom: 100px;
            width: 500px;
            right: 0;
            float: right;
            z-index: 1500;
            margin-right: 20px;
        }

        .chat-container.visible {
            display: block;
        }
          
        

</style>
   
</head>
<body>
    <div class="chat-toggle-button" onclick="toggleChat()"><img src="/dungjip/resources/img/AiBot.png" alt="메인이미지"></div>
<!--@@@@@@@@@@@@@@@@@@@@@메인 인덱스@@@@@@@@@@@@@@@@@@@@@@@@@-->
    <div class="chat-body">
        <!-- 챗봇 대화창 컨테이너 -->
        <div class="chat-container" id="chat-container">
            <!-- 챗봇 헤더 -->
            <!-- 버튼 컨테이너 -->
            <div class="button-container" id="button-container">
              <h6><pre id="textToReveal" style="font-family: 'Noto sans KR', sans-serif;">
안녕하세요 
	
새로운 터전을 구하시는데
	
도움이 되고자 하는 
	
DUNGJIP 입니다
	
무엇을 도와드릴까요? 
                </pre></h6>
                <button onclick="introduceArea()">홈페이지소개 시켜줘</button>
                <button onclick="whatSubscribeArea()">구독을 시작하면?</button>
                <button onclick="goEnrollArea()">회원가입 하고 싶어</button>
                <button onclick="goFindIDPwdArea()">아이디를 잃어버렸어 </button>
                <button onclick="goSubscribeArea()">구독하고 싶어</button>
                <button onclick="noSubscribeArea()">구독해지하고 싶어</button>
             	  <button onclick="goChatService()"> 채  팅 </button>
		    <c:choose>
		    		<c:when test="${not empty loginUser}">
		    	   
		    	    <script>
					function goChatService(){
					window.open('websocket/ask?estateUserNo=' + ${loginUser.userNo}, "_blink");
				 }
		        	</script>
		   			
		   			 </c:when>
		    	
		    	<c:otherwise>
		      
		        <script>
		        function goChatService(){
		            showError("실패","로그인 후 이용 가능 합니다.","확인");
		        }
		     
		        </script>
		  
		    	</c:otherwise>
		
		</c:choose>
            </div>
        </div>
        <div class="chat-container" id="introduce" style="display: none;">
<!--@@@@@@@@@@@@@@@@@@@@@홈페이지 소개@@@@@@@@@@@@@@@@@@@@@@@@@-->
            <div class="button-container" id="button-container-introduce">
               <h6> <pre id="text2" style="font-family: 'Noto sans KR', sans-serif;">

저희 홈페이지는 집을 구하고 싶은 사람,

집을 판매하고 싶은 사람을 위한

집 중개 서비스 홈페이지 입니다

이 집이 어떤지 알고 싶은데

직접 방문하긴 어려운 사람들을 위해

실제로 거주했던 사용자들의 실제 리뷰를 통해 

더욱 확실한 정보들을 전달해드리거나 

집을 올려서 판매할 수 있는 사이트입니다.
 
                                </pre></h6>
             
                <button onclick="toggleChat()" id="backsite">이전 목록으로</button>
            </div>
        </div>
<!--@@@@@@@@@@@@@@@@@@@@@구독소개@@@@@@@@@@@@@@@@@@@@@@@@-->

        <div class="chat-container" id="whatSubscribe" style="display: none;">

            <div class="button-container" id="button-container-introduce">
<h6> <pre id="text4" style="font-family: 'Noto sans KR', sans-serif;">

둥집은 구독을 신청하시면

구독한 중개인들을 위해

우선 추천 서비스로

구독한 중개인의 매물들을

둥집의 메인페이지에 우선 추천 해드립니다.

</pre></h6>
               
                <button onclick="toggleChat()" id="backsite3">이전 목록으로</button>
            </div>
        </div>
<!--@@@@@@@@@@@@@@@@@@@@@회원가입@@@@@@@@@@@@@@@@@@@@@@@@@-->
<c:if test="${not empty loginUser}">
        <div class="chat-container" id="goEnrollForm" style="display: none;">

            <div class="button-container" id="button-container-introduce">
<h6> <pre id="text3" style="font-family: 'Noto sans KR', sans-serif;">

DUNGJIP의 멤버가 되고싶으시다구요?

제가 바로 회원가입 버튼을 만들어 오겠습니다

.............

.............

.............

이미 로그인이 되어있으십니다.

해당 서비스는 로그아웃 후 이용가능 합니다.

</pre></h6>
              
                <button onclick="toggleChat()" id="backsite2">이전 목록으로</button>
            </div>
        </div>

</c:if>
        <div class="chat-container" id="goEnrollForm" style="display: none;">

            <div class="button-container" id="button-container-introduce">
<h6> <pre id="text3" style="font-family: 'Noto sans KR', sans-serif;">

DUNGJIP의 멤버가 되고싶으시다구요?

요청을 듣고 제가 밑에 회원가입 버튼을 만들어왔습니다 

어서 둥집의 든든한 친구가 되어주세요!

</pre></h6>
           <a href="enrollType.me"><button>회원가입</button></a>     
                <button onclick="toggleChat()" id="backsite2">이전 목록으로</button>
            </div>
        </div>

<!--@@@@@@@@@@@@@@@@@@@@@아디비번찾기@@@@@@@@@@@@@@@@@@@@@@@@@-->
<c:if test="${not empty loginUser}">
<div class="chat-container" id="goFindPwdForm" style="display: none;">

            <div class="button-container" id="button-container-introduce">
<h6> <pre id="text5" style="font-family: 'Noto sans KR', sans-serif;">

아이디 비밀번호를 까먹으셨다구요?

잠시만 기다려주세요 버튼을 만들어 오겠습니다

.............

.............

현제 로그인이 되어 있으십니다.

해당 서비스는 로그아웃 후 이용해주세요
</pre></h6>
                <button onclick="toggleChat()" id="backsite4">이전 목록으로</button>
            </div>
        </div>

</c:if>
        <div class="chat-container" id="goFindPwdForm" style="display: none;">

            <div class="button-container" id="button-container-introduce">
<h6> <pre id="text5" style="font-family: 'Noto sans KR', sans-serif;">

아이디 비밀번호를 까먹으셨다구요?

제가 바로 버튼을 만들어왔습니다

어서 찾으시고 로그인 하신다음에

DUNGJIP을 즐겨주세요!

</pre></h6>
               <a href="findIdCheck"><button id="">ID 찾기</button></a>
               <a href="findPwdCheck"><button id="">PW 찾기</button></a>
                <button onclick="toggleChat()" id="backsite4">이전 목록으로</button>
            </div>
        </div>

<!--@@@@@@@@@@@@@@@@@@@@@구독강요@@@@@@@@@@@@@@@@@@@@@@@@@-->

        <div class="chat-container" id="goSubscribeForm" style="display: none;">

            <div class="button-container" id="button-container-introduce">
            <c:choose>
            <c:when test="${empty loginUser}">
<h6> <pre id="text6" style="font-family: 'Noto sans KR', sans-serif;">

둥집의 매력에 더욱더 빠지고 싶으신가요?

제가 바로 구독버튼을 만들어오겠습니다

.............

.............

아직 로그인을 안하셨네요! 

로그인을 하셔야지만 구독을 하실수 있으세요! 

로그인 먼저 진행 하시고 다시 저를 찾아와주세요!

</pre></h6>
	
               
</c:when>
<c:when test="${loginUser.userType eq '중개인' and loginUser.subscribe eq 'N'}">
<h6> <pre id="text6" style="font-family: 'Noto sans KR', sans-serif;">

둥집의 매력에 더욱더 빠지고 싶으신가요?

제가 바로 구독버튼을 만들어오겠습니다

밑에 생긴 구독버튼을 클릭 하셔서 둥집의

프리미엄 서비스를 즐겨 주세요!

</pre></h6>


 			<button onclick="location.href='subscribe.sb'">구독하기</button>


</c:when>
<c:otherwise>

<h6> <pre id="text6" style="font-family: 'Noto sans KR', sans-serif;">

둥집의 매력에 더욱더 빠지고 싶으신가요?

제가 바로 구독버튼을 만들어오겠습니다

.............

.............

.............

해당 서비스는 중개인만 구독 할 수 있는

서비스입니다.

</pre></h6>

</c:otherwise>
                </c:choose>
                <button onclick="toggleChat()" id="backsite5">이전 목록으로</button>
            </div>
        </div>       
        
        
        <div class="chat-container" id="noSubscribeForm" style="display: none;">

            <div class="button-container" id="button-container-introduce">
            <c:choose>
            <c:when test="${empty loginUser}">
<h6> <pre id="text" style="font-family: 'Noto sans KR', sans-serif;">

더 이상 둥집을 구독하시지 않으실건가요?

... 바로 구독 해지 버튼을 만들어 오겠습니다

.............

.............

아직 로그인을 안하셨네요!

로그인을 하셔야지만 구독을 해지하실 수 있으세요! 

로그인 먼저 진행 하시고 다시 저를 찾아와주세요!

</pre></h6>
	
               
</c:when>
<c:when test="${loginUser.userType eq '중개인' and loginUser.subscribe eq 'Y'}">
<h6> <pre id="text" style="font-family: 'Noto sans KR', sans-serif;">

더 이상 둥집을 구독하시지 않으실건가요?

... 바로 구독 해지 버튼을 만들어 오겠습니다

밑에 생긴 구독 해지 버튼을 클릭 하셔서

구독을 해지하실 수 있습니다.

해지하는 순간부터 구독자 서비스를 이용할 수 없으니

이 점 유의하시길 바랍니다!

</pre></h6>


 			<button onclick="noSubscribe()">구독해지하기</button>


</c:when>
<c:otherwise>

<h6> <pre id="text" style="font-family: 'Noto sans KR', sans-serif;">

더 이상 둥집을 구독하시지 않으실건가요?

... 바로 구독 해지 버튼을 만들어 오겠습니다

.............

.............

.............

회원님이 중개인이 아니시거나

이미 구독이 해지된 상태이십니다!!

마음껏 둥집을 즐겨주세요!

</pre></h6>

</c:otherwise>
                </c:choose>
                <button onclick="toggleChat()" id="backSite">이전 목록으로</button>
            </div>
        </div>       
        
        
    </div>

<!-- 새롭게 창이 열리게 해놓아 경우마다 div를 주었습니다 -->
    <script>
    //this가 안먹혀 일일히 아이디값 주고 이전으로 설정해놨습니다
        $("#backsite").click(function(){

            $("#introduce").css("display", "none");
            $("#chatContainer").css("display", "block");
        });
 
        $("#backsite2").click(function(){

        $("#goEnrollForm").css("display", "none");
        $("#chatContainer").css("display", "block");
        });


        $("#backsite3").click(function(){

        $("#whatSubscribe").css("display", "none");
        $("#chatContainer").css("display", "block");
        });

        $("#backsite4").click(function(){

        $("#goFindPwdForm").css("display", "none");
        $("#chatContainer").css("display", "block");
        });

        
        $("#backsite5").click(function(){

        $("#goSubscribeForm").css("display", "none");
        $("#chatContainer").css("display", "block");
        });
        
        $("#backSite").click(function(){

            $("#noSubscribeForm").css("display", "none");
            $("#chatContainer").css("display", "block");
            });


        // 토글하는 함수(버튼 클릭시 챗봇 영역이 나오게)
        function toggleChat() {
            var chatContainer = $("#chat-container");
            var openChat = $("#openChat");
            var textToReveal = $("#textToReveal");
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
                textToReveal.each(function () {
                    revealText($(this));
                });
            } else {//열려있을때는 한번더 클릭하여 없에기 
            	  $(".chat-container").css("display", "none");
            	}
            	  
            }
            
        
		//첫번째 옵션인 홈페이지 소개 함수입니다
        function introduceArea() {
            var chatContainer = $("#chat-container");
            var introduce = $("#introduce");
            var text2 = $("#text2");

            chatContainer.css("display", "none");
            introduce.css("display", "block");
            text2.each(function () {
                revealText($(this));
            });
           
        }
 	//두번째 옵션인 구독소개 함수입니다
        function whatSubscribeArea() {
            var chatContainer = $("#chat-container");
            var whatSubscribe = $("#whatSubscribe");
            var text4 = $("#text4");

            chatContainer.css("display", "none");
            whatSubscribe.css("display", "block");
            text4.each(function () {
                revealText($(this));
            });
        }

	//세번째 옵션인 회원가입 함수입니다
        function goEnrollArea() {
            var chatContainer = $("#chat-container");
            var goEnrollForm = $("#goEnrollForm");
            var text3 = $("#text3");

            chatContainer.css("display", "none");
            goEnrollForm.css("display", "block");
            text3.each(function () {
                revealText($(this));
            });
        }
	//네번째 옵션인 아디 찾기 옵션입니다
        function goFindIDPwdArea() {
            var chatContainer = $("#chat-container");
            var goFindPwdForm = $("#goFindPwdForm");
            var text5 = $("#text5");

            chatContainer.css("display", "none");
            goFindPwdForm.css("display", "block");
            text5.each(function () {
                revealText($(this));
            });
        }
	//다섯번째 옵션인 구독하기 옵션입니다
        function goSubscribeArea() {
            var chatContainer = $("#chat-container");
            var goSubscribeForm = $("#goSubscribeForm");
            var text6 = $("#text6");

            chatContainer.css("display", "none");
            goSubscribeForm.css("display", "block");
            text6.each(function () {
                revealText($(this));
            });
        }
      //여섯번째 옵션인 구독하기 옵션입니다
        function noSubscribeArea() {
            var chatContainer = $("#chat-container");
            var noSubscribeForm = $("#noSubscribeForm");
            var text = $("#text");

            chatContainer.css("display", "none");
            noSubscribeForm.css("display", "block");
            text.each(function () {
                revealText($(this));
            });
        }
		//일일히 문자를 타이핑 하듯이 나열해주는 함수입니다.
        function revealText(element) {
			var timer = 0;
            var text = element.html();
            element.html("");//처음에는 빈문자열로 시작합니다
            var index = 0;//시작할 인덱스입니다
            timer = setInterval(function () {
                element.html(element.html() + text.charAt(index));//빈문자열부터 시작해서 인덱스를 하나하나씩 올려주며 작성한 글들을 뽑습니다
                index++;
                if (index === text.length) {//모든 글자가 다 출력 되면 시간이 멈춘다
                    clearInterval(timer);
                } else if(index !== text.length && element.css("display") === 'none') {
                	element.html(text);
                }
            }, 30);//30ms로 설정 아마 0.03초
        }
      
		
		
		
		//현재 챗봇 이외의 영역을 클릭할시 다 사리지게 하는 옵션입니다
        $(document).on('click', function(e) {
            // 클릭된 요소가 채팅 창 또는 관련된 영역인지 확인
            if (!$(e.target).closest('.chat-container, .chat-toggle-button').length) {
                // 클릭된 영역이 채팅 창 또는 관련된 영역이 아니면 채팅 창을 숨김
                $(".chat-container").css("display", "none");
            }
        });
		 
		 function noSubscribe(){
    	  var userNo = "${loginUser.userNo}";
    	 	  if(confirm("정말로 해지하시겠습니까?")){
    	 		 $.ajax({
    	 			 url: 'subscribe.no',
    	 			 data: {
    	 				 userNo: userNo
    	 			 },
    	 			 success: function(result){
    	 				 if(result === 1){
    	 		            showSuccess("성공",'해지 성공',"확인");
    	 				 } else {
     	 		            showError("실패",'해지 실패',"확인");
    	 				 }
    	 			 },
    	 			 error: function(){
  	 		            showError("실패",'해지 실패',"확인");
    	 			 },
    	 			 complete: function(){
    	 				 location.replace('/dungjip');
    	 			 }
    	 		 })
    	 	 } else {
		            showError("실패","구독 해지가 취소되었습니다.","확인");
    	 	 }
      	 }
    	//채팅바로가기
    	
    	

      
      </script>
    
    
    
    
        
</body>
</html>
