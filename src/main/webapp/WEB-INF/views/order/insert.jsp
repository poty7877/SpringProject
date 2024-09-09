<%@page import="com.happytable.domain.OperationsVO"%>
<%@page import="java.util.Date"%>
<%@page import="java.text.SimpleDateFormat"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>

<!DOCTYPE html>
<html>
<%@ include file="../includes/header.jsp"%>
<head>
<meta charset="UTF-8">
<title>HappyTable-예약생성</title>
</head>
<body>
	<section id="contact-us">
		<div class="container">
			<div class="row">
				<div class="col-md-12">
					<div class="block">
						<h1 class="heading wow fadeInUp" data-wow-duration="500ms"
							data-wow-delay="300ms">
							<span>식사 예약 페이지에 어서오세요</span>
						</h1>
						<form role="form" action="/order/insert" method="post">

							<input type='text' name='resNum'
								value='<c:out value="${resVO.oper.resNum}"/>' />
							<!-- 가게번호 받는것으로 수정 -->
							<input type='text' name='memUno'
								value='<c:out value="${loginMember.getMemUno()}"/>' />
							<!-- 회원번호 받는것으로 수정 -->
							<input type='text' name='headCount'
								value='<c:out value="${resVO.salList[0].headCount}"/>' /> <input
								type='hidden' name='a_Status' value='예약 중' />
							<div>
								<label>예약일</label> <input type="date" class="form-control"
									name="date">
							</div>
							<div>
								<label>예약시간</label> <select name="time">
									<c:forEach var="i" begin="${open}" end="${close}">
										<option value="${i}:00">
											<c:out value="${i}:00" />
										</option>
									</c:forEach>
								</select>



							</div>
							<div class="form-group wow fadeInDown" data-wow-duration="500ms"
								data-wow-delay="1000ms">
								<label>예약인수</label> <select name="a_NOP">
									<c:forEach var="j" begin="1" end="10">
										<option value="${j}">
											<c:out value="${j}명" />
										</option>
									</c:forEach>
								</select>
							</div>
							<button type="reset" class="btn btn-default wow bounceIn">초기화하기</button>
							<button type="submit" data-oper='appoint' class="btn btn-default">예약</button>

						</form>
					</div>
				</div>
				<!-- .col-md-12 close -->
			</div>
			<!-- .row close -->
		</div>
		<!-- .container close -->
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
					<div class="modal-body">로그인 후에 사용할실 수 있습니다. 홈으로 돌아갑니다.</div>
					<div class="modal-footer">
						<button type="button" class="btn btn-default" data-oper="modal">Close</button>

					</div>
				</div>
				<!-- /.modal-content -->
			</div>
			<!-- /.modal-dialog -->
		</div>
		<!-- /.modal -->

	</section>
	<!-- #contact-us close -->
	<script type="text/javascript">
		var loggedIn =
	<%=loggedInStr%>
		;
		if (!loggedIn) {
			$("#myModal").modal("show");
			$("#myModal").on("hidden.bs.modal", function() {
				window.location.href = "/";
			});
		}

		$(document).ready(

				function() {

					var formObj = $("form");

					$('button').on(
							"click",
							function(e) {

								e.preventDefault();

								var operation = $(this).data("oper");

								console.log(operation);
								if (operation === 'appoint') {
									formObj.attr("action", "/order/insert")
											.attr("method", "post");
									formObj.submit();
								} else if (operation === 'modal') {
									formObj.attr("action", "/")
									formObj.submit();
								} else if (operation === 'time')
									formObj.attr("action", "/order/insert")
											.attr("method", "get")
								formObj.submit();
								console.log("time 세션 저장 : "
										+ session.getAttribute("time"));

							});

				});
		console.log(loggedIn);
	</script>



	<%@ include file="../includes/footer.jsp"%>
</body>

</html>