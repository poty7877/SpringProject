<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>

<%@ include file="../includes/header.jsp"%>
<!DOCTYPE html>
<html>

<head>
<meta charset="UTF-8">
<title>HappyTable</title>
</head>
<body>
	<div class="container py-4">


		<div class="p-5 mb-4 bg-body-tertiary rounded-3">
			<div class="container-fluid py-5">
				<h1 class="display-5 fw-bold">도서정보</h1>
				<p class="col-md-8 fs-4">BookInfo</p>
			</div>
		</div>


		<div class="row align-items-md-stretch">
			<div class="col-md-5">
				<img src="./resources/images/" style="width: 70%">
			</div>
			<div class="col-md-6">
				<h3>
					<b></b>
				</h3>
				<p>
				<p>
					<b>도서코드 : </b><span class="badge text-bg-danger"></span>
				<p>
					<b>저자</b> :
				<p>
					<b>출판사</b> :
				<p>
					<b>출판일</b> :
				<p>
					<b>분류</b> :
				<p>
					<b>재고수</b> :
				<h4></h4>
				<p>
				<form name="addForm" action="./addCart.jsp?id=" method="post">
					<a href="#" class="btn btn-info" onclick="addToCart()"> 도서주문
						&raquo;</a> <a href="./cart.jsp" class="btn btn-warning"> 장바구니
						&raquo;</a> <a href="./Books.jsp" class="btn btn-secondary"> 도서목록
						&raquo;</a>
				</form>
			</div>
		</div>

	</div>
	<%@ include file="../includes/footer.jsp"%>
</body>
</html>