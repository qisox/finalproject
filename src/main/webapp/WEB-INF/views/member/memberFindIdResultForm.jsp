<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" import="com.kh.dungjip.member.model.vo.Member"%>
    
    
<!DOCTYPE html>
<!--[if lt IE 7]>      <html class="no-js lt-ie9 lt-ie8 lt-ie7"> <![endif]-->
<!--[if IE 7]>         <html class="no-js lt-ie9 lt-ie8"> <![endif]-->
<!--[if IE 8]>         <html class="no-js lt-ie9"> <![endif]-->
<!--[if gt IE 8]><!--> <html class="no-js"> <!--<![endif]-->
    <head>
    
        <meta charset="utf-8">
        <meta http-equiv="X-UA-Compatible" content="IE=edge">
        <title>아이디 찾기</title>
        <meta name="description" content="GARO is a real-estate template">
        <meta name="author" content="Kimarotec">
        <meta name="keyword" content="html5, css, bootstrap, property, real-estate theme , bootstrap template">
        <meta name="viewport" content="width=device-width, initial-scale=1">
	
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
 
        <!-- End page header -->
 

        <!-- register-area -->
        <div class="register-area" style="background-color: rgb(249, 249, 249);">
        
            <div class="container" style="display: flex; justify-content: center;">
                <div class="col-md-6">
                    <div class="box-for overflow" style="width: 600px; height: 365px;">                         
                        <div class="col-md-12 col-xs-12 login-blocks">
                            <h2>Find your ID : </h2> 
                            <form action="login.be" method="post">
                                <div class="form-group" style="display:flex; justify-content:center; margin:45px;">
                                    
									<c:choose>
										<c:when test="${empty findId }">
											<p class="idresult"> 조회 결과가 없습니다. </p>
										</c:when>
										
										<c:otherwise>
											<a>아이디 : ${findId.userId } </a>
										</c:otherwise>
									</c:choose>                                
                                
                                </div>
                                
                            </form>
                                
                               <div class="form-check <!-- form-check-reverse py-2 -->">
	                               	<div style="display: none;">
										  <label class="form-check-label" for="findSubmit" style="padding:0px 10px 0 0px">아이디 저장하기</label>
										  <input class="form-check-input" type="checkbox" id="saveId" name="saveId" style="width: min-content;">									 	
									 	 
									 </div>	
								 	<br><br>						 	
								</div>
                              
                                <div class="text-center" >                                	
                                    <button  onclick='location.href="login.be"' class="btn btn-default">로그인</button>
                                    <button  onclick='location.href="findPwdCheck"' class="btn btn-default">비밀번호 찾기 </button>                              
                                </div>
                                
                            <br>
                            
                            
                        </div>
                        
                    </div>
                </div>

            </div>
        </div> 
        
        
       	<!-- Footer area-->
        <%@ include file="../common/footer.jsp" %>

    </body>
</html>