<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>

<%@ include file="../includes/header.jsp"%>
<!DOCTYPE html>
<html>

<head>
<style>
.comment-content {
	padding: 10px; /* 댓글의 패딩 조정 */
	border-bottom: 1px solid #ddd; /* 각 댓글 구분을 위한 하단 경계선 */
}

.comment-replier {
	font-weight: bold; /* 댓글 작성자 이름을 강조 */
}

.comment-date {
	color: #888; /* 날짜의 색상 조정 */
}

.comment-text {
	margin-top: 5px; /* 제목과 내용 간의 간격 조정 */
}

.left.clearfix {
	margin-bottom: 20px; /* 댓글 간의 간격 조정 */
}
</style>
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
							<button class="btn btn-primary">예약하기</button>
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
	<div class='row'>
		<div class="col-lg-12">
			<!-- /.panel -->
			<div class="panel panel-default">
				<!-- 		<div class="panel-heading">
				<i class="fa fa-comments fa-fw">Reply</i>
			</div> -->

				<div class="panel-heading">
					<i class="fa fa-comments fa-fw">Reply</i>
					<button id='addReplyBtn' class='btn btn-primary btn-xs pull-right'>New
						Reply</button>
				</div>

				<!-- /.panel-heading -->
				<div class="panel-body">

					<ul class="chat">
						<!-- start reply -->
						<li class="left clearfix" data-rno='12'>
							<div class='header'>
								<strong class="primary-font">user00</strong> <small
									class="pull-right text-muted">2018-01-01 13:13</small>
							</div>
							<p>Good job!</p>
						</li>

					</ul>
					<!-- ul end -->
					<!-- 댓글 목록은<ul>태그내에 <li> 태그를 이용해서 처림. 각 <li>태그는 하나의
				댓글을 의미하므로 수정이나 삭제 시 이를 클릭하게 됨. 수정이나 삭제시에는
				반드시 댓글 번호(rno)가 필요하므로 'data-rno-속성을 이용해서 처리한다. -->
				</div>
				<!-- /.panel.chat-panel -->

				<div class="panel-footer"></div>

			</div>
			<!-- class="panel panel-default" end -->
		</div>
	</div>
	<!-- ./end row -->

	<!-- Modal -->
	<div class="modal fade" id="myModal" tabindex="-1" role="dialog"
		aria-labelledby="myModalLabel" aria-hidden="true">
		<div class="modal-dialog">
			<div class="modal-content">
				<div class="modal-header">
					<button type="button" class="close" data-dismiss="modal"
						aria-hidden="true">&times;</button>
					<h4 class="modal-title" id="myModalLabel">REPLY MODAL</h4>
				</div>
				<!-- class="modal-header" end -->
				<div class="modal-body">
					<div class="form-group">
						<label>Reply</label> <input class="form-control" name='reply'
							value="NewReply!!!!">
					</div>
					<div class="form-group">
						<label>Replyer</label> <input class="form-control" name="replyer"
							value='Replyer'>
					</div>
					<div class="form-group">
						<label>Reply Date</label> <input class="form-control"
							name='replyDate' value='2018-01-01 13:13'>
					</div>
				</div>
				<!-- class="modal-body" end -->
				<div class="modal-footer">
					<button id='modalModBtn' type="button" class="btn btn-warning">Modify</button>
					<button id='modalRemoveBtn' type="button" class="btn btn-danger">Remove</button>
					<button id='modalRegisterBtn' type="button" class="btn btn-primary"
						data-dismiss="modal">Register</button>
					<button id='modalCloseBtn' type="button" class="btn btn-default"
						data-dismiss="modal">Close</button>

				</div>
				<!-- class="modal-footer end -->
			</div>
			<!-- class="modal-content  end -->
		</div>
		<!-- class="modal-dialog end -->
	</div>
	<!-- modal end -->
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

	<script type="text/javascript" src="../resources/js/reply.js"> /* 외부파일
	include용 */
	</script>

	<script>
		$(document)
				.ready(
						function() {

							var resNumValue = "${resVO.resNum}";
							var replyUL = $(".chat");

							showList(1);

							var modal = $(".modal");
							var modalInputReply = modal
									.find("input[name='reply']");
							var modalInputReplyer = modal
									.find("input[name='replyer']");
							var modalInputReplyDate = modal
									.find("input[name='replyDate']");

							var modalModBtn = $("#modalModBtn");
							var modalRemoveBtn = $("#modalRemoveBtn");
							var modalRegisterBtn = $("#modalRegisterBtn");

							$("#modalCloseBtn").on("click", function(e) {

								modal.modal('hide');
							});

							$("#addReplyBtn").on(
									"click",
									function(e) {

										modal.find("input").val("");
										modalInputReplyDate.closest("div")
												.hide();
										modal.find(
												"button[id !='modalCloseBtn']")
												.hide();

										modalRegisterBtn.show();

										$(".modal").modal("show");

									});

							modalRegisterBtn.on("click", function(e) {

								var reply = {
									reply : modalInputReply.val(),
									replyer : modalInputReplyer.val(),
									resNum : resNumValue
								};
								replyService.add(reply, function(result) {

									alert(result);

									modal.find("input").val("");
									modal.modal("hide");

									//showList(1);
									showList(-1);

								});

							});

							//댓글 조회 클릭 이벤트 처리 
							$(".chat")
									.on(
											"click",
											"li",
											function(e) {

												var rno = $(this).data("rno");

												replyService
														.get(
																rno,
																function(reply) {

																	modalInputReply
																			.val(reply.reply);
																	modalInputReplyer
																			.val(reply.replyer);
																	modalInputReplyDate
																			.val(
																					replyService
																							.displayTime(reply.replyDate))
																			.attr(
																					"readonly",
																					"readonly");
																	modal
																			.data(
																					"rno",
																					reply.rno);

																	modal
																			.find(
																					"button[id !='modalCloseBtn']")
																			.hide();
																	modalModBtn
																			.show();
																	modalRemoveBtn
																			.show();

																	$(".modal")
																			.modal(
																					"show");

																});
											});

							/*     modalModBtn.on("click", function(e){
							
							 var reply = {rno:modal.data("rno"), reply: modalInputReply.val()};
							
							 replyService.update(reply, function(result){
							
							 alert(result);
							 modal.modal("hide");
							 showList(1);
							
							 });
							
							 });

							 modalRemoveBtn.on("click", function (e){
							
							 var rno = modal.data("rno");
							
							 replyService.remove(rno, function(result){
							
							 alert(result);
							 modal.modal("hide");
							 showList(1);
							
							 });
							
							 }); */

							modalModBtn.on("click", function(e) {

								var reply = {
									rno : modal.data("rno"),
									reply : modalInputReply.val()
								};

								replyService.update(reply, function(result) {

									alert(result);
									modal.modal("hide");
									showList(pageNum);

								});

							});

							modalRemoveBtn.on("click", function(e) {

								var rno = modal.data("rno");

								replyService.remove(rno, function(result) {

									alert(result);
									modal.modal("hide");
									showList(pageNum);

								});

							});

							function showList(page) {

								console.log("show list " + page);

								replyService
										.getList(
												{
													resNum : resNumValue,
													page : page || 1
												},
												function(replyCnt, list) {

													console.log("replyCnt: "
															+ replyCnt);
													console
															.log("list: "
																	+ list);
													console.log(list);

													if (page == -1) {
														pageNum = Math
																.ceil(replyCnt / 10.0);
														showList(pageNum);
														return;
													}

													var str = "";

													if (list == null
															|| list.length == 0) {
														return;
													}

													for (var i = 0, len = list.length || 0; i < len; i++) {
													    str += "<li class='left clearfix' data-rno='" + list[i].rno + "'>";
													    str += "<div class='comment-content'>";
													    str += "<div class='header'><strong class='primary-font comment-replier'>"
													            + list[i].replyer
													            + "</strong>";
													    str += "<small class='pull-right text-muted comment-date'>"
													            + replyService.displayTime(list[i].replyDate)
													            + "</small></div>";
													    str += "<p class='comment-text'>"
													            + list[i].reply
													            + "</p></div></li>";
													}

													replyUL.html(str);

													showReplyPage(replyCnt);

												});//end function

							}//end showList

							var pageNum = 1;
							var replyPageFooter = $(".panel-footer");

							function showReplyPage(replyCnt) {

								var endNum = Math.ceil(pageNum / 10.0) * 10;
								var startNum = endNum - 9;

								var prev = startNum != 1;
								var next = false;

								if (endNum * 10 >= replyCnt) {
									endNum = Math.ceil(replyCnt / 10.0);
								}

								if (endNum * 10 < replyCnt) {
									next = true;
								}

								var str = "<ul class='pagination pull-right'>";

								if (prev) {
									str += "<li class='page-item'><a class='page-link' href='"
											+ (startNum - 1)
											+ "'>Previous</a></li>";
								}

								for (var i = startNum; i <= endNum; i++) {

									var active = pageNum == i ? "active" : "";

									str += "<li class='page-item "+active+" '><a class='page-link' href='"+i+"'>"
											+ i + "</a></li>";
								}

								if (next) {
									str += "<li class='page-item'><a class='page-link' href='"
											+ (endNum + 1) + "'>Next</a></li>";
								}

								str += "</ul></div>";

								console.log(str);

								replyPageFooter.html(str);
							}

							replyPageFooter.on("click", "li a", function(e) {
								e.preventDefault();
								console.log("page click");

								var targetPageNum = $(this).attr("href");

								console.log("targetPageNum: " + targetPageNum);

								pageNum = targetPageNum;

								showList(pageNum);
							});

							/*     function showList(page){
							
							 replyService.getList({bno:bnoValue,page: page|| 1 }, function(list) {
							
							 var str="";
							 if(list == null || list.length == 0){
							
							 replyUL.html("");
							
							 return;
							 }
							 for (var i = 0, len = list.length || 0; i < len; i++) {
							 str +="<li class='left clearfix' data-rno='"+list[i].rno+"'>";
							 str +="  <div><div class='header'><strong class='primary-font'>"+list[i].replyer+"</strong>"; 
							 str +="    <small class='pull-right text-muted'>"+replyService.displayTime(list[i].replyDate)+"</small></div>";
							 str +="    <p>"+list[i].reply+"</p></div></li>";
							 }


							 replyUL.html(str);

							 });//end function
							
							 }//end showList */

						});
	</script>

	<%@ include file="../includes/getFooter.jsp"%>
</body>

</html>