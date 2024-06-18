<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%> 
<%@ page import="java.text.SimpleDateFormat" %>  
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<!DOCTYPE html>
<html lang="ko">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>공감</title>
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
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
                <h3 class="panel-title"><strong>공감 > 중개사</strong></h3>
            </div>
            
            <!-------------------------------------------- 중개사 리뷰공감 ------------------------------------->	 
			<section id="comments"> 			
	          <c:if test="${not empty esRelike }"> 
	          	<c:forEach items="${esRelike}" var="esRelike" varStatus="status" >
	          
					<div class="row comment" style="margin:0; margin-top:15px;">		                
		                               
		                <div class="col-sm-9 col-md-10" style=" border-bottom: inset;">
		                	
		                	<div style="display: flex;justify-content: space-between;">
		                    	<h6 class="text-uppercase"># ${esRelike.esReNo}</h6><a href="estate/esRedelete.me?esReNo=${esRelike.esReNo}" onclick="return confirm('공감을 취소하시겠습니까?');" style="color:darkblue;">공감취소</a>
		                    </div>
		                    
		                    <p class="posted" id="posted"><i class="fa fa-clock-o" id="date">
		                    
		                    <c:choose>
		                    	<c:when test="${fn:length(esRelike.esReCreateDate) > 10 }">
		                    		${fn:substring(esRelike.esReCreateDate,0,10) }		                    		
		                    	</c:when>	
		                    	<c:otherwise>
		                    		${esRelike.esReCreateDate}
		                    	</c:otherwise>
		                    </c:choose>	
		                    
		                    </i></p>
		                    <p>${esRelike.esReContent}</p>
		                </div>
		            </div>
				   <script>
					   var esReCreateDate = "${esRelike.esReCreateDate}";
					   console.log(esReCreateDate);
				       if(esReCreateDate.length > 10){
				       	esReCreateDate = esReCreateDate.substr(0, 10);
				       }
				       $("#date").text(esReCreateDate);
				   </script>			            
	            </c:forEach>
	          </c:if>		
	        </section>  

	      
	        
	        <footer style="width: 450px;">
			   <!--------------------------------------- 페이징 처리 ------------------------------------->
			   <div class="pull-right" >
		            <div class="pagination">
		                <ul>
		                	 <c:if test="${pi.currentPage ne 1 }">
		                   <li><a href="myReviewLike.me?currentPage=${pi.currentPage-1}">Prev</a></li>
		                </c:if>   
		                <c:forEach begin="${pi.startPage }" end="${pi.endPage }" var="p">  
		                   <li><a href="myReviewLike.me?currentPage=${p}">${p}</a></li>
		                </c:forEach>   
		                <c:if test="${pi.currentPage ne pi.maxPage }"> 
		                     <li><a href="myReviewLike.me?currentPage=${pi.currentPage+1}">Next</a></li>
		                	  </c:if>
		                </ul>
		            </div>
		       </div> 
        	</footer>
                               
		</section>
	</div>

	<form action="esRedelete.me" method="post">
    	<input type ="hidden">
    </form>

	<%@ include file="../common/footer.jsp" %> 
     
     
</body>
</html>
