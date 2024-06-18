<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>  
<!DOCTYPE html>
<html lang="ko">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>회원정보 수정</title>
   <script src="//t1.daumcdn.net/mapjsapi/bundle/postcode/prod/postcode.v2.js"></script>
    <style>
        .card{
           box-shadow: 1px 1px 7px 0;
           border: none;
           border-radius: 12px 12px 12px 12px;
           
        }
        .card h3 {
            font-size: 18px;
            margin-bottom: 10px;
            position: relative;
            display: block;
            padding: 15px 38px 13px 18px; 
            background-color: #c2c2c2;
            border-radius: 12px 12px 0 0;
            color: #effcf1;
           
        }
        .card p {
            font-size: 14px;
           
        }
        .card a {
            color: #fff;
            text-decoration: none;
            font-size: 14px;
            display: inline-block;
            margin-top: 10px;
            padding-top: 10px;
         
        }

        .card ul {
           padding: 0 40px;
        }

        .item_text{
            padding: 20px 0 10px 0px;
            line-height: 30px;
            font-size: 14px;
            letter-spacing: -0.8;
        }
        .btn_edit {
            float: right;
            padding: 2px 9px 3px 10px;
           color: #7b8994;
           border: none ;
        }
        
    </style>
</head>
<body>

	<%@ include file="../common/header.jsp" %>

    <div class="container" style="display: flex; width: 67%;">
    
	<!-- 마이페이지 메뉴바 --> 
	<c:choose>
    <c:when test="${loginUser.userType eq '임차인' || loginUser.userType eq '임대인'}">
        <%@ include file="memberMypagemenubar.jsp" %>
    </c:when>
    <c:when test="${loginUser.userType eq '중개인'}">
        <%@ include file="memberMypageEsmenubar.jsp" %>
    </c:when>
    </c:choose>     
        
        <!-------------------------------- 중개사무소 정보 수정하기-------------------------------->    
        <section class="main-content" style="width:100%; margin: 70px 0 70px 50px; margin-left:4%;">
            <div class="card" style="width: 93%; margin-bottom:50px;">
            
                <h3>프로필 수정하기 </h3>
                <!-- Additional content can be added here -->
                <ul class="card_row" style="color: #333; list-style: none; padding: 0 20px 20px 20px;">
                   
                   <form class="row cotact_form" action="esupdate.me" method="post" style="margin:0;">
                   
                   	 <input type="hidden" name="esNo" value="${elist[0].esNo}" >
                   	         	
	                   	<div>
	                   		<span class="item_text userName">중개사무소 이름</span>
	                   	 	<input type="text" class="form-control" id="esName" name="esName" placeholder="NAME" value="${elist[0].esName}" >
	                   	</div>	
	                   	
	                   	<hr id="hrElement"> 
	                   	
	                   	<div>
	                   		<span class="item_text userNickName"  id="userNickNameLabel">대표자 명</span>
	                   	 	<input type="text" class="form-control" id="esCeo" name="esCeo" placeholder="NICKNAME" value="${elist[0].esCeo}">
	                   	</div>	
	                   
	                   	<hr>	                   
	                    
	                   	<div>
	                    	<span class="item_text phone">중개사무소 전화번호(-없이)</span>
	                   	 	<input type="text" class="form-control" id="esPhone" name="esPhone" placeholder="PHONE" value="${elist[0].esPhone}" >
	                   	</div>	
	                   	
	                   	<hr>          	 
	    
	                   	<div>
	    					<span class="item_text esAddress">주소</span>
	                   	 	<input type="text" class="form-control" id="esAddress" name="esAddress" placeholder="ADDRESS" value="${elist[0].esAddress}" >
	                   	</div>	
	                   	
	                   	<!-------------------------------------주소 카카오 팝업---------------------------------->
	                   	<script type="text/javascript">
				
		               	    window.onload = function(){
		               	        document.getElementById("esAddress").addEventListener("click", function(){ //주소입력칸을 클릭하면
		               	            
		               	        	event.preventDefault(); // 링크의 기본 동작을 중지
		               	        	//카카오 지도 발생
		               	            new daum.Postcode({
		               	                oncomplete: function(data) { //선택시 입력값 세팅
		               	                    document.getElementById("esAddress").value = data.address; 	// 주소 넣기
		               	                    document.querySelector("input[name=esContent]").focus(); //다음 임력 칸으로 포커싱
		               	                }
		               	            }).open();
		               	        });
		               	    }	     
		               	    
		               	    //주소를 바꾸지 않을 시 이전 주소로 자동 입력
			               	 document.addEventListener("DOMContentLoaded", function() {
			               	    const addressInput = document.getElementById("esAddress");
	
			               	    addressInput.addEventListener("blur", function() {
			               	        if (!this.value || this.value.trim() === '') {
			               	            this.value = "${elist[0].esAddress}";
			               	        }
			               	    });
			               	});
               		    </script>   

	                   	<hr>
	                   	
                   		<div>
		                   	<span class="item_text age">중개사무소 소개</span>
	                   	 	<input type="text" class="form-control" id="esContent" name="esContent" placeholder="Content" value="${elist[0].esContent}" >
	                   	</div>	
	                   	
	                   	<hr>
	                   	
	                   	<div>
		                   	<span class="item_text age">한 줄 인사(500자 이내)</span>
	                   	 	<input type="text" class="form-control" id="esIntro" name="esIntro" placeholder="Intro" value="${elist[0].esIntro}" >
	                   	</div>	
	                   	
	                   	<hr>
	                   		                   		                   	
	                   	<div class="btns" style="float: right;">	                   								                   	
		                   	<button class="btn btn-primary" type="submit" onclick="mypageEstateUpdate();"><strong>정보 수정</strong></button>
	                   	</div>
	                   		                   	
                	</form>
	                </ul>
                
                <!-----------------------------------중개사무소 정보 수정-------------------------------->	
               
               
            </div>           
        </section> 
                               
      </div>
      
      <script type="text/javascript">
      	function mypageEstateUpdate() {
      		
      		var esName = $("#esName").val();
      		var esCeo = $("#esCeo").val();
      		var esPhone = $("#esPhone").val();
      		var esAddress = $("#esAddress").val();
      		
      		if(showConfirmToTrue("정보를 수정하시겠습니까?")) {
      			if (esName == '' || esName == null) {
					showError("오류", '사무소 명을 입력하세요.', "확인"); 
					return false;
				}
      			if (esCeo == '' || esCeo == null) {
					showError("오류", '대표자 명을 입력하세요.', "확인"); 
					return false;
				}
      			if (esPhone == '' || esPhone == null) {
					showError("오류", '사무소 번호를 입력하세요.', "확인");
					return false;
				}
      			if (esAddress == '' || esAddress == null) {
					showError("오류", '사무소 주소를 입력하세요.', "확인");
					return false;
				}
      			
      		}
      		
      		return true;

      	}
      
      </script>
    
     <%@ include file="../common/footer.jsp" %>
     
</body>
</html>
