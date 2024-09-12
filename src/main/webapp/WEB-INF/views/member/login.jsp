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
							로그인 </br><span>${ loginError }</span>
						</h3>
						<form role="form" action="/member/login" method="post"
							id="loginForm">
							<div class="form-group wow fadeInDown" data-wow-duration="500ms"
								data-wow-delay="600ms">
								<div class="input-group mb-3"
									style="display: flex; justify-content: center; margin: 20px;">
									<input type="text" class="form-control" placeholder="이메일"
										aria-label="이메일" name="email" id="email"
										style="display: inline-block; width: 400px; margin-right: 10px;"
										required> <input type="password" class="form-control"
										placeholder="비밀번호" aria-label="비밀번호" name="pw" id="pw"
										style="display: inline-block; width: 400px;" required>
									<input type="hidden" name="mno"
										value="${ loginMember.getMno() }" />
								</div>
								<div class="btn-group" role="group"
									style="display: flex; justify-content: center; align-items: center; margin-left: 400px;">
									<label
										style="margin-right: 20px; display: flex; align-items: center;">
										<input type="radio" name="userType" id="user" checked>
										일반회원
									</label> <label
										style="margin-right: 20px; display: flex; align-items: center;">
										<input type="radio" name="userType" id="admin"> 관리자
									</label>
									<button type="submit" id="submit" class="btn btn-primary"
										style="margin-right: 10px; background: none; color: #FF4F02; border: 1px solid #FF4F02;">로그인</button>
									<button type="button" onclick="location.href='/'"
										class="btn btn-default">home</button>
								</div>
								<div class="btn-group" role="group"
									style="display: flex; justify-content: center; align-items: center; margin-left: 600px;">
									<button type="button" onclick="location.href='/member/findID'"
										class="btn btn-default" style="margin-right: 10px;">
										이메일 찾기</button>
									<button type="button" onclick="location.href='/member/findPW'"
										class="btn btn-default" style="margin-right: 10px;">
										비밀번호 찾기</button>
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
			$("#submit").on("click", function(e) {
				var radioId = $('input[name="userType"]:checked').attr("id");
				if (radioId === "user") {
					form.attr("action", "/member/login").submit();

				} else if (radioId === "admin") {
					$("#email").attr("name", "resID");
					$("#pw").attr("name", "resPW");
					form.attr("action", "/restaurant/login").submit();
				}
			});
		});
	</script>

	<%@ include file="../includes/footer.jsp"%>
</body>
</html>