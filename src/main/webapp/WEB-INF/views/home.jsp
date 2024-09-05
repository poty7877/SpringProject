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
								<button type="button" class="btn btn-primary"
									data-dismiss="modal">Close</button>

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