<%@page import="com.happytable.domain.MemberVO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ include file="../includes/header.jsp"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core"  prefix="c"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/fmt"  prefix="fmt"%>
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
									<tr class="danger">
										<th width=4%>번호</th>
										<th>이름</th>
										<th>주소</th>
										<th width=12%>전화번호</th>
										<th>홍보문</th>
										<th>사업자번호</th>
										<th>가입일</th>
										<th width=5%>가입승인</th>
									</tr>
								</thead>

								<c:forEach items="${list2}" var="restaurant" varStatus="status">
									<!-- Controller에서 보낸 list를 받아 변수는 restaurant로 설정 -->
									<tr>
										<td>${ status.index + 1 }</td>
										<!-- varStatus를 설정하고 번호 추가 -->
										<td>${ restaurant.resName }</td>
										<!-- 이름 -->
										<td><a
											href="https://www.google.co.kr/maps/search/${restaurant.resAddr }${ restaurant.resName }" target="_blank">${ restaurant.resAddr } </a></td>
										<!-- 주소 -->
										<td>${ restaurant.resPhone }</td>
										<!-- 전화번호 -->
										<td>${ restaurant.summary }</td>
										<!-- 소개글,홍보문 -->
										<td>${ restaurant.co_Num }</td>
										<td><fmt:formatDate pattern="yyyy/MM/dd" value="${ restaurant.regDate }"/></td>
										
										<td><button id="regBtn" class="btn btn-default"
												onclick="location.href='/admin/register?resNum=${restaurant.resNum}'">가입승인
											</button></td>
										<!-- 홈페이지 버튼(클릭시 홈페이지의 번호를 가지고 상세보기페이지로 넘어감) -->
									</tr>
								</c:forEach>
							</table>
						</div>

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
	
	<%@ include file="../includes/footer.jsp"%>
</body>
</html>