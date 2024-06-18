<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@page import="com.kh.dungjip.member.model.vo.Member"%>    
<!DOCTYPE html>
<html lang="ko">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>프로필 페이지</title>
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
	
	<script type="text/javascript">
	
		//-----------중개인일때 닉네임 칸 안보이게 하는 처리 
		const userType = '${loginUser.userType}'; // userType 값 가져오기
	    
	    window.onload = function() {
	        const userNickNameContainer = document.getElementById('userNickNameContainer');
	        const hrElement = document.getElementById('hrElement');
	        
	        if (userType === '중개인') {
	            if (userNickNameContainer) {
	                userNickNameContainer.style.display = 'none'; // 닉네임 li 요소 숨김 처리
	            }
	            if (hrElement) {
	                hrElement.style.display = 'none'; // hr 태그를 숨김 처리
	            }
	        }
	    };
	
	</script>

    <div class="container" style="display: flex; width: 67%;">
          
        <%@ include file="memberMypageImdamenubar.jsp" %>
            
        <section class="main-content" style="width:100%; margin: 70px 0 70px 50px; margin-left:4%;">
          
            <div class="card" style="width: 93%; margin-bottom:50px;">
            
                <a href="mypageupdate.me" style="width: 100%;"><h3>내프로필<img src="resources/img/icons/rightarrow271228.png" alt="" style="width: 15px; float:right;"></h3></a>
                <!-- Additional content can be added here -->
                <ul class="card_row" style="color: #333; list-style: none; padding: 0 20px 20px 20px;">
                    <li>
                       <img src="resources/img/icons/person3856336.png" alt="" style="width: 16px;">
                       <span class="item_text name" style="margin-left:12px;">${loginUser.userName }</span>
                       
                    </li>
                    
                    <hr id="hrElement" >
                    <li id="userNickNameContainer">
                    	<img alt="" src="resources/img/icons/nickname1828439.png" style="width: 16px;">
                        <span class="item_text nickname" style="margin-left:12px;">${loginUser.userNickName }</span>                        
                    </li>                    
                    
                    <hr>
                  
                    <li>
                   		<img alt="" src="resources/img/icons/phone519184.png" style="width: 16px;">
                        <span class="item_text phone" style="margin-left:12px;">${loginUser.phone }</span>
                        
                    </li>
                    <hr>
                    <li>
                    	<img alt="" src="resources/img/icons/mail7873670.png" style="width: 17px;">
                        <span class="item_text email" style="margin-left:12px;">${loginUser.email }</span>
                           
                    </li>
    
                </ul>
            </div>
			<div class="card" style="width: 93%; margin-bottom: 50px;">
				<a href="myQnA.me" style="width: 100%;"><h3>
						문의내역 <img src="resources/img/icons/rightarrow271228.png" alt=""
							style="width: 15px; float: right;">
					</h3></a>
				<!-- Additional content can be added here -->
				<ul class="card_row"
					style="color: #333; list-style: none; padding: 0 20px 20px 20px;">

					<c:if test="${not empty qlist }">
						<c:forEach items="${qlist}" var="qlist" varStatus="loop">
							<c:if test="${loop.index < 4}">
								<!-- 최대 4개까지만 표시 -->
								<li><img alt="" src="" style="width: 16px;"> <span
									class="item_text name" style="margin-left: 12px;">${qlist.enquiryTitle}</span>
									<button onclick="window.location.href='myQnA.me'"
										class="btn_edit">상세보기</button></li>
								<hr>
							</c:if>
						</c:forEach>
					</c:if>
					<c:if test="${empty qlist }">
						<p>※ 문의 내역이 존재하지 않습니다.</p>

					</c:if>

				</ul>
			</div>
                
        </section>
      </div>
 
 
	<!---------------------- 마스킹처리 ----------------------------> 
 	<script type="text/javascript">
 	
		 // 전화번호를 가리는 함수
	 	function maskPhone(phone) {
	 	    return phone.replace(/(\d{3})(\d{4})(\d{4})/, '$1-****-$3');
	 	}
 	
	 	// 이메일을 가리는 함수
	 	function maskEmail(email) {
	 	    const [username, domain] = email.split('@');
	 	    const maskedUsername = username.charAt(0) + '****' + '@' + domain;
	 	    return maskedUsername;
	 	}
		 
	 	// 요소를 가져와서 값들을 가립니다.
	 	const phoneElement = document.querySelector('.item_text.phone');
	 	const emailElement = document.querySelector('.item_text.email');

	 	if (phoneElement) {
	 	    phoneElement.textContent = maskPhone("${loginUser.phone}");
	 	}

	 	if (emailElement) {
	 	    emailElement.textContent = maskEmail("${loginUser.email}");
	 	} 
	 	
	 	console.log(${loginUser.phone});
 	</script>
 

     <%@ include file="../common/footer.jsp" %>
     
</body>
</html>
