<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ include file="../includes/header2.jsp"%>
<div class="container">
<div class="row">
	<div class="col-md-12">
		<h1 class="heading ">
			<span>Restaurant 회원가입</span>
		</h1>
	</div>
	<!-- .col-md-12 close -->
</div>
<!-- .row close -->
 <div class="row">
	<div class="col-md-12"> 
	<div class="panel panel-Info">
				<div class="panel-heading">기본정보 등록</div>
				<!-- .panel-heading -->
				<div class="panel-body">
		<form role="form" id="regiForm" method="post"
			action="restaurant/register" onsubmit="return valForm(this)">			
					<div class="row col-md-8">
						<div class="form-group">
							<label for="resID">아이디</label>
<input type="text" class="form-control" id="resID" name="resID"
									placeholder="아이디를 입력하세요.(영문, 숫자포함 5~10자)"/>

						</div>
						<!-- .row close -->
					</div>
					<!--.row col-md-8  -->
					<div class="row col-md-8">
						<div class="form-group">
							<label for="resPW">패스워드</label><input type="text" class="form-control"
								id="resPW" name="resPW"
								placeholder="패스워드를 입력하세요.(영문, 숫자, 특수기호 포함 6자 이상)" />
						</div>
						<!-- .form-group-->
					</div>
					<!--.row col-md-8  -->
					<div class="row col-md-8">
						<div class="form-group">
							<label for="resName">식당명</label> <input type="text" class="form-control"
								id="resName" name="resName" placeholder="식당명을 입력하세요." />
						</div>
						<!-- .form-group close -->
					</div>
					<!--.row col-md-8  -->
					<div class="row col-md-8">
						<div class="form-group">
							<label for="phoneNum">대표 전화번호</label>
							<div class="input-group" id="phoneNum">
								<input type="text" class="form-control" id="phone_p"
									name="phone_p" /><span class="input-group-addon">-</span> <input
									type="text" class="form-control" id="phone_m" name="phone_m" /><span
									class="input-group-addon">-</span> <input type="text"
									class="form-control" id="phone_l" name="phone_l" />
							</div>
						</div>
						<!-- .form-group close -->
					</div>
					<!--.row col-md-8  -->
					<div class="row col-md-8">
						<div class="form-group">
							<label for="resAddr">식당 주소</label><input type="text" class="form-control"
								id="resAddr" name="resAddr" placeholder="식당주소를 입력하세요." />
						</div>
						<!-- .form-group close -->
					</div>
					<!--.row col-md-8  -->
					<div class="row col-md-8">
						<div class="form-group">
							<label for="summary">식당 소개</label>
							<textarea class="form-control" rows="2" id="summary" name="summary"
								placeholder="소개문구(100자 이내)" /></textarea>
						</div>
						<!-- .form-group close -->
					</div>
					<!--.row col-md-8  -->
					<div class="row col-md-8">
						<div class="form-group">
							<label for="coNum">사업자번호</label>
							<div class="input-group" id="coNum">
								<input type="text" class="form-control" id="conum_p"
									name="conum_p" width="30%" /><span class="input-group-addon">-</span>
								<input type="text" class="form-control" id="conum_m"
									name="conum_m" width="30%" /><span class="input-group-addon">-</span>
								<input type="text" class="form-control" id="conum_l"
									name="conum_l" width="30%" />
							</div>
						</div>
						<!-- .form-group close -->
					</div>
					<!--.row col-md-8  -->
							</form>
				</div>
				<!-- .panel-body -->
				<div class="panel-footer">
					<button type="submit" class="btn btn-warning btn-lg" >가입하기</button>
				</div>
				<!-- .panel-footer -->
			</div>
			<!--.panel panel-Info  -->
	</div>
<!-- .col-md-12 -->
</div>
<!-- .row close  -->
</div><!--.container  -->
<script type="text/javascript" src="/resources/js/restregister.js"></script>
<%@ include file="../includes/footer2.jsp"%>