<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@page import="com.kh.dungjip.member.model.vo.Member"%>
<%@ include file="sweetAlert.jsp" %>
<c:set var="contextPath" value="${pageContext.request.contextPath }" />
<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="UTF-8" />
<meta name="viewport" content="width=device-width, initial-scale=1.0" />
<title>DungJip Header</title>
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.1/jquery.min.js"></script>
    <link rel="preconnect" href="https://fonts.googleapis.com">
	<link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
	<link href="https://fonts.googleapis.com/css2?family=Caveat:wght@400;500&family=Frank+Ruhl+Libre:wght@500;700&family=Montserrat+Alternates:wght@500&display=swap" rel="stylesheet">

     <link href='http://fonts.googleapis.com/css?family=Open+Sans:400,300,700,800' rel='stylesheet' type='text/css'>
        <link rel="stylesheet" href="/dungjip/resources/assets/css/normalize.css">
        <link rel="stylesheet" href="/dungjip/resources/assets/css/font-awesome.min.css">
        <link rel="stylesheet" href="/dungjip/resources/assets/css/fontello.css">
        <link href="/dungjip/resources/assets/fonts/icon-7-stroke/css/pe-icon-7-stroke.css" rel="stylesheet">
        <link href="/dungjip/resources/assets/fonts/icon-7-stroke/css/helper.css" rel="stylesheet">
        <link href="/dungjip/resources/assets/css/animate.css" rel="stylesheet" media="screen">
        <link rel="stylesheet" href="/dungjip/resources/assets/css/bootstrap-select.min.css"> 
        <link rel="stylesheet" href="/dungjip/resources/bootstrap/css/bootstrap.min.css">
        <link rel="stylesheet" href="/dungjip/resources/assets/css/icheck.min_all.css">
        <link rel="stylesheet" href="/dungjip/resources/assets/css/price-range.css">
        <link rel="stylesheet" href="/dungjip/resources/assets/css/owl.carousel.css">  
        <link rel="stylesheet" href="/dungjip/resources/assets/css/owl.theme.css">
        <link rel="stylesheet" href="/dungjip/resources/assets/css/owl.transitions.css">
        <link rel="stylesheet" href="/dungjip/resources/assets/css/style.css">
        <link rel="stylesheet" href="/dungjip/resources/assets/css/responsive.css">
        
		<noscript>
        <link rel="stylesheet" type="text/css" href="/dungjip/resources/assets/css/styleNoJS.css" />
        </noscript>
 
  </head>
  
  <style>
  *{
  	font-family: 'Caveat', cursive;
  	font-family: 'Frank Ruhl Libre', serif;
	font-family: 'Montserrat Alternates', sans-serif;
	font-weight: bold;
  }
  	.navbar-brand p {
  		padding: 0.5em 0 0;
  	}
  	.bounceInRight {
  		margin-right: 10px;
  	}
  	#right-navi {
  		padding-top: 5px;
  	}
  	.fadeInDown {
  		cursor: pointer;
  	}
  </style>
  <body>
        <nav class="navbar navbar-default ">
            <div class="container">
                <div class="navbar-header">
                    <button type="button" class="navbar-toggle collapsed" data-toggle="collapse" data-target="#navigation">
                        <span class="sr-only">Toggle navigation</span>
                        <span class="icon-bar"></span>
                        <span class="icon-bar"></span>
                        <span class="icon-bar"></span>
                    </button>
                    <a class="navbar-brand" href="/dungjip"><img src="" alt=""><p>DungJip</p></a>
                </div>

                <!-- Collect the nav links, forms, and other content for toggling -->
            <c:choose>   
            
            	<c:when test="${loginUser == null }">
            	
            	<!-- 로그인 전  -->
	                <div class="collapse navbar-collapse yamm" id="navigation">
	                    <div class="button navbar-right" id="right-navi">
	                        <button class="navbar-btn nav-button wow bounceInRight" onclick='location.href="/dungjip/login.be"' data-wow-delay="0.4s">Login</button>
	                        <button class="navbar-btn nav-button wow fadeInRight" onclick='location.href="/dungjip/enquiry.en"' data-wow-delay="0.5s">QnA</button>	                        	
	                    </div>
	                    <ul class="main-nav nav navbar-nav navbar-right" id="nav-menu">
	                        <li class="wow fadeInDown" data-wow-delay="0.1s"><a class="active" onclick="clickVilla(this)">원룸</a></li>
	                        <li class="wow fadeInDown" data-wow-delay="0.1s"><a class="" onclick="clickVilla(this)">빌라</a></li>
	                        <li class="wow fadeInDown" data-wow-delay="0.1s"><a class="" onclick="clickVilla(this)">오피스텔</a></li>
	                        
	                    </ul>
	                </div>  
	                  
                </c:when>
                
                <c:otherwise>
                
                <!-- 로그인 후  -->
                	<div class="collapse navbar-collapse yamm" id="navigation">

	                    <div class="button navbar-right" id="right-navi">
	                        <button class="navbar-btn nav-button wow bounceInRight" onclick='location.href="http://localhost:9999/dungjip/logout.me?userNo=${loginUser.userNo}"' data-wow-delay="0.4s">Logout</button>
								<c:choose>
		                        	<c:when test="${loginUser.userType eq '관리자'}">
				                        <button class="navbar-btn nav-button wow fadeInRight" onclick='location.href="/dungjip/enList.en"' data-wow-delay="0.5s">QnA</button>
		                        	</c:when>
		                        	<c:otherwise>	                        
		                        		<button class="navbar-btn nav-button wow fadeInRight" onclick='location.href="/dungjip/enquiry.en"' data-wow-delay="0.5s">QnA</button>
		                        	</c:otherwise>
	                        </c:choose>
	                    </div>
	                    <ul class="main-nav nav navbar-nav navbar-right">
                 
	                        <li class="wow fadeInDown" data-wow-delay="0.1s"><a class="active" onclick="clickVilla(this)">원룸</a></li>
	                        <li class="wow fadeInDown" data-wow-delay="0.1s"><a class="" onclick="clickVilla(this)">빌라</a></li>
	                        <li class="wow fadeInDown" data-wow-delay="0.1s"><a class="" onclick="clickVilla(this)">오피스텔</a></li>
	                        <li class="wow fadeInDown" data-wow-delay="0.4s"><a class="" onclick="redirectToEnrollForm()">집내놓기</a></li>
	                       
	                        <li class="dropdown ymm-sw" data-wow-delay="0.1s">
								<a href="#" class="dropdown-toggle" data-toggle="dropdown" data-hover="dropdown" data-delay="200">
									<c:choose>
										<c:when test="${not empty loginUser.userNickName }">
											${loginUser.userNickName } 님 환영합니다! <b class="caret"></b>
										</c:when>
										<c:otherwise>
											${loginUser.userName } 님 환영합니다! <b class="caret"></b>
										</c:otherwise>
									</c:choose>
								</a>
								<ul class="dropdown-menu">
									<c:choose>
										<c:when test="${loginUser.userType == '관리자'}">
											<li class="nav-item"><a class="nav-link" href="http://localhost:9999/dungjip/admin/list">관리자 페이지</a></li>
										</c:when>
										<c:when test="${loginUser.userType == '중개인'}">
											<li class="nav-item"><a class="nav-link" href="http://localhost:9999/dungjip/myEsPage.me">중개인 페이지</a></li>
										</c:when>
										<c:when test="${loginUser.userType == '임차인'}">
											<li class="nav-item"><a class="nav-link" href="http://localhost:9999/dungjip/myPage.me">마이 페이지</a></li>
										</c:when>
										<c:when test="${loginUser.userType == '임대인'}">
											<li class="nav-item"><a class="nav-link" href="http://localhost:9999/dungjip/myImdaPage.me">임대인 페이지</a></li>
										</c:when>										
									</c:choose>
								</ul>
							</li>
							
	                    </ul>
	                </div>         
                </c:otherwise>               
                
             </c:choose>    
                
            </div>
        </nav>
        
        <c:if test="${not empty alertMsg  or not empty errorMsg }">
        <script>
            var alertMsg = "${alertMsg}";
            var errorMsg = "${errorMsg}";
            if(alertMsg){
	            showSuccess("성공",alertMsg,"확인");            	
            } else {
	            showError("오류", errorMsg, "확인");            	
            }
            alertMsg = "";
            errorMsg = "";
        </script>
        <c:remove var="alertMsg" />
        <c:remove var="errorMsg" />
   		</c:if>        
        
        <script>
        	function clickVilla(e){
				var villa = e.text;
				location.href="/dungjip/villa.map?type="+villa;
        	}
        </script>
        
        <script>
        var type = "${type}";
        var menuItems = document.querySelectorAll('.navbar-right li a');

        menuItems.forEach(function(item) {
            if(type === item.text){
            	item.classList.add('active');
            } else {
            	item.classList.remove('active');
            }
        });
    </script>
    
    <script>
	    function redirectToEnrollForm() {
	        window.location.href = "/dungjip/house/enrollForm";
	    }
	</script>
  
        <script src="/dungjip/resources/assets/js/modernizr-2.6.2.min.js"></script>

        <script src="/dungjip/resources/assets/js/jquery-1.10.2.min.js"></script>
        <script src="/dungjip/resources/bootstrap/js/bootstrap.min.js"></script>
        <script src="/dungjip/resources/assets/js/bootstrap-select.min.js"></script>
        <script src="/dungjip/resources/assets/js/bootstrap-hover-dropdown.js"></script>

        <script src="/dungjip/resources/assets/js/easypiechart.min.js"></script>
        <script src="/dungjip/resources/assets/js/jquery.easypiechart.min.js"></script>

        <script src="/dungjip/resources/assets/js/owl.carousel.min.js"></script>        

        <script src="/dungjip/resources/assets/js/wow.js"></script>

        <script src="/dungjip/resources/assets/js/icheck.min.js"></script>
        <script src="/dungjip/resources/assets/js/price-range.js"></script>


        <script src="/dungjip/resources/assets/js/jquery.ba-cond.min.js"></script>
        <script src="/dungjip/resources/assets/js/jquery.slitslider.js"></script>

        <script src="/dungjip/resources/assets/js/main.js"></script>
        
  </body>
</html>