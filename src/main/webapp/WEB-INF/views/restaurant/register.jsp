<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ include file="../includes/header2.jsp"%>
<div class="row">
		<div class="col-md-12">
			<h1 class="heading "><span>Restaurant 회원가입</span></h1>
		</div>
		<!-- .col-md-12 close -->
	</div><!-- .row close -->
	<div class="row">
		<div class="col-md-12">
		<form id="regiForm" method="post" action="restaurant/register" onsubmit="return valForm(this)">
			<div class="panel panel-Info">
				<div class="panel-heading">기본정보 등록</div><!-- .panel-heading -->
				<div class="panel-body">
				<div class="row">
				<div class="col-md-2">
					<label>아이디</label>
				</div>
				<!-- col-md-2 -->
				<div class="col-md-8">
					<div class="form-group">
						<input type="text" class="form-control" id="resID" name="resID"
							placeholder="아이디를 입력하세요.(영문, 숫자포함 5~10자)">
					</div>
				</div>
				<!-- col-md-8 -->
				<div class="col-md-2">
					<button class="btn btn-warning" id="dupleCheck" name="dupleCheck"
						value="nonCK">중복확인</button>
				</div>
				<!-- col-md-2 -->
			</div>
			<!-- .row close -->
			<!-- 패스워드 입력란 -->
			<div class="row">
				<div class="col-md-2">
					<label>패스워드</label>
				</div>
				<!-- col-md-2 -->
				<div class="col-md-8">
					<div class="form-group">
						<input type="text" class="form-control" id="resPW" name="resPW"
							placeholder="패스워드를 입력하세요.(영문, 숫자, 특수기호 포함 6자 이상)">
					</div>
				</div>
				<!-- col-md-8 -->
			</div>
			<!-- .row close -->
			<!-- 레스토랑 이름 입력란 -->
			<div class="row">
				<div class="col-md-2">
					<label>식당명</label>
				</div>
				<!-- col-md-2 -->
				<div class="col-md-8">
					<div class="form-group">
						<input type="text" class="form-control" id="resName"
							name="resName" placeholder="식당명을 입력하세요.">
					</div>
				</div>
				<!-- col-md-8 -->
			</div>
			<!-- .row close -->
			<!-- 레스토랑 대표 전화번호 입력란 -->
			<div class="row">
				<div class="col-md-2">
					<label>대표 전화번호</label>
				</div>
				<!-- col-md-2 -->
				<div class="col-md-3">
					<div class="input-group">
						<input type="text" class="form-control" id="phone_p"
							name="phone_p" /><span class="input-group-addon">-</span>
					</div>
				</div>
				<!-- col-md-3-->
				<div class="col-md-3">
					<div class="input-group">
						<input type="text" class="form-control" id="phone_m"
							name="phone_m" /><span class="input-group-addon">-</span>
					</div>
				</div>
				<!-- col-md-3-->
				<div class="col-md-2">
					<div class="form-group">
						<input type="text" class="form-control" id="phone_l"
							name="phone_l" />
					</div>
				</div>
				<!-- col-md-2-->
			</div>
			<!-- .row close -->
			<!-- 레스토랑 주소 입력란 -->
			<div class="row">
				<div class="col-md-2">
					<label>식당 주소</label>
				</div>
				<!-- col-md-2 -->
				<div class="col-md-8">
					<div class="form-group">
						<input type="text" class="form-control" id="resAddr"
							name="resAddr" placeholder="식당주소를 입력하세요.">
					</div>
				</div>
				<!-- col-md-8 -->
			</div>
			<!-- .row close -->
			<!-- 레스토랑 홍보문구 입력란 -->
			<div class="row">
				<div class="col-md-2">
					<label>식당 소개</label>
				</div>
				<!-- col-md-2 -->
				<div class="col-md-8">
					<div class="form-group">
						<textarea rows="2" name="summary" placeholder="소개문구(100자 이내)"></textarea>
					</div>
				</div>
				<!-- col-md-8 -->
			</div>
			<!-- .row close -->
			<!-- 레스토랑 사업자번호 입력란 -->
			<div class="row">
				<div class="col-md-2">
					<label>사업자번호</label>
				</div>
				<!-- col-md-2 -->
				<div class="col-md-3">
					<div class="input-group">
						<input type="text" class="form-control" id="conum_p"
							name="conum_p" /><span class="input-group-addon">-</span>
					</div>
				</div>
				<!-- col-md-3-->
				<div class="col-md-3">
					<div class="input-group">
						<input type="text" class="form-control" id="conum_m"
							name="conum_m" /><span class="input-group-addon">-</span>
					</div>
				</div>
				<!-- col-md-3-->
				<div class="col-md-2">
					<div class="form-group">
						<input type="text" class="form-control" id="conum_l"
							name="conum_l" />
					</div>
				</div>
				<!-- col-md-2-->
			</div>
			<!-- .row close -->

			<!-- 인증정보 입력란 추후구현-->
				</div> <!-- .panel-body -->
				<div class="panel-footer">
				<button type="submit" class="btn btn-warning btn-lg">가입하기</button>
				</div><!-- .panel-footer -->
			</div> <!--.panel panel-Info  -->
		</form>	
		</div><!-- .col-md-12 -->
	</div><!-- .row close -->
<%@ include file="../includes/footer2.jsp"%>