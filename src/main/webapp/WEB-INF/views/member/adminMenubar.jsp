<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@page import="com.kh.dungjip.member.model.vo.Member"%>
<!DOCTYPE html>
<html lang="ko">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Admin Menu</title>
   
    <style>
        body {
            font-family: 'Noto Sans KR', sans-serif;
            margin: 0;
            padding: 0;
            background-color: #f4f6f8;
        }

        .mypagecontainer {
            display: flex;
            min-height: 100vh;
        }

        .sidebar {
            background-color: #fff;
            width: 400px;
            padding: 20px;
        }

        .headerLeft {
            line-height: 60px;
        }

        .profile {
            text-align: center;
            padding-bottom: 20px;
            border-bottom: 1px solid #ddd;
        }

        .profile img {
            border-radius: 50%;
            margin-bottom: 10px;
        }

        .profile h2 {
            font-size: 24px;
            color: #333;
        }

        .profile { position: relative; }
        .profile img { width: 100px; height: 100px; }
        .pic { position: relative; display: inline-block; }

        /* 드롭다운 내용을 숨김 */
        .dropdown-content {
            display: none;
            position: relative;
            min-width: 160px;
            z-index: 1;
        }

        /* 마우스를 올렸을 때 드롭다운 내용을 보이도록 함 */
        .dropdown:hover .dropdown-content {
            display: block;
        }
    </style>
</head>
<body>
	
    <aside class="sidebar" style="margin-left: 40px;">
        <div class="profile" style="margin-top: 26px;">
            <c:choose>
                <c:when test="${not empty loginUser.userNickName }">
                    <h2>${loginUser.userNickName }</h2>
                </c:when>	
                <c:otherwise>
                    <h2>${loginUser.userName }</h2>
                </c:otherwise>
            </c:choose>
            <p>${loginUser.email }</p>
            <!-- Additional content can be added here -->
        </div>
        <div id="headerLeft" class="headerLeft" style="margin: 10px 10px;">
            <ul class="leftmenu" style="list-style: none; margin-top: 20px; padding: 0;">
                <li><a href="http://localhost:9999/dungjip/admin/list" class="menuitem" style="font-size: 15px; color: #929292;">회원관리</a></li>
                <li><a href="http://localhost:9999/dungjip/admin/estateList" class="menuitem" style="font-size: 15px; color: #929292;">중개인관리</a></li>
                <li><a href="http://localhost:9999/dungjip/admin/reportList" class="menuitem" style="font-size: 15px; color: #929292;">신고관리</a></li>
                <li><a href="http://localhost:9999/dungjip/admin/houseList" class="menuitem" style="font-size: 15px; color: #929292;">매물관리</a></li>
            </ul>
        </div>
    </aside>
</body>
</html>
