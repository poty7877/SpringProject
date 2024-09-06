<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ include file="../includes/header.jsp"%>
<%
session.getAttribute("loginMember");
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>회원탈퇴</title>
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
							<span>회원 탈퇴</span>
						</h1>
						<h3 class="title wow fadeInLeft" data-wow-duration="500ms"
							data-wow-delay="300ms">본인인증을 위해 다시한번 로그인 해주세요</h3>
						<form role="form" action="/member/remove" method="post"
							id="delForm">
							<div class="form-group wow fadeInDown" data-wow-duration="500ms"
								data-wow-delay="600ms">
								<div class="input-group mb-3"
									style="display: flex; justify-content: center; margin: 20px;">
									<input type="hidden" name="mno" value=${ loginMember.getMno() } />
									<input type="text" class="form-control" placeholder="이메일"
										aria-label="이메일" name="email"
										style="display: inline-block; width: 400px; margin-right: 10px;"
										required> <input type="password" class="form-control"
										placeholder="비밀번호" aria-label="비밀번호" name="pw"
										style="display: inline-block; width: 400px;" required>
								</div>
								<div class="input-group mb-3"
									style="display: flex; justify-content: center; margin-left: 600px;">
									<button type="submit" id="delBtn"
										class="btn btn-primary btn-lg wow bounceIn"
										data-wow-duration="500ms" data-wow-delay="1300ms"
										style="margin-right: 10px;">회원 탈퇴</button>
									<button type="button" onclick="location.href='/'"
										class="btn btn-default btn-lg wow bounceIn"
										data-wow-duration="500ms" data-wow-delay="1300ms">home</button>
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
			$("#delBtn").on("click", function(e) {
				e.preventDefault(); // 기본 버튼 동작 방지

				// 확인 대화상자 표시
				var confirmation = confirm("정말 삭제하시겠습니까?");
				if (confirmation) {
					// 사용자가 "확인"을 클릭했을 경우
					$("#delForm").submit(); // 기존의 submit 이벤트 핸들러를 제거하고 폼을 제출
				}
			});
		});
	</script>

	<%@ include file="../includes/footer.jsp"%>
</body>
</html>