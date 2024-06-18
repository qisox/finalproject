<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>  
<!DOCTYPE html>
<html lang="ko">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>임대인 매물내역</title>
  <script
	src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.1/jquery.min.js"></script>
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
		    <c:when test="${loginUser.userType eq '중개인'}">
		        <%@ include file="memberMypageEsmenubar.jsp" %>
		    </c:when>
		    <c:when test="${loginUser.userType eq '임대인'}">
		        <%@ include file="memberMypageImdamenubar.jsp" %>
		    </c:when>
	    </c:choose>

		<section class="main-content"
			style="width: 100%; margin: 70px 0 70px 50px; margin-left: 4%;">

			<div class="section" style="width: 93%; margin-bottom: 50px;">				
				
				<div  id="list-type" class="proerty-th-list" style="color: #333; list-style: none; padding: 20px 20px 20px 20px;">
					                           
                        <c:if test="${not empty imdalike}">
							<c:forEach items="${imdalike}" var="imdalike" varStatus="status">
	                     		<div class="col-md-4 p0">
		                            <div class="box-two proerty-item">
		                                <div class="item-thumb">
		                                    <img src="${imdaimg[status.index].changeName }">
		                                </div>
		                                <div class="item-entry overflow">
		                                    <h5><a href="property-1.html"> ${imdalike.houseName } </a></h5>
		                                    <div class="dot-hr"></div>
		                                    <span class="pull-left"><b> Area :</b> ${imdalike.houseSquare } </span>
		                                    <div>
		                                    	<div>	
			                                    	<span class="proerty-price pull-right"> ${imdalike.housePrice } / ${imdalike.houseRent }</span>
		                                        </div>
		                                   		<p>${imdalike.houseTitle }</p>
		                                        <div class="dealer-action pull-right" style="margin-top:35px;">                                                                              
		                                            <a href="${contextPath}/imdaHdelete.li?houseNo=${imdalike.houseNo}" class="button delete_user_car">Delete</a>
		                                            <a href="${contextPath}/detail.ho?houseNo=${imdalike.houseNo}" class="button">View</a>
		                                        </div>
		                                    </div>    
		                                </div>
		                            </div>
	                     		</div>	                          	                     
                        	</c:forEach>	
						</c:if>                                
										
				</div>
				
				<footer style="width: 450px;">
				 <!--------------------------------------- 페이징 처리 ------------------------------------->
				   <div class="pull-right" >
			            <div class="pagination">
			                <ul>
			                	 <c:if test="${pi.currentPage ne 1 }">
			                   <li><a href="imdaHouse.li?currentPage=${pi.currentPage-1}">Prev</a></li>
			                </c:if>   
			                <c:forEach begin="${pi.startPage }" end="${pi.endPage }" var="p">  
			                   <li><a href="imdaHouse.li?currentPage=${p}">${p}</a></li>
			                </c:forEach>   
			                <c:if test="${pi.currentPage ne pi.maxPage }"> 
			                     <li><a href="imdaHouse.li?currentPage=${pi.currentPage+1}">Next</a></li>
			                	  </c:if>
			                </ul>
			            </div>
			       </div> 				
				</footer>
			</div>
		</section>
	</div>



	<!-- delete -->
	<form action="imdaHdelete.li" method="post">
    	<input type ="hidden">
    </form>

	<%@ include file="../common/footer.jsp" %>       
     
</body>
</html>
