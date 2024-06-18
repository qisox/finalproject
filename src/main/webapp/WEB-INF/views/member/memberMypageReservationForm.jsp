<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@page import="com.kh.dungjip.member.model.vo.Member"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html lang="ko">
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>예약내역</title>
<style>
.card {
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
	background-color: #C2C2C2;
	border-radius: 12px 12px 0 0;
	color: #EFFCF1;
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
.item_text {
	padding: 20px 0 10px 0px;
	line-height: 30px;
	font-size: 14px;
	letter-spacing: -0.8;
}
.btn_edit {
	float: right;
	padding: 2px 9px 3px 10px;
	color: #7B8994;
	border: none;
}
</style>
</head>
<body>
	<%@ include file="../common/header.jsp"%>
	<div class="container" style="display: flex; width: 67%;">
		<!-- 마이페이지 메뉴바 -->
		<%@ include file="memberMypagemenubar.jsp"%>
		<section class="main-content"
			style="width: 100%; margin: 70px 0 70px 50px; margin-left: 4%;">
				<h3 class="panel-title"><strong>예약내역</strong></h3>
				<div class="cart_inner">
					<div class="table-responsive">
						<table class="table">
							<thead>
								<tr class="text-center">
									<th scope="col" style="width:10%;text-align: center;">#</th>
									<th scope="col">예약 상세정보</th>
									<th scope="col" style="width:15%;">리뷰</th>
								</tr>
							</thead>
							<tbody>
							<c:forEach var="reservation" items="${rlist }" >
								<tr>
									<td class="text-center">
										<input type="hidden" value="${reservation.reservationNo}" id="reservationNo">
										<h5>NO.${reservation.reservationNo}</h5>
									</td>
									
									<td>
										<div class="media">
											<div class="d-flex"></div>
											<div class="media-body">
												<p>
													<b># 일시</b>
													<input type="hidden" id="rTime" value="${reservation.reservationDate }">
													${reservation.reservationDate }
													${reservation.time.timeValue }
												</p>
												<p>
													<b># 중개사무소</b> ${reservation.estate.esName }
													<input type="hidden" id="esNo" value="${reservation.esNo}">
												</p>
											</div>
										</div>
									</td>	
									<td>
									<!-- 여기버튼 누르면 리뷰 작성 창 -->
									<a href="#" class="genric-btn primary-border small" id="reviewEnrol"onclick="insertEstateReview(this);">작성</a>
									<a href="deleteReview.re?reservationNo=${reservation.reservationNo}" style="color:red;padding-left: 10px;" class="genric-btn primary-border small">삭제</a>
									</td>
								</tr>
							</c:forEach>
							</tbody>
						</table>
					</div>
				</div>
	
		</section>
	</div>
	<script>
	function insertEstateReview(el){
		var esNo = $(el).closest('tr').find('#esNo').val();
		var beforeRTime = $(el).closest('tr').find('#rTime').val();
		
		var rTime = new Date(beforeRTime);
		var today = new Date();
		
		if(rTime>today){
			showWarning("경고","예약 날짜 이후 작성이 가능합니다.","확인");
		}else{
			window.location.href = "/dungjip/insert.esre?esNo="+esNo;
		}
	
	

	}
	
	</script>
	<%@ include file="../common/footer.jsp"%>
</body>
</html>