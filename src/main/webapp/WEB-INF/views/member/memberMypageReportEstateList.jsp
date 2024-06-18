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
		  margin-right: 10px; /* 각 요소 사이의 간격을 조정할 수 있습니다. */
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

		<section class="main-content"
			style="width: 100%; margin: 70px 0 70px 50px; margin-left: 4%;">

			<div class="panel-heading">
			
                <h3 class="panel-title"><strong>신고내역</strong></h3>           

				 <div class="section additional-details">
				 
					 <c:if test="${not empty repolist }">
						 <c:forEach items="${repolist}" var="repolist" >
						 
							<h4 class="s-property-title"># ${repolist.reportNo}</h4>
							
			                 <ul class="additional-details-list clearfix">
			                     <li>
			                         <span class="col-xs-6 col-sm-4 col-md-4 add-d-title">신고한 중개사 번호</span>
			                         <span class="col-xs-6 col-sm-8 col-md-8 add-d-entry">${repolist.esNo}</span>
			
			                     <li>
			                         <span class="col-xs-6 col-sm-4 col-md-4 add-d-title">신고 사유</span>
			                         <span class="col-xs-6 col-sm-8 col-md-8 add-d-entry">${repolist.reportReason }</span>
			                     </li>
			
			                 </ul>
			                 
			             </c:forEach>  			             
		             </c:if>
		             
		             <hr>
		              
	             </div> 
             
             </div>

			<footer style="width: 450px;">
				<!--------------------------------------- 페이징 처리 ------------------------------------->
				<div class="pull-right">
					<div class="pagination">
						<ul>
							<c:if test="${pi.currentPage ne 1 }">
								<li><a href="reportList_es?currentPage=${pi.currentPage-1}">Prev</a></li>
							</c:if>
							<c:forEach begin="${pi.startPage }" end="${pi.endPage }" var="p">
								<li><a href="reportList_es?currentPage=${p}">${p}</a></li>
							</c:forEach>
							<c:if test="${pi.currentPage ne pi.maxPage }">
								<li><a href="reportList_es?currentPage=${pi.currentPage+1}">Next</a></li>
							</c:if>
						</ul>
					</div>
				</div>
			</footer>

		</section>    
	</div>

	<%@ include file="../common/footer.jsp" %>
      
     
     
</body>
</html>
