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
                    <div class="box-for overflow" style="width: 600px; height: 500px;">                         
                        <div class="col-md-12 col-xs-12 login-blocks">
                            <h2>Find your Password : </h2> 
                            <form action="findPwd.bo" method="post">
                            
                                <div class="form-group">
                                    <label for="userName">Name</label>
                                    <input type="text" class="form-control" name="userName" id="userName" placeholder="가입시 등록한 이름을 입력하세요.">
                                </div>
                                
                                <div class="form-group">
                                    <label for="userId">Id</label>
                                    <input type="text" class="form-control" name="userId" id="userId" placeholder="가입시 등록한 아이디를 입력하세요.">
                                </div>
                                
                                <div class="form-group">
                                    <label for="email">Email</label>
                                    <input type="text" class="form-control" name="email" id="email" placeholder="가입시 등록한 이메일을 입력하세요.">
                                </div>
                                
                                <div class="form-check <!-- form-check-reverse py-2 -->">
	                               	<div style="display: none;">
										  <label class="form-check-label" for="saveId" style="padding:0px 10px 0 0px">아이디 저장하기</label>
										  <input class="form-check-input" type="checkbox" id="saveId" name="saveId" style="width: min-content;">									 	
									</div>	
								 	<br><br>						 	
								</div>																
                              
                                <div class="text-center">                                	
                                    <button type="submit" id="Pwd-find" onclick="return findCheck(); " class="btn btn-default"> 비밀번호 찾기</button>
                                </div>
                            </form>
                            <br>
                            
                            
                        </div>
                        
                    </div>
                </div>

            </div>
        </div> 
        
         <script type="text/javascript">
        
        	function findCheck() {
        		
        		var userId = $("#userId").val();
        		var userName = $("#userName").val();
        		var email = $("#email").val();
        		
        		if (userId == null || userId == '') {
        			showError("오류", "아이디를 입력하세요.", "확인");
					$("#userId").focus();
					return false;
				}
        		
        		if (userName == null || userName == '') {
        			showError("오류", "이름을 입력하세요.", "확인");
					$("#userName").focus();
					return false;
				}
        		       		
        		
        		if (email == null || email == '') {
        			showError("오류", "이메일을 입력하세요", "확인");
					$("#email").focus();
					return false;
					
				}else{
					
					var regExp = /^[A-Za-z0-9._%+-]+@[A-Za-z0-9.-]+\.[A-Za-z]{2,}$/;
					
					if (!regExp.test(email)) { 
	        			showError("오류", "올바르지 않은 이메일 형식입니다.", "확인");
						$("#email").focus();
						return false;
					}
				}
        		
        		return true;
        	}
        
        </script>
        
        
       	<!-- Footer area-->
        <%@ include file="../common/footer.jsp" %>

    </body>
</html>