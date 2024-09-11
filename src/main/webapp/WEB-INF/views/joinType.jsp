<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>

<%@ include file="../views/includes/header.jsp"%>
<!DOCTYPE html>
<html>

<head>

<meta charset="UTF-8">
<title>HappyTable</title>
</head>
<body>


	<!--
    price start
    ============================ -->
	<section id="price">
		<div class="container">
			<div class="row">
				<div class="col-md-12">
					<div class="block">
						<div class="pricing-list">
							<button type="button" class="btn btn-primary btn-lg btn-block"
								onclick="location.href='/member/join'">일반 회원가입</button>
							<button type="button" class="btn btn-primary btn-lg btn-block"
								onclick="location.href='/restaurant/register'">사업자 회원가입</button>
						</div>

					</div>
				</div>
			</div>
		</div>
	</section>




	<%@ include file="../views/includes/footer.jsp"%>
</body>

</html>