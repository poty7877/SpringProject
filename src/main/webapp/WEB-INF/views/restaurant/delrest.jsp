<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ include file="../includes/header2.jsp"%>

<style>
.col-sm-12 {
	margin-bottom: 16px;
}

.form-control-user {
	height: 50px;
	width: 683px;
}

.btn-block {
	height: 50px;
}
</style>

<body class="bg-gradient-primary">
	<div class="container">

		<div class="card-body p-0">
			<!-- Nested Row within Card Body -->
			<div class="row">
				<div class="col-md-3"></div>

				<div class="col-lg-7" style="margin-top: 100px;">
					<div class="p-5">
						<div class="text-center">
							<h1 class="h4 text-gray-900 mb-4">회원 탈퇴</h1>
							<h3>${ error }</h3>
						</div>
						<form class="user" method="post" action="/restaurant/delrest">
							<div class="form-group row">

								<div class="col-sm-12" style="margin-left: -16px;">
									<label>아이디</label> <input type="text"
										class="form-control form-control-user" id="resID" name="resID"
										placeholder="아이디" required>
								</div>

								<div class="col-sm-12" style="margin-left: -16px;">
									<label>비밀번호</label> <input type="text"
										class="form-control form-control-user" id="resPW" name="resPW"
										placeholder="비밀번호" required>
								</div>
								<label>사업자 번호</label>
								<div class="input-group col-sm-12" id="coNum">
									<input type="number"
										class="form-control form-control-user form-custom"
										id="conum_f" name="divNum" required /><span
										class="input-group-addon">-</span> <input type="number"
										class="form-control form-control-user form-custom"
										id="conum_m" name="divNum" required /><span
										class="input-group-addon">-</span> <input type="number"
										class="form-control form-control-user form-custom"
										id="conum_l" name="divNum" required> <input
										type="hidden" name="co_Num" id="co_Num"
										value="${myrest.co_Num}" />
								</div>
							</div>
							<button class="btn btn-primary btn-user btn-block" type="submit">회원탈퇴</button>
							<button class="btn btn-default btn-user btn-block" type="button"
								onclick="location.href='/'">홈으로 이동</button>
						</form>
						<hr>

					</div>
				</div>
			</div>
		</div>
	</div>
	<script type="text/javascript">
		$(document).ready(function() {
			var divNum = $("input[name='divNum']");
			divNum.on("propertychange change paste input", function(e) {
				var frontcN = $("#conum_f").val();
				var midcN = $("#conum_m").val();
				var lastcN = $("#conum_l").val();
				var resCoNum = frontcN + "-" + midcN + "-" + lastcN;

				$("#co_Num").val(resCoNum);
				console.log("test:" + resCoNum);

			});
		});
	</script>
</body>
<!-- .container close -->
<%@ include file="../includes/footer2.jsp"%>