<%@page import="org.springframework.ui.Model"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ include file="../includes/header.jsp"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>로그인</title>
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
							<span>로그인</span>
						</h1>
						<h3 class="title wow fadeInLeft" data-wow-duration="500ms"
							data-wow-delay="300ms">
							로그인 <span>${ loginError }</span>
						</h3>
						<form role="form" action="/member/login" method="post" id="loginForm">
							<div class="form-group wow fadeInDown" data-wow-duration="500ms"
								data-wow-delay="600ms">
								<div class="input-group mb-3"
									style="display: flex; justify-content: center; margin: 20px;">
									<input type="text" class="form-control" placeholder="이메일"
										aria-label="이메일" name="email"
										style="display: inline-block; width: 400px; margin-right: 10px;"
										required> <input type="password" class="form-control"
										placeholder="비밀번호" aria-label="비밀번호" name="pw"
										style="display: inline-block; width: 400px;" required>
									<input type="hidden" name="mno"
										value="${ loginMember.getMno() }" />
								</div>
								<div class="input-group mb-3"
									style="display: flex; justify-content: center; align-items: center; margin-left: 600px;">
									<label
										style="margin-right: 20px; display: flex; align-items: center;">
										<input type="radio" name="userType" id="user" value="option1"
										checked> 일반회원
									</label> <label
										style="margin-right: 20px; display: flex; align-items: center;">
										<input type="radio" name="userType" id="admin" value="option2">
										관리자
									</label>
									<button type="submit" id="submit"
										class="btn btn-primary wow bounceIn" data-wow-duration="500ms"
										data-wow-delay="1300ms" style="margin-right: 10px;">로그인</button>
									<button type="button" onclick="location.href='/member/join'"
										class="btn btn-info wow bounceIn" data-wow-duration="500ms"
										data-wow-delay="1300ms" style="margin-right: 10px;">
										회원가입</button>
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
	<script type="text/javascript">
		$(document).ready(function() {
			var form = $("#loginForm");
			var radioId = $(this).attr("id");

			$("#submit").on("click", function(e) {
				if (radioId === "user") {
					form.submit();
				} else {
					form.attr("action", "/restaurant/login").submit();
				}
			});
		});
	</script>
	<%@ include file="../includes/footer.jsp"%>
</body>
</html>