<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="../common/sweetAlert.jsp" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Subscription</title>
    <style>
        body {
            font-family: 'Arial', sans-serif;
            padding: 20px;
            background-color: #f4f4f4;
        }
        .container {
            background-color: #fff;
            border-radius: 8px;
            box-shadow: 0 2px 4px rgba(0, 0, 0, 0.1);
            padding: 20px;
            max-width: 600px;
            margin: auto;
        }
        .title {
            font-size: 24px;
            color: #333;
            text-align: center;
            margin-bottom: 30px;
        }
        .subscription-fee {
            text-align: center;
            font-size: 18px;
            margin-bottom: 20px;
        }
        .billing-info {
            background-color: #ecf0f1;
            border-radius: 4px;
            padding: 10px 15px;
            margin-bottom: 20px;
            display: flex;
            justify-content: space-between;
        }
        .checkmark {
            color: green;
            margin-right: 5px;
        }
        .features-list {
            list-style: none;
            padding: 0;
            margin-bottom: 30px;
        }
        .features-list li {
            padding: 10px 0;
            border-top: 1px solid #ddd;
            font-size: 16px;
            color: #666;
        }
        .features-list li:first-child {
            border-top: none;
        }
        .subscribe-button {
            background-color: #cca427;
            color: white;
            border: none;
            border-radius: 20px;
            padding: 15px 30px;
            font-size: 18px;
            display: block;
            width: 100%;
            cursor: pointer;
            box-shadow: 0 4px 6px rgba(0, 0, 0, 0.1);
            margin-bottom: 20px;
        }
        .note {
            font-size: 14px;
            color: #999;
            text-align: center;
        }
        
        #info-right {
        	display: flex;
        	flex-direction: column;
        	align-items: center;
        }
        
        #info-imgs {
        	margin-top: 10px;
        }
        
        #info-imgs img {
        	width: 75px;
        	height: 75px;
        	border: none;
        	transition: background 0.1s ease;
        }
        
        #info-imgs img.active {
        	border: 3px solid red;
        	border-radius: 10px;
        }
        
    </style>
</head>
<body>
<script src="http://code.jquery.com/jquery-latest.min.js"></script>
<script type="text/javascript"	src="https://cdn.iamport.kr/js/iamport.payment-1.2.0.js"></script>
<div class="container">
    <div class="title">중개자PLUS 년간 이용권</div>
    <div class="subscription-fee">년 100원 정기결제</div>
    <div class="billing-info">
	    <div class="info-left">
	        <strong>다음 결제 예정일</strong>
	        <div>2024.01.19.</div>
	        <div>카드 갱신결제</div>
	    </div>
	    <div id="info-right">
	        <strong>결제 방식 선택</strong>
	        <div id="info-imgs">
		    	<img class="active" id="kakaopay" src="resources/img/icons/kakao-talk.png">
		    	<img class="" id="html5_inicis" src="resources/img/icons/debit-card.png">
	        </div>
	    </div>
    </div>
    <ul class="features-list">
        <li><span class="checkmark">✔</span> (플랜) 본인 소유의 집 우선추천</li>
        <li><span class="checkmark">✔</span> (플랜) 채팅 이모지 사용가능</li>
        <li><span class="checkmark">✔</span> (플랜) 구독 마크 제공</li>
    </ul>
    <button class="subscribe-button" id="pay-btn">모두 동의 후 결제하기</button>
    <div class="note">주문 내용을 확인하였으며, 정보 제공 등에 동의합니다.</div>
</div>

<script>
	var imgs = document.querySelectorAll('#info-imgs img');
	
	function removeActiveClasses() {
		imgs.forEach(function(item) {
            item.classList.remove('active');
        });
    }

    // Function to add active class to the clicked item
    function setActiveClass(clickedItem) {
        removeActiveClasses();
        clickedItem.classList.add('active');
    }

    // Add click event to all menu items
    imgs.forEach(function(item) {
        item.addEventListener('click', function() {
            setActiveClass(item);
        });
    });
</script>

<script>
	var IMP = window.IMP;
	IMP.init('imp18563871');
	
	var userNo = "${loginUser.userNo}";
	var userName = "${loginUser.userName}";
	var email = "${loginUser.email}";
	var address = "${loginUser.address}";
	var phone = "${loginUser.phone}";
	var result = phone.replace(/(\d{3})(\d{3,4})(\d{4})/, '$1-$2-$3');
	
	$('#pay-btn').click(function(){
		const activeImg = document.querySelector('#info-imgs img.active');
		
		IMP.request_pay({
			pg: activeImg.id,
			merchant_uid: 'merchant_' + new Date().getTime(),
			name: 'DungJip',
			amount: 100,
			buyer_email: email,
			buyer_name: userName,
			buyer_tel: phone,
            buyer_addr: address,
            buyer_postcode: '123-456'
		}, function(rsp){
			var msg;
			if(rsp.success){
				msg = 'success';
				console.log("success to pay");
				
				$.ajax({
					url: 'subscribe.pay',
					data:{
						userNo: userNo
					},
					success: function(result){
						console.log("success");
					},
					error: function(){
						console.log("통신 에러");
					}
				});
			} else {
				msg = 'failed to pay';
			}
			
			if(msg == 'success'){
				showConfirm("구독에 성공하셨습니다","/dungjip");
			} else {
				showError("오류", msg, "확인");
			}
		})
	})
</script>

</body>
</html>