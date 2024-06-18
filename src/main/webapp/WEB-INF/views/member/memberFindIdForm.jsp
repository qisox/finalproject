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
                    <div class="box-for overflow" style="width: 600px; height: 400px;">                         
                        <div class="col-md-12 col-xs-12 login-blocks">
                            <h2>Find your ID : </h2> 
                            <form action="findId.bo" method="post">
                                <div class="form-group">
                                    <label for="userName">Name</label>
                                    <input type="text" class="form-control" name="userName" id="userName" placeholder="가입시 등록한 이름을 입력하세요.">
                                </div>
                                <div class="form-group">
                                    <label for="phone">Phone</label>
                                    <input type="text" class="form-control" name="phone" id="phone" placeholder="가입시 등록한 번호를 입력하세요.">
                                </div>
                                
                               <div class="form-check <!-- form-check-reverse py-2 -->">
	                               	<div style="display: none;">
										  <label class="form-check-label" for="findSubmit" style="padding:0px 10px 0 0px">아이디 저장하기</label>
										  <input class="form-check-input" type="checkbox" id="saveId" name="saveId" style="width: min-content;">									 	
									 	 
									 </div>	
								 	<br><br>						 	
								</div>
                              
                                <div class="text-center">                                	
                                    <button type="submit" id="id-find" onclick="return findCheck();" class="btn btn-default">아이디 찾기</button>
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
    		
        		var userName = $("#userName").val();
        		var phone = $("#phone").val();
        		
        		if (userName == null || userName == '') {
        			showError("오류", "이름을 입력하세요.", "확인");
					$("#userName").focus();
					return false;
				}
        		
        		if (phone == null || phone == '') {
        			showError("오류", "'-'를 제외한 숫자 11자리로 작성해 주세요", "확인");
					$("#phone").focus();
					return false;
					
				}else{
					
					var regExp = /^\d{11}$/;
					
					if (!regExp.test(phone)) { 
	        			showError("오류", "올바르지 않은 번호 형식입니다.", "확인");
						$("#phone").focus();
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