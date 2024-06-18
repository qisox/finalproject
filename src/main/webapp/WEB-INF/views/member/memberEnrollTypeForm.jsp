<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<!--[if lt IE 7]>      <html class="no-js lt-ie9 lt-ie8 lt-ie7"> <![endif]-->
<!--[if IE 7]>         <html class="no-js lt-ie9 lt-ie8"> <![endif]-->
<!--[if IE 8]>         <html class="no-js lt-ie9"> <![endif]-->
<!--[if gt IE 8]><!--> <html class="no-js"> <!--<![endif]-->

    <head>
        <meta charset="utf-8">
        <meta http-equiv="X-UA-Compatible" content="IE=edge">
        <title>가입유형</title>
        <meta name="description" content="GARO is a real-estate template">
        <meta name="author" content="Kimarotec">
        <meta name="keyword" content="html5, css, bootstrap, property, real-estate theme , bootstrap template">
        <meta name="viewport" content="width=device-width, initial-scale=1">
	
    </head>
    <body>
		
		<!-- page header -->

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
        
        <!-- End page header -->

        <!-- register-area -->
        <div class="register-area" style="background-color: rgb(249, 249, 249);">
        
         <h3 align="center" style="padding: 15px;"><b>회원가입</b></h3>
         
            <div class="container" style="width: 65%;">

                <div class="col-md-6">
                    <div class="box-for overflow">
                        <div class="col-md-12 col-xs-12 register-blocks">
                            <h2>임차인 / 임대인 : </h2> 
                            <form action="agree.me" method="post">
                                <img src="resources/assets/img/u1.png" alt="">
                                <div class="text-center" style="padding: 10px;">
                                    <button type="submit" class="btn btn-default">가입하기</button>
                                </div>
                            </form>
                        </div>
                    </div>
                </div>

                <div class="col-md-6">
                    <div class="box-for overflow" >
                        <div class="col-md-12 col-xs-12 register-blocks">
                            <h2>중개인 : </h2> 
                            <form action="enroll.es" method="post">
                                <img class="img-fluid" src="resources/assets/img/e1.png" alt="">
                                <div class="text-center" style="padding: 10px;">
                                    
                                    <button type="submit" class="btn btn-default">가입하기</button>
                                </div>
                            </form>
                        </div>
                    </div>
                </div>

            </div>
        </div>          

         <!-- Footer area-->
         <%@ include file="../common/footer.jsp" %>

    </body>
</html>