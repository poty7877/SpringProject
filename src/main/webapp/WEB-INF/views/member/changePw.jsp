<%@page import="com.happytable.service.MemberService"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ include file="../includes/header.jsp"%>

<!DOCTYPE html>
<html>
<head>
<style>
.btn-primary {
	background: #fff;
	color: #ff503a;
	border: 1px solid #ff503a;
}

.btn-primary:hover {
	background: #ff530a;
	color: #fff;
}

#subBtn:disabled:hover {
	background: #ff530a;
	color: #fff;
}
</style>
<meta charset="UTF-8">
<title>회원가입</title>
</head>
<body>
	<!--
    CONTACT US  start
    ============================= -->
	<section id="contact-us" style="justify-content: center; margin: auto;">
		<div class="container">
			<div class="row">
				<div class="col-md-12">
					<div class="block">
						<h1 class="heading wow fadeInUp" data-wow-duration="500ms"
							data-wow-delay="300ms">
							<span>회원 가입</span>
						</h1>
						<form role="form" action="/member/join" method="post" id="myForm">
							<div class="form-group">
								<div class="input-group mb-3"
									style="display: flex; justify-content: center; margin: 20px;">
									<input type="text" class="form-control" placeholder="이름"
										aria-label="이름" name="name" id="name" minlength="2"
										maxlength="10" style="display: flex; width: 600px;" required>
								</div>
								<div class="input-group mb-3"
									style="display: flex; justify-content: center; margin: 20px;">
									<input type="text" class="form-control" id="phone"
										placeholder="핸드폰 번호 10자리 or 11자리 (-제외입력)" aria-label="핸드폰 번호"
										name="phone" style="display: flex; width: 600px;" required
										minlength="10" maxlength="11">
								</div>

								<div class="input-group mb-3"
									style="display: flex; justify-content: center; margin: 20px;">
									<input type="email" class="form-control"
										placeholder="abcde@example.com" aria-label="abcde@example.com"
										name="email" id="email" maxlength="100"
										style="display: flex; width: 600px;" required>
								</div>
								<div class="input-group mb-3"
									style="display: flex; justify-content: center; margin: 20px;">
									<input type="text" class="form-control"
										placeholder="닉네임(2~10글자)" aria-label="닉네임" name="nickName"
										id="nickName" style="display: flex; width: 600px;" required
										minlength="2" maxlength="10">
								</div>
								<div class="input-group mb-3"
									style="display: flex; justify-content: center; margin: 20px;">
									<input type="password" class="form-control"
										placeholder="비밀번호(6~16글자)" aria-label="비밀번호" name="pw" id="pw"
										style="display: inline-block; width: 600px;" required
										minlength="6" maxlength="16">
								</div>
								<div class="input-group mb-3"
									style="display: flex; justify-content: center; margin: 20px;">
									<input type="password" class="form-control" id="cpw"
										placeholder="비밀번호 확인" aria-label="비밀번호 확인" name="cpw"
										style="display: inline-block; width: 600px;" required
										minlength="6" maxlength="16">
								</div>
								<div class="input-group mb-3"
									style="display: flex; justify-content: center; margin: 20px;">
									<input type="text" class="form-control" placeholder="생년월일(6자리)"
										aria-label="생년월일(6자리)" name="birth" id="birth"
										style="display: inline-block; width: 600px;" required
										minlength="6" maxlength="6">
								</div>
								<div style="display: flex; justify-content: flex-start;">
									<span id="emailError"
										style="display: none; color: red; width: 600px; margin-left: 265px;">*이메일 : 이미 사용중입니다.</span>
								</div>
								<div style="display: flex; justify-content: flex-start;">
									<span id="nickNameError"
										style="display: none; color: red; width: 600px; margin-left: 265px;">*닉네임 : 이미 사용중입니다.</span>
								</div>
								
								<div style="display: flex; justify-content: flex-start;">
									<span id="pwError"
										style="display: none; color: red; width: 600px; margin-left: 265px;">*비밀번호 : 비밀번호가 서로 일치하지 않습니다.
										</span>
								</div>
								
								<div style="display: flex; justify-content: flex-start;">
									<span id="birthError"
										style="display: none; color: red; width: 600px; margin-left: 265px;">*생년월일 : 숫자만 입력 해주세요.
										</span>
								</div>
								
								<div style="display: flex; justify-content: flex-start;">
									<span id="phoneError"
										style="display: none; color: red; width: 600px; margin-left: 265px;">*핸드폰 번호 : 숫자만 입력 해주세요.
										</span>
								</div>
								<div class="form-group">
									<div class="input-group mb-3"
										style="display: flex; justify-content: center; margin: 20px;">
										<input type="submit" id="subBtn" class="btn btn-primary"
											style="width: 600px;" value="회원가입">
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

	<script src="/resources/js/join.js"></script>
	<%@ include file="../includes/footer.jsp"%>
</body>
</html>