<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
  <head>
  <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
  
  
    <meta charset="UTF-8" />
    
    <title>매물 평가 수정하기</title>
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
      #exampleText,#example{
      color:blue
      }
      
         select {
        width: 100%; /* 셀렉트 박스의 가로 길이를 100%로 설정 */
        padding: 10px; /* 셀렉트 박스 내부의 여백을 추가 */
        border: 1px solid #ccc; /* 경계선 설정 */
        border-radius: 4px; /* 경계선 둥글게 설정 */
        box-sizing: border-box; /* 박스 크기 계산 방식 설정 */
    }

.keyword-button.selected {
    background-color: #fdc600; /* 선택된 상태의 배경색 */
    color: white; /* 선택된 상태의 글자색 */
}


    </style>
  </head>
  <body style="background-color:#f4f6f8;">
<%@ include file="../common/header.jsp"%>
  	<br>
  <form class="row contact_form" action="update.rere" method="post" id="contactForm" novalidate="novalidate" enctype="multipart/form-data">
    <div class="container">
      <div class="header">
        <h2 class="text-xl font-semibold">매물 리뷰 수정하기</h2>
        <input type="hidden" name="reReviewNo" value="${rr.reReviewNo}">
        <input type="hidden" name="houseNo" value="${rr.houseNo}">
      </div>
      
      <div class="content">
      </div>
      
        
        <div class="mb-4">
            <div class="rating-title">집 내부 별점</div>
            <div class="rating-group">
                <input class="rating-input" id="interior-5-copy" type="radio" name="interiorScore" value="5" ${5 == rr.interiorScore ? 'checked' : ''}/>
                <label class="rating-label" for="interior-5-copy">★★★★★ 강력 추천</label>
    
                <input class="rating-input" id="interior-4-copy" type="radio" name="interiorScore" value="4" ${4 == rr.interiorScore ? 'checked' : ''}/>
                <label class="rating-label" for="interior-4-copy">★★★★ 추천</label>
    
                <input class="rating-input" id="interior-3-copy" type="radio" name="interiorScore" value="3" ${3 == rr.interiorScore ? 'checked' : ''}/>
                <label class="rating-label" for="interior-3-copy">★★★ 보통</label>
    
                <input class="rating-input" id="interior-2-copy" type="radio" name="interiorScore" value="2" ${2 == rr.interiorScore ? 'checked' : ''} />
                <label class="rating-label" for="interior-2-copy">★★ 아쉬움</label>
    
                <input class="rating-input" id="interior-1-copy" type="radio" name="interiorScore" value="1" ${1 == rr.interiorScore ? 'checked' : ''} />
                <label class="rating-label" for="interior-1-copy">★ 실망</label>
            </div>
             <div class="rating-title">건물 별점</div>
            <div class="rating-group">
                <input class="rating-input" id="building-5-copy" type="radio" name="buildingScore" value="5" ${5 == rr.buildingScore ? 'checked' : ''}/>
                <label class="rating-label" for="building-5-copy">★★★★★ 강력 추천</label>
    
                <input class="rating-input" id="building-4-copy" type="radio" name="buildingScore" value="4" ${4 == rr.buildingScore ? 'checked' : ''} />
                <label class="rating-label" for="building-4-copy">★★★★ 추천</label>
    
                <input class="rating-input" id="building-3-copy" type="radio" name="buildingScore" value="3" ${3 == rr.buildingScore ? 'checked' : ''}/>
                <label class="rating-label" for="building-3-copy">★★★ 보통</label>
    
                <input class="rating-input" id="building-2-copy" type="radio" name="buildingScore" value="2" ${2 == rr.buildingScore ? 'checked' : ''}/>
                <label class="rating-label" for="building-2-copy">★★ 아쉬움</label>
    
                <input class="rating-input" id="building-1-copy" type="radio" name="buildingScore" value="1" ${1 == rr.buildingScore ? 'checked' : ''}/>
                <label class="rating-label" for="building-1-copy">★ 실망</label>
            </div>
             <div class="rating-title">교통 별점</div>
            <div class="rating-group">
                <input class="rating-input" id="traffic-5-copy" type="radio" name="trafficScore" value="5" ${5 == rr.trafficScore ? 'checked' : ''}/>
                <label class="rating-label" for="traffic-5-copy">★★★★★ 강력 추천</label>
    
                <input class="rating-input" id="traffic-4-copy" type="radio" name="trafficScore" value="4" ${4 == rr.trafficScore ? 'checked' : ''}/>
                <label class="rating-label" for="traffic-4-copy">★★★★ 추천</label>
    
                <input class="rating-input" id="traffic-3-copy" type="radio" name="trafficScore" value="3" ${3 == rr.trafficScore ? 'checked' : ''}/>
                <label class="rating-label" for="traffic-3-copy">★★★ 보통</label>
    
                <input class="rating-input" id="traffic-2-copy" type="radio" name="trafficScore" value="2" ${2 == rr.trafficScore ? 'checked' : ''}/>
                <label class="rating-label" for="traffic-2-copy">★★ 아쉬움</label>
    
                <input class="rating-input" id="traffic-1-copy" type="radio" name="trafficScore" value="1" ${1 == rr.trafficScore ? 'checked' : ''}/>
                <label class="rating-label" for="traffic-1-copy">★ 실망</label>
            </div>
             <div class="rating-title">치안 별점</div>
            <div class="rating-group">
                <input class="rating-input" id="safety-5-copy" type="radio" name="safetyScore" value="5" ${5 == rr.safetyScore ? 'checked' : ''}/>
                <label class="rating-label" for="safety-5-copy">★★★★★ 강력 추천</label>
    
                <input class="rating-input" id="safety-4-copy" type="radio" name="safetyScore" value="4" ${4 == rr.safetyScore ? 'checked' : ''}/>
                <label class="rating-label" for="safety-4-copy">★★★★ 추천</label>
    
                <input class="rating-input" id="safety-3-copy" type="radio" name="safetyScore" value="3" ${3 == rr.safetyScore ? 'checked' : ''}/>
                <label class="rating-label" for="safety-3-copy">★★★ 보통</label>
    
                <input class="rating-input" id="safety-2-copy" type="radio" name="safetyScore" value="2" ${2 == rr.safetyScore ? 'checked' : ''}/>
                <label class="rating-label" for="safety2-copy">★★ 아쉬움</label>
    
                <input class="rating-input" id="safety-1-copy" type="radio" name="safetyScore" value="1"${1 == rr.safetyScore ? 'checked' : ''} />
                <label class="rating-label" for="safety-1-copy">★ 실망</label>
            </div>
             <div class="rating-title">생활 별점</div>
            <div class="rating-group">
                <input class="rating-input" id="life-5-copy" type="radio" name="lifeScore" value="5" ${5 == rr.lifeScore ? 'checked' : ''}/>
                <label class="rating-label" for="life-5-copy">★★★★★ 강력 추천</label>
    
                <input class="rating-input" id="life-4-copy" type="radio" name="lifeScore" value="4" ${4 == rr.lifeScore ? 'checked' : ''}/>
                <label class="rating-label" for="life-4-copy">★★★★ 추천</label>
    
                <input class="rating-input" id="life-3-copy" type="radio" name="lifeScore" value="3" ${3 == rr.lifeScore ? 'checked' : ''}/>
                <label class="rating-label" for="life-3-copy">★★★ 보통</label>
    
                <input class="rating-input" id="life-2-copy" type="radio" name="lifeScore" value="2" ${2 == rr.lifeScore ? 'checked' : ''}/>
                <label class="rating-label" for="life-2-copy">★★ 아쉬움</label>
    
                <input class="rating-input" id="life-1-copy" type="radio" name="lifeScore" value="1"${1 == rr.lifeScore ? 'checked' : ''} />
                <label class="rating-label" for="life-1-copy">★ 실망</label>
            </div>
             <div class="rating-title">총점</div>
            <div class="rating-group">
                <input class="rating-input" id="total-5-copy" type="radio" name="total" value="5" ${5 == rr.total ? 'checked' : ''}/>
                <label class="rating-label" for="total-5-copy">★★★★★ 강력 추천</label>
    
                <input class="rating-input" id="total-4-copy" type="radio" name="total" value="4" ${4 == rr.total ? 'checked' : ''}/>
                <label class="rating-label" for="total-4-copy">★★★★ 추천</label>
    
                <input class="rating-input" id="total-3-copy" type="radio" name="total" value="3" ${3 == rr.total ? 'checked' : ''}/>
                <label class="rating-label" for="total-3-copy">★★★ 보통</label>
    
                <input class="rating-input" id="total-2-copy" type="radio" name="total" value="2" ${2 == rr.total ? 'checked' : ''}/>
                <label class="rating-label" for="total-2-copy">★★ 아쉬움</label>
    
                <input class="rating-input" id="total-1-copy" type="radio" name="total" value="1" ${1 == rr.total ? 'checked' : ''}/>
                <label class="rating-label" for="total-1-copy">★ 실망</label>
            </div>
            
            <div class="rating-title">거주시기</div>
            <div class="type-group">
                <select name="rePeriod">
                	<option value="2023년까지" ${'2023년까지' == rr.rePeriod ? 'selected' : ''}>2023년까지</option>
                	<option value="2022년까지" ${'2022년까지' == rr.rePeriod ? 'selected' : ''}>2022년까지</option>
                	<option value="2021년까지" ${'2021년까지' == rr.rePeriod ? 'selected' : ''}>2021년까지</option>
                	<option value="2020년까지" ${'2020년까지' == rr.rePeriod ? 'selected' : ''}>2020년까지</option>
                	<option value="2019년까지" ${'2019년까지' == rr.rePeriod ? 'selected' : ''}>2019년까지</option>
                </select>
            </div>
            <div class="rating-title">거주층</div>
            <div class="type-group">
              <select name="reFloor">
                	<option value="고층" ${'고층' == rr.reFloor ? 'selected' : ''}>고층</option>
                	<option value="중층" ${'중층' == rr.reFloor ? 'selected' : ''}>중층</option>
                	<option value="저층" ${'저층' == rr.reFloor ? 'selected' : ''}>저층</option>
               
                </select>
            </div>
        </div>
            <div class="mb-4">
            
            <div class="text-label">장점 키워드 선택(최대 3개)</div>
<div class="advantages" id="ad">
   <button type="button" id="option1" name=keywordNo class="keyword-button" data-value="1">주차</button>
  <button type="button" id="option2" name=keywordNo class="keyword-button" data-value="2">대중교통</button>
<button type="button" id="option3" name=keywordNo class="keyword-button" data-value="3">공원산책</button>
   <button type="button" id="option4" name=keywordNo class="keyword-button" data-value="4">치안</button>
  <button type="button" id="option5" name=keywordNo class="keyword-button" data-value="5">분리수거</button>
<button type="button" id="option6" name=keywordNo class="keyword-button" data-value="6">반려동물 키우기</button>
 <button type="button" id="option7" name=keywordNo class="keyword-button" data-value="7">방음</button>
  <button type="button" id="option8" name=keywordNo class="keyword-button" data-value="8">엘레베이터</button>
<button type="button" id="option9" name=keywordNo class="keyword-button" data-value="9">상가</button>
<button type="button" id="option10" name=keywordNo class="keyword-button" data-value="10">학교/학원</button>

</div>

            
         
          <div class="text-label">장점</div>
           <span class="length">
                            <span class="comment_length">0</span>
                            / 100
                        </span>
          <textarea class="comment-content" cols="160" rows="7" style="resize: none; width:1150px;" name="reAdContent" id="reAdContent" placeholder="장점을 작성해주세요.">${rr.reAdContent }</textarea>
		<div id="exampleText" class="example-text"></div>


        
         <div class="text-label">단점 키워드 선택(최대 3개)</div>
<div class="disadvantages" id="dis">
   <button type="button" id="option11" name=keywordNo class="keyword-button" data-value="11">주차</button>
  <button type="button" id="option12" name=keywordNo class="keyword-button" data-value="12">대중교통</button>
<button type="button" id="option13" name=keywordNo class="keyword-button" data-value="13">공원산책</button>
   <button type="button" id="option14" name=keywordNo class="keyword-button" data-value="14">치안</button>
  <button type="button" id="option15" name=keywordNo class="keyword-button" data-value="15">분리수거</button>
<button type="button" id="option16" name=keywordNo class="keyword-button" data-value="16">반려동물 키우기</button>
 <button type="button" id="option17" name=keywordNo class="keyword-button" data-value="17">방음</button>
  <button type="button" id="option18" name=keywordNo class="keyword-button" data-value="18">엘레베이터</button>
<button type="button" id="option19" name=keywordNo class="keyword-button" data-value="19">상가</button>
<button type="button" id="option20" name=keywordNo class="keyword-button" data-value="20">학교/학원</button>

  </div>

        
           <div class="mb-4">
          <div class="text-label">단점</div>
           <span class="length">
                            <span class="comment_lengths">0</span>
                            / 100
                        </span>
          <textarea  class="comment-contents" cols="160" rows="7" style="resize: none; width:1150px;" name="reDisContent" id="reDisContent" placeholder="단점을 작성해주세요.">${rr.reDisContent }</textarea>
          <div id="example" class="example-text"></div>
          
        </div>
        
       

<div class="mb-4">
    <div class="text-label">사진 추가</div>
    <input type="file" name="reviewImage" id="reviewImage" accept="image/*">
    현재 업로드된 파일 :
     <a href="${rr.reviewImg.originName }">${rr.reviewImg.originName }</a>
                            <input type="hidden" name="reReviewdNo" value=${rr.reReviewNo } >
                            <input type="hidden" name="changeName" value="${rr.reviewImg.changeName }">
                            <input type="hidden" name="originName" value="${rr.reviewImg.changeName }">
    <div id="imagePreview"></div>
</div>
        
        
       
      
      
      <br>
      <div class="alert" style="background-color:rgb(254 226 226 ); color:red;"  role="alert">
        <p class="font-bold" style="color:#B91C1C; font-weight: 700;">경고 제목</p>
        <p style="color:#B91C1C;">게시물 운영 원칙에 어긋나다고 판단되는 게시물은 상단 동물의이 블라인드 처리될 수 있습니다.</p>
        <p style="color:#B91C1C;">특히 타인의 명예 훼손 및 어떠한 목적으로든 스팸, 오보 등 사회적 물의를 일으키는 경우 문의사항으로 신고 접수가 가능합니다.</p>
        <p style="color:#B91C1C;">사용자 경고에도 불구하고 문제 게시물을 계속해서 올리는 이용자는 게시판 접근 차단이 제한됩니다.</p>
    </div>
          <input type="hidden" name="prosKeywords" id="prosKeywords" value="">
<input type="hidden" name="consKeywords" id="consKeywords" value="">
       <input class="rebutton" value="수정하기" type="submit">
      
        

                </form>
    
<script>


function updateKeywords() {
    var prosSelected = [${rr.positive}];
    var consSelected = [${rr.negative}];

    // Assuming 'advantages' is the class for pros keywords
    document.querySelectorAll('.advantages .keyword-button.selected').forEach(function(button) {
        prosSelected.push(button.getAttribute('data-value'));
    });
    // Assuming 'disadvantages' is the class for cons keywords
    document.querySelectorAll('.disadvantages .keyword-button.selected').forEach(function(button) {
        consSelected.push(button.getAttribute('data-value'));
    });

    document.getElementById('prosKeywords').value = prosSelected.join(',');
    document.getElementById('consKeywords').value = consSelected.join(',');
    
    console.log(prosSelected)
    console.log(consSelected)
}

updateKeywords();



var selectedAdvantages = [${rr.positive}];
var selectedDisadvantages = [${rr.negative}];


console.log(${rr.positive});
console.log(${rr.negative});

// 선택된 장점 키워드 버튼에 'selected' 클래스 추가
selectedAdvantages.forEach(function(value) {
    var button = document.querySelector('.advantages .keyword-button[data-value="' + value + '"]');
    if (button) {
        button.classList.add('selected');
    }
});

// 선택된 단점 키워드 버튼에 'selected' 클래스 추가
selectedDisadvantages.forEach(function(value) {
    var button = document.querySelector('.disadvantages .keyword-button[data-value="' + value + '"]');
    if (button) {
        button.classList.add('selected');
    }
});


document.addEventListener('DOMContentLoaded', function() {
    // 장점 키워드 처리
    const advantageButtons = document.querySelectorAll('.advantages .keyword-button');
    advantageButtons.forEach(function(button) {
        button.addEventListener('click', function() {
            const selectedCount = document.querySelectorAll('.advantages .keyword-button.selected').length;
            if (!this.classList.contains('selected') && selectedCount >= 3) {
                alert('장점 키워드는 최대 3개까지만 선택할 수 있습니다.');
                return;
            }
            this.classList.toggle('selected');
            console.log('선택된 장점 키워드 번호: ' + this.getAttribute('data-value'));
        	updateKeywords();
           
        });
    });

    // 단점 키워드 처리
    const disadvantageButtons = document.querySelectorAll('.disadvantages .keyword-button');
    disadvantageButtons.forEach(function(button) {
        button.addEventListener('click', function() {
            const selectedCount = document.querySelectorAll('.disadvantages .keyword-button.selected').length;
            if (!this.classList.contains('selected') && selectedCount >= 3) {
                alert('단점 키워드는 최대 3개까지만 선택할 수 있습니다.');
                return;
            }
            this.classList.toggle('selected');
            console.log('선택된 단점 키워드 번호: ' + this.getAttribute('data-value'));
        	updateKeywords();
            
        });
    });
});

function updateSelectedKeywords(selector, inputId) {
    const selectedKeywords = [];
    document.querySelectorAll(selector + ' .keyword-button.selected').forEach(function(button) {
        selectedKeywords.push(button.getAttribute('data-value'));
    });
    document.getElementById(inputId).value = selectedKeywords.join(',');
}

</script>




<script>
    var examples = [
        "예시)층간소음 한 번도 겪은 적 없어요! 방음이 좋아요!",
        "예시)공간이 분리되어있어 혼자 살기 좋아요!",
        "예시)이중창이라 단열 잘 되고 환기도 좋습니다!",
        "예시)신축이라 쾌적하고 주차공간이 항상 넉넉합니다!",
        "예시)내부 수납 공간이 많아서 공간활용이 좋아요!"
    ];
    
    var currentExampleIndex = 0;

    function rotateExample() {
        document.getElementById('exampleText').innerText = examples[currentExampleIndex];
        currentExampleIndex = (currentExampleIndex + 1) % examples.length;
    }

    // 3초마다 예시 내용 변경
    setInterval(rotateExample, 3000);
</script>

 <script>
    var examples = [
        "예시)층간소음이 심해요ㅠㅠ",
        "예시)지하철역이 멀고 버스는 배차 시간이 길어요ㅠㅠ",
        "예시)주차공간 부족으로 이중주차 해야합니다ㅠㅠ",
        "예시)분리수거장이 멀고 주 1회 배출이라 불편해요",
        "예시)습하고 집에 벌레가 자주나와요"
    ];
    
    var currentExampleIndex = 0;

    function rotateExample() {
        document.getElementById('example').innerText = examples[currentExampleIndex];
        currentExampleIndex = (currentExampleIndex + 1) % examples.length;
    }

    // 3초마다 예시 내용 변경
    setInterval(rotateExample, 3000);
</script>

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
        
         <script>
        $(document).ready(function() {
            $(".comment-contents").keyup(function(e) {
                var content = $(this).val();
                $(".comment_lengths").text(content.length);

                if (content.length > 100) {
                    $(this).val($(this).val().substring(0, 100));
                    alert("글자수는 100자까지 입력가능합니다.");
                }
                
               
            });
        });
        </script>
  
  <script>
$(document).ready(function() {
	$("input[type='checkbox']").on("click",function(){
        var count = $("input:checked[type='checkbox']").length;

        if(count>3){
          $(this).prop("checked",false);
          alert("카테고리는 최대 3개까지 선택할 수 있습니다");
        }
})

});
</script>
  
  







    
    <br>
  
    
    <%@ include file="../common/footer.jsp"%>
  </body>
</html>
