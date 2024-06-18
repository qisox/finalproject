<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@page import="com.kh.dungjip.member.model.vo.Member"%>    
<!DOCTYPE html>
<html lang="ko">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>문의사항 내역</title>
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

		<section class="main-content"
			style="width: 100%; margin: 70px 0 70px 50px; margin-left: 4%;">

			<div class="panel-heading">
                <h3 class="panel-title"><strong>문의내역</strong></h3>
            </div>

				<!-- Additional content can be added here -->
				<ul class="card_row"
					style="color: #333; list-style: none; padding: 20px 20px 20px 20px;">

					<c:if test="${not empty qlist }">
						<c:forEach items="${qlist}" var="qlist" varStatus="index">
							<div class="row row-feat">
								<div class="panel-group">
									<div class="panel panel-default">
										<div class="panel-heading"
											style="background: white; display: flex; justify-content: space-between;">
											<h4 class="panel-title fqa-title" data-toggle="collapse"
												data-target="#fqa11${index.count}">${qlist.enquiryTitle}</h4>
												
											<div>
												<c:if test="${qlist.status=='Y'}">
												    <span class="check" style="red: blue;font-size: small;">답변 완료</span>
												</c:if>
												<c:if test="${qlist.status=='N'}">
												    <span class="check" style="color: blue;font-size: small;">미답변</span>
												</c:if>
												
												<a href="enquiry/delete.bo?enquiryNo=${qlist.enquiryNo}" id="deleteBtn" class="bbtn btn-light btn-sm" onclick="return confirm('문의사항을 삭제하시겠습니까?');" style="color: red;">삭제</a>																																
										
											</div>
										</div>
										<div id="fqa11${index.count}"
											class="panel-collapse collapse fqa-body">
											<div class="panel-body">
												<ul>${qlist.enquiryContent}</ul>
											</div>

											<c:if test="${not empty qlist.enquiryReply}">
												<div class="panel-body">
													<ul>
														<b>관리자 답변 : </b>${qlist.enquiryReply}</ul>
												</div>
											</c:if>
											<c:if test="${empty qlist.enquiryReply}">
												<div class="panel-body">
													<ul>
														<b style="color: blue;">미답변</b>
													</ul>

												</div>
											</c:if>

										</div>
									</div>
								</div>
							</div>
						</c:forEach>
					</c:if>

					<c:if test="${empty qlist }">
						<p>※ 문의 내역이 존재하지 않습니다.</p>

					</c:if>

				</ul>
	
		</section>
	</div>

	<form action="delete.bo" method="post">
    	<input type ="hidden">
    </form>	

	<%@ include file="../common/footer.jsp" %>

</body>
</html>
