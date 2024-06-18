<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@page import="com.kh.dungjip.member.model.vo.Member"%>    
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
	    <c:when test="${loginUser.userType eq '임차인' }">
	        <%@ include file="memberMypagemenubar.jsp" %>
	    </c:when>
	    <c:when test="${loginUser.userType eq '중개인'}">
	        <%@ include file="memberMypageEsmenubar.jsp" %>
	    </c:when>
	    <c:when test="${loginUser.userType eq '임대인'}">
	        <%@ include file="memberMypageImdamenubar.jsp" %>
	    </c:when>
    </c:choose>     
        
        <!-------------------------------- 회원 정보 수정하기-------------------------------->    
        <section class="main-content" style="width:100%; margin: 70px 0 70px 50px; margin-left:4%;">
            <div class="card" style="width: 93%; margin-bottom:50px;">
            
                <h3>프로필 수정하기 </h3>
                <!-- Additional content can be added here -->
                <ul class="card_row" style="color: #333; list-style: none; padding: 0 20px 20px 20px;">
                   
                   <form class="row cotact_form" id="memberupdateform" action="mupdate.me" method="post" style="margin:0;">
                   
                   	 <input type="hidden" name="userNo" value="${loginUser.userNo }">
	                   	
	                   	<div>
	                   		<span class="item_text userId">아이디</span>
	                   	 	<input type="text" class="form-control" id="userId" name="userId" placeholder="ID" value="${loginUser.userId}" readonly="readonly">
	                   	</div>		                   		                   
	                   
	                   	<hr>  
	                   	
	                   	<div>
	                   		<span class="item_text userName">이름</span>
	                   	 	<input type="text" class="form-control" id="userName" name="userName" placeholder="NAME" value="${loginUser.userName}" >
	                   	</div>	
	                   	
	                   	<hr id="hrElement"> 
	                   	
	                   	<div>
	                   		<span class="item_text userNickName"  id="userNickNameLabel">닉네임</span>
	                   	 	<input type="text" class="form-control" id="userNickName" name="userNickName" placeholder="NICKNAME" value="${loginUser.userNickName}">
	                   	</div>	
	                   	
	                   	
	                   	<!-- 중개인 일때는 닉네임 필요 없으니 중개인 페이지 들어갈땐 닉네임 div 숨김 -->
	                   	<script>
		                    const userType = '${loginUser.userType}'; // userType 값 가져오기
		                    
		                    const userNickNameLabel = document.getElementById('userNickNameLabel');
		                    const userNickNameInput = document.getElementById('userNickName');
		                    const hrElement = document.getElementById('hrElement');
	
		                    if (userType === '중개인') {
		                        userNickNameLabel.style.display = 'none'; // 라벨 숨김 처리
		                        userNickNameInput.style.display = 'none'; // 입력창 숨김 처리
		                        hrElement.remove(); // hr 태그를 삭제
		                    }
						</script>
	                   
	                   
	                   
	                   	<hr>
	                   	
	                   	<div>
		                   	<span class="item_text age">나이</span>
	                   	 	<input type="text" class="form-control" id="age" name="age" placeholder="AGE" value="${loginUser.age}" >
	                   	</div>	
	                   	
	                   	<hr>
	                    
	                   	<div>
	                    	<span class="item_text phone">휴대폰 번호(-없이)</span>
	                   	 	<input type="text" class="form-control" id="phone" name="phone" placeholder="PHONE" value="${loginUser.phone}" >
	                   	</div>	
	                   	
	                   	<hr>          	
	                   
	                   	<div>
	                    	<span class="item_text email">이메일</span>
	                   	 	<input type="text" class="form-control" id="email" name="email" placeholder="EMAIL" value="${loginUser.email}" >
	                   	</div>	
	                   	
	                   	<hr>   
	    
	                   	<div>
	    					<span class="item_text address_kakao">주소</span>
	                   	 	<input type="text" class="form-control" id="address_kakao" name="address" placeholder="ADDRESS" value="${loginUser.address}" >
	                   	</div>	
	                   	
	                   	<!-------------------------------------주소 카카오 팝업---------------------------------->
	                   	<script type="text/javascript">
				
		               	    window.onload = function(){
		               	        document.getElementById("address_kakao").addEventListener("click", function(){ //주소입력칸을 클릭하면
		               	            
		               	        	event.preventDefault(); // 링크의 기본 동작을 중지
		               	        	//카카오 지도 발생
		               	            new daum.Postcode({
		               	                oncomplete: function(data) { //선택시 입력값 세팅
		               	                    document.getElementById("address_kakao").value = data.address; 	// 주소 넣기
		               	                    document.querySelector("input[name=address]").focus(); //다음 임력 칸으로 포커싱
		               	                }
		               	            }).open();
		               	        });
		               	    }	               	    
               		  </script>   

	                   	<hr>
	                   		                   	
           	             	<button type="button" class="btn btn-link" data-toggle="modal" data-target="#changePwd" style="float: inline-end;">비밀번호 변경하기</button>              	
	                   	<div class="btns" style="display: flex; justify-content: space-between;">	                   								                   	
		                   	<button class="btn btn-danger" type="button" data-target="#memberDelete" data-toggle="modal" style="color:red;"><strong>회원 탈퇴</strong></button>	    
		                   	<button class="btn btn-primary" type="submit" onclick="return mypageUpdate();"><strong>정보 수정</strong></button>
	                   	</div>
	                   		                   	
	                </ul>
                </form>
                
                <!-----------------------------------회원 정보 수정-------------------------------->	
               
            </div>           
        </section> 
                               
      </div>
      
      <!------------------------- 비밀번호 변경 모달 ------------------------>
       <div class="modal fade" id="changePwd" >
		  <div class="modal-dialog">
		    <div class="modal-content">
		      <div class="modal-header">
		       
		        <button type="button" class="close" data-dismiss="modal" aria-label="Close">
		          <span aria-hidden="true">&times;</span>
		        </button>
		      </div>
		      
		     <form action="changePwd.me" method="post">
		      	<input type="hidden" name="userNo" value="${loginUser.userNo }">
			      <div class="modal-body" style="padding: 25px;">
			      	<div class="modal-body context" style="margin-bottom: 25px;">
						<div class="text-left"><h5><a>현재 비밀번호</a></h5>
							<input type="password" id="userPassword" name="userPassword" placeholder="현재 비밀번호" style="border: 1px solid #DADADA;" autocomplete="current-password">
						</div>
						<br>
						<div class="text-left"><h5><a>새로운 비밀번호</a></h5>
							<input type="password" id="userNewPassword" name="userNewPassword" placeholder="새로운 비밀번호 (6~15자리 영문 및 숫자 조합)" style="border: 1px solid #DADADA;" autocomplete="current-password">
						</div>
						<br>
						<div class="text-left"><h5><a>새로운 비밀번호 확인</a></h5>
							<input type="password" id="userNewPasswordChk" name="userNewPasswordChk" placeholder="새로운 비밀번호 (6~15자리 영문 및 숫자 조합)" style="border: 1px solid #DADADA;" autocomplete="current-password">
						</div>
						
					</div>	        
			      </div>
		      
			      <div class="modal-footer">
			        <button type="button" class="btn btn-secondary" data-dismiss="modal">닫기</button>
			        <button type="submit" class="btn btn-primary" onclick="return memberPwdUpdate();">변경하기</button>
			      </div>
		      
		      </form>
		      
		    </div>
		  </div>
	 </div>
      
      
      <!--------------------------------- 회원탈퇴 모달 ------------------------------------->    
 	  <div class="modal fade" id="memberDelete" ><!-- style="z-index: 1500;"> -->
		  <div class="modal-dialog">
		    <div class="modal-content">
		      <div class="modal-header">
		        <h4 class="modal-title"><b> DungJip 회원 탈퇴</b></h4>
		        <button type="button" class="close" data-dismiss="modal" aria-label="Close">
		          <span aria-hidden="true">&times;</span>
		        </button>
		      </div>
		      
		      <form action="mdelete.me" method="post">
		      	
			      <div class="modal-body" style="margin: 18px;">
			      	<div class="modal-body context">
						<div class="text-left"><h5><b>환불 규정 동의</b></h5></div>
						<blockquote class="generic-blockquote" style="overflow: scroll; overflow-x: hidden; height: 250px; font-size:small;">
							KH정보교육원 회원 약관 제 1 장 총칙 제 1 조 목적 이 약관은 KH정보교육원이 제공하는 서비스인
							http://www.iei.or.kr의 이용조건 및 절차에 관한 사항과 기타 필요한 사항을 규정함을 목적으로 합니다.
							제 2 조 약관의 효력과 변경 1) 약관은 이용자에게 공시함으로써 효력을 발생합니다. 2) KH정보교육원은 교육원
							사정상 변경의 경우와 영업상 중요사유가 있을 때 약관을 변경할 수 있으며, 변경된 약관은 전항과 같은 방법으로 효력을
							발생합니다. 제 3 조 약관 외 준칙 이 약관에 명시되지 않은 사항이 관계법령에 규정되어 있을 경우에는 그 규정에
							따릅니다.KH정보교육원 회원 약관 제 1 장 총칙 제 1 조 목적 이 약관은 KH정보교육원이 제공하는 서비스인
							http://www.iei.or.kr의 이용조건 및 절차에 관한 사항과 기타 필요한 사항을 규정함을 목적으로 합니다.
							제 2 조 약관의 효력과 변경 1) 약관은 이용자에게 공시함으로써 효력을 발생합니다. 2) KH정보교육원은 교육원
							사정상 변경의 경우와 영업상 중요사유가 있을 때 약관을 변경할 수 있으며, 변경된 약관은 전항과 같은 방법으로 효력을
							발생합니다. 제 3 조 약관 외 준칙 이 약관에 명시되지 않은 사항이 관계법령에 규정되어 있을 경우에는 그 규정에
							따릅니다.
						</blockquote>
						<div class="col-lg-8 mx-auto" style="float:none;">
							<div class="single-element-widget">
								<div class="switch-wrap d-flex justify-content-around" style="display: flex; justify-content:left; margin-bottom: 16px;">
									<h5 style="margin-right:12px;"><b>환불 규정에 동의합니다.</b></h5>
									<div class="primary-checkbox">
										<input type="checkbox" id="cashRefundAgree" name="">
										<label for="cashRefundAgree"></label>
									</div>								
									
								</div>
								
								<div class="form-group password">
									<div class="text-left"><h5><b>해당 계정 비밀번호 확인</b></h5></div>
					                <input type="password" class="form-control" id="userPwdChk" name="userPwdChk" placeholder="비밀번호를 작성하세요" autocomplete="current-password">
					                <span class="placeholder"></span>
				            	</div>  
								
							</div>
						</div>
					</div>	        
			      </div>
		      
			      <div class="modal-footer">
			        <button type="button" class="btn btn-secondary" data-dismiss="modal">닫기</button>
			        <button type="submit" class="btn btn-danger" onclick="return memberDelete();">탈퇴 하기</button>
			      </div>
		      
		      </form>
		      
		    </div>
		  </div>
	 </div>
	 
	<script type="text/javascript">
	
		//회원탈퇴
		function memberDelete(){
			
			var deletePwd = $("#userPwdChk").val();
			
			if(!($("#cashRefundAgree").is(":checked"))) {
				showWarning("경고", '환불 규정에 동의하세요.', "확인");  
				return false;
			}
			
			if(deletePwd == null || deletePwd == '') {
				showError("오류", '비밀번호를 작성하세요.', "확인");
				$("#userPwdChk").focus();
				return false;
			}

			return true;
		}
		
		//회원 정보 수정
		function memberPwdUpdate() {
			
			var userPassword = $("#userPassword").val();
			var userNewPassword = $("#userNewPassword").val();
			var userNewPasswordChk = $("#userNewPasswordChk").val();
			
			if(userPassword == null || userPassword == '') {

				showError("오류", '비밀번호를 작성하세요.', "확인");
				$("#userPassword").focus();
				return false;
				
			}else {
				
				var regExp =  /^(?=.*[A-Za-z\d?!\s])[A-Za-z\d?!]{5,14}$/;
		
				if(!regExp.test(userNewPassword)) {
					showError("오류", "비밀번호는 6~15자리 영문 및 숫자 조합이여야 합니다.", "확인");
					$("#userNewPassword").focus();
					return false;
				}
				
				if(userNewPassword != userNewPasswordChk) {
					showError("오류", "비밀번호가 일치하지 않습니다.", "확인");
					$("#userNewPasswordChk").focus();
					return false;
				}				
			}
			
			if (confirm("비밀번호를 변경하시겠습니까?")) {
				return true;
			} else {
				return false;
			}
			
		}
		
		//정보수정
		function mypageUpdate() {
			
			var userName = $("#userName").val();
			var phone = $("#phone").val();
			var email = $("#email").val();
			var address = $("#address_kakao").val();
			
			if(confirm("정보를 수정하시겠습니까?")) {
				
				if (userName == '' || userName == null) {
					showError("오류", '이름을 입력하세요.', "확인");
					return false;
				}
				
				if (phone == '' || phone == null) {
					showError("오류", '휴대폰 번호를 입력하세요.', "확인");
					return false;
				}
				
				if (address == '' || address == null) {
					showError("오류", '주소를 입력하세요.', "확인");
					return false;
				}
				
				if (email == '' || email == null) {
					showError("오류", '이메일을 입력하세요.', "확인");
					return false;
				} else {

					var regExp = /^[A-Za-z0-9._%+-]+@[A-Za-z0-9.-]+\.[A-Za-z]{2,}$/;

					if (!regExp.test(email)) {
						showError("오류", "이메일 형식이 올바르지 않습니다.", "확인");
						$("#email").focus(); //해당 요소에 포커스
						return false;
					}

				}
				
				return true;

			}else{
				
				return false;
				
			}
			
		}
	
	</script>
	
     <%@ include file="../common/footer.jsp" %>
     
</body>
</html>
