<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@page import="com.kh.dungjip.member.model.vo.Member"%>
<!DOCTYPE html>
<html lang="ko">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>프로필 페이지</title>
   
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
	    .text {
	        position: absolute;
	        top: 0;
	        left: 0;
	        width: 100px;
	        height: 100px;
	        background: #000000;
	        opacity: 0;
	        padding: 30px;
	        text-align: center;
	        color: #ffffff;
	        transition: opacity 0.3s ease-in-out;
	        border-radius: 50%;
	    }
	    .pic:hover .text { opacity: 0.6; }
	    
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
               	
               	<form id="profileForm" >
	               	<div class="pic">
	              	 	<img id="titleImg" src="${loginUser.changeName }" alt="프로필 사진" style="width:100px; height:100px;" >
	               		<input style="display: none; " type="file"  class="form-control" id="upfile" name="upfile" onchange="loadImg(this,1)">
	               		<div class="text">
	               			<p>사진 변경</p>
	               		</div>
	               	</div>
	            </form>               
                
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
                
                    <li class="dropdown">
                    	<a href="#" class="menuitem" style="font-size: 15px; color: #929292;">프로필 수정</a>
                    	<div class="dropdown-content" style="background: white;">                   	
			                <!-- 드롭다운 내용 -->
			                <a href="mypageupdate.me">내 정보 수정</a><br>			                
			                <a href="mypageEsUpdate.me">중개사무소 정보 수정</a>			                
			            </div>                    	
                    </li>
                    
                    <li><form action="esHouse.li" method="post">
                    	<input type="hidden" value="${esNo}" name="esNo">
                    	<button type="submit" class="menuitem" style="font-size: 15px;color: #929292;background: white;font-weight: bold;padding: 0;">매물내역</button>
                    	</form>
                    </li>  
                    
                    <li><form action="reser.es" method="post">
                    	<input type="hidden" value="${esNo}" name="esNo">
                    	<button type="submit" class="menuitem" style="font-size: 15px;color: #929292;background: white;font-weight: bold;padding: 0;">예약내역</button>
                    	</form>
                    </li> 
                                                    
                    <li><a href="myHousejjim.me" class="menuitem" style="font-size: 15px; color: #929292;">찜내역</a></li> 
                       
                    <li class="dropdown">
                    	<a href="#" class="menuitem" style="font-size: 15px; color: #929292;">리뷰공감</a>
                    	<div class="dropdown-content" style="background: white;">                   	
			                <!-- 드롭다운 내용 -->
			                <a href="myReReviewLike.me">집</a><br>
			                <a href="myReviewLike.me">중개사</a>			                
			            </div> 
                    </li>
                       
                    <li><a href="myQnA.me" class="menuitem" style="font-size: 15px; color: #929292;">문의내역</a></li> 
                                                   
                </ul>


            </div>
        </aside>
        
        <script type="text/javascript">
        
       		$(function() {
			  $("input[type='file']").css("display","none"); //file input 숨기기
                //대표이미지를 클릭하면 input file 요소 1번이 클릭되게 하는 함수
                $(".text").click(function(){
                    $("#upfile").click();
                });
	                
			});
       		
			//이미지를 읽어줄 함수 
            function loadImg(inputFile, num){
                //inputFile : 이벤트가 발생된 요소 객체 
                console.log(inputFile.files, "==============");
                //inputFile.files : 파일업로드 정보를 배열의 형태로 반환해주는 속성
                //파일을 선택하면 files속성의 length가 1이 반환됨
                if(inputFile.files.length == 1){ //파일이 등록되면 
                    //해당 파일을 읽어줄 FileReader라고 하는 자바스크립트 객체를 이용한다.
                    
                    var form = document.querySelector("#profileForm");
                
                    // var formData = new FormData(form);
       				//formData.append('file', inputFile.files[0]);                    
                    
                    var reader = new FileReader();
                    reader.readAsDataURL(inputFile.files[0]);
                    
                    //해당 reader객체가 읽혀진 시점에 img src속성에 부여된 고유 url을 넣어주기
                    reader.onload = function(e){//e : event 객체
                       
                        var fileData = e.target.result
                        
                        var form = document.querySelector("#profileForm");
                        
                        var formData = new FormData(form);
                       
           				formData.append('file', inputFile.files[0]);
                                               
                        switch(num){
                        
                            case 1: $("#titleImg").attr("src", fileData); 
                            
                            $.ajax({                            	
                            	url : "changefile.me",
                            	type : "POST",
                            	processData: false,
                                contentType: false,
                            	data: formData
                            });
                            
                            break;
                        
                        }
                    }
                }else{//length가 1이 아니면 
                    switch(num){
                            case 1: $("#titleImg").attr("src","${loginUser.changeName}"); break; //바뀌면 바뀐 이미지 취소 누를 시 이전 이미지
                         
                        }
                }
            }
       
        </script>
      
</body>
</html>

