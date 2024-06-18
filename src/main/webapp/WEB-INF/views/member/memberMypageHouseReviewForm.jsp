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
		<%@ include file="memberMypagemenubar.jsp"%>

		<section class="main-content"
			style="width: 100%; margin: 70px 0 70px 50px; margin-left: 4%;">

			<div class="section" style="width: 93%; margin-bottom: 50px;">

				<div class="panel-heading">
                     <h3 class="panel-title"><strong>리뷰내역 > 집</strong></h3>
                 </div>

				<div  id="list-type" class="proerty-th-list" style="color: #333; list-style: none; padding: 20px 20px 20px 20px;">
					
						<c:if test="${not empty hlist }">
							<c:forEach items="${hlist}" var="hlist" >
							<div class="col-md-4 p0">	
								<div class="box-two proerty-item" style="margin:0;">
			                         <div >
			                             <div style="width:100%;">
			                                
			                                 <div class="item-entry overflow" style="width:100%;">

			                                     <h5 style="display: flex;justify-content: space-between;"><a href=""> 집 번호 ${hlist.houseNo}  </a>
			                                     	<div><a href="update.rere?reReviewNo=${hlist.reReviewNo}&houseNo=${hlist.houseNo}" type="button" id="updateBtn" class="btn btn-light btn-sm">수정</a>																					


													 	<a href="residentReview/delete.re?reReviewNo=${hlist.reReviewNo }" id="deleteBtn" class="btn btn-light btn-sm" onclick="return confirm('리뷰를 삭제하시겠습니까?');" style="color: red;">삭제</a></div></h5>
			                                     <div class="dot-hr"></div>
			                                     <!-- 별점을 어떻게 띄울지 생각을 해보자. -->
			                                     <span class="pull-left"><b>작성된 날짜 : </b>${hlist.reCreateDate}</span>

	
			                                     <p>장점 : ${hlist.reAdContent}</p>
			                                     <p>단점 : ${hlist.reDisContent}</p>

			
			                                 </div>
			                             </div>
			                         </div>   
								</div>
							</div>	
							</c:forEach>	
						</c:if>
	
						<c:if test="${empty hlist }">
							<p>※ 리뷰 내역이 존재하지 않습니다.</p>
	
						</c:if>
										
				</div>
				
				<footer style="width: 450px;">
				   <!--------------------------------------- 페이징 처리 ------------------------------------->
				   <div class="pull-right" >
			            <div class="pagination">
			                <ul>
			                	 <c:if test="${pi.currentPage ne 1 }">
			                   <li><a href="myHReview.me?currentPage=${pi.currentPage-1}">Prev</a></li>
			                </c:if>   
			                <c:forEach begin="${pi.startPage }" end="${pi.endPage }" var="p">  
			                   <li><a href="myHReview.me?currentPage=${p}">${p}</a></li>
			                </c:forEach>   
			                <c:if test="${pi.currentPage ne pi.maxPage }"> 
			                     <li><a href="myHReview.me?currentPage=${pi.currentPage+1}">Next</a></li>
			                	  </c:if>
			                </ul>
			            </div>
			       </div> 
		       	</footer>
		       						
			</div>			
		</section>
	</div>
	
	<!-- update  -->
	<div class="modal fade" tabindex="-1" id='updateReReview'>
	  <div class="modal-dialog">
	    <div class="modal-content">
	      <div class="modal-header">
	      
	        <h5 class="modal-title"></h5>
	        <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
	      </div>
	      
	      <form action="updateReReview.es" method="post">
	      	<input type="hidden" name="reReviewNo" id="updateReReviewNo">
	      	
	      	
		      <div class="modal-body">
		        <div>
			      <ul class="list" style="margin-bottom:10%;">
			      	<p><strong>집내부 별점</strong></p>
					<div class="form-check form-check-inline">
					  <input class="form-check-input" type="radio" name="interiorScore" id="interiorScore5" value="5" checked>
					  <label class="form-check-label" for="interiorScore5">5</label>
					</div>
					<div class="form-check form-check-inline">
					  <input class="form-check-input" type="radio" name="interiorScore" id="interiorScore4" value="4">
					  <label class="form-check-label" for="interiorScore4">4</label>
					</div>
					<div class="form-check form-check-inline">
					  <input class="form-check-input" type="radio" name="interiorScore" id="interiorScore3" value="3">
					  <label class="form-check-label" for="interiorScore3">3</label>
					</div>
					<div class="form-check form-check-inline">
					  <input class="form-check-input" type="radio" name="interiorScore" id="interiorScore2" value="2">
					  <label class="form-check-label" for="interiorScore2">2</label>
					</div>
					<div class="form-check form-check-inline">
					  <input class="form-check-input" type="radio" name="interiorScore" id="interiorScore1" value="1">
					  <label class="form-check-label" for="interiorScore1">1</label>
					</div>
				 </ul>
				 </div>
				 
				 <div>
			      <ul class="list" style="margin-bottom:10%;">
			      	<p><strong>건물 별점</strong></p>
					<div class="form-check form-check-inline">
					  <input class="form-check-input" type="radio" name="buildingScore" id="buildingScore5" value="5" checked>
					  <label class="form-check-label" for="buildingScore5">5</label>
					</div>
					<div class="form-check form-check-inline">
					  <input class="form-check-input" type="radio" name="buildingScore" id="buildingScore4" value="4">
					  <label class="form-check-label" for="buildingScore4">4</label>
					</div>
					<div class="form-check form-check-inline">
					  <input class="form-check-input" type="radio" name="buildingScore" id="buildingScore3" value="3">
					  <label class="form-check-label" for="buildingScore3">3</label>
					</div>
					<div class="form-check form-check-inline">
					  <input class="form-check-input" type="radio" name="buildingScore" id="buildingScore2" value="2">
					  <label class="form-check-label" for="buildingScore2">2</label>
					</div>
					<div class="form-check form-check-inline">
					  <input class="form-check-input" type="radio" name="buildingScore" id="buildingScore1" value="1">
					  <label class="form-check-label" for="buildingScore1">1</label>
					</div>
				 </ul>
				 </div>
				 <div>
			      <ul class="list" style="margin-bottom:10%;">
			      	<p><strong>교통 별점</strong></p>
					<div class="form-check form-check-inline">
					  <input class="form-check-input" type="radio" name="trafficScore" id="trafficScore5" value="5" checked>
					  <label class="form-check-label" for="trafficScore5">5</label>
					</div>
					<div class="form-check form-check-inline">
					  <input class="form-check-input" type="radio" name="trafficScore" id="trafficScore4" value="4">
					  <label class="form-check-label" for="trafficScore4">4</label>
					</div>
					<div class="form-check form-check-inline">
					  <input class="form-check-input" type="radio" name="trafficScore" id="trafficScore3" value="3">
					  <label class="form-check-label" for="trafficScore3">3</label>
					</div>
					<div class="form-check form-check-inline">
					  <input class="form-check-input" type="radio" name="trafficScore" id="trafficScore2" value="2">
					  <label class="form-check-label" for="trafficScore2">2</label>
					</div>
					<div class="form-check form-check-inline">
					  <input class="form-check-input" type="radio" name="trafficScore" id="trafficScore1" value="1">
					  <label class="form-check-label" for="trafficScore1">1</label>
					</div>
				 </ul>
				 </div> 
				 
				 <div>
			      <ul class="list" style="margin-bottom:10%;">
			      	<p><strong>치안 별점</strong></p>
					<div class="form-check form-check-inline">
					  <input class="form-check-input" type="radio" name="safetyScore" id="safetyScore5" value="5" checked>
					  <label class="form-check-label" for="safetyScore5">5</label>
					</div>
					<div class="form-check form-check-inline">
					  <input class="form-check-input" type="radio" name="safetyScore" id="safetyScore4" value="4">
					  <label class="form-check-label" for="safetyScore4">4</label>
					</div>
					<div class="form-check form-check-inline">
					  <input class="form-check-input" type="radio" name="safetyScore" id="safetyScore3" value="3">
					  <label class="form-check-label" for="safetyScore3">3</label>
					</div>
					<div class="form-check form-check-inline">
					  <input class="form-check-input" type="radio" name="safetyScore" id="safetyScore2" value="2">
					  <label class="form-check-label" for="safetyScore2">2</label>
					</div>
					<div class="form-check form-check-inline">
					  <input class="form-check-input" type="radio" name="safetyScore" id="safetyScore1" value="1">
					  <label class="form-check-label" for="safetyScore1">1</label>
					</div>
				 </ul>
				 </div>
				 
				 <div>
			      <ul class="list" style="margin-bottom:10%;">
			      	<p><strong>생활 별점</strong></p>
					<div class="form-check form-check-inline">
					  <input class="form-check-input" type="radio" name="lifeScore" id="lifeScore5" value="5" checked>
					  <label class="form-check-label" for="lifeScore5">5</label>
					</div>
					<div class="form-check form-check-inline">
					  <input class="form-check-input" type="radio" name="lifeScore" id="lifeScore4" value="4">
					  <label class="form-check-label" for="lifeScore4">4</label>
					</div>
					<div class="form-check form-check-inline">
					  <input class="form-check-input" type="radio" name="lifeScore" id="lifeScore3" value="3">
					  <label class="form-check-label" for="lifeScore3">3</label>
					</div>
					<div class="form-check form-check-inline">
					  <input class="form-check-input" type="radio" name="lifeScore" id="lifeScore2" value="2">
					  <label class="form-check-label" for="lifeScore2">2</label>
					</div>
					<div class="form-check form-check-inline">
					  <input class="form-check-input" type="radio" name="score" id="Score1" value="1">
					  <label class="form-check-label" for="Score1">1</label>
					</div>
				 </ul>
				 </div>
				 
			     	<p><strong>장점</strong></p>
			        <div class="form-group">
						<textarea class="form-control" name="reAdContent" id="reAdContent"></textarea>
					</div>
					
					<p><strong>단점</strong></p>
			        <div class="form-group">
						<textarea class="form-control" name="reDisContent" id="reDisContent"></textarea>
					</div>
					
			   </div>   
		      <div class="modal-footer">
		        <button type="button" class="btn btn-secondary" data-dismiss="modal"  aria-label="Close">Close</button>
		        <button type="submit" class="btn btn-primary" onclick="return updateReReview();">수정하기</button>
		      </div>
		     </div>  
		    </form> 
	    </div>
	  </div>
	</div>
	
	<script type="text/javascript">
		function a(data){
			$("#updateReReviewNo").prop("value", data);
			
			var reReviewNo = data;
			var interiorScore  = $("input[name=interiorScore]:checked").val();
			var buildingScore  = $("input[name=buildingScore]:checked").val();
			var trafficScore  = $("input[name=trafficScore]:checked").val();
			var safetyScore  = $("input[name=safetyScore]:checked").val();
			var lifeScore  = $("input[name=lifeScore]:checked").val();
			var reAdContent  =$("#reAdContent").val();
			var reDisContent  =$("#reDisContent").val();

            $.ajax({
                type: "POST",
                url: "updateReReview.es",
                data: {
                	reReviewNo: reReviewNo,
                	interiorScore: interiorScore,
                	buildingScore: buildingScore,
                	trafficScore: trafficScore,
                	safetyScore: safetyScore,
                	lifeScore: lifeScore,
                	reAdContent: reAdContent,
                    reDisContent: reDisContent
                },
                success: function (result) {
					showSuccess("성공",'리뷰 등록이 완료되었습니다.',"확인");  
                },
                error: function (error) {
                	console.log("오류");
                }
            });
            return true; // 수정 내용 전송
		       
		} 
		
	</script>
	
	
	
	<form action="delete.re" method="post">
    	<input type ="hidden">
    </form>	

	<%@ include file="../common/footer.jsp" %> 
     
     
</body>
</html>
