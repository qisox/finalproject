<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@page import="com.kh.dungjip.member.model.vo.Member"%>
<%@ include file="../common/sweetAlert.jsp" %>
<!DOCTYPE html>
<html lang="ko">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>부동산 신고 관리 페이지</title>
    <style>
        /* 스타일 코드는 여기에 작성 */

        .card {			
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

        .item_text {
            padding: 20px 0 10px 0px;
            line-height: 30px;
            font-size: 14px;
            letter-spacing: -0.8;
        }

        .btn_edit {
            float: right;
            padding: 2px 9px 3px 10px;
            color: #7b8994;
            border: none;
        }

        .accordion-header {
            cursor: pointer;
            padding: 1rem;
            background-color: #fff;
            border: 1px solid #ddd;
            border-bottom: none;
        }

        .accordion-body {
            display: none;
            padding: 1rem;
            border: 1px solid #ddd;
            background-color: #fff;
        }

        .chat-message {
            border-bottom: 1px solid #ddd;
            padding: 5px;
        }

        .modal {
            display: none;
            position: fixed;
            z-index: 1;
            left: 0;
            top: 0;
            width: 100%;
            height: 100%;
            overflow: auto;
            background-color: rgba(0, 0, 0, 0.5);
            padding-top: 60px;
        }

        .modal-content {
            background-color: #fefefe;
            margin: 5% auto;
            padding: 20px;
            border: 1px solid #888;
            width: 80%;
        }

        .modal-buttons {
            text-align: center;
            margin-top: 20px;
        }

        .closeModalBtn {
            background-color: #007bff;
            color: white;
            padding: 10px 15px;
            border: none;
            border-radius: 5px;
            cursor: pointer;
        }

        .closeModalBtn:hover {
            background-color: #0056b3;
        }

        #approveBtn,
        #cancelBtn {
            background-color: #007bff;
            color: white;
            padding: 10px 15px;
            border: none;
            border-radius: 5px;
            cursor: pointer;
            margin-right: 10px;
        }

        #approveBtn:hover,
        #cancelBtn:hover {
            background-color: #0056b3;
        }
        
        .foldBtn {
            float: right; /* 우측 정렬 */
            margin-right: 10px; /* 우측 여백 설정 */
        }
    </style>
</head>
<body>

    <%@ include file="../common/header.jsp" %>

    <div class="container" style="display: flex; width: 67%;">
        <%@ include file="/WEB-INF/views/member/adminMenubar.jsp" %>
        <section class="main-content" style="width:100%; margin: 70px 0 70px 50px; margin-left:4%;">
            <div class="card" style="width: 93%; margin-bottom:50px;">
                <h3>신고 관리</h3>
                <!-- 아코디언 게시판 시작 -->
                <ul class="card_row" style="color: #333; list-style: none; padding: 0 20px 20px 20px;">
                    <c:forEach var="reportEstate" items="${reportList}">
                        <div class="accordion">
                            <div class="accordion-header">
                                피신고자 : ${reportEstate.estate.userName}
                            </div>
                            <div class="accordion-body">
                                <p>신고자 : ${reportEstate.user.userName} </p>
                                <p>신고사유 : ${reportEstate.reportReason }</p>
                                <!-- 채팅 내역을 불러오는 버튼 -->
                                <button class="loadChatHistoryBtn" id="loadChatHistoryBtn" value="${reportEstate.chatRoomNo}">상세보기</button>
                                <!-- 채팅 내역을 출력할 공간 -->
                                <div class="chatHistoryContent"></div>
                                <!-- 승인, 취소 버튼 -->
                                <div class="chatHistoryButtons">
                                    <button class="approveBtn" value="${reportEstate.chatRoomNo}">승인</button>
                                    <button class="cancelBtn" value="${reportEstate.chatRoomNo}">취소</button>
                                </div>
                            </div>
                        </div>
                    </c:forEach>
                </ul>
            </div>
        </section>
    </div>

<script>
	$(document).ready(function () {

        $(".approveBtn, .cancelBtn").hide();
	    $(".accordion-header").click(function () {
	        var detailContent = $(this).next(".accordion-body");
	        var toggleButton = $(this).find(".loadChatHistoryBtn");
	        var chatHistoryContent = $(this).find(".chatHistoryContent");

	        $(".accordion-body").not(detailContent).slideUp(function () {
	            // 다른 아코디언 닫힘 완료 후에 실행되는 콜백 함수
	            toggleButton.removeClass("active").html("상세보기");
	        });

	        // 채팅 내역 콘텐츠의 가시성에 따라 토글
	        detailContent.slideToggle(function () {
	            // 채팅 내역 콘텐츠의 토글 완료 후에 실행되는 콜백 함수
            var isContentVisible = detailContent.is(":visible");
            toggleButton.toggleClass("active", isContentVisible).html(isContentVisible ? "접기" : "상세보기");


	        
            // 새로 추가된 부분
			// 수정된 부분
            if (isContentVisible) {
                toggleButton.html("접기");
            } else {
                toggleButton.html("상세보기");
            }

            if (isContentVisible && chatHistoryContent.children().length > 0) {
                $(".approveBtn, .cancelBtn").show();
            }
	        });
	    });
	
	    $(".loadChatHistoryBtn").click(function () {
	        var chatRoomNo = $(this).val();
	        var currentButton = $(this);
	
	        // 기존 채팅 내역 및 버튼 삭제
	        $(".chat-history-content").remove();
	        $(".approveBtn, .cancelBtn").hide();
	        
	        var toggleButton = document.getElementById("loadChatHistoryBtn");
	        // Ajax를 이용하여 채팅 내역을 불러오기
	        if(toggleButton.innerText !== "접기"){
	        	
	        $.ajax({
	            type: "GET",
	            url: "/dungjip/admin/chatHistory",
	            data: { chatRoomNo: chatRoomNo },
	            success: function (chatHistory) {
	                var chatHistoryContent = $("<div class='chat-history-content'></div>");
	
	                if (Array.isArray(chatHistory)) {
	                    chatHistory.forEach(function (message) {
	                        var formattedMessage = formatChatMessage(message);
	                        var messageDiv = $("<div class='chat-message'></div>");
	                        messageDiv.text(formattedMessage);
	                        chatHistoryContent.append(messageDiv);
	                    });
	                } else {
	                    var messageDiv = $("<div class='chat-message'></div>");
	                    messageDiv.text("Invalid chat history data");
	                    chatHistoryContent.append(messageDiv);
	                }
	
	                // 현재 클릭한 아코디언의 바로 아래에 추가
	                currentButton.siblings(".chatHistoryContent").append(chatHistoryContent);
	
	                // 상세보기를 눌렀을 때 나오는 승인, 취소버튼에 클릭 이벤트 추가
	                $(".approveBtn, .cancelBtn").show();
	                if($(".chat-history-content").length == 1){
		                toggleButton.innerText = "접기"
	                }
	                
	            },
	            error: function (xhr, status, error) {
	                console.error("Error fetching chat history:", error);
	            }
	        });
	        } else {
	        	toggleButton.innerText = "상세보기"
	        }
	    });
	
	    function formatChatMessage(message) {
	        return message.sendMessageTime + " - " + message.userName + " : " + message.contentMessage;
	    }
	
	    $(".approveBtn, .cancelBtn").click(function () {
	        var chatRoomNo = $(this).val();
	        var currentButton = $(this);
	
	        if (currentButton.hasClass("approveBtn")) {
	            handleApproval(chatRoomNo);
	        } else if (currentButton.hasClass("cancelBtn")) {
	            handleCancellation(chatRoomNo);
	        }
	    });
	
	    function handleApproval(chatRoomNo) {
	        $.ajax({
	            type: "POST",
	            url: "/dungjip/admin/approveReport",
	            data: { chatRoomNo: chatRoomNo },
	            success: function () {
	                showSuccessThen("성공", "신고가 승인되었습니다.", "확인");
	            },
	            error: function (xhr, status, error) {
	                console.error("Error approving report:", error);
	            }
	        });
	    }
	
	    function handleCancellation(chatRoomNo) {
	        $.ajax({
	            type: "POST",
	            url: "/dungjip/admin/cancelReport",
	            data: { chatRoomNo: chatRoomNo },
	            success: function () {
	                showSuccessThen("성공", "신고가 취소되었습니다.", "확인");
	            },
	            error: function (xhr, status, error) {
	                console.error("Error canceling report:", error);
	            }
	        });
	    }
	});
</script>


</body>
</html>