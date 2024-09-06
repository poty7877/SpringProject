<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

<!DOCTYPE html>
<html>
<%@ include file="../views/includes/header.jsp"%>
<head>
<meta charset="UTF-8">
<title>HappyTable</title>
</head>
<body>

	<!--
    Slider start
    ============================== -->
	<section id="slider">
		<div class="container">
			<div class="row">
				<div class="col-md-12">
					<div class="block wow fadeInUp" data-wow-duration="500ms"
						data-wow-delay="300ms">
						<div class="title">
							<h3>
								Featured <span>Works</span>
							</h3>
						</div>
						<div id="owl-example" class="owl-carousel">
							<div>
								<img class="img-responsive"
									src="/resources/images/slider/slider-img-1.jpg" alt="">
							</div>
							<div>
								<img class="img-responsive"
									src="/resources/images/slider/slider-img-2.jpg" alt="">
							</div>
							<div>
								<img class="img-responsive"
									src="/resources/images/slider/slider-img-3.jpg" alt="">
							</div>
							<div>
								<img class="img-responsive"
									src="/resources/images/slider/slider-img-4.jpg" alt="">
							</div>
							<div>
								<img class="img-responsive"
									src="/resources/images/slider/slider-img-1.jpg" alt="">
							</div>
							<div>
								<img class="img-responsive"
									src="/resources/images/slider/slider-img-2.jpg" alt="">
							</div>
							<div>
								<img class="img-responsive"
									src="/resources/images/slider/slider-img-3.jpg" alt="">
							</div>
							<div>
								<img class="img-responsive"
									src="/resources/images/slider/slider-img-4.jpg" alt="">
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
				<!-- .col-md-12 close -->
			</div>
			<!-- .row close -->
		</div>
		<!-- .container close -->
	</section>
	<!-- slider close -->
	<script type="text/javascript">
		$(document).ready(function() {
			var mno = "${mno}"
			var result1 = "${result1}"
			checkModal(mno, result1);
			console.log(result1);
			console.log(mno);
			function checkModal(mno, result1) {
				if (result1 === '') {
					return;
				}
				if (parseInt(mno) > 0) {
					$(".modal-body").html(result1 + "님 회원가입을 축하드립니다.");
				}
				$("#myModal").modal("show");
			}
			var result2 = "${result2}"
			loginModal(result2);
			console.log(result2);
			function loginModal(result2) {
				if (result2 === '') {
					return;
				} else {
					$(".modal-body").html(result2 + "님 환영합니다.");
				}
				$("#myModal").modal("show");
			}

			var result3 = "${result3}"
			modifyModal(result3);
			console.log(result3);
			function modifyModal(result3) {
				if (result3 === "") {
					return;
				} else if (result3 === "success") {
					$(".modal-body").html("정보가 성공적으로 수정 되었습니다.");
				}
				$("#myModal").modal("show");
			}

			var result4 = "${result4}"
			deleteModal(result4);
			console.log(result4);
			function deleteModal(result4) {
				if (result4 === "") {
					return;
				} else if (result4 === "success") {
					$(".modal-body").html("회원 탈퇴되었습니다. 감사합니다.");
				}
				$("#myModal").modal("show");
			}
		});
	</script>
	<%@ include file="../views/includes/footer.jsp"%>
</body>

</html>