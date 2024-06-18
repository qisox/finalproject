<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="UTF-8" />
<meta http-equiv="X-UA-Compatible" content="IE=edge" />
<meta name="viewport" content="width=device-width, initial-scale=1.0" />
<style>
	.footer-title-line {
		margin: 0 0 25px;
	}
	.input-group-btn {
		width: 88px;
		height: 88px;
	}
	#emailSubmitBtn {
		width: 100%;
		height: 100%;
		margin: 0;
	}
	#emailInput, #contentInput {
		color: black;
	}
</style>
<title>Document</title>
</head>
<body>
	<div class="footer-area">

            <div class=" footer">
                <div class="container">
                    <div class="row">

                        <div class="col-md-3 col-sm-6 wow fadeInRight animated">
                            <div class="single-footer">
                                <h4>About us </h4>

                                <img src="assets/img/footer-logo.png" alt="" class="wow pulse" data-wow-delay="1s">
                                <p>새로운 터전을 구하시는데 도움이 되고자 하는 DUNGJIP입니다!</p>
                                <ul class="footer-adress">
                                    <li><i class="pe-7s-map-marker strong"> </i> 서울특별시 영등포구 선유동2로 57 이레빌딩(구관) 20F</li>
                                    <li><i class="pe-7s-mail strong"> </i> esk147@naver.com</li>
                                    <li><i class="pe-7s-call strong"> </i> +82 10-8697-7610</li>
                                </ul>
                            </div>
                        </div>
                        <div class="col-md-3 col-sm-6 wow fadeInRight animated">
                            <div class="single-footer">
                                <h4>Contributors </h4>
                                <div class="footer-title-line"></div>
                                <ul class="footer-menu">
                                    <li><a>김은성</a></li> 
                                    <li><a>이지오</a></li> 
                                    <li><a>정슬기</a></li> 
                                    <li><a>이채현</a></li> 
                                    <li><a>이동혁</a></li> 
                                    <li><a>장재혁</a></li> 
                                </ul>
                            </div>
                        </div>
                        <div class="col-md-3 col-sm-6 wow fadeInRight animated">
                            <div class="single-footer">
                                <h4>advertisements</h4>
                                <div class="footer-title-line"></div>
                                <ul class="footer-blog">
                                    <li>
                                        <div class="col-md-3 col-sm-4 col-xs-4 blg-thumb p0">
                                            <a href="single.html">
                                                <img src="resources/img/icons/kh.png">
                                            </a>
                                            <span class="blg-date">12-12-2023</span>

                                        </div>
                                        <div class="col-md-8  col-sm-8 col-xs-8  blg-entry">
                                            <h6> <a href="">Kh 강남점 </a></h6> 
                                            <p style="line-height: 17px; padding: 8px 2px;">절찬리 홍보중</p>
                                        </div>
                                    </li> 

                                    <li>
                                        <div class="col-md-3 col-sm-4 col-xs-4 blg-thumb p0">
                                            <a href="single.html">
                                                <img src="resources/img/icons/kh.png">
                                            </a>
                                            <span class="blg-date">12-24-2023</span>

                                        </div>
                                        <div class="col-md-8  col-sm-8 col-xs-8  blg-entry">
                                            <h6> <a href="">Kh 당산점 </a></h6> 
                                            <p style="line-height: 17px; padding: 8px 2px;">절찬리 홍보중22</p>
                                        </div>
                                    </li> 

                                    <li>
                                        <div class="col-md-3 col-sm-4 col-xs-4 blg-thumb p0">
                                            <a href="single.html">
                                                <img src="resources/img/icons/kh.png">
                                            </a>
                                            <span class="blg-date">01-12-2024</span>

                                        </div>
                                        <div class="col-md-8  col-sm-8 col-xs-8  blg-entry">
                                            <h6> <a href="">Kh 종로점 </a></h6> 
                                            <p style="line-height: 17px; padding: 8px 2px;">절찬리 홍보중33</p>
                                        </div>
                                    </li> 
                                </ul>
                            </div>
                        </div>
                        <div class="col-md-3 col-sm-6 wow fadeInRight animated">
                            <div class="single-footer news-letter">
                                <h4>Direct Message</h4>
                                <div class="footer-title-line"></div>
                                <p>광고 및 후원 문의를 위한 이메일과 내용을 간단히 작성해주세요.</p>

                                <form action="sendEmail.do" method="post">
                                    <div class="input-group">
                                        <input id="emailInput" class="form-control" type="text" placeholder="E-mail ... " name="email">
                                        <input id="contentInput" class="form-control" type="text" placeholder="content ... " name="body">
                                        <span class="input-group-btn">
                                            <button id="emailSubmitBtn" class="btn btn-primary subscribe" type="submit"><i class="pe-7s-paper-plane pe-2x"></i></button>
                                        </span>
                                    </div>
                                    <!-- /input-group -->
                                </form>
                            </div>
                        </div>

                    </div>
                </div>
            </div>

            <div class="footer-copy text-center">
                <div class="container">
                    <div class="row">
                        <div class="pull-left">
                            <span> (C) <a href="http://www.KimaroTec.com">회심의 한방</a> , All rights reserved 2024  </span> 
                        </div> 
                        <div class="bottom-menu pull-right"> 
                            <ul> 
                                <li><a class="wow fadeInUp animated" href="" data-wow-delay="0.2s">Home</a></li>
                                <li><a class="wow fadeInUp animated" href="" data-wow-delay="0.3s">Property</a></li>
                                <li><a class="wow fadeInUp animated" href="" data-wow-delay="0.4s">Faq</a></li>
                                <li><a class="wow fadeInUp animated" href="" data-wow-delay="0.6s">Contact</a></li>
                            </ul> 
                        </div>
                    </div>
                </div>
            </div>

        </div>
</body>
</html>
