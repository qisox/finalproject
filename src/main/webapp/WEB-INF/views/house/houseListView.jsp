<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@page import="com.kh.dungjip.member.model.vo.Member"%>
<%@ include file="../common/sweetAlert.jsp" %>
<!DOCTYPE html>
<html lang="ko">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>매물 관리 페이지</title>
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
            width: 20%;
        }

        .modal-buttons {
            text-align: center;
            margin-top: 20px;
        }

        .closeModalBtn:hover {
            background-color: #0056b3;
        }

        #deleteConfirmBtn {
            background-color: #007bff;
            color: white;
            padding: 10px 15px;
            border: none;
            border-radius: 5px;
            cursor: pointer;
            margin-right: 10px;
        }

        #deleteConfirmBtn:hover {
            background-color: #0056b3;
        }

        #cancelDeleteBtn {
            background-color: #ccc;
            color: white;
            padding: 10px 15px;
            border: none;
            border-radius: 5px;
            cursor: pointer;
        }

        #cancelDeleteBtn:hover {
            background-color: #999;
        }
        
        .house-images {
   		display: grid;
    	grid-template-rows: repeat(2, 1fr);
    	grid-template-columns: repeat(2, 1fr);
		}
    </style>
</head>
<body>
    <%@ include file="../common/header.jsp" %>

    <div class="container" style="display: flex; width: 67%;">
        <%@ include file="../member/adminMenubar.jsp" %>
        <section class="main-content" style="width:100%; margin: 70px 0 70px 50px; margin-left:4%;">
            <div class="card" style="width: 93%; margin-bottom:50px;">
                <h3>매물 관리</h3>
                <!-- 아코디언 게시판 시작 -->
                <ul class="card_row" style="color: #333; list-style: none; padding: 0 20px 20px 20px;">
                    <c:forEach var="house" items="${houseList}">
                        <div class="accordion">
                            <div class="accordion-header" onclick="toggleAccordion(${house.houseNo})">
                                집 이름 : ${house.houseName}
                            </div>
                            <div class="accordion-body" id="detailContent-${house.houseNo}">
                                <p>주소: ${house.houseAddress}</p>
                                <!-- 이미지 출력 -->
                                <div class="house-images">
                                    <c:forEach var="img" items="${imgList}">
                                        <c:if test="${img.houseNo eq house.houseNo}">
                                            <div data-thumb="${img.changeName}">
                                                <img src="${pageContext.request.contextPath}/${img.changeName}" style="width:400px;height:200px;"/>
                                            </div>
                                        </c:if>
                                    </c:forEach>
                                </div>
                                <!-- 매물 삭제 버튼 -->
                                <button class="btn-delete" onclick="openDeleteModal(${house.houseNo})">매물 삭제</button>
                            </div>
                        </div>
                    </c:forEach>
                </ul>
            </div>
        </section>
    </div>

    <!-- 매물 삭제 모달 -->
    <div class="modal" id="deleteModal">
        <div class="modal-content">
            <p style="text-align: center;">정말 삭제하시겠습니까?</p>
            <div class="modal-buttons">
                <button id="deleteConfirmBtn" onclick="deleteHouseConfirm()">예</button>
                <button id="cancelDeleteBtn" onclick="closeDeleteModal()">아니오</button>
            </div>
        </div>
    </div>

    <script>
 // 아코디언 토글 함수
    function toggleAccordion(houseNo) {
        var detailContent = document.getElementById("detailContent-" + houseNo);
        detailContent.style.display = (detailContent.style.display === "block") ? "none" : "block";
    }

    // 매물 삭제 모달 열기
    function openDeleteModal(houseNo) {
        var deleteModal = document.getElementById("deleteModal");
        deleteModal.style.display = "block";

        // 삭제할 집 번호를 모달 버튼에 저장
        var deleteConfirmBtn = document.getElementById("deleteConfirmBtn");
        deleteConfirmBtn.setAttribute("data-house-no", houseNo);
    }

    // 매물 삭제 모달 닫기
    function closeDeleteModal() {
        var deleteModal = document.getElementById("deleteModal");
        deleteModal.style.display = "none";
    }

    // 매물 삭제 확인
    function deleteHouseConfirm() {
        var deleteConfirmBtn = document.getElementById("deleteConfirmBtn");
        var houseNo = deleteConfirmBtn.getAttribute("data-house-no");

        // Ajax를 사용하여 삭제 요청 전송
        $.ajax({
            type: "POST",
            url: "/dungjip/admin/deleteHouse",
            contentType: "application/json",
            data: JSON.stringify({ "houseNo": houseNo }),
            success: function (response) {
                if (response === "Success") {
                	showSuccessThen("성공","매물이 삭제되었습니다.","확인");
                } else {
                    alert("글 삭제 실패");
                }
                closeDeleteModal(); // 모달 닫기
            },
            error: function () {
                alert("서버 오류");
                closeDeleteModal(); // 모달 닫기
            }
        });
    }

    </script>

</body>
</html>