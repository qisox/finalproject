<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="ko">

<head>
	
   <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>이용약관</title>
    <link href="https://fonts.googleapis.com/css?family=Noto+Sans+KR:400,700&display=swap" rel="stylesheet">
   	
   
    <style>
        body {
            font-family: 'Noto Sans KR', sans-serif;
            margin: 0;
            padding: 0;
        }
        .container {
            max-width: 1200px;
            margin: 0 auto;
            padding: 20px;
        }
        .header {
            font-size: 24px;
            text-align: center;
            margin-bottom: 20px;
        }
        .tab-menu {
            list-style: none;
            padding: 0;
            display: flex;
            justify-content: center;
            margin-bottom: 20px;
        }
        .tab-menu li {
            margin: 0 10px;
            padding-bottom: 5px;
            cursor: pointer;
        }
        .tab-menu li.active {
            border-bottom: 2px solid black;
        }
        .content-box {
            border: 1px solid #ddd;
            padding: 20px;
        }
        .content-box h3 {
            font-size: 20px;
            margin-bottom: 10px;
        }
        .content-box p {
            font-size: 16px;
            line-height: 1.6;
            color: #333;
        }
        
        .check-box {
            display: flex;
            align-items: center;
            margin-top: 20px;
        }
        .check-box input[type="checkbox"] {
            margin-right: 10px;
        }
        .btn-area {
            text-align: center;
            margin-top: 20px;
            background: #e3dcd6;
            cursor: pointer;
        }
        
        .btn {
            /* background: #e3dcd6; */
            color: #fff;
            padding: 10px 20px;
            text-transform: uppercase;
            width: 100%;
        }
        #AllAgreeDiv {
        	display: flex;
		    align-items: center;
		    justify-content: center;
        }
        #default-checkbox3 {
        	width: auto;
        	margin: 0;
        }
        #agree-label {
        	margin: 0;
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

    <div class="container" style="padding: 100px;">
        <div class="header">
            <strong>이용약관</strong>
        </div>
        
        <div class="content-box" style="padding:40px;">
        
            <h3 style="font-size: 16px; font-weight:bold;">회원가입 이용약관</h3>
            
            <textarea name="" id="" cols="137" rows="10" style="width: 100%;">제1조 (약관의 적용목적)이 약관은 스테이션3(이하 “회사”라 한다)가 운영하는 “다방”에서 제공하는 인터넷과 모바일 서비스(이하 “서비스”라 한다)를 이용함에 있어 “회사”와 “이용자”의 권리, 의무 및 책임 사항, 기타 필요한 사항을 규정함을 목적으로 합니다. 유료 서비스 상품의 경우 “유료 서비스 이용약관”을 따릅니다.

제2조 (용어의 정의)“서비스”라 함은 “회사”가 “회원”이 등록한 “매물”을 “이용자”에게 제공하기 위하여 컴퓨터 등 정보 통신 설비를 이용하여 설정한 가상의 중개장을 말합니다.“이용자”라 함은 “다방”이 제공하는 서비스를 받는 “회원” 또는 “비회원”을 말합니다.
“회원”은 “개인 사용자 회원”과 “공인중개사 회원”을 의미합니다.“개인 사용자 회원”이라 함은 “회사”가 정한 소정의 절차를 거쳐서 회원 가입을 하고 “서비스”를 이용하는 개인으로서, 매물 정보를 이용하는 자 뿐만 아니라 자신이 소유하거나 임대할 수 있는 권한을 가진 “매물”을 등록하는 자를 포함합니다. 아울러 “회사”는 서비스의 원활한 제공을 위해 회원의 등급을 “회사” 내부 규정에 따라 나눌 수 있습니다.
“공인중개사 회원”이라 함은 “회사”가 정한 소정의 절차를 거쳐서 회원 가입을 한 부동산 중개업자로서, 관련 법령에 따라 중개사무소 개설등록을 하고 “다방”에 “매물”을 제공할 수 있는 권한을 가진 “회원”을 말합니다.
“비회원”이라 함은 회원으로 가입하지 않고 “회사”가 제공하는 서비스를 이용하는 자를 말합니다.
“매물”이라 함은 다방의 개인 사용자 회원 또는 부동산 소유주의 의뢰를 받은 공인중개사 회원이 “다방”에 게시한 부동산 광고물을 의미합니다.
“콘텐츠”라 함은 “회원”이 제공한 각종 정보, 콘텐츠로서 서비스 상에 게시된 모든 글, 사진, 동영상, 각종 파일, 링크, 회원소개 등(부호, 문자, 영상, 그림 등 그 형태를 불문한다)을 말합니다.
“분양정보”라 함은 “회사”가 “이용자”에게 제공하는 공동주택(아파트, 오피스텔, 도시형생활주택 등)의 분양에 관련된 모든 글, 사진, 동영상 등의 정보를 말합니다.
“다방 매물관리규정”이라 함은 회사가 별도로 규정하여 공개한 부동산 “매물” 등록 시 회원의 준수 사항 및 위반 시 제재 규정을 의미합니다.
“허위 매물”이라 함은 “다방 매물관리규정”에 명시한 허위 매물 기준에 부합하는 매물을 의미합니다.
“유료 서비스”라 함은 다방, 다방프로 서비스를 통해 유료로 이용 가능한 회사가 제공하는 각종 온라인 디지털 콘텐츠 및 제반 서비스를 말합니다. 정보 및 광고 게시 서비스 등이 포함됩니다.
위 항에서 정의되지 않은 이 약관상의 용어의 의미는 일반적인 거래 관행에 의합니다.

제3조 (약관 명시와 개정)
회사는 이 약관의 내용과 상호 및 대표자 성명, 영업소 소재지 주소(소비자의 불만을 처리할 수 있는 곳의 주소를 포함), 전화번호, 전자 우편 주소, 사업자 등록 번호, 통신 판매업 신고 번호, 개인 정보 관리 책임자 등을 이용자가 쉽게 알 수 있도록 초기 서비스 화면(전면)에 게시합니다. 다만, 약관의 내용은 이용자가 연결 화면을 통하여 볼 수 있도록 할 수 있습니다.
회사는 전자상거래 등에서의 소비자 보호에 관한 법률, 약관의 규제에 관한 법률, 전자거래기본법, 전자서명법, 정보통신망 이용촉진 및 정보보호 등에 관한 법률, 방문판매 등에 관한 법률, 소비자기본법 등 관련법을 위배하지 않는 범위에서 이 약관을 개정할 수 있습니다.
회사가 이 약관을 개정하는 경우에는 개정된 약관의 적용일자 및 개정사유를 명시하여 현행 약관과 함께 그 적용일자 7일(불리한 경우 30일) 이전부터 적용일자 전일까지 위 제1항의 방법으로 공지합니다. 회원에게 불리한 약관의 개정은 이용자가 등록한 전자우편, 로그인 시 팝업창 등의 전자적 수단을 통하여 통지하도록 합니다.
회사가 전항에 따라 개정약관을 공지 또는 통지하면서 회원에게 동 기간 내에 의사표시를 하지 않으면 의사표시가 표명된 것으로 본다는 뜻을 명확하게 고지하였음에도 회원이 명시적으로 거부의 의사표시를 하지 아니한 경우 회원이 개정약관에 동의한 것으로 봅니다.
회원이 개정약관의 적용에 동의하지 않는 경우 회사는 개정 약관의 내용을 적용할 수 없으며, 이 경우 회원은 이용계약을 해지할 수 있습니다. 기존 약관을 적용할 수 없는 특별한 사정이 있는 경우에는 회사는 회원과의 이용계약을 해지할 수 있습니다.
본 약관에서 정하지 아니한 사항과 본 약관의 해석에 관해서는 전자상거래 등에서의 소비자 보호에 관한 법률, 약관의 규제 등에 관한 법률, 공정거래위원회가 정하는 전자상거래 등에서의 소비자 보호 지침 및 관계 법령 또는 상관례에 의합니다.
제4조 (서비스의 제공 및 변경)
회사는 다음과 같은 서비스를 제공합니다.</textarea>
			
            <!-- Repeat the text blocks as needed to match the layout -->
        </div>
        <div class="check-box" style="margin:20px 0px;">
            <input type="checkbox" id="default-checkbox1" name="chk" style="width: 3%; margin: 0;">
            <label for="default-checkbox1">[필수] 회원가입 이용약관에 동의합니다.</label>
        </div>
        
        <div class="content-box" style="padding:40px;">
            <h3 style="font-size: 16px; font-weight:bold;">개인정보수집 및 이용에 대한 동의</h3>
             <textarea name="" id="" cols="137" rows="10" style="width: 100%;">제1조 (약관의 적용목적)
이 약관은 스테이션3(이하 “회사”라 한다)가 운영하는 “둥집”에서 제공하는 인터넷과 모바일 서비스(이하 “서비스”라 한다)를 이용함에 있어 “회사”와 “이용자”의 권리, 의무 및 책임 사항, 기타 필요한 사항을 규정함을 목적으로 합니다. 유료 서비스 상품의 경우 “유료 서비스 이용약관”을 따릅니다.

제2조 (용어의 정의)
“서비스”라 함은 “회사”가 “회원”이 등록한 “매물”을 “이용자”에게 제공하기 위하여 컴퓨터 등 정보 통신 설비를 이용하여 설정한 가상의 중개장을 말합니다.
“이용자”라 함은 “다방”이 제공하는 서비스를 받는 “회원” 또는 “비회원”을 말합니다.
“회원”은 “개인 사용자 회원”과 “공인중개사 회원”을 의미합니다.
“개인 사용자 회원”이라 함은 “회사”가 정한 소정의 절차를 거쳐서 회원 가입을 하고 “서비스”를 이용하는 개인으로서, 매물 정보를 이용하는 자 뿐만 아니라 자신이 소유하거나 임대할 수 있는 권한을 가진 “매물”을 등록하는 자를 포함합니다. 아울러 “회사”는 서비스의 원활한 제공을 위해 회원의 등급을 “회사” 내부 규정에 따라 나눌 수 있습니다.
“공인중개사 회원”이라 함은 “회사”가 정한 소정의 절차를 거쳐서 회원 가입을 한 부동산 중개업자로서, 관련 법령에 따라 중개사무소 개설등록을 하고 “다방”에 “매물”을 제공할 수 있는 권한을 가진 “회원”을 말합니다.
“비회원”이라 함은 회원으로 가입하지 않고 “회사”가 제공하는 서비스를 이용하는 자를 말합니다.
“매물”이라 함은 다방의 개인 사용자 회원 또는 부동산 소유주의 의뢰를 받은 공인중개사 회원이 “다방”에 게시한 부동산 광고물을 의미합니다.
“콘텐츠”라 함은 “회원”이 제공한 각종 정보, 콘텐츠로서 서비스 상에 게시된 모든 글, 사진, 동영상, 각종 파일, 링크, 회원소개 등(부호, 문자, 영상, 그림 등 그 형태를 불문한다)을 말합니다.
“분양정보”라 함은 “회사”가 “이용자”에게 제공하는 공동주택(아파트, 오피스텔, 도시형생활주택 등)의 분양에 관련된 모든 글, 사진, 동영상 등의 정보를 말합니다.
“다방 매물관리규정”이라 함은 회사가 별도로 규정하여 공개한 부동산 “매물” 등록 시 회원의 준수 사항 및 위반 시 제재 규정을 의미합니다.
“허위 매물”이라 함은 “다방 매물관리규정”에 명시한 허위 매물 기준에 부합하는 매물을 의미합니다.
“유료 서비스”라 함은 다방, 다방프로 서비스를 통해 유료로 이용 가능한 회사가 제공하는 각종 온라인 디지털 콘텐츠 및 제반 서비스를 말합니다. 정보 및 광고 게시 서비스 등이 포함됩니다.
위 항에서 정의되지 않은 이 약관상의 용어의 의미는 일반적인 거래 관행에 의합니다.

제3조 (약관 명시와 개정)
회사는 이 약관의 내용과 상호 및 대표자 성명, 영업소 소재지 주소(소비자의 불만을 처리할 수 있는 곳의 주소를 포함), 전화번호, 전자 우편 주소, 사업자 등록 번호, 통신 판매업 신고 번호, 개인 정보 관리 책임자 등을 이용자가 쉽게 알 수 있도록 초기 서비스 화면(전면)에 게시합니다. 다만, 약관의 내용은 이용자가 연결 화면을 통하여 볼 수 있도록 할 수 있습니다.
회사는 전자상거래 등에서의 소비자 보호에 관한 법률, 약관의 규제에 관한 법률, 전자거래기본법, 전자서명법, 정보통신망 이용촉진 및 정보보호 등에 관한 법률, 방문판매 등에 관한 법률, 소비자기본법 등 관련법을 위배하지 않는 범위에서 이 약관을 개정할 수 있습니다.
회사가 이 약관을 개정하는 경우에는 개정된 약관의 적용일자 및 개정사유를 명시하여 현행 약관과 함께 그 적용일자 7일(불리한 경우 30일) 이전부터 적용일자 전일까지 위 제1항의 방법으로 공지합니다. 회원에게 불리한 약관의 개정은 이용자가 등록한 전자우편, 로그인 시 팝업창 등의 전자적 수단을 통하여 통지하도록 합니다.
회사가 전항에 따라 개정약관을 공지 또는 통지하면서 회원에게 동 기간 내에 의사표시를 하지 않으면 의사표시가 표명된 것으로 본다는 뜻을 명확하게 고지하였음에도 회원이 명시적으로 거부의 의사표시를 하지 아니한 경우 회원이 개정약관에 동의한 것으로 봅니다.
회원이 개정약관의 적용에 동의하지 않는 경우 회사는 개정 약관의 내용을 적용할 수 없으며, 이 경우 회원은 이용계약을 해지할 수 있습니다. 기존 약관을 적용할 수 없는 특별한 사정이 있는 경우에는 회사는 회원과의 이용계약을 해지할 수 있습니다.
본 약관에서 정하지 아니한 사항과 본 약관의 해석에 관해서는 전자상거래 등에서의 소비자 보호에 관한 법률, 약관의 규제 등에 관한 법률, 공정거래위원회가 정하는 전자상거래 등에서의 소비자 보호 지침 및 관계 법령 또는 상관례에 의합니다.
제4조 (서비스의 제공 및 변경)
회사는 다음과 같은 서비스를 제공합니다.</textarea>
        </div>
        <div class="check-box" style="margin:20px 0px;">
            <input type="checkbox" id="default-checkbox2" name="chk" style="width: 3%; margin: 0;">
            <label for="default-checkbox2">[필수] 회원가입 이용약관에 동의합니다.</label>
        </div>
        
        <div id="AllAgreeDiv" class="check-box" align="center" style="display: block; margin:20px 0px;">
            <input type="checkbox" id="default-checkbox3">
            <label id="agree-label" for="default-checkbox3">이용 약관에 모두 동의합니다.</label>
        </div>
       
        <div class="btn-area" id="memberEnrollNext">
            <button class="btn" >가입하기</button>
        </div>
        
    </div>
    
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.1/jquery.min.js"></script>
    <script type="text/javascript">
    
    	$(function() {
    		
    		var toggle = false; //체크 상태를 나타내는 변수
    		
    		
    		//전체동의 클릭 시 전부 체크
    		$("#default-checkbox3").on("click",function() {
    			
    			toggle = !toggle; //클릭할 때마다 상태 변경
    			
    			//console.log("클릭했다");
    			
    			if(toggle) { //한번 클릭 시 
    				$("#default-checkbox1, #default-checkbox2,#default-checkbox3").prop("checked",true);
    			}else{ //또 한번 클릭 시
    				$("#default-checkbox1, #default-checkbox2,#default-checkbox3").prop("checked",false);
    			}  			
    			
    		})
    		
 			$("input[name=chk]").click(function() {
				var total = $("input[name=chk]").length;
				var checked = $("input[name=chk]:checked").length;
				
				if(total != checked) $("#default-checkbox3").prop("checked", false);
				else $("#default-checkbox3").prop("checked", true); 
			});
    		
    		//전체동의 되지 않은 상태로 회원가입 버튼 클릭 시 페이지 이동 막기 
    		$("#memberEnrollNext").on("click",function() {
    			if (!($("#default-checkbox1").prop("checked") && $("#default-checkbox2").prop("checked"))) {
					showError("오류", "이용 약관에 모두 동의해야 합니다.", "확인"); 
					return false;
				}
    			
    			location.href='${contextPath}/enroll.me';   			
    		});
    		   		
    	})
    	
    </script>
    
    
    <%@ include file="../common/footer.jsp" %>
    
</body>
</html>