<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ include file="../includes/header2.jsp"%>

<div class="row">
	<div class="col-md-12">
		<h1 class="heading ">
			<span>Restaurant 회원가입</span>
		</h1>
	</div>
	<!-- .col-md-12 close -->
</div>
<div class="alert alert-danger" style="display: none; text-align: center;">
<input type="hidden" id="result" value="${result}">
<p></p>
</div><!-- 가입결과 알럿창(hidden) -->
<!-- .row close -->
<div class="row">
	<div class="col-md-8 col-md-offset-2">
		<form role="form" id="regiForm" method="post"
			action="" onsubmit="return valForm(this)">
			<div class="panel panel-info">
				<div class="panel-heading">기본정보 등록</div>
				<!-- .panel-heading -->
				<div class="panel-body">

					<div class="row" style="width: 90%; margin-left: 20px;">
						<div class="form-group ">
							<label>아이디</label><div class="input-group"> <input type="text" class="form-control"
								id="resID" name="resID" placeholder="아이디를 입력하세요.(영문, 숫자포함 5~10자)" />
								<span class="input-group-btn" ><a class="btn btn-warning" id="dupleCheck" data-value="0">중복확인</a></span></div>
						</div>
						<!-- .row close -->
					</div>
					<!--.row  -->
					<div class="row" style="width: 90%; margin-left: 20px;">
						<div class="form-group">
							<label>패스워드</label><input type="password" class="form-control"
								id="resPW" name="resPW"
								placeholder="패스워드를 입력하세요.(영문, 숫자, 특수기호 포함 6자 이상)" />
						</div>
						<!-- .form-group-->
					</div>
					<!--.row  -->
					<div class="row" style="width: 90%; margin-left: 20px;">
						<div class="form-group">
							<label>식당명</label> <input type="text" class="form-control"
								id="resName" name="resName" placeholder="식당명을 입력하세요." />
						</div>
						<!-- .form-group close -->
					</div>
					<!--.row  -->
					<div class="row" style="width: 90%; margin-left: 20px;">
						<div class="form-group">
							<label>대표 전화번호</label>
							<div class="phone input-group" >
								<input type="number" class="form-control" id="phone_f" name="divNum" maxlength="4"/><span class="input-group-addon">-</span> 
								<input type="number" class="form-control" id="phone_m" name="divNum" maxlength="4"/><span class="input-group-addon">-</span> 
								<input type="number" class="form-control" id="phone_l" name="divNum" maxlength="4"/>
								<input type="hidden" name="resPhone" id="resPhone" />	
							</div>
						</div>
						<!-- .form-group close -->
					</div>
					<!--.row  -->
					<div class="row" style="width: 90%; margin-left: 20px;">
						<div class="form-group">
							<label>식당 주소</label><input type="text" class="form-control"
								id="resAddr" name="resAddr" placeholder="식당주소를 입력하세요." />
						</div>
						<!-- .form-group close -->
					</div>
					<!--.row  -->
					<div class="row" style="width: 90%; margin-left: 20px;">
						<div class="form-group">
							<label>식당 소개</label>
							<textarea class="form-control" rows="2" id="summary"
								name="summary" placeholder="소개문구(100자 이내)" ></textarea>
						</div>
						<!-- .form-group close -->
					</div>
					<!--.row  -->
					<div class="row" style="width: 90%; margin-left: 20px;">
						<div class="form-group">
							<label>사업자번호</label>
							<div class="comun input-group" id="coNum">
								<input type="number" class="form-control" id="conum_f" name="divNum" maxlength="3"/><span class="input-group-addon">-</span> 
								<input type="number" class="form-control" id="conum_m"  name="divNum" maxlength="2"/><span class="input-group-addon">-</span> 
								<input type="number" class="form-control" id="conum_l" name="divNum" maxlength="5"/>
								<input type="hidden" name="co_Num" id="co_Num" />	
							</div>
						</div>
						<!-- .form-group close -->
					</div>
					<!--.row  -->

				</div>
				<input type="hidden" name="certify" value="추후구현">

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
<!-- .row close  -->

<script type="text/javascript" src="/resources/js/restregister.js"></script>
<%@ include file="../includes/footer2.jsp"%>