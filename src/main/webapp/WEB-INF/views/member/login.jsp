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
<style>
.btn-primary:hover {
	background: #ff530a;
	color: #fff;
}
</style>
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
							이메일과 비밀번호를 입력하세요 </br> <span>${ loginError }</span>
						</h3>
						<form role="form" action="/member/login" method="post"
							id="loginForm">
							<div class="form-group">
								<div class="input-group mb-3"
									style="display: flex; justify-content: center; margin: 20px;">
									<input type="text" class="form-control" placeholder="이메일"
										aria-label="이메일" name="email" id="email"
										style="display: block; width: 600px;" required> <input
										type="hidden" name="mno" value="${ loginMember.getMno() }" />
								</div>
								<div class="input-group mb-3"
									style="display: flex; justify-content: center; margin: 20px;">
									<input type="password" class="form-control" placeholder="비밀번호"
										aria-label="비밀번호" name="pw" id="pw"
										style="display: block; width: 600px;" required>
								</div>
								<div class="btn-group" role="group"
									style="display: flex; justify-content: center; align-items: center; margin-left: 250px;">
									<label
										style="margin-right: 20px; display: flex; align-items: center;">
										<input type="radio" name="userType" id="user" checked>
										일반회원
									</label> <label
										style="margin-right: 20px; display: flex; align-items: center;">
										<input type="radio" name="userType" id="admin"> 관리자
									</label>
									<button type="button" onclick="location.href='/member/findID'"
										class="btn btn-default">이메일 찾기</button>
									<button type="button" onclick="location.href='/member/findPW'"
										class="btn btn-default">비밀번호 찾기</button>
								</div>

								<div class="form-group">
									<div class="input-group mb-3"
										style="display: flex; justify-content: center; margin: 20px;">
										<input type="submit" class="btn btn-primary"
											style="background: none; color: #FF4F02; border: 1px solid #FF4F02; width: 600px;"
											id="submit" value="로그인">
									</div>
									<div class="input-group mb-3"
										style="display: flex; justify-content: center; margin: 20px;">
										<input type="button" class="btn btn-default"
											style="width: 600px;" id="submit" value="회원가입"
											onclick="location.href='/joinType'">
									</div>
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
			var form = $("#loginForm"); // 로그인폼을찾아 변수에 저장
			$("#submit").on("click", function(e) { //sunmit 버튼 클릭시
				// radio에 체크된 id를 가져와 변수에 저장
				var radioId = $('input[name="userType"]:checked').attr("id");
				if (radioId === "user") { // radioID값이 user이면
					// form의 action을 /member/login으로 변경한후 제출
					form.attr("action", "/member/login").submit();

				} else if (radioId === "admin") { //radioID값이 user가 아니고 admin이면
					//email과 pw의 name을 변경
					$("#email").attr("name", "resID");
					$("#pw").attr("name", "resPW");
					// form의 action을 /restaurant/login으로 변경한후 제출
					form.attr("action", "/restaurant/login").submit();
				}
			});
		});
	</script>

	<%@ include file="../includes/footer.jsp"%>
</body>
</html>