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

	<!--
    about-us start
    ============================== -->
	<section id="about-us">
		<div class="container">
			<div class="row">
				<div class="col-md-12">
					<div class="block">
						<img class="wow fadeInUp" data-wow-duration="300ms"
							data-wow-delay="400ms" src="/resources/images/cooker-img.png"
							alt="cooker-img">
						<h1 class="heading wow fadeInUp" data-wow-duration="400ms"
							data-wow-delay="500ms">
							<span>${ resVO.resName }</span></br> ${ resVO.summary }
						</h1>
					</div>
				</div>
			</div>
		</div>

	</section>
	<!-- #call-to-action close -->

	<!--
    price start
    ============================ -->
	<section id="price">
		<div class="container">
			<div class="row">
				<div class="col-md-12">
					<div class="block">
						<h1 class="heading wow fadeInUp" data-wow-duration="300ms"
							data-wow-delay="300ms">
							our <span>MENU</span> the <span>PRICE </span>

						</h1>
						<div class="pricing-list">
							<div class="title">

								<h3>
									메뉴 <span>리스트</span>
								</h3>
							</div>
							<ul class="menu-list">
								<c:forEach items="${ menuList }" var="menu">
									<li class="menu-item">
										<div class="item">
											<div>
												<img class="img-responsive"
													src="/resources/images/slider/slider-img-1.jpg" alt="">
												<h2>
													${ menu.menuName } </a>
												</h2>
												<div class="border-bottom"></div>
												<span>${ menu.unitCost } 원</span></br> <span>주재료 : ${ menu.mainIngredient }
												</span></br> <span>${ menu.serving }인분</span>
											</div>
											<p style="font-size: 15px;">${ menu.menuAcoount }</p>
										</div>
									</li>
								</c:forEach>
							</ul>
							<button class="btn btn-primary" onclick="location.href='/order/insert?resNum=${resVO.resNum}'">예약하기</button>
						</div>

					</div>
				</div>
			</div>
		</div>
	</section>
	<style>
.menu-list {
	display: flex; /* Flexbox로 설정 */
	flex-wrap: wrap; /* 화면 크기에 맞춰 메뉴가 줄 바꿈 가능 */
	gap: 30px; /* 각 메뉴 간격 */
	list-style-type: none; /* 리스트 스타일 제거 */
	padding: 0;
	margin: 0;
}

.menu-item {
	flex: 1 1 250px; /* 각 메뉴 항목이 최소 200px 너비를 가지며 크기에 맞춰 확장 */
	max-width: 250px; /* 각 메뉴 항목의 최대 너비 */
	text-align: center; /* 중앙 정렬 */
}

.item img {
	max-width: 100%; /* 이미지가 아이템 크기에 맞게 조절 */
	height: auto;
}
</style>
	<!-- #price close -->
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
				<!-- .col-md-12 close -->
			</div>
			<!-- .row close -->
		</div>
		<!-- .container close -->
	</section>
	<!-- slider close -->
	<section id="footer">
		<div class="container">
			<div class="row">
				<div class="col-md-6">
					<div class="block wow fadeInLeft" data-wow-delay="200ms">
						<h3>
							page <span>info</span>
						</h3>
						<div class="info">
							<ul>
								<li>
									<h4>
										<i class="fa fa-phone"></i>Telefone
									</h4>
									<p>${ resVO.resPhone }</p>

								</li>
								<li>
									<h4>
										<i class="fa fa-map-marker"></i>Address
									</h4>
									<p>${ resVO.resAddr }</p>
								</li>
								<li>
									<h4>
										<i class="fa fa-envelope"></i>E mail
									</h4>
									<p>mbc@mbc.com</p>

								</li>
								<li>
									<h4>
										<i class="fa fa-align-justify"></i>coNum
									</h4>
									<p>${ resVO.co_Num }</p>

								</li>
							</ul>
						</div>
					</div>
				</div>
				<!-- .col-md-4 close -->
				<div class="col-md-6">
					<div class="block wow fadeInLeft" data-wow-delay="700ms">
						<h3>
							restaurant <span>info</span>
						</h3>
						<div class="blog">
							<ul>
								<li>
									<h4>
										<a>open</a>
									</h4>
									<p>${ operVO.openTime }</p>
								</li>
								<li>
									<h4>
										<a>close</a>
									</h4>
									<p>${ operVO.endTime }</p>
								</li>
								<li>
									<h4>
										<a>break</a>
									</h4>
									<p>${ operVO.breakTime_start }~${ operVO.breakTime_end }</p>
								</li>
								<li>
									<h4>
										<a>rest</a>
									</h4>
									<p>${ operVO.dayoff_cate }${ operVO.dayoff_weekCnt }${ operVO.dayoff_Day }</p>
								</li>
								<li>
									<h4>
										<a>pay</a>
									</h4>
									<p>${ operVO.adPayCond }명이상예약시</p>
									<p>${ operVO.adPay }원선불</p>
								</li>
							</ul>
						</div>
					</div>
				</div>
				<!-- .col-md-4 close -->

				<!-- .col-md-4 close -->
			</div>
			<!-- .row close -->
		</div>
		<!-- .containe close -->
	</section>
	<%@ include file="../includes/getFooter.jsp"%>
</body>

</html>