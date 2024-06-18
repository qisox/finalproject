<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
  <head>
  
    <meta charset="UTF-8" />
    
    <title>중개인 평가 수정하기</title>
    <style>
      .container {
        background-color: white;
        box-shadow: 0px 1px 3px 0px rgba(0, 0, 0, 0.1);
        border-radius: 0.5rem;
        padding: 1.5rem;
      }
      .header {
        border-bottom: 1px solid #e2e8f0;
        padding-bottom: 1rem;
      }
      .content {
        padding-top: 1rem;
      }
      .flex-row {
        display: flex;
        justify-content: space-between;
        align-items: center;
        margin-bottom: 1rem;
        white-space: nowrap;
      }
      
      .flex-rows{
      	display: flex;
      }
      .text-label {
        font-size: 1em;
        font-weight: 500;
        margin-right: 1em;
      }
     
      .rebutton{
      	background-color : #FDC600;
      	color:white;
      }
      .input-field {
        border: 1px solid #e2e8f0;
        background-color: #f7fafc;
        padding: 0.5rem;
        border-radius: 0.25rem;
        width: 100%;
      }
      .rating-label {
        color: #f59e0b;
      }
      .textarea {
          width: 1000px;
        height: 8rem;
        resize: none;
      }
      #modal{
      	width: 800px;
      }
      
      .profile{
    		 height: 175px;
             }
             
      .modal-content{
      	max-height: 90vh;
    	overflow-y: auto;
      }
    </style>
  </head>
  <body style="background-color:#f4f6f8;">
  	<%@ include file="../common/header.jsp"%>
  	<br>
  <form class="row contact_form" action="update.esre" method="post" id="updateForm" >
    <div class="container">
      <div class="header">
        <h2 class="text-xl font-semibold">중개인 리뷰 수정하기</h2>
        <input type="hidden" name="esReNo" value="${er.esReNo}">
      </div>
      
      <div class="content">
      </div>
        <div class="flex-row"> 
            <div class="text-label">중개인</div>
              <input class="input-field" value="${selectedReservation.estate.esName }" readonly="readonly"/>
              <input type="hidden" name="esNo" value="${selectedReservation.esNo}">
          	</div>
          	
        <div class="flex-row">
          <div class="text-label">예약일시</div>
          <input class="input-field" value="${selectedReservation.reservationDate }/${selectedReservation.time.timeValue}" readonly="readonly"/>
          </div>
     
          
        <div class="flex-rows">
          <div class="text-label">집 선택</div>
         <a data-toggle="modal" data-target="#homeModal">선택하기</a>
         
         
         
         
        </div>
        
        
        
        
        <div class="mb-4">
            <div class="rating-title">별점</div>
            <div class="rating-group">
                <input class="rating-input" id="rating-5-copy" type="radio" name="reviewScore" value="5" ${5 == er.esReScore ? 'checked' : ''}/>
                <label class="rating-label" for="rating-5-copy">★★★★★ 강력 추천</label>
    
                <input class="rating-input" id="rating-4-copy" type="radio" name="reviewScore" value="4" ${4 == er.esReScore ? 'checked' : ''}/>
                <label class="rating-label" for="rating-4-copy">★★★★ 추천</label>
    
                <input class="rating-input" id="rating-3-copy" type="radio" name="reviewScore" value="3" ${3 == er.esReScore ? 'checked' : ''}/>
                <label class="rating-label" for="rating-3-copy">★★★ 보통</label>
    
                <input class="rating-input" id="rating-2-copy" type="radio" name="reviewScore" value="2" ${2 == er.esReScore ? 'checked' : ''}/>
                <label class="rating-label" for="rating-2-copy">★★ 아쉬움</label>
    
                <input class="rating-input" id="rating-1-copy" type="radio" name="reviewScore" value="1"${1 == er.esReScore ? 'checked' : ''} />
                <label class="rating-label" for="rating-1-copy">★ 실망</label>
            </div>
            
            
            <div class="rating-title">고객 분류</div>
            <div class="type-group">
              <input class="" id="reviewType1" type="radio" name="reviewType" value="상담고객" ${'상담고객' == er.esReType ? 'checked' : ''} />
				<label class="" for="reviewType1">상담고객</label>

			<input class="" id="reviewType2" type="radio" name="reviewType" value="계약고객" ${'계약고객' == er.esReType ? 'checked' : ''} />
			<label class="" for="reviewType2">계약고객</label>
            </div>
        </div>
        <div class="mb-4">
          <div class="text-label">내용</div>
           <span class="length">
                            <span class="comment_length">0</span>
                            / 100
                        </span>
          <textarea  class="comment-content" cols="160" rows="7" style="resize: none; width:1150px;" name="esReContent" id="myEsReContent" placeholder="내용을 작성해주세요.">${er.esReContent}</textarea>
        </div>
        
        <script>
        $(document).ready(function() {
            $(".comment-content").keyup(function(e) {
                var content = $(this).val();
                $(".comment_length").text(content.length);

                if (content.length > 100) {
                    $(this).val($(this).val().substring(0, 100));
                    alert("글자수는 100자까지 입력가능합니다.");
                }
            });
        });
        </script>
      
      <br>
      <div class="alert" style="background-color:rgb(254 226 226 ); color:red;"  role="alert">
        <p class="font-bold" style="color:#B91C1C; font-weight: 700;">경고 제목</p>
        <p style="color:#B91C1C;">게시물 운영 원칙에 어긋나다고 판단되는 게시물은 상단 동물의이 블라인드 처리될 수 있습니다.</p>
        <p style="color:#B91C1C;">특히 타인의 명예 훼손 및 어떠한 목적으로든 스팸, 오보 등 사회적 물의를 일으키는 경우 문의사항으로 신고 접수가 가능합니다.</p>
        <p style="color:#B91C1C;">사용자 경고에도 불구하고 문제 게시물을 계속해서 올리는 이용자는 게시판 접근 차단이 제한됩니다.</p>
    </div>
    
       <input class="rebutton" value="수정하기" type="submit" onclick="updateEstateReview();">
      
        <div class="modal fade" id="homeModal">
        <div class="modal-dialog modal-sm" id="modal">
            <div class="modal-content">
                <!-- Modal Header -->
                <div class="modal-header">
                    <h4 class="modal-title">매물리스트</h4>
                    <button type="button" class="close" data-dismiss="modal">&times;</button>
                </div>
        
       <c:forEach var="house" items="${hlist }" varStatus="status">
                <form action="login.me" method="post">
                    <!-- Modal body -->
                    <div class="modal-body" >
                       <table class="modal_table"  >
                       	
           				 <tr>
           				 	<td ><input id="houseSelect" type="radio" name="homeName" value="${house.houseNo }" ${house.houseNo == er.houseNo ? 'checked' : ''}><td/>
		           				 	<label for="houseSelect">
	              				<td style="width:250px; padding:10px;">
	              						<img class='profile' id="houseSelect" src="${himglist[status.index].changeName}">
		           				 </td>
		           				 	</label>
	              				<td id="modal_houseTitle">${house.houseName }</td>             
            			</tr>
           				 		
                     </table>      
                    </div>
       </c:forEach>
                    <!-- Modal footer -->
                    <div class="modal-footer">
                        <button type="button" class="btn btn-warning">확인</button>
                        <button type="button" class="btn btn-warning" data-dismiss="modal">취소</button>
                    </div>
                </form>
            </div>
        </div>

    </div>
    
        </div>
        
        

  </form>
  
  <script>
  console.log('확인용');
  console.log($("#houseSelect2"));
    // 모달이 열릴 때마다 초기화
    $('.modal').on('show.bs.modal', function (e) {
        $('input[name="homeName"]').prop('checked', false);
        
    });

    // 모달에서 확인 버튼 클릭 시
    $('.modal .btn-warning').on('click', function() {
        // 선택된 radio 값을 가져와서 변수에 저장
        var selectedHouseNo = $('input[name="homeName"]:checked').val();

        // 선택된 값에 대한 처리 (예를 들면, 콘솔에 출력)
        console.log("선택된 집 번호: " + selectedHouseNo);

        // 모달을 닫습니다.
        $(this).closest('.modal').modal('hide');
    });
</script>
  
  
  

<script>

    function updateEstateReview() {
    	var esReNo = $("input[name=esReNo]").val();
    	var esNo = $("input[name=esNo]").val();
        var userNo = ${loginUser.userNo};
        var esReContent = $("#myEsReContent").val();
        var esReScore = $("input[name=reviewScore]:checked").val();
        var esReType = $("input[name=reviewType]:checked").val();
        var houseNo = $('input[name="homeName"]:checked').val();
        console.log(houseNo);
        
        $(".rebutton").prop("disabled", true);
        
        $.ajax({
            url: "update.esre",
            data: {
            	esReNo : esReNo,
            	esNo: esNo,
                userNo: userNo,
                esReContent: esReContent,
                esReScore: esReScore,
                esReType :esReType,
                houseNo : houseNo
                
            },
            method: "post",
            dataType: "json", 
            success: function (result) {
                console.log(result);
                if (result.success) {
                    alert("부동산 리뷰 수정 성공");
                    window.location.href = "detail.es?esNo="+esNo;
                } else {
                    alert("부동산 리뷰 수정 실패");
                }
            },
            error: function () {
                console.log("부동산 리뷰 수정 통신 실패");
            },
            complete: function () {
                // 버튼 다시 활성화
                $(".rebutton").prop("disabled", false);
            }
        });
    }
</script>

    
    <br>
  
    
    <%@ include file="../common/footer.jsp"%>
  </body>
</html>
