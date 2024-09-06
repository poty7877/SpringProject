<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%><!--

<!--
    footer-bottom  start
    ============================= -->
<footer id="footer-bottom">
	<div class="container">
		<div class="row">
			<div class="col-md-12 col-sm-12">
				<div class="block">
					<div class="footer-info">
						<div class="footer-item">
							<h4>
								<i class="fa fa-phone"></i> Telefone
							</h4>
							<span>010-1234-5678</span>
						</div>
						<div class="footer-item">
							<h4>
								<i class="fa fa-map-marker"></i> Address
							</h4>
							<span>경기 수원시 팔달구 덕영대로 899 3층</span>
						</div>
						<div class="footer-item">
							<h4>
								<i class="fa fa-envelope"></i> E-mail
							</h4>
							<span>mbcAcademy@mbc.com</span>
						</div>
					</div>

					<p>
						Copyright &copy; 2014 - All Rights Reserved. Design and Developed
						By <a href="http://www.themefisher.com">Themefisher</a>
					</p>
				</div>
			</div>
		</div>
	</div>
</footer>

<style>
.footer-info {
	display: flex; /* Flexbox로 설정하여 가로로 배치 */
	justify-content: space-between; /* 각 항목 사이 간격을 자동으로 맞춤 */
	flex-wrap: wrap; /* 화면 크기가 작아질 때 자동으로 줄 바꿈 */
}

.footer-item {
	flex: 1; /* 각 항목이 동일한 크기를 가짐 */
	padding: 10px; /* 각 항목에 여백 추가 */
	max-width: 300px; /* 항목의 최대 너비 */
}

.footer-item h4 {
	margin-bottom: 5px; /* 제목과 내용 사이의 간격 */
}
</style>