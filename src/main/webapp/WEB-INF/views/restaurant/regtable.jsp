<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ include file="../includes/header2.jsp"%>
<div class="row">
	<div class="col-md-12">
		<h1 class="heading">
			<span>Restaurant 테이블 운영정보 등록</span>
		</h1>
	</div>
	<!-- .col-md-12 close -->
</div>

<!-- .row close -->
<div class="row" style="margin-top: 50px;">
<form id="regiTableForm" method="post" action="/estaurant/regtable"
	onsubmit="return valForm(this)">
	<input type="hidden" id="sales_resNum" name="resNum" value="${resNum}">
	<div class="col-md-8 col-md-offset-2">
		<div class="panel panel-info">
			<div class="panel-heading">테이블 운영정보    <span class="left cleafix"><button class="btn btn-success btn-sm" id="plusBtn">테이블 추가</button></span>
			</div>
			<!-- panel-heading -->
			<div class="panel-body">
			<div class="table-responsive">
				<table class="table " >
					<thead>
						<tr>
							<th width="10%">#</th>
							<th width="30%">운영타입</th>
							<th width="30%">최대 수용인원</th>
							<th width="30%">관리</th>
						</tr>
					</thead>
					<tbody id="table-body">
						<tr>
							<td><input class="form-control" id="vrNum" name="tableNum" type="number" value="1" readonly="readonly"></td>
							<td>
							<select class="form-control" id="tableType" name="tableType">
							<option value="room">룸타입</option>
							<option value="table">홀타입</option>
							</select>
							</td>
							<td><div class="input-group">
							<input class="form-control"  type="text" id="headCount" name="headCount" /><span class="input-group-addon">명</span></div></td>
							<td></td>
						</tr>
					</tbody>
				</table>
				<!-- /.table-responsive -->
				</div><!--.table-responsive  -->
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
<!-- .row -->
<%@ include file="../includes/footer2.jsp"%>
