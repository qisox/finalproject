<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<!--[if lt IE 7]>      <html class="no-js lt-ie9 lt-ie8 lt-ie7"> <![endif]-->
<!--[if IE 7]>         <html class="no-js lt-ie9 lt-ie8"> <![endif]-->
<!--[if IE 8]>         <html class="no-js lt-ie9"> <![endif]-->
<!--[if gt IE 8]><!-->
<html class="no-js">
<!--<![endif]-->
<head>
<meta charset="utf-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<title>부동산 상세페이지</title>
<meta name="description" content="company is a real-estate template">
<meta name="author" content="Kimarotec">
<meta name="keyword"
	content="html5, css, bootstrap, property, real-estate theme , bootstrap template">
<meta name="viewport" content="width=device-width, initial-scale=1">

<link
	href='http://fonts.googleapis.com/css?family=Open+Sans:400,300,700,800'
	rel='stylesheet' type='text/css'>

<!-- Place favicon.ico and apple-touch-icon.png in the root directory -->
<link rel="shortcut icon" href="favicon.ico" type="image/x-icon">
<link rel="icon" href="favicon.ico" type="image/x-icon">

<link rel="stylesheet" href="resources/assets/css/normalize.css">
<link rel="stylesheet" href="resources/assets/css/font-awesome.min.css">
<link rel="stylesheet" href="resources/assets/css/fontello.css">
<link
	href="resources/assets/fonts/icon-7-stroke/css/pe-icon-7-stroke.css"
	rel="stylesheet">
<link href="resources/assets/fonts/icon-7-stroke/css/helper.css"
	rel="stylesheet">
<link href="resources/assets/css/animate.css" rel="stylesheet"
	media="screen">
<link rel="stylesheet"
	href="resources/assets/css/bootstrap-select.min.css">
<link rel="stylesheet" href="resources/bootstrap/css/bootstrap.min.css">
<link rel="stylesheet" href="resources/assets/css/icheck.min_all.css">
<link rel="stylesheet" href="resources/assets/css/price-range.css">
<link rel="stylesheet" href="resources/assets/css/owl.carousel.css">
<link rel="stylesheet" href="resources/assets/css/owl.theme.css">
<link rel="stylesheet" href="resources/assets/css/owl.transitions.css">
<link rel="stylesheet" href="resources/assets/css/lightslider.min.css">
<link rel="stylesheet" href="resources/assets/css/style.css">
<link rel="stylesheet" href="resources/assets/css/responsive.css">
<style>
.fa-star {
	color: #D27E04;
}


             #num {
            color: #D27E04;
             }
             
             #type{
             display: flex;
             align-items: center;
             justify-content: space-between;
             }
             
             #realtype{
            
    		 padding: 6px;
    		 border-radius: 50px;
    		 background-color:rgb(255, 236, 235);
    		 color:rgb(250, 78, 62);
             }
             
             .profile{
             width: 35px;
    		 height: 35px;
    		 border-radius: 50%;
             }
             
             .d-flex{
             display: flex;
    		 align-items: center;
    		 justify-content: flex-start;
             }
             
             .good{
             width: 20px;
             }
             
             .emo{
             display:flex;
             align-items: center;
             justify-content: flex-end;
             }
             
             .likecount{
             padding-left: 3px;
             }
             
        	.like-btn.liked img {
            filter: sepia(100);
        	}

             

#num {
	color: #D27E04;
}


#type {
	display: flex;
	align-items: center;
	justify-content: space-between;
}

#realtype {
	padding: 6px;
	border-radius: 50px;
	background-color: rgb(255, 236, 235);
	color: rgb(250, 78, 62);
}

.profile {
	width: 35px;
	height: 35px;
	border-radius: 50%;
}

.d-flex {
	display: flex;
	align-items: center;
	justify-content: flex-start;
}

.timeStyle {
	width: 150px;
	background-color: #fff;
	color: #000;
}

.selected {
	border: 1px solid red;
}

.check {
	font-weight: bold;
	color: red;
}

#reviewH3{
	padding-top: 90px;
  	text-align: center;
}

</style>
<script src="https://code.jquery.com/jquery-3.6.4.min.js"></script>

</head>
<body>
	<%@ include file="../common/header.jsp"%>
	
	<div id="preloader">
		<div id="status">&nbsp;</div>
	</div>
	<!-- Body content -->


	<!--End top header -->


	<!-- End of nav bar -->

	<div class="page-head">
		<div class="container">
			<div class="row">
				<div class="page-head-content">
					<h1 class="page-title"></h1>
				</div>
			</div>
		</div>
	</div>
	<!-- End page header -->

	<!-- property area -->
	<div class="content-area single-property"
		style="background-color: #FFFFFF;">
		&nbsp;
		<div class="container" style="width: 1500px;">

			<div class="clearfix padding-top-40">
				<div class="col-md-4 single-property-content prp-style-1 "
					style="width: 370px;">
					<aside class="sidebar sidebar-property blog-asside-right">

						<div class="dealer-widget">

							<div class="dealer-content">
								<div class="inner-wrapper">

									<div class="clear">
										<div class="col-xs-4 col-sm-4 dealer-face">
											<img src="${e.member.changeName}" class="img-circle">
										</div>
										<div class="col-xs-8 col-sm-8 ">
											<h3 class="dealer-name">
												<a style="font-size: 16px;">${e.esName}</a> <br> <a
													style="font-size: 14px; color: white;">${e.esIntro}</a>
											</h3>
										</div>
									</div>
									<div class="clear"></div>
								</div>
							</div>
						</div>
						<div
							class="panel panel-default sidebar-menu wow fadeInRight animated">
							<div class="panel-heading">
								<h3 class="panel-title">예약 정보</h3>
							</div>
							<table id="calendar" align="center" style="width: 100%;">
								<tr>
									<td align="center"><label onclick="prevCalendar()">
											◀ </label></td>
									<td colspan="5" align="center" id="calendarTitle">yyyy년 m월</td>
									<td align="center"><label onclick="nextCalendar()">
											▶ </label></td>
								</tr>
								<tr>
									<td align="center"><font color="red">일</font></td>
									<td align="center">월</td>
									<td align="center">화</td>
									<td align="center">수</td>
									<td align="center">목</td>
									<td align="center">금</td>
									<td align="center"><font color="blue">토</font></td>
								</tr>
							</table>
							<div class="panel-body search-widget">
								<div style="background-color: #fff;">
									<c:forEach var="time" items="${time}">
										<button class="timeStyle" id="time${time.timeNo}" name="${time.timeNo}" onclick="check(this);">${time.timeValue}</button>
									</c:forEach>
								</div>
								<fieldset>
									<div class="row">
										<div class="col-xs-12">
											<input type="hidden" value="${e.esNo}" id="selectEsNo">
											<input type="hidden" value="${loginUser.userNo}" id="selectUserNo">
											<input onclick="reservation();" class="button btn largesearch-btn" value="예약하기" type="submit">
									
											<input class="button btn largesearch-btn" id="clickChatBtn" value="상담하기" type="button" 
											onclick="qwer();">
										</div>																			<!-- onclick="location.href='websocket/ask?estateUserNo=${e.member.userNo}'" -->

									</div>
								</fieldset>
							</div>
						</div>

					</aside>
				</div>
				<script type="text/javascript">
				function qwer(){
					console.log("${loginUser}");
					if("${loginUser}" != ""){
						window.open('websocket/ask?estateUserNo='+"${e.member.userNo}","_blink");
					
					}else{
						showError("실패","로그인 후 이용 가능 합니다","확인");
					}
				}
				</script>
				
				
				<div class="col-md-8 single-property-content prp-style-1 "
					style="width: 1100px;">

					<section class="product_description_area">
						<div class="container">
							<ul class="nav nav-tabs" id="myTab" role="tablist"
								style="width: 1100px;">
								<li class="nav-item"><a class="nav-link" id="home-tab"
									data-toggle="tab" href="#home" role="tab" aria-controls="home"
									aria-selected="true">상세설명</a></li>
								<li class="nav-item"><a class="nav-link" id="profile-tab"
									data-toggle="tab" href="#profile" role="tab"
									aria-controls="profile" aria-selected="false">상세정보</a>
								</li>
								<li class="nav-item"><a class="nav-link" id="contact-tab"
									data-toggle="tab" href="#contact" role="tab"
									aria-controls="contact" aria-selected="false">매물 종류</a></li>
								<li class="nav-item"><a class="nav-link active"
									id="review-tab" data-toggle="tab" href="#review" role="tab"
									aria-controls="review" aria-selected="false">리뷰</a></li>
							</ul>
							<div class="tab-content" id="myTabContent" style="width: 1100px;">
								<div class="tab-pane fade" id="home" role="tabpanel"
									aria-labelledby="home-tab" style="margin: 20px;">
									<p>${e.esContent}</p>
								</div>
								<div class="tab-pane fade" id="profile" role="tabpanel"
									aria-labelledby="profile-tab" style="width: 1100px;">
									<div class="table-responsive" style="margin: 20px;">
										<table class="table">
											<tbody>
												<tr>
													<td style="width: 550px;">
														<h5>중개사무소명</h5>
													</td>
													<td>
														<h5>${e.esName }</h5>
													</td>
												</tr>
												<tr>
													<td>
														<h5>대표</h5>
													</td>
													<td>
														<h5>${e.esCeo }</h5>
													</td>
												</tr>
												<tr>
													<td>
														<h5>전화번호</h5>
													</td>
													<td>
														<h5>${e.esPhone}</h5>
													</td>
												</tr>
												<tr>
													<td>
														<h5>사업자 등록 번호</h5>
													</td>
													<td>
														<h5>${e.esNum }</h5>
													</td>
												</tr>
												<tr>
													<td>
														<h5>중개 등록 번호</h5>
													</td>
													<td>
														<h5>${e.esRegisterNum }</h5>
													</td>
												</tr>
												<tr>
													<td>
														<h5>둥집 가입일</h5>
													</td>
													<td>
														<h5>${e.enrollDate }</h5>
													</td>
												</tr>
												<tr>
													<td>
														<h5>주소</h5>
													</td>
													<td>
														<h5>${e.esAddress }</h5>
													</td>
												</tr>

											</tbody>
										</table>
									</div>
								</div>
								<div class="tab-pane fade" id="contact" role="tabpanel"
									aria-labelledby="contact-tab" style="width: 850px;">
									<div class="row">
										<div class="col-lg">

											<div class="properties-area recent-property"
												style="background-color: #FFF;">
												<div class="container">
													<div class="row  pr0 padding-top-40 properties-page">


														<div class="col-md-12  clear">
															<div class="col-xs-10 page-subheader sorting pl0">
																
																<!--/ .sort-by-list-->


															</div>

															<div class="col-xs-2 layout-switcher">

																<a class="layout-grid active" href="javascript:void(0);">
																	<i class="fa fa-th"></i>
																</a>
															</div>
															<!--/ .layout-switcher-->
														</div>

														<div class="flex-div">
															<div class="col-md-12 clear" id="houseListContainer">
																<!-- 집 리스트 -->
															</div>
														</div>
														<div class="col-md-12 clear text-right center">
															<div id="pagingArea">
																<div class="pagination" id="paginationList">
																	<ul>
																		<!-- 여기에 페이징 숫자를 추가 -->
																	</ul>
																</div>
															</div>

														</div>

														<script>
                                                            $(document).ready(function() {
                                                                var currentPage = 1; // currentPage 변수를 정의하고 초기화

                                                                // 페이지 번호 클릭 이벤트 핸들러 등록
                                                                $(document).on("click", ".page-link", function() {
                                                                    var pageClicked = $(this).text(); // 클릭한 페이지 번호를 가져옴
                                                                    console.log(pageClicked);
                                                                    if (pageClicked === "Prev") {
                                                                        currentPage--;
                                                                    } else if (pageClicked === "Next") {
                                                                        currentPage++;
                                                                    } else {
                                                                        currentPage = parseInt(pageClicked); // 클릭한 페이지 번호로 설정
                                                                    }
                                                                    loadPage(currentPage); // 수정된 currentPage 값을 loadPage 함수에 전달
                                                                });

                                                                // 초기 페이지 로드
                                                                loadPage(currentPage); // 초기 페이지 로드 시 currentPage 값을 전달
                                                            });

                                                            function loadPage(currentPage) {
                                                                $.ajax({
                                                                    url: "houseList.ho",
                                                                    data: {
                                                                        esNo: "${e.esNo}",
                                                                        currentPage: currentPage // 수정된 currentPage 값을 전달
                                                                    },
                                                                    success: function(data) {
                                                                        updateHouseList(data.hlist, data.himglist); // 주택 목록 업데이트
                                                                        updatePagination(data.pi, ${e.esNo}); // 페이징 정보 업데이트
                                                                    },
                                                                    error: function() {
                                                                        console.log("부동산 매물리스트 실패");
                                                                    }
                                                                });
                                                            }

                                                        
																function updateHouseList(hlist,himglist) {
																    var html = '';
																    
																    var himg = "${himglist}";
																    for (var i = 0; i < hlist.length; i++) {
																        var house = hlist[i];
																        var img = himglist[i].changeName; // 이미지 경로
																        var houseStyleDisplay = house.houseStyle === '월세' ? house.houseStyle + ' ' + house.houseRent + '/' + house.housePrice : house.houseStyle + ' ' + house.housePrice;

																        html += '<div id="list-type" class="proerty-th">' +
																                    '<div class="col-sm-6 col-md-3 p0" style="height: 377.59px;">' +
																                        '<div class="box-two proerty-item" id="' + house.houseNo + '" onclick="detailHouse(this)">' +
																                            '<div class="item-thumb" style="width:265px;">' +
																                                '<img src="' + img + '" style="max-height: 225px; width: 265px; cursor: pointer;">' +
																                            '</div>' +
																                            '<div class="item-entry overflow">' +
																                                '<h5><a>' + houseStyleDisplay + '</a></h5>' +
																                                '<div class="dot-hr"></div>' +
																                                '<span class="pull-left"><b> 평수 :</b> ' + house.houseSquare + ' </span>' +
																                                '<span class="proerty-price pull-right">' + house.houseType + '</span>' +
																                                '<div class="property-icon">' +
																                                    '<span class="pull-left"><b> 층수 :</b> ' + house.houseFloor + ' </span>' +
																                                '</div>' +
																                            '</div>' +
																                        '</div>' +
																                    '</div>' +
																                '</div>';
																    }
																    $('#houseListContainer').html(html);
																}
														    
																function updatePagination(pi, esNo) {
																    var html = '';
																    if (pi.currentPage > 1) {
																        html += '<li class="page-item"><a class="page-link" href="javascript:void(0);" onclick="loadPage(' + (pi.currentPage - 1) + ')">Prev</a></li>';
																    } else {
																        html += '<li class="page-item disabled"><span class="page-link">Prev</span></li>';
																    }

																    for (var p = pi.startPage; p <= pi.endPage; p++) {
																        html += '<li class="page-item ' + (p === pi.currentPage ? 'active' : '') + '">' +
																            '<a class="page-link" href="javascript:void(0);" onclick="loadPage(' + p + ')">' + p + '</a>' +
																            '</li>';
																    }

																    if (pi.currentPage < pi.maxPage) {
																        html += '<li class="page-item"><a class="page-link" href="javascript:void(0);" onclick="loadPage(' + (pi.currentPage + 1) + ')">Next</a></li>';
																    } else {
																        html += '<li class="page-item disabled"><span class="page-link">Next</span></li>';
																    }

																    $('#paginationList').html(html);
																}


															</script>




													</div>
												</div>
											</div>


										</div>

									</div>
								</div>
								<div class="tab-pane fade active" id="review" role="tabpanel"
									aria-labelledby="review-tab" style="width: 850px;">
								<c:choose>
                                    <c:when test="${empty loginUser.userType}">
                                        <h3 id="reviewH3">로그인 후 리뷰 확인 가능합니다!</h3>
                                    </c:when>
                                    <c:otherwise>
                                        <div class="row">
                                            <div class="col-lg">
                                                <div class="row total_rate" style="display: flex;">
                                                    <div class="col-6" style="flex: 1">
                                                        <div class="box_total">
                                                            <br>
                                                            <h3
                                                                style="text-align: center; font-weight: bold; margin: 20px 0 0 0;">Overall</h3>
                                                            <h1
                                                                style="text-align: center; color: #D27E04; font-weight: bold; margin: 0;"></h1>
                                                            <h5 style="text-align: center;"></h5>
                                                        </div>
                                                    </div>
                                                    <div class="col-6" style="flex: 0.3">
                                                        <div class="rating_list" style="margin-top: 25px;" id="count">
                                                            <h5 style="text-align: left;"></h5>
                                                            <ul class="list" style="padding: 0;">
                                                                <li id="5star"><a href="#" id="num">5 Star <i
                                                                        class="fa fa-star"></i><i class="fa fa-star"></i><i
                                                                        class="fa fa-star"></i><i class="fa fa-star"></i><i
                                                                        class="fa fa-star"></i> <span></span>
                                                                </a></li>
                                                                <li id="4star"><a href="#" id="num">4 Star <i
                                                                        class="fa fa-star"></i><i class="fa fa-star"></i><i
                                                                        class="fa fa-star"></i><i class="fa fa-star"></i><span></span>
                                                                </a></li>
                                                                <li id="3star"><a href="#" id="num">3 Star <i
                                                                        class="fa fa-star"></i><i class="fa fa-star"></i><i
                                                                        class="fa fa-star"></i> <span></span></a></li>
                                                                <li id="2star"><a href="#" id="num">2 Star <i
                                                                        class="fa fa-star"></i><i class="fa fa-star"></i><span></span></a></li>
                                                                <li id="1star"><a href="#" id="num">1 Star <i
                                                                        class="fa fa-star"></i><span></span>
                                                                </a></li>
                                                            </ul>
                                                        </div>
                                                        </div>
                                                    </div>
                                                    <div id="reviewContainer">
                                                    <div class="review_list" style="width: 1100px;">
                                                        <!-- 리뷰내용 -->
                                                   <div class="emo">
                                                                
                                                </div>
                                                </div>
                                            </div>
                                        </div>
                                    </c:otherwise>
                                   </c:choose>
                                </div>
                            </div>
                        </section>
                           <script>
   							 function toggleLike(element) {


   								 console.log("toggleLike element 로그");
   								 console.log(element);

       							var likeButton = element;
								var userNo = "${loginUser.userNo}";
 								var esReNo = element.id;
 								
 								console.log(esReNo);
 								console.log(userNo);
 								
       							  $.ajax({
       								 url: "estate.like",
       								 data: {
       									 esReNo: esReNo,
       									 userNo: userNo
       								 },
       								 success: function(result){
       									 var idName = "likeCount"+result.esReNo;
       									 var likeCount = document.getElementById(idName);
       									 console.log(result);
       									 console.log(likeCount);
       									 likeCount.textContent = result.emoCount;
       									 
       									 if(result.result === 1){
       		        						likeButton.classList.remove('liked');
       									 } else {
        		        					likeButton.classList.add('liked');
       									 }
       								 },
       								 error: function(){
       									 console.log("통통신신에에러러");
       								 }
       							 }) 

        						// 클릭 토글
   								 }
   							 
							</script>
							
                                    <script>

                                    function selectEstateReview(){
                                    	
                                    	$.ajax({
                                    		url : "estate.re",
                                    		data: {esNo: "${e.esNo}",
                                    			   userNo: "${loginUser.userNo}"
                                    				},
                                    		success: function(result){
	
                                    			var avg = (result.sum /result.count).toFixed(2);
                                    			
												for(var i=0; i<result.erlist.length; i++){

													console.log("결과");
													console.log(result);
                                    				var stars = "";
                                    				
                                    				for(var j=0; j<result.erlist[i].esReScore; j++){
                                    					
                                    					stars += "<i class='fa fa-star'></i> ";
                                    				}
                                                    
                                    				var reviewItem = $("<div class='review_item'>" +
                                    						"<div class='media'>" +
                            		        		        "<div class='d-flex'>" +
                            		        		        "<img class='profile' src='"+result.erlist[i].member.changeName+"' alt=''>"+
                            		        		        "<h5 style='padding-left: 10px;'>" + result.erlist[i].member.userNickName + "</h5>" +
                            		        		        "</div>" +
                            		        		        "<div class='media-body'>" +
                            		        		        "<span>" + result.erlist[i].esReCreateDate + "</span>" +
                            		        		        "<div id='type'>" +
                            		        		        "<b>" + result.erlist[i].house.houseName + "</b>" +
                            		        		        "<h6 id='realtype'>"+result.erlist[i].esReType +"</h6>" +
                            		        		        "</div>" + 
                            		        		        stars +
                            		        		        "</div>" +
                            		        		        "</div>" +

                            		        		        "<p>" + result.erlist[i].esReContent + "</p>" +


                            		        		        '<div class="emo"><span class="' + (result.reviewBooleans[i] === 1 ? "like-btn liked" : "like-btn") + '" onclick="toggleLike(this)" id="'+result.erlist[i].esReNo+'"><img class="good" src="resources/img/good.svg"> </span> <h6 id="likeCount'+result.erlist[i].esReNo+'" class="likecount">'+

                            		        		        result.erNums[i]+'</h6>'+
                            		        		        "</div>" +
                            		        		    	"<hr>"

                            		        		        );
                                    				 $(".review_list").append(reviewItem);
                                    		} 
											
											$(".box_total h5").text("("+result.count+" Reviews)");
									    	$("#count h5").text("Based on "+result.count+" Reviews");
									        $(".box_total h1").text(avg);
									        $("#5star span").text(result.fiveStar+"개");
		                                    $("#4star span").text(result.fourStar+"개");
		                                    $("#3star span").text(result.threeStar+"개");
		                                    $("#2star span").text(result.twoStar+"개");
		                                    $("#1star span").text(result.oneStar+"개");
									        
									        
									    
									        
									      
                                
                                    		},error : function(){
                                    			console.log("리뷰 통신 오류");
                                    		}
                                    	});
                                    }
                                    
                                    $(function(){
                                    	selectEstateReview();
                                    });
                                    
                                    
                                    </script>


					<div id="map" style="width: 1000px; height: 500px;"></div>
					<script type="text/javascript"
						src="//dapi.kakao.com/v2/maps/sdk.js?appkey=c9d3f1c90fc1cea85b8bb8303f360c81&libraries=services,clusterer,drawing"></script>



				</div>

			</div>






		</div>

	</div>
	</div>


	<!-- Footer area-->


	<script src="resources/assets/js/modernizr-2.6.2.min.js"></script>
	<script src="resources/assets/js/jquery-1.10.2.min.js"></script>
	<script src="resources/bootstrap/js/bootstrap.min.js"></script>
	<script src="resources/assets/js/bootstrap-select.min.js"></script>
	<script src="resources/assets/js/bootstrap-hover-dropdown.js"></script>
	<script src="resources/assets/js/easypiechart.min.js"></script>
	<script src="resources/assets/js/jquery.easypiechart.min.js"></script>
	<script src="resources/assets/js/owl.carousel.min.js"></script>
	<script src="resources/assets/js/wow.js"></script>
	<script src="resources/assets/js/icheck.min.js"></script>
	<script src="resources/assets/js/price-range.js"></script>
	<script src="resources/assets/js/main.js"></script>

	<script>
            $(document).ready(function() {
                // Description 탭을 활성화
                $('#myTab a[href="#profile"]').tab('show');
              
            });
        </script>

<script>
			function detailHouse(e){
				location.href="detail.ho?houseNo="+e.id;
				console.log(e.id);
			}
			</script>

	<script>
			$(document).ready(function() {
			    // myTab 링크 클릭 시 함수 실행
			   
			        // 클릭 시 실행하고자 하는 함수 내용
			        var container = document.getElementById('map'); // 지도를 담을 영역
			        container.style.display = 'block';
			        var options = {
			            center: new kakao.maps.LatLng(37.533067592513866, 126.89622037964806),
			            level: 3
			        };
			        var map = new kakao.maps.Map(container, options);
			        var geocoder = new kakao.maps.services.Geocoder();
			        // 주소로 좌표를 검색합니다
			        geocoder.addressSearch('${e.esAddress}', function(result, status) {
			            // 정상적으로 검색이 완료됐으면
			            if (status === kakao.maps.services.Status.OK) {
			                var coords = new kakao.maps.LatLng(result[0].y, result[0].x);
			                var marker = new kakao.maps.Marker({
			                    map: map,
			                    position: coords
			                });
			                var infowindow = new kakao.maps.InfoWindow({
			                    content: '<div style="width:200px;padding:0 0 0 27px;z-index:1;">${e.esName}</div>'
			                });
			                infowindow.open(map, marker);
							
			                map.setCenter(coords);
			            }
			        });
		
			        $('#review-tab, #contact-tab, #home-tab' ).on('click', function () {
				        var container = document.getElementById('map');
				        container.style.display = 'none';
				    });
			        
			        
			        $('#profile-tab').on('click', function () {
			            container.style.display = 'block';
			        });
			});
			</script>

			<!-- 예약 -->
			<script>
			//달력
		        var today = new Date();
				$(function(){
		            buildCalendar();					
				})
				
				var clickedYear;
		        var clickedMonth; 
		        var clickedDate; 
		        var clickedYMD;				
				
	            function buildCalendar(){
	              var row = null
	              var cnt = 0;
	              var calendarTable = document.getElementById("calendar");
     	          var calendarTableTitle = document.getElementById("calendarTitle");
	              calendarTableTitle.innerHTML = today.getFullYear()+"년"+(today.getMonth()+1)+"월";
	              var firstDate = new Date(today.getFullYear(), today.getMonth(), 1);
	              var lastDate = new Date(today.getFullYear(), today.getMonth()+1, 0);
				
	              console.log(calendarTableTitle);
	              if(firstDate == null){
	                  calendarTableTitle;
	                  cell = row.insertCell();
	              }
	              
	              while(calendarTable.rows.length > 2){
	                  calendarTable.deleteRow(calendarTable.rows.length -1);
	              }
	              
	              //첫날 빈칸생기게하기
	              row = calendarTable.insertRow();
	              for(i = 0; i < firstDate.getDay(); i++){
	                cell = row.insertCell();
	                cnt += 1;
	              }

	              for(i = 1; i <= lastDate.getDate(); i++){
	                cell = row.insertCell();
	                cnt += 1;
	                cell.setAttribute('id', i);
	                cell.setAttribute('style','color:black;');
	                cell.innerHTML = i;
	                cell.align = "center";
	                cell.onclick = function(){
		                    clickedYear = today.getFullYear();
		                    clickedMonth = ( 1 + today.getMonth());
		                    clickedDate = this.getAttribute('id');
		                    clickedDate = clickedDate >= 10 ? clickedDate : '0' + clickedDate;
		                    clickedMonth = clickedMonth >= 10 ? clickedMonth : '0' + clickedMonth;
		                    clickedYMD = clickedYear + clickedMonth + clickedDate;
		                    var selectEsNo = document.getElementById("selectEsNo").value;
		                    $.ajax({
		                        url: "selectReservationList.re",
		                        data: {
		                        	selectEsNo: selectEsNo,
		                            clickedYMD: clickedYMD
		                        },
		                        success: function(result) {
	                        		// 이전에 비활성화된 요소를 찾아 초기화
	                        		var disabledElements = document.querySelectorAll('[disabled]');
	                        		for (var i = 0; i < disabledElements.length; i++) {
	                        		  disabledElements[i].disabled = false;
	                        		  disabledElements[i].style.textDecoration = 'none';
	                        		}
		                        	if(result.length>0){
			                        	for (var i = 0;i < result.length; i++){
			                        		var time = "time"+result[i].selectTime;
				                        	var disDiv = document.getElementById(time);
				                        	disDiv.disabled = true;
				                        	
				                        	if (disDiv.disabled) {
				                                disDiv.style.textDecoration = 'line-through';
				                            }
			                        	}
		                        	}
		                        },
		                        error: function() {
		                            console.log("통신오류");
		                        }
		                    });
	                }
	                cell.addEventListener('click', cal);
	                
	                //토요일
	                if (cnt % 7 == 1) {
	                    cell.setAttribute('style', 'color: red');
	                }
	                //일요일
	                if (cnt % 7 == 0){
	                    cell.setAttribute('style', 'color: blue');
	                    row = calendar.insertRow();
	                }
	              }
	              
	              //달력 마지막날 뒤 비칸 행으로 채우기
	              if(cnt % 7 != 0){
	                for(i = 0; i < 7 - (cnt % 7); i++){
	                    cell = row.insertCell();
	                }
	              }
	            }
	            function prevCalendar(){
	                today = new Date(today.getFullYear(), today.getMonth()-1, today.getDate());
	                buildCalendar();
	            }
	            function nextCalendar(){
	                today = new Date(today.getFullYear(), today.getMonth()+1, today.getDate());
	                buildCalendar();
	            }
    		
        	<!-- 시간 -->
        	//시간 체크 표시
    		function check(e){
        		console.log(e.disabled);
    			var checked = document.querySelector(".check");
    			if(checked){
    				checked.classList.remove('check');
    			}
    				e.classList.add('check');
    		}        	
			
        	//달력 체크 표시
        	function cal(e){
      		 	  // 새로운 날짜 정보 가져오기
	      		  var checkToday = new Date();
	      		  var checkYear = checkToday.getFullYear();
	      		  var checkMonth = checkToday.getMonth() + 1;
	      		  var checkDay = checkToday.getDate();
	      		  var userType = "${loginUser.userType}";
	
	      		  // 월이 한 자리일 경우 "0"을 추가
	      		  checkMonth = checkMonth < 10 ? '0' + checkMonth : checkMonth;
	      		  
	      		  // 일이 한 자리일 경우 "0"을 추가
	      		  checkDay = checkDay < 10 ? '0' + checkDay : checkDay;
	
	      		  // Today를 문자열로 변환
	      		  var checkToday = checkYear.toString() + checkMonth.toString() + checkDay.toString();
	
	      		  //중개인의 경우 예약 불가
	      		  if(userType == "중개인"){
	      			showWarning("경고", "중개인은 다른 중개인에게 예약을 하실 수 없습니다.", "확인");
	      		  }else{
		      		  // 예약 날짜와 현재 날짜 비교
		      		  if (clickedYMD < checkToday) {
		      		    showWarning("경고", "예약은 오늘 날짜 또는 이후의 날짜만 선택가능합니다.", "확인");
		      		  }else{        		
		        		var select = document.querySelector(".selected");
		        		    // 이전에 선택된 요소가 있을 경우에만 클래스를 제거
		        		    if (select) {
		        		      select.classList.remove('selected');
		        		    }
		        		    // 현재 선택한 요소에 클래스 추가
		        		    e.srcElement.classList.add('selected');
		    		}
	      		  	      			  
	      		  }
        	}
			
        	//예약 insert
        	function reservation(){
        		var selectTime = document.querySelector(".check").name; //시간
        		var selectEsNo = document.getElementById("selectEsNo").value; //부동산 번호
        		var selectUserNo = document.getElementById('selectUserNo').value; //유저 번호
        		
        		if(selectUserNo == 0){
        			showWarning("경고","로그인 후 예약 가능합니다.","확인");
        		}else{
	          		let f = document.createElement('form');
	        		
	        		let selected;
	        		selected = document.createElement('input');
	        		selected.setAttribute('type','hidden'); 
	        		selected.setAttribute('name','clickedYMD');
	        		selected.setAttribute('value',clickedYMD); //달력
	        		
	        		let caled;
	        		caled = document.createElement('input');
	        		caled.setAttribute('type','hidden'); 
	        		caled.setAttribute('name','selectTime');
	        		caled.setAttribute('value',selectTime); //시간
	        		
	        		let esNoed;
	        		esNoed = document.createElement('input');
	        		esNoed.setAttribute('type','hidden'); 
	        		esNoed.setAttribute('name','selectEsNo');
	        		esNoed.setAttribute('value',selectEsNo); //부동산 번호
	        		
	        		let userNoed;
	        		userNoed = document.createElement('input');
	        		userNoed.setAttribute('type','hidden'); 
	        		userNoed.setAttribute('name','selectUserNo');
	        		userNoed.setAttribute('value',selectUserNo); //유저 정보
	        		
	        		f.appendChild(selected);
	        		f.appendChild(caled);
	        		f.appendChild(esNoed);
	        		f.appendChild(userNoed);
	        		f.setAttribute('method', 'post');
	        		f.setAttribute('action', 'insertReservation.re');
	        		document.body.appendChild(f);
	
	        		f.submit(); 
        		}
        	}
        	
			function detailHouse(e){
				location.href="detail.ho?houseNo="+e.id;
				console.log(e.id);
			}
        	
        	
        	</script>

	<%@ include file="../common/footer.jsp"%>

</body>
</html>
