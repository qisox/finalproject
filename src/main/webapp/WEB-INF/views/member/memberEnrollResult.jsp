<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="ko">

<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>가입완료</title>
    <style>
        body {
            font-family: 'Arial', sans-serif;
            margin: 0;
            padding: 0;
            background-color: #f4f4f4;
        }

        .container1 {
            width: 80%;
            margin: 40px auto;
            background-color: #fff;
            padding: 20px;
            text-align: center;
        }

        .progress-bar1 {
            display: flex;
            justify-content: center;
            margin-bottom: 30px;
        }

        .step {
            width: 30px;
            height: 30px;
            border: 2px solid #000;
            border-radius: 50%;
            line-height: 30px;
            margin: 0 5px;
            display: inline-block;
            background-color: #fff;
            color: #000;
        }

        .step.active {
            background-color: #000;
            color: #fff;
        }

        .message-box {
            border: 1px solid #ddd;
            padding: 20px;
            margin-bottom: 30px;
        }

        .confirm-button {
            background-color: #000;
            color: #fff;
            padding: 10px 20px;
            border: none;
            cursor: pointer;
        }

        .confirm-button:hover {
            background-color: #333;
        }

        .back-to-top {
            position: fixed;
            bottom: 20px;
            right: 20px;
            cursor: pointer;
        }
    </style>
</head>

<body>

	<%@ include file="../common/header.jsp" %>
	
	 <div class="page-head"> 
         <div class="container">
             <div class="row">
                 <div class="page-head-content">
                     <h1 class="page-title"></h1>               
                 </div>
             </div>
         </div>
     </div>


    <div class="container1">
    		<h2 style="font-size:30px; padding:inherit;font-weight:revert;">가입완료</h2>
       		
        <div class="message-box" >
            <h1>WELCOME</h1>
            <p>회원가입이 완료되었습니다.</p>
        </div>
        <button class="confirm-button" onclick='location.href="login.be"' style="background-color: #e3dcd6;">로그인하기</button>
        <div class="back-to-top">
            <!-- Typically this would be an icon, for demo purposes we use "^" -->
            ^
        </div>
    </div>
    
    <%@ include file="../common/footer.jsp" %>
    
</body>

</html>