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
	<div div class="col-md-8 col-md-offset-2">
		<ul class="nav nav-tabs">
			<li class="active"><a href="#myRest" data-toggle="tab">기본정보관리</a></li>
			<c:choose>
				<c:when test="${oper eq null}"><li><a href="#Non_oper" data-toggle="tab">영업정보관리(미등록)</a></li></c:when>
				<c:when test="${oper ne null}"><li><a href="#myoper" data-toggle="tab">영업정보관리</a></li></c:when>
			</c:choose>
			<c:choose>
				<c:when test="${sales eq null}"><li><a href="#Non_sales" data-toggle="tab">테이블운영정보관리(미등록)</a></li></c:when>
				<c:when test="${sales ne null}"><li><a href="#mysales" data-toggle="tab">테이블운영정보관리</a></li></c:when>
			</c:choose>
			<c:choose>
				<c:when test="${menus eq null}"><li><a href="#Non_menus" data-toggle="tab">메뉴관리(미등록)</a></li></c:when>
				<c:when test="${menus ne null}"><li><a href="#mymenus" data-toggle="tab">메뉴관리</a></li></c:when>
			</c:choose>
		</ul>
	</div>

	<!-- Tab panes -->
	<div class="tab-content">
		<div class="tab-pane fade in active" id="myRest">
			<div class="col-md-8 col-md-offset-2">
				<form role="form" id="regiForm" method="post"
					action="/restaurant/register" onsubmit="return valForm(this)">
					<div class="panel panel-info">
						<div class="panel-heading">기본정보</div>
						<!-- .panel-heading -->
						<div class="panel-body">

							<div class="row" style="width: 90%; margin-left: 20px;">
								<div class="form-group" id="idDiv">
									<label>아이디</label> <input type="text" class="form-control"
										id="resID" name="resID" value="${myrest.resID}" readonly="readonly"/>
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
										id="resName" name="resName" value="${myrest.resName}" readonly="readonly" />
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
											type="hidden" name="resPhone" id="resPhone" />
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
									<textarea class="form-control" rows="2" id="summary" name="summary" >${myrest.summary}</textarea>
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
											type="hidden" name="co_Num" id="co_Num" />
									</div>
								</div>
								<!-- .form-group close -->
							</div>
							<!--.row  -->

						</div>

						<!-- .panel-body -->
						<div class="panel-footer">
							<button type="submit" class="btn btn-primary btn-lg btn-block"
								id="regBtn">가입하기</button>
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
			<h4>Profile Tab</h4>
			<p>Lorem ipsum dolor sit amet, consectetur adipisicing elit, sed
				do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut
				enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi
				ut aliquip ex ea commodo consequat. Duis aute irure dolor in
				reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla
				pariatur. Excepteur sint occaecat cupidatat non proident, sunt in
				culpa qui officia deserunt mollit anim id est laborum.</p>
		</div>
		<!--.tab-pane  -->
		<!-- tab: 메뉴관리 여기부터 -->
		<div class="tab-pane fade" id="mymenu">
			<h4>Messages Tab</h4>
			<p>Lorem ipsum dolor sit amet, consectetur adipisicing elit, sed
				do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut
				enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi
				ut aliquip ex ea commodo consequat. Duis aute irure dolor in
				reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla
				pariatur. Excepteur sint occaecat cupidatat non proident, sunt in
				culpa qui officia deserunt mollit anim id est laborum.</p>
		</div>
		<!--.tab-pane  -->
	</div>
	<!-- .tab-content -->
</div>
<!-- .row -->

<%@ include file="../includes/footer2.jsp"%>
