<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@page import="com.kh.dungjip.member.model.vo.Member"%>  
<%@ include file="../common/sweetAlert.jsp" %>  
<!DOCTYPE html>
<html lang="ko">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>부동산 관리 페이지</title>
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

	<%@ include file="/WEB-INF/views/member/adminMenubar.jsp" %>

        <section class="main-content" style="width:100%; margin: 70px 0 70px 50px; margin-left:4%;">

            <div class="card" style="width: 93%; margin-bottom:50px;">

                <h3>부동산 관리</h3>
                <!-- 아코디언 게시판 시작 -->
                <ul class="card_row" style="color: #333; list-style: none; padding: 0 20px 20px 20px;">
                    <c:forEach var="estate" items="${estateList}">
                        <div class="accordion">
                            <div class="accordion-header" onclick="toggleAccordion(${estate.esNo})">
                                부동산 이름 : ${estate.esName} 대표자명 : ${estate.esCeo}
                            </div>
                            <div class="accordion-body" id="detailContent-${estate.esNo}">
                                <p>전화 번호: ${estate.esPhone}</p>
                                <p>사업자 번호: ${estate.esNum}</p>
                                <p>중개사 등록 번호: ${estate.esRegisterNum}</p>
                                <p>중개사 주소: ${estate.esAddress}</p>
                                <p id="status-${estate.esNo}">활동상태 : ${estate.esStatus}</p>
                                <button class="btn-stop" onclick="banEstate(${estate.esNo})">활동 정지</button>
                                <button class="btn-release" onclick="permitEstate(${estate.esNo})">활동 허용</button>
                            </div>
                        </div>
                    </c:forEach>
                </ul>
            </div>

        </section>

    </div>


    <script>
	    function toggleAccordion(esNo) {
	        var content = $("#detailContent-" + esNo);
	        var status = $("#status-" + esNo).text().trim();
	        var btnStop = $("#detailContent-" + esNo + " .btn-stop");
	        var btnRelease = $("#detailContent-" + esNo + " .btn-release");
	
	        if (content.is(":visible")) {
	            content.slideUp("slow");
	        } else {
	            content.slideDown("slow");
	        }
	
	        if (status === '활동상태 : Y') {
	            btnStop.show();
	            btnRelease.hide();
	        } else {
	            btnStop.hide();
	            btnRelease.show();
	        }
	    }

        function banEstate(esNo) {
            // AJAX 호출을 통해 banEstate 엔드포인트와 상호 작용
            $.ajax({
                type: "POST",
                url: "/dungjip/admin/banEstate",
                contentType: "application/json",
                data: JSON.stringify({ esNo: esNo }),
                success: function(response) {
                    // 서버 응답에 따라 버튼 및 회원 상태 업데이트
                    if (response === "Success") {
                    	showSuccessThen("성공","중개인 활동이 정지되었습니다.","확인");
                    } else {
                        alert("부동산이 이미 정지 상태입니다.");
                    }
                },
                error: function() {
                    alert("에러");
                }
            });
        }

        function permitEstate(esNo) {
            // AJAX 호출을 통해 permitMember 엔드포인트와 상호 작용
            $.ajax({
                type: "POST",
                url: "/dungjip/admin/permitEstate",
                contentType: "application/json",
                data: JSON.stringify({ esNo: esNo }),
                success: function(response) {
                    // 서버 응답에 따라 버튼 및 회원 상태 업데이트
                    if (response === "Success") {
                    	showSuccessThen("성공","중개인 활동이 허용되었습니다.","확인");
                    } else {
                        alert("부동산이 정지 상태가 아닙니다.");
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