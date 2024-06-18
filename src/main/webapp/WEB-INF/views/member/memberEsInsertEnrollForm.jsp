<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="ko">

<head>
	<meta charset="UTF-8">
	<meta name="viewport" content="width=device-width, initial-scale=1.0">
	<title>중개사무소 등록</title>
	<script src="//t1.daumcdn.net/mapjsapi/bundle/postcode/prod/postcode.v2.js"></script>
	 
	 
	<style>
	body {
		font-family: 'Arial', sans-serif;
		margin: 0;
		padding: 0;
		background-color: #f4f4f4;
	}
	
	.registration-container {
		background: #fff;
		width: 70%;
		margin: 40px auto;
		padding: 20px;
		box-shadow: 0 2px 4px rgba(0, 0, 0, 0.1);
	}
	
	.form-title {
		font-size: 24px;
		text-align: center;
		margin: 20px 0;
	}
	
	.form-section {
		margin-bottom: 15px;
	}
	
	.form-section label {
		display: block;
		margin-bottom: 5px;
	}
	
	.form-section input[type="text"], .form-section select, .form-section input[type="email"],
		.form-section input[type="tel"], .form-section input[type="password"]{
		width: 100%;
		padding: 10px;
		margin-bottom: 10px;
		border: 1px solid #ddd;
		border-radius: 4px;
	}
	
	.userType input[type="radio"] {
		width: 23%;
		padding: 10px;
		margin-bottom: 10px;
		border: 1px solid #ddd;
		border-radius: 4px;
		
	}
	
	.form-section input[type="submit"] {
		width: 100%;
		padding: 10px;
		background-color: #000;
		color: #fff;
		border: none;
		border-radius: 4px;
		cursor: pointer;
	}
	
	.form-section input[type="submit"]:hover {
		background-color: #333;
	}
	</style>
</head>

<body>

 	<%@ include file="../common/header.jsp" %>
 	
 	 <div class="page-head"> 
         <div class="container">
             <div class="row">
                 <div class="page-head-content">
                     <h1 class="page-title"></h1>               
                 </div>
             </div>
         </div>
     </div>
 		
		<div class="registration-container" style="padding:40px;width:40%;box-shadow: 0 0 4px 4px rgba(0, 0, 0, 0.1);">
			<h2 class="form-title">중개사무소 등록</h2>
			
			<form action="insertenroll.es" method="post">
					
				<div class="form-section">
					<label for="esName">중개사명*</label> 
					<input type="text" class="form-control" id="esName" name="esName" placeholder="중개사명">
					<input type="hidden" name="userId" value="${memberInfo.userId}">
				</div>				
	
				<div class="form-section">
					<label for="esCeo">대표자명*</label> 
 					<input type="text" class="form-control" id="esCeo" name="esCeo" placeholder="대표자명">				
				</div>

                <div class="form-section">
					<label for="esPhone">사업자 전화번호*</label> 
					<input type="text" class="form-control" id="esPhone" name="esPhone" >
					
				</div>
				
				<div class="form-section">
					<label for="esNum">사업자 등록 번호*</label> 
					<input type="text" class="form-control" id="esNum" name="esNum" >
					<span id="confirm"></span>
				</div>
                
				<div class="form-section">
					<label for="esRegisterNum">중개 등록 번호*</label> 
					<input type="text" class="form-control" id="esRegisterNum" name="esRegisterNum" >
					<span id="confirm2"></span>
				</div>
	
				<!-- 주소 text 누르면 팝업까지 -->
                <div class="form-section">
                    <label for="esAddress">주소*</label>
                    <input type="text" class="form-control" id="address_kakao" name="esAddress" placeholder="주소" >
                    <span class="placeholder"></span>
                </div>         	
				
				<!-------------------------- 주소창 띄우는 작업  ------------------------->
				<script type="text/javascript">
				
	               	    window.onload = function(){
	               	        document.getElementById("address_kakao").addEventListener("click", function(){ //주소입력칸을 클릭하면
	               	            
	               	        	event.preventDefault(); // 링크의 기본 동작을 중지
	               	        	//카카오 지도 발생
	               	            new daum.Postcode({
	               	                oncomplete: function(data) { //선택시 입력값 세팅
	               	                    document.getElementById("address_kakao").value = data.address; 	// 주소 넣기
	               	                    document.querySelector("input[name=esContent]").focus(); //다음 임력 칸으로 포커싱
	               	                
	               	                 
	               	                }
	               	            }).open();
	               	        });
	               	    }
	               	    
                 </script>
                 
                 <div class="form-section">
					<label for="esContent">중개사 소개</label> 
					<input type="text" class="form-control" id="esContent" name="esContent" placeholder="중개사를 소개해주세요.">					
				 </div>	
				 
				 <div class="form-section">
					<label for="esIntro">한 줄 소개</label> 
					<input type="text" class="form-control" id="esIntro" name="esIntro" placeholder="한 줄로 중개사를 소개해보세요.">					
				 </div>	
                 
                 <!---------------------------- 1000byte 넘을 시 타이핑 되지 않도록 설정 ----------------------->
                 <script type="text/javascript">
					    $(".form-control").keyup(function(e) {
					        var content = $(this).val();
					        
					        // 글자수 세기
					        if(content.length == 0 || content == "") {
					            $(".comment_length").text('0');
					        } else {
					            $(".comment_length").text(content.length);
					        }
					        
					        if (content.length > 500) {
					            // 500자를 넘었을 때 알림창 띄우기
					            showWarning("경고", "500자 이내로 입력해주세요.", "확인");  
					            
					            // 500자를 넘어가면 타이핑 되지 않도록 처리
					            $(this).val(content.substring(0, 500));
					        }
					    });
					</script>
                 
                                  	
				<div align="center">
	                <button type="submit" value="nextEnroll" onclick="return memberEnrollResult();" >가입하기</button>
	                <button type="reset">초기화</button>
           		 </div>
				
			</form>
		</div>
		
		<script type="text/javascript">
		
	        
				
			
	        function memberEnrollResult() {
	        	
	        	var esName = $("#esName").val();
				var esCeo = $("#esCeo").val();
				var esPhone = $("#esPhone").val();
				var esNum = $("#esNum").val();
				var esRegisterNum = $("#esRegisterNum").val();
				var address_kakao = $("#address_kakao").val();
				var esContent = $("#esContent").val();
	        	
	       		if(esName == null || esName == '') {
	       			showError("오류", "중개사를 입력하세요.", "확인");
	       			$("#esName").focus();
	       			return false;
	       		}
	        
	       		if(esCeo == null || esCeo == '') {
	       			showError("오류", "대표자명을 입력하세요.", "확인");
	       			$("#esCeo").focus();
	       			return false;
	       		}
	        
	       		if(esPhone == null || esPhone == '') {
	       			showError("오류", "전화번호를 입력하세요.", "확인");
	       			$("#esPhone").focus();
	       			return false;
	       		}
				
	       		if(esNum == null || esNum == '') {
	       			showError("오류", "사업자 번호를 입력하세요.", "확인");
	       			$("#esNum").focus();
	       			return false;
	       		}
	        	
	       		if(esRegisterNum == null || esRegisterNum == '') {
	       			showError("오류", "중개인 번호를 입력하세요.", "확인");
	       			$("#esRegisterNum").focus();
	       			return false;
	       		}
	        
	       		if(address_kakao == null || address_kakao == '') {
	       			showError("오류", "주소를 입력하세요.", "확인");
	       			$("#address_kakao").focus();
	       			return false;
	       		}
	        	        
	        }
		
		</script>
		
		
		
		
		
		<%@ include file="../common/footer.jsp" %>
				
</body>

</html>