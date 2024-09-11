<%@page import="com.happytable.domain.MemberVO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ include file="../views/includes/header.jsp"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>식당 리스트</title>
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
							<span>식당 리스트</span>
						</h1>
						<div class="panel-body">
							<table class="table table-striped table-bordered table-hover">
								<thead>
									<tr>
										<th>#번호</th>
										<th>이름</th>
										<th>주소</th>
										<th>전화번호</th>
										<th>홍보문</th>
										<th>홈페이지</th>
									</tr>
								</thead>

								<c:forEach items="${list}" var="restaurant" varStatus="status">
									<tr>
										<td>${ status.index + 1 }</td>
										<td>${ restaurant.resName }</td>
										<td>${ restaurant.resAddr }</td>
										<td>${ restaurant.resPhone }</td>
										<td>${ restaurant.summary }</td>
										<td><button id="getBtn"
												onclick="location.href='/restaurant/get?resNum=${restaurant.resNum}'">홈페이지
											</button></td>
									</tr>
								</c:forEach>
							</table>
						</div>

					</div>
				</div>

			</div>
			<div class='row'>
				<div class="col-lg-12">

					<form id='searchForm' action="/restaurant/list" method='get'>
						<select name='type'>
							<option value=""
								<c:out value="${pageMaker.cri.type == null?'selected':''}"/>>--</option>
							<option value="T"
								<c:out value="${pageMaker.cri.type eq 'T'?'selected':''}"/>>이름</option>
							<option value="C"
								<c:out value="${pageMaker.cri.type eq 'C'?'selected':''}"/>>주소</option>
							<option value="W"
								<c:out value="${pageMaker.cri.type eq 'W'?'selected':''}"/>>전화번호</option>
							<option value="TC"
								<c:out value="${pageMaker.cri.type eq 'TC'?'selected':''}"/>>이름
								or 주소</option>
							<option value="TW"
								<c:out value="${pageMaker.cri.type eq 'TW'?'selected':''}"/>>이름
								or 전화번호</option>
							<option value="TWC"
								<c:out value="${pageMaker.cri.type eq 'TWC'?'selected':''}"/>>이름
								or 주소 or 전화번호</option>
						</select> <input type='text' name='keyword'
							value='<c:out value="${pageMaker.cri.keyword}"/>' /> <input
							type='hidden' name='pageNum'
							value='<c:out value="${pageMaker.cri.pageNum}"/>' /> <input
							type='hidden' name='amount'
							value='<c:out value="${pageMaker.cri.amount}"/>' />
						<button class='btn btn-default'>Search</button>
					</form>
				</div>
			</div>


			<div class='pull-right'>
				<ul class="pagination">

					<%--             <c:if test="${pageMaker.prev}">
              <li class="paginate_button previous"><a href="#">Previous</a>
              </li>
            </c:if>

            <c:forEach var="num" begin="${pageMaker.startPage}"
              end="${pageMaker.endPage}">
              <li class="paginate_button"><a href="#">${num}</a></li>
            </c:forEach>

            <c:if test="${pageMaker.next}">
              <li class="paginate_button next"><a href="#">Next</a></li>
            </c:if> --%>

					<c:if test="${pageMaker.prev}">
						<li class="paginate_button previous"><a
							href="${pageMaker.startPage -1}">Previous</a></li>
					</c:if>

					<c:forEach var="num" begin="${pageMaker.startPage}"
						end="${pageMaker.endPage}">
						<li class="paginate_button  ${pageMaker.cri.pageNum == num ? "active":""} ">
							<a href="${num}">${num}</a>
						</li>
					</c:forEach>

					<c:if test="${pageMaker.next}">
						<li class="paginate_button next"><a
							href="${pageMaker.endPage +1 }">Next</a></li>
					</c:if>


				</ul>
			</div>
			<!--  end Pagination -->
		</div>

		<form id='actionForm' action="/restaurant/list" method='get'>
			<input type='hidden' name='pageNum' value='${pageMaker.cri.pageNum}'>
			<input type='hidden' name='amount' value='${pageMaker.cri.amount}'>

			<input type='hidden' name='type'
				value='<c:out value="${ pageMaker.cri.type }"/>'> <input
				type='hidden' name='keyword'
				value='<c:out value="${ pageMaker.cri.keyword }"/>'>


		</form>
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
					<div class="modal-body">로그인 후에 회원정보를 수정 할 수 있습니다. 홈으로 돌아갑니다.</div>
					<div class="modal-footer">
						<button type="button" class="btn btn-default" data-dismiss="modal">Close</button>

					</div>
				</div>
				<!-- /.modal-content -->
			</div>
			<!-- /.modal-dialog -->
		</div>
		<!-- /.modal -->

		</div>

		<!-- .col-md-12 close -->

		<!-- .row close -->

		<!-- .container close -->
	</section>
	<!-- #contact-us close -->
	<script type="text/javascript">
		$(document).ready(function() {
			$("#getBtn").on("click", function() {

			});
		});
	</script>

	<script type="text/javascript">
		$(document)
				.ready(
						function() {

							var actionForm = $("#actionForm");

							$(".paginate_button a").on(
									"click",
									function(e) {

										e.preventDefault();

										console.log('click');

										actionForm
												.find("input[name='pageNum']")
												.val($(this).attr("href"));
										actionForm.submit();
									});

							$(".move")
									.on(
											"click",
											function(e) {

												e.preventDefault();
												actionForm
														.append("<input type='hidden' name='resNum' value='"
																+ $(this).attr(
																		"href")
																+ "'>");
												actionForm.attr("action",
														"/restaurant/get");
												actionForm.submit();

											});

							var searchForm = $("#searchForm");

							$("#searchForm button")
									.on(
											"click",
											function(e) {

												if (!searchForm.find(
														"option:selected")
														.val()) {
													alert("검색종류를 선택하세요");
													return false;
												}

												if (!searchForm
														.find(
																"input[name='keyword']")
														.val()) {
													alert("키워드를 입력하세요");
													return false;
												}

												searchForm
														.find(
																"input[name='pageNum']")
														.val("1");
												e.preventDefault();

												searchForm.submit();

											});

						});
	</script>
	<script type="text/javascript">
		var mno = "${mno}";
		var result1 = "${result1}";
		var result2 = "${result2}";
		var result3 = "${result3}";
		var result4 = "${result4}";
		var result5 = "${email}";
		var result6 = "${randomPW}";
	</script>
	<script src="/resources/js/home.js"></script>
	<%@ include file="../views/includes/footer.jsp"%>
</body>
</html>