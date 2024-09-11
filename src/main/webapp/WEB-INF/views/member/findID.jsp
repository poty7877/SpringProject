<%@page import="org.springframework.ui.Model"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ include file="../includes/header.jsp"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>이메일 찾기</title>
</head>
<body>
	<!--
    CONTACT US  start
    ============================= -->
	<section id="contact-us">
		<div class="container">
			<div class="row">
				<div class="col-md-12">
					<div class="block ">
						<h1 class="heading wow fadeInUp" data-wow-duration="500ms"
							data-wow-delay="300ms">
							<span>아이디, 비밀번호 찾기</span>
						</h1>
						<h3 class="title wow fadeInLeft" data-wow-duration="500ms"
							data-wow-delay="300ms">회원가입시 입력했던 이름과 핸드폰번호를 입력해주세요.</h3>
							<span>${ loginError }</span>
						<form role="form" action="/member/findID" method="post"
							id="findForm">
							<div class="form-group wow fadeInDown" data-wow-duration="500ms"
								data-wow-delay="600ms">
								<div class="form-group">
									<label for="name">이름</label> <input type="text" id="name"
										class="form-control" name="name" required>
								</div>
								<div class="form-group">
									<label for="phone">핸드폰 번호[10자리 or 11자리 (-제외 입력)]</label> <input
										type="text" id="phone" class="form-control" name="phone"
										required maxlength="11">
								</div>
								<div class="input-group mb-3"
									style="display: flex; justify-content: center; align-items: center; margin-left: 1000px;">
									<button type="submit" id="findID"
										class="btn btn-primary wow bounceIn" data-wow-duration="500ms"
										data-wow-delay="1300ms" style="margin-right: 10px;">입력
										완료</button>
									<button type="button" onclick="location.href='/'"
										class="btn btn-default wow bounceIn" data-wow-duration="500ms"
										data-wow-delay="1300ms">home</button>
								</div>

							</div>
						</form>
					</div>
				</div>
			</div>
			<!-- .col-md-12 close -->
		</div>
		<!-- .row close -->

		<!-- .container close -->
	</section>
	<!-- #contact-us close -->

	<%@ include file="../includes/footer.jsp"%>
</body>
</html>