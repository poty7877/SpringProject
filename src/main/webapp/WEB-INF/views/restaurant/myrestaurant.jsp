<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
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
<div class="row">
	<div class="col-lg-3 col-md-6">
		<div class="panel panel-primary">
			<div class="panel-heading">
				<div class="row">
					<div class="col-xs-3">
						<i class="fa-cutlery fa-5x"></i>
					</div>
					<div class="col-xs-9 text-right">
						<div class="huge" id="resName">${myrest.resName}</div>
						<div id = "resPhone">${myrest.resPhone}</div>
					</div>
				</div>
			</div>
				<div class="panel-footer" id="viewRest">
					<span class="pull-left" >상세정보 보기</span> <span
						class="pull-right"><i class="fa fa-arrow-circle-right"></i></span>
					<div class="clearfix"></div>
				</div>
		</div>
	</div>
	
	<div class="col-lg-3 col-md-6">
		<div class="panel panel-primary">
			<div class="panel-heading">
				<div class="row">
					<div class="col-xs-3">
						<i class="fa-cutlery fa-5x"></i>
					</div>
					<div class="col-xs-9 text-right">
						<div class="huge" id="openTime">OPEN: ${myrest.oper.openTime}</div>
						<div class="huge" id="endTime">CLOSE: ${myrest.oper.endTime}</div>
					</div>
				</div>
			</div>
				<div class="panel-footer" id="viewRest">
					<span class="pull-left" >상세정보 보기</span> <span
						class="pull-right"><i class="fa fa-arrow-circle-right"></i></span>
					<div class="clearfix"></div>
				</div>
		</div>
	</div>
	
	<div class="col-lg-3 col-md-6">
		<div class="panel panel-primary">
			<div class="panel-heading">
				<div class="row">
					<div class="col-xs-3">
						<i class="fa-cutlery fa-5x"></i>
					</div>
					<div class="col-xs-9 text-right">
						<div class="huge" id="operTime">${myrest.menuCnt}</div>
						<div id = "resPhone">메뉴 등록</div>
					</div>
				</div>
			</div>
				<div class="panel-footer" id="viewRest">
					<span class="pull-left" >상세정보 보기</span> <span
						class="pull-right"><i class="fa fa-arrow-circle-right"></i></span>
					<div class="clearfix"></div>
				</div>
		</div>
	</div>
</div>
<!-- .row -->


<%@ include file="../includes/footer2.jsp"%>
