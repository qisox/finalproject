<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@page import="com.kh.dungjip.member.model.vo.Member"%>    
<!DOCTYPE html>
<html lang="ko">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>중개사 리뷰내역</title>
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
		<%@ include file="memberMypagemenubar.jsp"%>

		<section class="main-content"
			style="width: 100%; margin: 70px 0 70px 50px; margin-left: 4%;">

			<div class="section" style="width: 93%; margin-bottom: 50px;">
				 
				 <div class="panel-heading">
                     <h3 class="panel-title"><strong>리뷰내역 > 중개사</strong></h3>
                 </div>
				
				<!-- Additional content can be added here -->
				<div  id="list-type" class="proerty-th-list" style="color: #333; list-style: none; padding: 20px 20px 20px 20px;">
					
						<c:if test="${not empty elist }">
							<c:forEach items="${elist}" var="elist" >
							<div class="col-md-4 p0">	
								<div class="box-two proerty-item" style="margin:0;">
			                         <div >
			                             <div style="width:100%;">
			                                
			                                 <div class="item-entry overflow" style="width:100%;">

			                                     <h6 style="display: flex;justify-content: space-between;"><a href=""> # ${elist.esNo} </a>
			                                     	<div><a href="update.esre?esReNo=${elist.esReNo}&esNo=${elist.esNo}" type="button" id="updateBtn" class="btn btn-light btn-sm">수정</a>																					
													 	<a href="estateReview/delete.es?esReNo=${elist.esReNo}" id="deleteBtn" class="btn btn-light btn-sm" onclick="return confirm('리뷰를 삭제하시겠습니까?');" style="color: red;">삭제</a></div></h6>

			                                     <div class="dot-hr"></div>
			                                     <span class="pull-left"><b>작성된 날짜 : </b>${elist.esReCreateDate}</span>

			                                     <p style="display: ">${elist.esReContent}</p>

			
			                                 </div>
			                             </div>
			                         </div>   
								</div>
							</div>	
							</c:forEach>	
						</c:if>
	
						<c:if test="${empty elist }">
							<p>※ 리뷰 내역이 존재하지 않습니다.</p>
	
						</c:if>
										
				</div>
				
				<footer style="width: 450px;">
				 <!--------------------------------------- 페이징 처리 ------------------------------------->
				   <div class="pull-right" >
			            <div class="pagination">
			                <ul>
			                	 <c:if test="${pi.currentPage ne 1 }">
			                   <li><a href="myEsReview.me?currentPage=${pi.currentPage-1}">Prev</a></li>
			                </c:if>   
			                <c:forEach begin="${pi.startPage }" end="${pi.endPage }" var="p">  
			                   <li><a href="myEsReview.me?currentPage=${p}">${p}</a></li>
			                </c:forEach>   
			                <c:if test="${pi.currentPage ne pi.maxPage }"> 
			                     <li><a href="myEsReview.me?currentPage=${pi.currentPage+1}">Next</a></li>
			                	  </c:if>
			                </ul>
			            </div>
			       </div> 				
				</footer>
			</div>
		</section>
	</div>



	<!-- update  -->
	<div class="modal fade" tabindex="-1" id='updateReview'>
	  <div class="modal-dialog">
	    <div class="modal-content">
	      <div class="modal-header">
	      
	        <h5 class="modal-title"></h5>
	        <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
	      </div>
	      
	      <form action="updateReview.es" method="post">
	      	<input type="hidden" name="esReNo" id="updateEsReNo">
	      	<!-- ********* value 안에 클릭한 글의 해당 esReNo를 가지고 와서 넣어주기 ******* -->
	      	
		      <div class="modal-body">
		        <div>
			      <ul class="list" style="margin-bottom:10%;">
			      	<p><strong>별점 수정</strong></p>
					<div class="form-check form-check-inline">
					  <input class="form-check-input" type="radio" name="esReScore" id="esReScore5" value="5" checked>
					  <label class="form-check-label" for="esReScore5">5</label>
					</div>
					<div class="form-check form-check-inline">
					  <input class="form-check-input" type="radio" name="esReScore" id="esReScore4" value="4">
					  <label class="form-check-label" for="esReScore4">4</label>
					</div>
					<div class="form-check form-check-inline">
					  <input class="form-check-input" type="radio" name="esReScore" id="esReScore3" value="3">
					  <label class="form-check-label" for="esReScore3">3</label>
					</div>
					<div class="form-check form-check-inline">
					  <input class="form-check-input" type="radio" name="esReScore" id="esReScore2" value="2">
					  <label class="form-check-label" for="esReScore2">2</label>
					</div>
					<div class="form-check form-check-inline">
					  <input class="form-check-input" type="radio" name="esReScore" id="esReScore1" value="1">
					  <label class="form-check-label" for="esReScore1">1</label>
					</div>
				 </ul>
				 </div>
				 
			     	<p><strong>리뷰 내용 수정</strong></p>
			        <div class="form-group">
						<textarea class="form-control" name="esReContent" id="esReContent"></textarea>
					</div>
					
			   </div>   
		      <div class="modal-footer">
		        <button type="button" class="btn btn-secondary" data-dismiss="modal"  aria-label="Close">Close</button>
		        <button type="submit" class="btn btn-primary" onclick="return updateReview();">수정하기</button>
		      </div>
		     </div>  
		    </form> 
	    </div>
	  </div>
	</div>

	<script type="text/javascript">
		function a(data){
			
			$("#updateEsReNo").prop("value", data);
			
			var esReNo = data;
			var esReScore  = $("input[name=esReScore]:checked").val();
			var esReContent  =$("#esReContent").val();
        
            $.ajax({
                type: "POST",
                url: "updateReview.es",
                data: {
                    esReNo: esReNo,
                    esReScore: esReScore,
                    esReContent: esReContent
                },
                success: function (result) {
                	
					console.log(result);
					
					showSuccess("성공",'리뷰 등록이 완료되었습니다.',"확인");  
                },
                error: function (error) {
                	console.log("오류");
                }
            });		            
		 
		} 
		
	</script>

	<!-- delete -->
	<form action="delete.es" method="post">
    	<input type ="hidden">
    </form>

	<%@ include file="../common/footer.jsp" %>       
     
</body>
</html>
