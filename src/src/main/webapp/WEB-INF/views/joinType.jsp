<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>

<%@ include file="../views/includes/header.jsp"%>
<!DOCTYPE html>
<html>

<head>
<style>
.custom-button {
	padding: 28px 105px;
	border-radius: 0px;
	background: none;
	color: #FF4F02;
	border: 1px solid #FF4F02;
	font-size: 25px;
	text-transform: uppercase;
	font-weight: 600;
	-webkit-transition: .3s all;
	-o-transition: .3s all;
	transition: .3s all;
	height: 200px;
}

.custom-button:hover {
	background: #ff530a;
	color: #fff;
}
</style>
<meta charset="UTF-8">
<title>HappyTable</title>
</head>
<body>


	<!--
    price start
    ============================ -->

	<div class="container" style="margin-top: 150px; margin-bottom: 150px;">
		<div class="row">
			<div class="col-md-6">
				<div class="block">
					<button type="button"
						class="custom-button btn btn-primary btn-lg btn-block"
						onclick="location.href='/member/join'">일반 회원가입</button>
				</div>
			</div>
			<div class="col-md-6">
				<div class="block">
					<button type="button"
						class="custom-button btn btn-primary btn-lg btn-block"
						onclick="location.href='/restaurant/register'">사업자 회원가입</button>
				</div>
			</div>
		</div>
	</div>
	<%@ include file="../views/includes/footer.jsp"%>
</body>

</html>