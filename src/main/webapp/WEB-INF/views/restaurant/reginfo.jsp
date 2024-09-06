<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ include file="../includes/header2.jsp"%>

<div class="row">
	<div class="col-md-12">
		<h1 class="heading wow fadeInUp" data-wow-duration="500ms"
			data-wow-delay="300ms">
			<span>Restaurant 정보등록</span>
		</h1>
	</div>
	<!-- .col-md-12 close -->
</div>

<!-- .row close -->
<form id="regiForm" method="post" action="restaurant/register"
	onsubmit="return valForm(this)">
	<input type="hidden" name="resNum" value="${rest.resNum}">
	<div class="col-md-12">
		<div class="panel panel-info">
			<div class="panel-heading">영업정보 등록</div>
			<div class="panel-body">

				<!-- 입력란 시작 -->

				<!-- 아이디 입력란 -->
				<div class="row">
					<div class="col-md-2">
						<label class="form-group">OPEN</label>
					</div>
					<!-- col-md-3 -->
					<div class="col-md-4">
						<input type="time" name="openTime" />
					</div>
					<!-- col-md-3 -->
					<div class="col-md-2">
						<label class="form-group">CLOSE</label>
					</div>
					<!-- col-md-3 -->
					<div class="col-md-4">
						<input type="time" name="endTime" />
					</div>
					<!-- col-md-3 -->
				</div>
				<!-- .row close -->
				<!-- breakTime 입력란 -->
				<div class="row">
					<div class="col-md-2">
						<label class="form-group">BreakTime</label>
					</div>
					<!-- col-md-2 -->
					<div class="col-md-8">
						<label class="checkbox-inline"> <input type="checkbox"
							id="bt_true" value="1"> 있음
						</label> <label class="checkbox-inline"> <input type="checkbox"
							id="bt_false" checked="checked" value="0"> 없음
						</label>
					</div>
					<!-- col-md-8 -->
				</div>
				<!-- .row close -->
				<div class="row" id="breaktime_input">
					<div class="col-md-2"></div>
					<!-- col-md-2 -->
					<div class="col-md-8">
						<label class="form-group">START </label> <input type="time"
							name="breakTime_start" /> <label class="form-group">END
						</label> <input type="time" name="breakTime_end" />
					</div>
					<!-- col-md-8 -->
				</div>

				<!-- 휴무일 -->
				<div class="row">
					<div class="col-md-2">
						<label class="form-group">휴무일</label>
					</div>
					<!-- col-md-2 -->
					<div class="col-md-8">
						<select class="form-control" id="dayoffSel">
							<option value="A">연중무휴</option>
							<option value="M">매월</option>
							<option value="W">매주</option>
						</select>
						<!--select 선택따라 나타나기  -->

					</div>
					<!-- col-md-8 -->
				</div>
				<!-- .row close -->
				<!-- 선불정보 입력란 -->
				<div class="row">
					<div class="col-md-2">
						<label class="form-group">예약금 설정</label>
					</div>
					<!-- col-md-2 -->
					<div class="col-md-8">
						<blockquote>
							<small>예약금을 설정하시면 단체예약시 예약금을 선결제한 회원의 예약정보만 받을 수 있습니다.</small> <small>예약금을
								선결제할 최소 예약인원과 선결제 받을 금액을 설정할 수 있습니다.</small> <small>설정을 원하시면
								[설정함]을, 원하지 않으면 [설정안함]을 선택하세요.</small>
						</blockquote>
						<label class="checkbox-inline"> <input type="checkbox"
							id="adPay_true" checked="checked" value="0"> 설정안함
						</label> <label class="checkbox-inline"> <input type="checkbox"
							id="adPay_false" value="1"> 설정함
						</label>
					</div>
					<!-- col-md-8 -->
				</div>
				<!-- .row close -->

				<div class="row">
					<div class="col-md-2"></div>
					<div class="col-md-8">
						<!-- 선택하면 활성화되는 란 -->
						<div class="col-md-4">
							<label class="form-group">예약금 기준인원(최소인원) </label>
							<div class="form-group input-group">
								<input type="text" class="form-control" name="adPayCond"><span
									class="input-group-addon">명</span>
							</div>
						</div>
						<!-- col-md-4 -->
						<div class="col-md-4">
							<label class="form-group">선불금액 </label>
							<div class="form-group input-group">
								<input type="text" class="form-control" name="adPay"><span
									class="input-group-addon">원</span>
							</div>
						</div>
						<!-- col-md-4 -->
					</div>
					<!-- col-md-8 -->
				</div>
				<!-- .row close -->

			</div>
			<!-- panel-body -->
		</div>
		<!-- .panel-info-->
	</div>
	<!-- .col-md-12 close -->

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

<%@ include file="../includes/footer2.jsp"%>