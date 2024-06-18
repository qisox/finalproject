<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
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

.item_text {
	padding: 20px 0 10px 0px;
	line-height: 30px;
	font-size: 14px;
	letter-spacing: -0.8;
}

.btn_edit {
	float: right;
	padding: 2px 9px 3px 10px;
	color: #7b8994;
	border: none;
}
</style>
</head>
<body>

	<%@ include file="../common/header.jsp"%>

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

		<section class="main-content" style="width: 100%; margin: 70px 0 70px 50px; margin-left: 4%;">				
		        
			<div class="cart_inner">
			
				<div class="table-responsive" style="margin-top:20px;">
					<table class="table">
						<thead>
							<tr class="text-center">
								<div>
									<th scope="col" style="width:10%;width:10%;text-align: center;">#</th>
									<th scope="col" style="width:60%;">예약 상세정보</th>
									<th scope="col" style="width:20%;">TIME</th>
								</div>
							</tr>
						</thead>
						<tbody>
						<c:forEach var="relist" items="${relist }" >
							<tr>
								<td class="text-center" >
									<h5>NO.${relist.reservationNo }</h5>
								</td>
								<td>
									<div class="media" >
										<div class="d-flex"></div>
										<div class="media-body">
											<p>
												<b><i class="fa fa-clock-o" ></i> </b>
												${relist.time.timeValue }
											</p>
											<p>
												<b>임대인 : </b> ${relist.member.userName }
												
											</p>
										</div>
									</div>
								</td>
									
								<td>								
									<P style="margin-right: 123px; display: contents;">
										<b>예약날짜 : </b> ${relist.reservationDate }
									</P>
								</td>								
								
						</c:forEach>
						</tbody>
					</table>
				</div>
			</div>
			<script type="text/javascript">
				console.log(${relist});
			
			</script>
			<!------------------------------ 페이징 처리 -------------------------------->
			<footer style="width: 450px;">
				<div class="pull-right">
					<div class="pagination">
						<ul>
							<c:if test="${pi.currentPage ne 1 }">
								<li><a
									href="reser.es?currentPage=${pi.currentPage-1}&esNo=${esNo}">Prev</a></li>
							</c:if>
							<c:forEach begin="${pi.startPage}" end="${pi.endPage }" var="p">
								<li><a href="reser.es?currentPage=${p}&esNo=${esNo}">${p}</a></li>
							</c:forEach>
							<c:if test="${pi.currentPage ne pi.maxPage }">
								<li><a
									href="reser.es?currentPage=${pi.currentPage+1}&esNo=${esNo}">Next</a></li>
							</c:if>
						</ul>
					</div>
				</div>
			</footer>
		</section> 
	</div>
			<script type="text/javascript">
				console.log(${pi});
			</script>

	<%@ include file="../common/footer.jsp"%>

</body>
</html>
