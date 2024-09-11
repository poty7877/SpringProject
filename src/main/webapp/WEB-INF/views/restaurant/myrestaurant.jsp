<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ include file="../includes/header2.jsp"%>

<div class="row">
	<div class="col-md-12">
		<h1 class="heading">
			<span>myRestaurant</span>
		</h1>
	</div>
	<!-- .col-md-12 close -->
</div>
<!-- .row close -->
<div class="row" style="margin-top: 50px;">
	<!-- Nav tabs -->
	<div class="col-md-8 col-md-offset-2">
		<ul class="nav nav-tabs">
			<li class="active"><a href="#myRest" data-toggle="tab">기본정보관리</a></li>
			<c:choose>
				<c:when test="${oper eq null}">
					<li id="nonOper"><a href="#myModal" data-toggle="modal">영업정보관리(미등록)</a></li>
				</c:when>
				<c:when test="${oper ne null}">
					<li><a href="#myoper" data-toggle="tab">영업정보관리</a></li>
				</c:when>
			</c:choose>
			<c:choose>
				<c:when test="${sales eq null}">
					<li id="nonSales"><a href="#myModal" data-toggle="modal">테이블운영정보관리(미등록)</a></li>
				</c:when>
				<c:when test="${sales ne null}">
					<li><a href="#mysales" data-toggle="tab">테이블운영정보관리</a></li>
				</c:when>
			</c:choose>
			<c:choose>
				<c:when test="${menus eq null}">
					<li id="nonMenu"><a href="#myModal" data-toggle="modal">메뉴관리(미등록)</a></li>
				</c:when>
				<c:when test="${menus ne null}">
					<li><a href="#mymenus" data-toggle="tab">메뉴관리</a></li>
				</c:when>
			</c:choose>
		</ul>
	</div>

	<!-- Tab panes -->
	<div class="tab-content">
		<div class="tab-pane fade in active" id="myRest">
			<div class="col-md-8 col-md-offset-2">
				<form role="form" id="restForm" method="post"
					action="/restaurant/register" onsubmit="return valForm(this)">
					<div class="panel panel-info">
						<div class="panel-heading">기본정보</div>
						<!-- .panel-heading -->
						<div class="panel-body">

							<div class="row" style="width: 90%; margin-left: 20px;">
								<div class="form-group" id="idDiv">
									<label>아이디</label> <input type="text" class="form-control"
										id="resID" name="resID" value="${myrest.resID}"
										readonly="readonly" />
								</div>
								<!-- .row close -->
							</div>
							<!--.row  -->
							<div class="row" style="width: 90%; margin-left: 20px;">
								<div class="form-group">
									<label>패스워드</label><input type="password" class="form-control"
										id="resPW" name="resPW" value="${myrest.resPW}" />
								</div>
								<!-- .form-group-->
							</div>
							<!--.row  -->
							<div class="row" style="width: 90%; margin-left: 20px;">
								<div class="form-group">
									<label>식당명</label> <input type="text" class="form-control"
										id="resName" name="resName" value="${myrest.resName}"
										readonly="readonly" />
								</div>
								<!-- .form-group close -->
							</div>
							<!--.row  -->
							<div class="row" style="width: 90%; margin-left: 20px;">
								<div class="form-group">
									<label>대표 전화번호</label>
									<div class="input-group">
										<input type="text" class="form-control" id="phone_f"
											name="phone_f" /><span class="input-group-addon">-</span> <input
											type="text" class="form-control" id="phone_m" name="phone_m" /><span
											class="input-group-addon">-</span> <input type="text"
											class="form-control" id="phone_l" name="phone_l" /> <input
											type="hidden" name="resPhone" id="resPhone"
											value="${myrest.resPhone}" />
									</div>
								</div>
								<!-- .form-group close -->
							</div>
							<!--.row  -->
							<div class="row" style="width: 90%; margin-left: 20px;">
								<div class="form-group">
									<label>식당 주소</label><input type="text" class="form-control"
										id="resAddr" name="resAddr" value="${myrest.resAddr}" />
								</div>
								<!-- .form-group close -->
							</div>
							<!--.row  -->
							<div class="row" style="width: 90%; margin-left: 20px;">
								<div class="form-group">
									<label>식당 소개</label>
									<textarea class="form-control" rows="2" id="summary"
										name="summary">${myrest.summary}</textarea>
								</div>
								<!-- .form-group close -->
							</div>
							<!--.row  -->
							<div class="row" style="width: 90%; margin-left: 20px;">
								<div class="form-group">
									<label>사업자번호</label>
									<div class="input-group" id="coNum">
										<input type="text" class="form-control" id="conum_f"
											name="conum_f" /><span class="input-group-addon">-</span> <input
											type="text" class="form-control" id="conum_m" name="conum_m" /><span
											class="input-group-addon">-</span> <input type="text"
											class="form-control" id="conum_l" name="conum_l" /> <input
											type="hidden" name="co_Num" id="co_Num"
											value="${myrest.co_Num}" />
									</div>
								</div>
								<!-- .form-group close -->
							</div>
							<!--.row  -->
							<div class="row" style="width: 90%; margin-left: 20px;">
								<div class="form-group">
									<label>가입일</label> <input type="text" class="form-control"
										id="regDate" name="regDate" value="${myrest.regDate}"
										readonly="readonly" />
								</div>
								<!-- .form-group close -->
							</div>
							<!--.row  -->

						</div>

						<!-- .panel-body -->
						<div class="panel-footer ">
							<div class="clearfix" style="text-align: right;">
								<button type="button" data-oper="modify" class="btn btn-primary"
									id="modBtn">수정하기</button>
								<button type="button" data-oper="delete" class="btn btn-default"
									id="delBtn">회원탈퇴</button>
							</div>
							<!-- .right clearfix -->
						</div>
						<!-- .panel-footer -->
					</div>
					<!--.panel panel-Info  -->
				</form>
			</div>
			<!-- .col-md-12 -->
		</div>
		<!-- .tab-pane -->
		<!-- tab: 영업정보관리 여기부터 -->
		<div class="tab-pane fade" id="myoper">
			<form id="operForm" method="post" action="restaurant/register"
				onsubmit="return valForm(this)">
				<input type="hidden" name="resNum" value="${rest.resNum}">
				<div class="col-md-8 col-md-offset-2">
			<div class="panel panel-info">
				<div class="panel-heading">영업정보 등록</div>
				<div class="panel-body">

					<!-- 영업시간 입력란 -->
					<div class="row">
						<div class="col-md-4 form-group">
							<label>OPEN</label> <input type="time" class="form-control"
								id="inputTime_op" name="inputTime_op" />
								<input type="hidden" id="openTime" name="openTime" value=""/>
						</div>
						<!-- col-md-3 -->

						<div class="col-md-4 form-group">
							<label>CLOSE</label> <input type="time" class="form-control"
								id="inputTime_ed" name="inputTime_ed" />
								<input type="hidden" id="endTime" name="endTime"  />
						</div>
						<!-- col-md-3 -->
					</div>
					<!-- .row close -->
					<!-- breakTime 입력란 -->
					<div class="row">
						<div class="col-md-8 form-group">
						<hr>
							<label>BreakTime</label>
							<div>
								<label class="radio-inline"> <input type="radio"
									id="bt_true" name="bt_sel" value="1"> 있음
								</label> <label class="radio-inline"> <input type="radio"
									id="bt_false" name="bt_sel" value="0" checked> 없음
								</label>
							</div>
						</div>
						<!-- col-md-8 -->
					</div>
					<!-- .row close -->
					<div class="row" id="breaktime_input" style="display: none">
						<div class="col-md-4 ">
							<div class="input-group">
								<span class="input-group-addon">START</span> <input type="time"
									class="form-control" id="input_btst"  name="input_btst"/>
									<input type="hidden" id="breakTime_start" name="breakTime_start" value=""/>
							</div>
							<!--.input-group  -->
						</div>
						<!-- col-md-8 -->

						<div class="col-md-4">
							<div class="input-group">
								<span class="input-group-addon">END</span> <input type="time"
									class="form-control" id="input_bted" name="input_bted" />
									<input type="hidden" id="breakTime_end" name="breakTime_end" value=""/>
							</div>
							<!--.input-group  -->
						</div>
						<!-- col-md-8 -->
					</div>

					<!-- 휴무일 -->
					<div class="row">
						<div class="col-md-8 form-group">
						<hr>
							<label for="dayoff">휴무일</label>
							<div class="input-group" id="dayoff">
								<select class="form-control" id="dayoff_cate" name="dayoff_cate"
									style="width: 40%">
									<option value="A">연중무휴</option>
									<option value="M">매월</option>
									<option value="W">매주</option>
								</select> <select class="form-control" id="dayoff_weekCnt"
									name="dayoff_weekCnt" style="width: 30%" disabled>
									<option value="1">첫째주</option>
									<option value="2">둘째주</option>
									<option value="3">셋째주</option>
									<option value="4">넷째주</option>
									<option value="1, 3">첫째, 셋째주</option>
									<option value="2, 4">둘째, 넷째주</option>
								</select> <select class="form-control" id="dayoff_Day" name="dayoff_Day"
									style="width: 30%" disabled>
									<option value="월">월요일</option>
									<option value="화">화요일</option>
									<option value="수">수요일</option>
									<option value="목">목요일</option>
									<option value="금">금요일</option>
									<option value="토">토요일</option>
									<option value="일">일요일</option>
								</select>
							</div>
							<!--.input-group  -->
						</div>
						<!-- col-md-8 -->
					</div>
					<!-- .row close -->
					<!-- 선불정보 입력란 -->
					<div class="row">
						<div class="col-md-8 form-group">
						<hr>
							<label for="adPayCheck">예약금 설정
								<button type="button" class="btn btn-danger btn-circle"
									id="queBtn">
									<i class="fa fa-question-circle"></i>
								</button>
							</label>
							<div id="adPayCheck">
								<label class="radio-inline"> <input type="radio"
									id="adPay_false" name="adPay_sel" value="0" checked>
									설정안함
								</label> <label class="radio-inline"> <input type="radio"
									id="adPay_true" name="adPay_sel" value="1"> 설정함
								</label>
							</div>
						</div>
						<!-- col-md-8 -->
					</div>
					<!-- .row close -->

					<div class="row" id="adPay_input" style="display: none;">
						<!-- 선택하면 활성화되는 란 -->
						<div class="col-md-4">
							<p>예약금 지불 최소인원 </p>
							<div class="input-group">
								<input type="text" class="form-control" name="adPayCond"><span
									class="input-group-addon">명</span>
							</div>
						</div>
						<!-- col-md-4 -->
						<div class="col-md-4">
							<p>예약금액 </p>
							<div class="input-group">
								<input type="text" class="form-control" name="adPay"><span
									class="input-group-addon">원</span>
							</div>
						</div>
						<!-- col-md-4 -->
					</div>
					<!-- .row close -->
				</div>
				<!-- panel-body -->
				<div class="panel-footer">
					<button type="submit" class="btn btn-primary btn-lg btn-block">저장하기</button>
				</div>
			</div>
			<!-- .panel-info-->
		</div>
		<!-- .col-md-8 close -->
			</form>

		</div>
		<!--.tab-pane  -->
		<!-- tab: 테이블관리 여기부터 -->
		<div class="tab-pane fade" id="mysales">
			<form id="saleForm" method="post" action="restaurant/register"
				onsubmit="return valForm(this)">
				<div class="col-md-12">
					<div class="panel panel-info">
						<div class="panel-heading">
							테이블 정보 입력
							<button>추가</button>
						</div>
						<!-- panel-heading -->
						<div class="panel-body">
							<table width="80%"
								class="table table-striped table-bordered table-hover"
								id="dataTables-example">
								<thead>
									<tr>
										<th>NO.</th>
										<th>운영타입</th>
										<th>최대수용인원</th>
										<th>관리</th>
									</tr>
								</thead>
								<tbody>
									<tr>
										<td>1</td>
										<td><select class="form-control" id="tableType">
												<option value="room">룸(단체석)</option>
												<option value="table">일반테이블</option>
										</select></td>
										<td><input type="text" id="headCount" name="headCount" />명
										</td>
										<td><button>삭제</button></td>
									</tr>
								</tbody>
							</table>
							<!-- /.table-responsive -->
						</div>
						<!-- panel-body -->
						<div class="panel-footer">
							<button type="submit" class="btn btn-primary btn-lg btn-block">저장하기</button>
						</div>
					</div>
					<!--panel panel-info  -->
				</div>
				<!-- .col-md-12 close -->
			</form>
		</div>
		<!--.tab-pane  -->

		<!-- tab: 메뉴관리 여기부터 -->
		<div class="tab-pane fade" id="mymenu">
			<div class="col-lg-12">
				<div class="panel panel-default">
					<div class="panel-heading">
						<i class="fa fa-comments fa-fw"></i>Reply
						<button id="addReplyBtn" class="btn btn-primary btn-xs pull-right">메뉴
							추가</button>
					</div>
					<!--panel-heading  -->
					<div class="panel-body">
						<ul class="chat">
							<li class='left clearfix' data-mno="${menus[i].menuNum}">
								<div>
									<div class='header'>
										<strong class='primary-font'>${menus[i].menuName}</strong> <small
											class='pull-right text-muted'>${menus[i].serving}</small>
									</div>
									<p>${menus[i].unitCost}</p>
									<p>${menus[i].menuAcoount}</p>
								</div>
							</li>
						</ul>
					</div>
					<!--panel-body  -->
					<div class="panel-footer">
						<!-- reply paging -->
					</div>
					<!--.panel-footer  -->
				</div>
				<!--panel panel-default  -->
			</div>
			<!-- .col-lg-12 -->
	</div>
	<!--.tab-pane  -->
</div>
<!-- .tab-content -->
</div>
<!-- .row -->

<!-- Modal -->
<div class="modal fade" id="myModal" tabindex="-1" role="dialog"
	aria-labelledby="myModalLabel" aria-hidden="true">
	<div class="modal-dialog">
		<div class="modal-content">
			<div class="modal-header">
				<button type="button" class="close" data-dismiss="modal"
					aria-hidden="true">&times;</button>
				<h4 class="modal-title" id="myModalLabel">Happy Table</h4>
			</div>
			<div class="modal-body">
				<p>
				</p>
			</div>
			<div class="modal-footer">				
				<button type="button" class="btn btn-success" id="modalRegBtn">등록하러 가기</button>
				<button type="button" class="btn btn-default" data-dismiss="modal">Close</button>
			</div>
		</div>
		<!-- /.modal-content -->
	</div>
	<!-- /.modal-dialog -->
</div>
<!-- /.modal -->

<script type="text/javascript" src="/resources/js/restreginfo.js"></script>
<script type="text/javascript" src="/resources/js/restmanage.js"></script>
<%@ include file="../includes/footer2.jsp"%>
