<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@page import="com.kh.dungjip.member.model.vo.Member"%>    
<%@ include file="../common/sweetAlert.jsp" %>
<!DOCTYPE html>
<html lang="ko">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>유저관리 페이지</title>
    <style>
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
    </style>
</head>
<body>
	<%@ include file="../common/header.jsp" %>

    <div class="container" style="display: flex; width: 67%;">
        <%@ include file="adminMenubar.jsp" %>
        <section class="main-content" style="width:100%; margin: 70px 0 70px 50px; margin-left:4%;">
            <div class="card" style="width: 93%; margin-bottom:50px;">
                <h3>회원관리</h3>
                <!-- 아코디언 게시판 시작 -->
                <ul class="card_row" style="color: #333; list-style: none; padding: 0 20px 20px 20px;">
                    <c:forEach var="member" items="${memberList}">
                        <c:if test="${member.userType != '관리자'}">
                            <div class="accordion">
                                <div class="accordion-header" onclick="toggleAccordion(${member.userNo})">
                                    이름 : ${member.userName} 아이디 : ${member.userId}
                                </div>
                                <div class="accordion-body" id="detailContent-${member.userNo}">
                                    <p>유저 타입: ${member.userType}</p>
                                    <p>닉네임: ${member.userNickName}</p>
                                    <p>나이: ${member.age}</p>
                                    <p>성별: ${member.gender}</p>
                                    <p>이메일: ${member.email}</p>
                                    <p>핸드폰: ${member.phone}</p>
                                    <p>주소: ${member.address}</p>
                                    <p id="status-${member.userNo}">회원상태 : ${member.status}</p>
                                    <button class="btn-stop" onclick="banMember(${member.userNo})">회원 정지</button>
                                    <button class="btn-release" onclick="permitMember(${member.userNo})">정지 해제</button>
                                </div>
                            </div>
                        </c:if>
                    </c:forEach>
                </ul>
            </div>
        </section>
     </div>

     
     
     <script>
        function toggleAccordion(userNo) {
            var content = $("#detailContent-" + userNo);
            content.slideToggle();

            var status = $("#status-" + userNo).text();
            var btnStop = $("#detailContent-" + userNo + " .btn-stop");
            var btnRelease = $("#detailContent-" + userNo + " .btn-release");

            if (status === '회원상태 : Y') {
                btnStop.show();
                btnRelease.hide();
            } else {
                btnStop.hide();
                btnRelease.show();
            }
        }

    function banMember(userNo) {
        // AJAX 호출을 통해 banMember 엔드포인트와 상호 작용
        $.ajax({
            type: "POST",
            url: "/dungjip/admin/banMember",
            contentType: "application/json",
            data: JSON.stringify({ userNo: userNo }),
            success: function(response) {
                // 서버 응답에 따라 버튼 및 회원 상태 업데이트
                if (response === "Success") {
                	showSuccessThen("성공","회원이 정지되었습니다.","확인");
                } else {
                    alert("회원이 이미 정지 상태입니다.");
                }
            },
            error: function() {
                alert("에러");
            }
        });
    }

    function permitMember(userNo) {
        // AJAX 호출을 통해 permitMember 엔드포인트와 상호 작용
        $.ajax({
            type: "POST",
            url: "/dungjip/admin/permitMember",
            contentType: "application/json",
            data: JSON.stringify({ userNo: userNo }),
            success: function(response) {
                // 서버 응답에 따라 버튼 및 회원 상태 업데이트
                if (response === "Success") {
                	showSuccessThen("성공","정지가 해제되었습니다.","확인");
                } else {
                    alert("회원이 정지 상태가 아닙니다.");
                }
            },
            error: function() {
            	alert("에러");
            }
        });
    }
</script>
     
</body>
</html>
