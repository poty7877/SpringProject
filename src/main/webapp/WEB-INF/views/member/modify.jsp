<%@page import="com.happytable.domain.MemberVO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ include file="../includes/header.jsp"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>

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

#modify:disabled:hover {
	background: #ff530a;
	color: #fff;
}
</style>
<meta charset="UTF-8">
<title>회원정보 수정</title>
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
							<span>회원 정보 수정</span>
						</h1>
						<form role="form" action="/member/modify" method="post">
							<div class="form-group">
								<input type="hidden" name="mno"
									value="${ loginMember.getMno() }"> <label for="name">이름</label>
								<input type="text" id="name" class="form-control" name="name"
									value="${ loginMember.getName() }" readonly>
							</div>

							<div class="form-group">
								<label for="email">이메일 주소(ID)</label> <input type="text"
									id="email" class="form-control" name="email"
									value="${ loginMember.getEmail() }" readonly>
							</div>

							<div class="form-group">
								<label for="phone">핸드폰 번호[10자리 or 11자리 (-제외 입력)]</label> <input
									type="text" id="phone" class="form-control" name="phone"
									value="${ loginMember.getPhone() }" required maxlength="11">
							</div>

							<div class="form-group">
								<label>비밀번호</label> <input type="button" id="changeBtn"
									class="form-control" name="changeBtn" value="비밀번호 변경"
									style="background: none; color: #FF4F02; border: 1px solid #FF4F02;">
							</div>

							<div class="form-group">
								<label for="birth">생년월일(6자리)</label> <input type="text"
									id="birth" class="form-control" name="birth"
									value="${ loginMember.getBirth() }" required maxlength="6">
							</div>

							<div class="form-group">
								<label for="nickName">닉네임(2~10글자)</label> <input type="text"
									id="nickName" class="form-control" name="nickName"
									value="${ loginMember.getNickName() }" required maxlength="10">
							</div>

							<div class="form-group">
								<label for="nickName">회원 가입일</label> <input type="text"
									id="regDate" class="form-control" name="regDate"
									value='<fmt:formatDate pattern="yyyy/MM/dd" value="${ loginMember.getRegDate() }"/>'
									readonly>
							</div>

							<div class="form-group">
								<button type="button" id="modify" class="btn btn-primary">정보저장</button>
								<button type="button" id="remove" class="btn btn-default">회원탈퇴</button>
								<button type="button" id="home" class="btn btn-default">메인메뉴</button>
							</div>
						</form>
					</div>
				</div>

			</div>

			<!-- Modal 추가 -->
			<div class="modal fade" id="myModal" tabindex="-1" role="dialog"
				aria-labelledby="myModalLabel" aria-hidden="true">
				<div class="modal-dialog">
					<div class="modal-content">
						<div class="modal-header">
							<button type="button" class="close" data-dismiss="modal"
								aria-hidden="true">&times;</button>
							<h4 class="modal-title" id="myModalLabel">로그인 필요</h4>
						</div>
						<div class="modal-body">로그인 후에 회원정보를 수정 할 수 있습니다</div>
						<div class="modal-footer">
							<button type="button" class="btn btn-default"
								data-dismiss="modal">Close</button>
						</div>
					</div>
					<!-- /.modal-content -->
				</div>
				<!-- /.modal-dialog -->
			</div>
			<!-- /.modal -->

			<!-- Modal -->
			<div class="modal fade" id="psModal" tabindex="-1" role="dialog"
				aria-labelledby="psModalLabel" aria-hidden="true">
				<div class="modal-dialog">
					<div class="modal-content">
						<div class="modal-header">
							<button type="button" class="close" data-dismiss="modal"
								aria-hidden="true">&times;</button>
							<h4 class="modal-title" id="psModalLabel">비밀번호변경</h4>
						</div>
						<!-- class="modal-header" end -->
						<div class="modal-body">
							<div class="form-group">
								<label>현재 비밀번호</label> <input type="password"
									class="form-control" id="pw" name='pw'>
							</div>
							<div class="form-group">
								<label>새 비밀번호</label> <input type="password"
									class="form-control" id="cpw" name="cpw">

							</div>
							<div class="form-group">
								<label>새 비밀번호 확인</label> <input type="password"
									class="form-control" id="cpw2" name="cpw2">
							</div>
						</div>
						<!-- class="modal-body" end -->
						<div class="modal-footer">
							<button id='modalRegisterBtn' type="button"
								class="btn btn-primary" data-dismiss="modal">확인</button>
							<button id='modalCloseBtn' type="button" class="btn btn-default"
								data-dismiss="modal">취소</button>
						</div>
						<!-- class="modal-footer end -->
					</div>
					<!-- class="modal-content  end -->
				</div>
				<!-- class="modal-dialog end -->
			</div>
			<!-- modal end -->

		</div>

		<!-- .col-md-12 close -->

		<!-- .row close -->

		<!-- .container close -->
	</section>
	<!-- #contact-us close -->

	<script type="text/javascript">
		var loggedIn =
	<%=loggedInStr%>
		;
	</script>
	<script src="/resources/js/modify.js"></script>
	<script type="text/javascript">
		$(document).ready(function() {
			var modal = $("#psModal");
			var modalInputPw = modal.find("input[name='pw']");
			var modalInputCpw = modal.find("input[name='cpw']");
			var modalInputCpw2 = modal.find("input[name='cpw2']");
			var modalRegisterBtn = $("#modalRegisterBtn");

			$("#changeBtn").on("click", function(e) {
				modal.find("input").val("");
				modal.modal("show");
			});

			modalRegisterBtn.on("click", function(e) {
				var member = {
					pw : modalInputPw.val(),
					cpw : modalInputCpw.val(),
					cpw2 : modalInputCpw2.val()
				};

				pwService.modify(member, function(result) {
					alert(result.message);
					modal.find("input").val("");
					modal.modal("hide");
				});
			});
		});
	</script>


	<%@ include file="../includes/footer.jsp"%>
</body>
</html>