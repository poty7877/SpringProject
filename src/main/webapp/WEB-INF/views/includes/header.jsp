<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%
Boolean loggedIn = (Boolean) session.getAttribute("loggedIn");
String loggedInStr = (loggedIn != null && loggedIn) ? "true" : "false";
Boolean loggedIn2 = (Boolean) session.getAttribute("loggedIn2");
String loggedInStr2 = (loggedIn2 != null && loggedIn2) ? "true" : "false";
%>
<!DOCTYPE html>
<head>
<meta charset="utf-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="description" content="">
<meta name="viewport" content="width=device-width, initial-scale=1">
<!-- CSS
        ================================================ -->
<!-- Owl Carousel -->
<link rel="stylesheet" href="/resources/css/owl.carousel.css">
<!-- bootstrap.min css -->
<link rel="stylesheet" href="/resources/css/bootstrap.min.css">
<!-- Font-awesome.min css -->
<link rel="stylesheet" href="/resources/css/font-awesome.min.css">
<!-- Main Stylesheet -->
<link rel="stylesheet" href="/resources/css/animate.min.css">

<link rel="stylesheet" href="/resources/css/main.css">
<!-- Responsive Stylesheet -->
<link rel="stylesheet" href="/resources/css/responsive.css">
<!-- Js -->
<script src="/resources/js/vendor/modernizr-2.6.2.min.js"></script>
<!-- <script src="//ajax.googleapis.com/ajax/libs/jquery/1.10.2/jquery.min.js"></script> -->
<script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
<script src="/resources/js/jquery.nav.js"></script>
<script src="/resources/js/jquery.sticky.js"></script>
<script src="/resources/js/bootstrap.min.js"></script>
<script src="/resources/js/plugins.js"></script>
<script src="/resources/js/wow.min.js"></script>
<script src="/resources/js/main.js"></script>
</head>
<!--
	header-img start 
	============================== -->
<!-- <section id="hero-area">
	<img class="img-responsive" src="/resources/images/header.jpg" alt="">
</section> -->
<!--
    Header start 
	============================== -->
<nav id="navigation">
	<div class="container">
		<div class="row">
			<div class="col-md-12">
				<div class="block">
					<nav class="navbar navbar-default">
						<div class="container-fluid">
							<!-- Brand and toggle get grouped for better mobile display -->
							<div class="navbar-header">
								<button type="button" class="navbar-toggle collapsed"
									data-toggle="collapse"
									data-target="#bs-example-navbar-collapse-1">
									<span class="sr-only">Toggle navigation</span> <span
										class="icon-bar"></span> <span class="icon-bar"></span> <span
										class="icon-bar"></span>
								</button>
								<a class="navbar-brand" href="/"> <img
									src="/resources/images/logo2.png" alt="Logo2">
								</a>

							</div>

							<!-- Collect the nav links, forms, and other content for toggling -->
							<div class="collapse navbar-collapse"
								id="bs-example-navbar-collapse-1">
								<ul class="nav navbar-nav navbar-right" id="top-nav">
									<li><a href="/">홈</a></li>
									<li><a id="reservationCheck" href="">예약조회</a></li>
									<!-- 예약 조회시 resNum혹은 memUno의 정보를 가져가 실행 -->
									<li><a href="/member/modify" id="myInfo">내정보</a></li>
									<!-- <li class="nav-item dropdown"><a
										class="nav-link dropdown-toggle" href="#" role="button"
										data-toggle="dropdown">info</a>
										<ul class="dropdown-menu">
											<li><a class="dropdown-item" href="/member/modify">my
													info</a></li>
											<li><a class="dropdown-item" href="#">reservation
													info</a></li>
											<li><a class="dropdown-item" href="#">review info</a></li>
										</ul></li> -->
									<li id="login"><a href="/member/login">로그인</a></li>
									<li id="logout"><a href="/member/logout">로그아웃</a></li>
									<li><a href="/joinType">회원가입</a></li>
								</ul>
							</div>
							<!-- /.navbar-collapse -->
						</div>
						<!-- /.container-fluid -->
					</nav>
				</div>
			</div>
			<!-- .col-md-12 close -->
		</div>
		<!-- .row close -->
	</div>
	<!-- .container close -->
</nav>
<!-- header close -->
<script type="text/javascript">
	$(document)
			.ready(
					function() {
						// 로그인 상태를 확인하는 함수 (쿠키를 사용하는 예)
						var loggedIn =
<%=loggedInStr%>
	;
						var loggedIn2 =
<%=loggedInStr2%>
	;
						console.log(loggedIn);
						console.log(loggedIn2);
						if (loggedIn || loggedIn2) {
							$('#login').hide(); // 로그인 상태에서는 로그인 버튼 숨기기
							$('#logout').show(); // 로그아웃 버튼 보이기
						} else if (!loggedIn || !loggedIn2) {
							$('#login').show(); // 비로그인 상태에서는 로그인 버튼 보이기
							$('#logout').hide(); // 로그아웃 버튼 숨기기

						}

						if (loggedIn) { // 일반사용자 로그인시
							$("#reservationCheck")
									.attr("href",
											"/order/list?memUno=${loginMember.getMemUno()}"); // 예약조회 버튼 누를때 memUno 보내기
							$("#myInfo").attr("href", "/member/modify"); // 내정보 버튼 누를때 member로 보내기
						} else if (loggedIn2) {// 관리자 로그인시
							$("#reservationCheck")
									.attr("href",
											"/order/list?resNum=${loginMember2.getResNum()}"); // 예약조회 버튼 누를때 resNum 보내기
							$("#myInfo")
									.attr("href",
											"/restaurant/myrestaurant?resNum=${loginMember2.getResNum()}"); // 내정보 버튼 누를때 myrestaurant로 보내기
						}

					});
</script>