<%@page import="com.happytable.domain.MemberVO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ include file="../includes/header.jsp"%>

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
						<h3 class="title wow fadeInLeft" data-wow-duration="500ms"
							data-wow-delay="300ms">
							<span>${ loginError }</span>
						</h3>
						<form role="form" action="/member/remove" method="post"
							id="delForm">
							<div class="form-group wow fadeInDown" data-wow-duration="500ms"
								data-wow-delay="600ms">
								<div class="input-group mb-3"
									style="display: flex; justify-content: center; margin: 20px;">
									<input type="hidden" name="mno" value=${ loginMember.getMno() } />
									<input type="text" class="form-control" placeholder="이메일"
										aria-label="이메일" name="email" id="email" style="width: 600px;"
										required>
								</div>
								<div class="input-group mb-3"
									style="display: flex; justify-content: center; margin: 20px;">
									<input type="password" class="form-control" placeholder="비밀번호"
										aria-label="비밀번호" name="pw" id="pw" style="width: 600px;"
										required>
								</div>
								<div class="input-group mb-3"
									style="display: flex; justify-content: center; margin: 20px;">
									<input type="submit" id="delBtn" class="btn btn-primary"
										style="background: none; color: #FF4F02; border: 1px solid #FF4F02; width: 600px;"
										value="회원 탈퇴">

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
			// delBtn이라는 id를 가지고있는 버튼 클릭시 실행
			$("#delBtn").on("click", function(e) {
				e.preventDefault(); // 기본 버튼 동작 방지
				var form = $("#delForm"); // delForm을 변수에 저장
				// confirm - 확인창("띄울 메시지");
				var confirmation = confirm("정말 삭제하시겠습니까?");
				// confirm창을 띄우고 사용자가 "확인"을 클릭했을 경우
				if (confirmation) {
					// form의 action을 /member/remove로 변경하고 제출
					form.attr("action", "/member/remove").submit();
				} else {
					return;
				}

			});
		});
	</script>
	<%@ include file="../includes/footer.jsp"%>
</body>
</html>