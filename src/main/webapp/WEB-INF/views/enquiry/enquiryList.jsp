<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>

<!DOCTYPE html>
<html class="no-js">
    <head>
        <meta charset="utf-8">
        <meta http-equiv="X-UA-Compatible" content="IE=edge">
        <title>1:1문의 내역</title>
        <meta name="description" content="company is a real-estate template">
        <meta name="author" content="Kimarotec">
        <meta name="keyword" content="html5, css, bootstrap, property, real-estate theme , bootstrap template">
        <meta name="viewport" content="width=device-width, initial-scale=1">

    </head>
    <style>
		.nav-menu {
			display: flex;
			justify-content: center;
			list-style: none;
			padding: 0;
			background-color: #f4f4f4;
			margin: 20px 0;
		}
		
		.nav-item2 {
			padding: 10px 50px; /* Adjust the padding as necessary */
			margin: 0 10px; /* Space between items */
			border: 1px solid #ddd; /* Border color */
			background-color: #fff; /* Background color for non-active items */
			cursor: pointer;
			color:#000;
		}
		
		.nav-item2.active {
			background-color: #000; /* Active item background color */
			color: #fff; /* Active item text color */
		}
		
		.nav-item2:hover{
		    background-color: #000;
		    color: #fff;
		}    
		
		.textBox{
			color: #000;
			font-size: 15px;
		}
		
		.panel-body{
			color: #000;
			font-size: 15px;
		}
		
		.row-feat{
    		display: flex;
    		justify-content: center;			
		}		
		
		.col-sm-6{
			width: 81%;
		}
		
		.col-md-12 {
    		width: 60%;
		}
		
		.feat-list{
			margin-left: 70px;
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
		
		.title{
			margin-left: 300px;
		}
		
		.feat-list{
			margin-left: 290px;
		}
		
		#moreEnquiry{
			background-color: #f1a90e;
			color: white;
			height: 50px;
			width: 90px;
			font-size: 15px;
		}
		
		#moreEnquiry:hover{
			background-color: #ffd883;
			color: #fff;
		}
		
		.panel-body2{
			color: #000;
			font-size: 15px;
		}
		
		.check{
			color: blue;
			float:right;
			font-size: 15px;
		}
		
		.success{
			color: red;
			float:right;
		}
		
		.content{
			float:right;
		}
		
    </style>
    <body>
    <%@ include file="../common/header.jsp" %>
         <div class="page-head"> 
            <div class="container">
            </div>
        </div>
       	<br><br>
		<div align="center">
			<a href="enList.en" class="nav-item2 active" style="width:180px;">1:1문의 내역</a>
			<a class="nav-item2" style="width:180px; cursor: pointer;" onclick="navigateToNotice()">공지사항</a>
		</div>
        <div class="content-area recent-property" style="background-color: #FCFCFC; padding-bottom: 55px;">
            <div class="container">    
                    <br>
                     <br>
		          <!-- 더보기 -->
                   <div class="enquiry-list" id="enquiry-list">
                   	
                   </div>		          	
               	</div>
           </div>
               	<div align="center">
		          <button id="moreEnquiry">더보기</button>
		        </div>
		        <br>
       <script>
			var page = 1;
			var enquiryList = 5;
			
			$(document).ready(function(){
				moreEnquiryList();
				$("#moreEnquiry").click(moreEnquiryList);
			});
			
			function moreEnquiryList(){
				$.ajax({
					url: "moreEnquiry.en",
					type: "GET",
					data: {page: page,
						   enquiryList: enquiryList},
					success: function(data){
						$.each(data, function (index, pm){
						var enquriyHtml = "";
				      	enquriyHtml += '<form method="post" action="reply.en">'
			                        + '<div class="row row-feat">'
			                        + '<div class="col-md-12">'
			                        + '<div class="col-sm-6 feat-list">'
			                        + '<div class="panel-group">'
			                        + '<div class="panel panel-default">'
			                        + '<div class="panel-heading">'
			                        + '<h4 class="panel-title fqa-title" data-toggle="collapse" data-target="#fqa'+pm.enquiryNo+'">'
			                        + '<span>'+pm.enquiryTitle+'</span>';
			                        if(pm.status == 'Y'){
			                        	enquriyHtml += '<span class="success">답변 완료</span>';
			                        }else{
			                        	enquriyHtml += '<span class="check">확인 중</span>';
			                        }
			                        enquriyHtml += '</h4>'
			                        + '</div>'
			                        + '<div id="fqa'+pm.enquiryNo+'" class="panel-collapse collapse fqa-body">'
			                        + '<div class="panel-body">';
			                        if (pm.enquiryImage != null) {
			                        enquriyHtml += '<a href="'+pm.changeName+'" download="'+pm.enquiryImage+'">'+pm.enquiryImage+'</a> <br>';
			                        }
			                        enquriyHtml += '작성자 : <span>' + pm.userName + '</span>'
			                        + '<span class="content">'+ pm.enquiryEnrollDate +'</span><hr>'
			                        + '내용 : <span>' + pm.enquiryContent + '</span><hr>';
			                        if (pm.enquiryReply != null) {
			                        	enquriyHtml+= '<textarea rows="2" cols="65" style="resize: none;width:500px;height:100px;" readonly>'+pm.enquiryReply+'</textarea> <br>'
			                        			   +  '답변일자: <span>' +pm.enquiryDate+'</span>';
			                        } else {
			                        	enquriyHtml+= '<textarea rows="2" cols="65" style="resize: none;width:500px;height:100px;" id="enquiryReply" name="enquiryReply"></textarea>'
			                        	+ '<input type="hidden" name="userNo" value="'+pm.userNo+'">'
                                    	+ '<input type="hidden" name="enquiryNo" value="'+pm.enquiryNo+'">'
                                    	+ '<br>'
                                    	+ '<div align="right">'
                                    	+ '<br>'
                                    	+ '<button type="submit">전송</button>'
                                    	+ '</div>';
			                        }
			                        enquriyHtml+= '</div></div></div></div></div>'
			                        + '</form>';
	                        	$('#enquiry-list').append(enquriyHtml);
							});
						},
						error: function(){
							console.error("Error enquiry list");
						},
						complete: function(){
							page++;
						}
				});
			}
		    function navigateToNotice() {
		        // 공지사항 페이지로 이동
		        window.location.href = "/dungjip/notice/list";
		    }
			
       </script>

       <%@ include file="../common/footer.jsp" %>
    </body>
</html>
