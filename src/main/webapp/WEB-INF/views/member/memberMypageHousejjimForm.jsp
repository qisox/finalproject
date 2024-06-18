<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@page import="com.kh.dungjip.member.model.vo.Member"%>    
<!DOCTYPE html>
<html lang="ko">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>하우스 리뷰내역</title>
    <style>
        .card{
           box-shadow: 0 0 5px 0;
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
        
      	.list {
		  list-style: none;
		  padding: 0;
		}
		
		.list .form-check {
		  display: inline-block;
		  margin-right: 10px;
		}
		
        
    </style>
</head>
<body>

	<%@ include file="../common/header.jsp" %>

	<div class="container" style="display: flex; width: 1192px;">

		<!-- 마이페이지 메뉴바 --> 
		<c:choose>
	    <c:when test="${loginUser.userType eq '임차인' || loginUser.userType eq '임대인'}">
	        <%@ include file="memberMypagemenubar.jsp" %>
	    </c:when>
	    <c:when test="${loginUser.userType eq '중개인'}">
	        <%@ include file="memberMypageEsmenubar.jsp" %>
	    </c:when>
	    </c:choose>  

		<section class="main-content"
			style="width: 100%; margin: 70px 0 70px 50px; margin-left: 4%;">

			<div class="panel-heading">
                <h3 class="panel-title"><strong>찜 내역 > 집</strong></h3>
            </div>

			<c:if test="${not empty hlike}">
				<c:forEach items="${hlike}" var="hlike" varStatus="status">
					<div class="col-md-4" style="margin-top:20px;">
						 <div class="card mb-3" style="width:250px;height:270px;">
							 	<div>
								 	<a href="${contextPath}/detail.ho?houseNo=${hlike.houseNo}" style="display:contents;">
									  <img class="homeImg" src="${himg[status.index].changeName }" class="card-img-top" alt="..." style="width: 260px;height: 168px;border-radius: 10px 10px 10px 0;">
									</a>
								</div> 
							  <div class="card-body">
							    <h5 class="card-title" style="width:100%;">${hlike.houseTitle }</h5>
							    <div style="display: flex;justify-content: end;">
							    	<a href="house/hjjimdelete.me?houseNo=${hlike.houseNo}" class="btn btn-light btn-sm" style="color: brown;">해제</a>
							  	</div>
							  </div>
						 </div> 
					</div>
				</c:forEach>	
			</c:if>

			<!-- <footer style="width: 450px;"> -->
				<!--------------------------------------- 페이징 처리 ------------------------------------->
				<div class="pull-right" style="width: 450px;">
					<div class="pagination">
						<ul>
							<c:if test="${pi.currentPage ne 1 }">
								<li><a
									href="myHousejjim.me?currentPage=${pi.currentPage-1}">Prev</a></li>
							</c:if>
							<c:forEach begin="${pi.startPage }" end="${pi.endPage }" var="p">
								<li><a href="myHousejjim.me?currentPage=${p}">${p}</a></li>
							</c:forEach>
							<c:if test="${pi.currentPage ne pi.maxPage }">
								<li><a
									href="myHousejjim.me?currentPage=${pi.currentPage+1}">Next</a></li>
							</c:if>
						</ul>
					</div>
				</div>
			</footer>
		
		<script type="text/javascript">
			console.log(${pi});
			
		
		</script>
		</section>    
	</div>
	

	<%@ include file="../common/footer.jsp" %>
      
     
     
</body>
</html>
