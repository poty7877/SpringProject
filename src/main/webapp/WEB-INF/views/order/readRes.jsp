<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>

<!DOCTYPE html>
<html>
<%@ include file="../includes/header.jsp"%>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<style>
.heading span {
  font-size: 45px;
  color: #067087;
  font-weight: 600;
}
</style>
</head>
<body>
	<section id="contact-us">
		<div class="container">
			<div class="row">
				<div class="col-md-12">
					<div class="block">
						<h1 class="heading wow fadeInUp" data-wow-duration="500ms"
							data-wow-delay="300ms">
							<span>예약 확인 페이지 - 관리자</span>
						</h1>
					</div>
					<form role="form" action="/order/readRes" method="get">
						<div class="panel-body">
							<table class="table table-striped table-bordered table-hover">
								<thead>
									<tr>
										<th width='20%' align='center'>예약 날짜</th>
										<td width='80%'>
										<input class="form-control" name='a_Date'
										value='<c:out value="${appoint[0].a_Date }"/>' readonly="readonly">
										</td>
									</tr>
									<tr>
										<th>회원 닉네임</th>
										<td>
										<input class="form-control" name='userName'
										value='<c:out value="${appoint[0].userName }"/>' readonly="readonly">
										</td>
									</tr>
									<tr>
										<th>예약 인원</th>
										<td>
										<input class="form-control" name='a_NOP'
										value='<c:out value="${appoint[0].a_NOP }"/>' readonly="readonly">
										</td>
									</tr>
									<tr>
										<th>예약 상태</th>
										<td>
										<select class="form-control" name='a_Status'>
											<option value="예약 중"> 예약 중 </option>											
											<option value="예약 확정"> 예약 확정 </option>
											<option value="예약 취소"> 예약 취소 </option>
											<option value="노쇼"> No Show </option>
										</select>
										</td>
									</tr>
									<tr>
										<th>요청 사항</th>
										<td>
										<input class="form-control" type='text' name='a_Note' readonly="readonly" value='<c:out value="${appoint[0].a_Note }"/>'/>
										</td>
										
									</tr>
									<tr>
									<td colspan="2" align="center">
										<input type='hidden' name='a_No' value='<c:out value="${appoint[0].a_No}"/>'>
										<input type='hidden' name='memUno' value='<c:out value="${appoint[0].memUno}"/>'>
											<button type="submit" data-oper='update'
												class="btn btn-default">예약 수정</button>
											<button type="submit" data-oper='delete'
												class="btn btn-default">예약 취소</button>
									</tr>
								</thead>

							</table>
						</div>
					</form>
				</div>
			</div>
		</div>
		
			<!-- Modal  추가 -->
					<div class="modal fade" id="myModal" tabindex="-1" role="dialog"
						aria-labelledby="myModalLabel" aria-hidden="true">
						<div class="modal-dialog">
							<div class="modal-content">
								<div class="modal-header">
									<button type="button" class="close" data-dismiss="modal"
										aria-hidden="true">&times;</button>
									<h4 class="modal-title" id="myModalLabel">Modal title</h4>
								</div>
								<div class="modal-body">처리가 완료되었습니다.</div>
								<div class="modal-footer">
									<button type="button" class="btn btn-default"
										data-dismiss="modal">Close</button>
									<button type="button" class="btn btn-primary"
										data-dismiss="modal">Save changes</button>
								</div>
							</div>
							<!-- /.modal-content -->
						</div>
						<!-- /.modal-dialog -->
					</div>
					<!-- /.modal -->
		
	
	</section>
	<script type="text/javascript">
		$(document).ready(
				function() {

					var formObj = $("form");

					$('button').on(
							"click",
							function(e) {

								e.preventDefault();

								var operation = $(this).data("oper");

								console.log(operation);

								if (operation === 'delete') {
									formObj.attr("action", "/order/delete");
									formObj.attr("method", "post")

								} else if (operation === 'update') {
									//move to list
									formObj.attr("action", "/order/update").attr(
											"method", "post");
								}

								formObj.submit();
							});

				});
	</script>
	<%@ include file="../includes/footer.jsp"%>
</body>

</html>