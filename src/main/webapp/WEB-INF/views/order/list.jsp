<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>

<!DOCTYPE html>
<html>
<%@ include file="../includes/header.jsp"%>
<head>
<meta charset="UTF-8">
<title>HappyTable=예약조회</title>
</head>
<body>
	<section id="contact-us">
		<div class="container">
			<div class="row">
				<div class="col-md-12">
					<div class="block">
						<h1 class="heading wow fadeInUp" data-wow-duration="500ms"
							data-wow-delay="300ms">
							<span>예약 현황 페이지에 어서오세요</span>
						</h1>

					</div>
						<div class="panel-body">
							<table class="table table-striped table-bordered table-hover">
								<thead>
									<tr>
										<th width='20%'>예약 날짜</th>
										<th width='20%'>레스토랑 이름</th>
										<th width='10%'>예약 인원</th>
										<th width='15%'>예약 상태</th>
										<th width='15%'>예약 번호</th>
										<th width='20%'>요청 사항</th>
									</tr>
								</thead>
								
								<c:forEach items="${appoint}" var="reservation">
									<tr>
										<td><c:out value="${reservation.a_Date}" /></td>

										<td><c:out value="${reservation.resName}" /></td>

										<td><c:out value="${reservation.a_NOP}" /></td>

										<td><c:out value="${reservation.a_Status}" /></td>

										<td><a
											href='/order/read?a_No=<c:out value="${reservation.a_No}"/>'>
												<c:out value="${reservation.a_No}" />
										</a></td>
										<td><c:out value="${reservation.a_Note}"/></td>									
										
									</tr>
								</c:forEach>
							</table>
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


				</div>
				<!--  end panel-body -->
			</div>
			<!-- end panel -->
		</div>
	</section>
	<!-- #contact-us close -->



	<%@ include file="../includes/footer.jsp"%>
</body>
</html>
