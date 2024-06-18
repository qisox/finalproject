<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>

<html class="no-js">

<head>
<meta charset="utf-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<title>문의하기</title>
<style>
body {
	font-family: 'Arial', sans-serif;
	margin: 0;
	padding: 0;
	background-color: #f4f4f4;
}

.form-container {
	width: 90%;
	max-width: 600px;
	margin: 40px auto;
	padding: 20px;
	background: #fff;
	box-shadow: 0 2px 4px rgba(0, 0, 0, 0.1);
}

h2 {
	text-align: center;
}

form {
	display: flex;
	flex-direction: column;
	margin-top: 20px;
}

input[type="text"], input[type="email"], select, textarea {
	margin-bottom: 15px;
	padding: 10px;
	border: 1px solid #ccc;
	border-radius: 4px;
}

.submit-button {
	padding: 10px;
	background-color: rgb(50, 108, 249);
	color: #fff;
	border: none;
	border-radius: 4px;
	cursor: pointer;
}

.submit-button:hover {
	background-color: rgb(88, 128, 229);
}

.submit-button {
	width: 110px;
}

.col-md-12 {
	display: flex;
	justify-content: center;
}

.nav-menu {
	display: flex;
	justify-content: center;
	list-style: none;
	padding: 0;
	background-color: #f4f4f4;
}

.nav-item2 {
	padding: 10px 50px; /* Adjust the padding as necessary */
	margin: 0 10px; /* Space between items */
	border: 1px solid #ddd; /* Border color */
	background-color: #fff; /* Background color for non-active items */
	color:#000;
	cursor: pointer;
}

.nav-item2.active {
	background-color: #000; /* Active item background color */
	color: #fff; /* Active item text color */
}

.nav-item2:hover{
    background-color: #000;
    color: #fff;
}

#enquiryButton{
	background-color: #f1a90e;
	color: white;
	height: 50px;
	width: 90px;
	font-size: 15px;
}

#enquiryButton:hover{
	background-color: #ffd883;
	color: #fff;
}

</style>
<meta name="description" content="company is a real-estate template">
<meta name="author" content="Kimarotec">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<link
	href='http://fonts.googleapis.com/css?family=Open+Sans:400,300,700,800'
	rel='stylesheet' type='text/css'>

<!-- Place favicon.ico and apple-touch-icon.png in the root directory -->
<link rel="shortcut icon" href="favicon.ico" type="image/x-icon">
<link rel="icon" href="favicon.ico" type="image/x-icon">

</head>
<body>
<%@ include file="../common/header.jsp" %>
    
	<div class="page-head">
		<div class="container">
		</div>
	</div>
	<br><br>
		<div align="center">
		<c:choose>
			<c:when test="${loginUser.userType == '관리자'}">
				<a href="enList.en" class="nav-item2 active" style="width:180px;">1:1문의 내역</a>
				<a class="nav-item2" style="width:180px; cursor: pointer;" onclick="navigateToNotice()">공지사항</a>
			</c:when>
			<c:otherwise>
				<a href="enquiry.en" class="nav-item2 active" style="width:180px;">1:1문의</a>	
				<a class="nav-item2" style="width:180px; cursor: pointer;" onclick="navigateToNotice()">공지사항</a>
			</c:otherwise>
		</c:choose>
		</div>
	<c:choose>
		<c:when test="${loginUser == null }">
			<div class="form-container">
				<form id="insertForm" method="post" action="insert.en" enctype="multipart/form-data">
					<input type="hidden" name="userNo" id="userNo" value="${loginUser.userNo}">
					<p align="center" style="font-size: 25px;">
						<a href="login.be">로그인</a> 후 등록이 가능합니다 </p>
					<br> 
					<label for="">문의 유형</label> 
		            <input type="text" value="서비스 이용 문의" disabled>
				    <label for="name">제목</label>
		            <input type="text" id="enquiryTitle" name="enquiryTitle" placeholder="제목을 입력해주세요."> 
		            <label for="content">문의 내용</label>
					<textarea id="enquiryContent" name="enquiryContent" rows="4" style="resize: none;" placeholder="문의 하실 내용을 입력해주세요."></textarea>
					<label>사진</label>
					<input type="file" id="enfile" name="enfile" class="form-control-file border">
				</form>
			</div>
			</c:when>
			<c:otherwise>
	
		<div class="form-container">
			<form id="insertForm" method="post" action="insert.en" enctype="multipart/form-data">
				<input type="hidden" name="userNo" id="userNo" value="${loginUser.userNo}">
				<p align="center" style="font-size: 16px;">
					둥집에 궁금하신 점을 문의해주세요. <br> 문의내용과 답변은 <a href="myQnA.me">'마이페이지 문의내역'</a> 에서 확인 하실 수 있습니다.
				</p>
				<br> 
				<label for="">문의 유형</label> 
	            <input type="text" value="서비스 이용 문의" disabled>
			    <label for="name">제목</label>
	            <input type="text" id="enquiryTitle" name="enquiryTitle" placeholder="제목을 입력해주세요." required> 
	            <label for="content">문의 내용</label>
				<textarea id="enquiryContent" name="enquiryContent" rows="4" style="resize: none;" placeholder="문의 하실 내용을 입력해주세요." required></textarea>
				<label>사진</label>
				<input type="file" id="enfile" name="enfile" class="form-control-file border">
				<br>
					<div align="center">
						<button type="submit" style="width:100px" id="enquiryButton">문의하기</button>
					</div>
			</form>
		</div>	
			</c:otherwise>
			</c:choose>
	<script>
    function navigateToNotice(event) {
        // 공지사항 페이지로 이동
        window.location.href = "/dungjip/notice/list";

        // 기본 동작 막기
        event.preventDefault();
    }
</script>		
	<%@ include file="../common/footer.jsp" %>
</body>
</html>