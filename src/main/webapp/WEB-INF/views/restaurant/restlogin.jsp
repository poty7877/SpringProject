<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ include file="../includes/header2.jsp"%>
<div class="row">
	<div class="col-md-12">
		<h1 class="heading ">
			<span>Restaurant Login</span>
		</h1>
	</div><!-- .col-md-12 close -->
</div><!-- .row close -->
<div class="row">
	<div class="col-md-4 col-md-offset-4">
		<div class="panel panel-default" style="margin-top: 50px;">
			<div class="panel-heading">
				<h3 class="panel-title">레스토랑 회원 로그인</h3>
			</div>
			<div class="panel-body">
				<form role="form" name="loginForm" action="/restaurant/restlogin"  method="post" onsubmit="return valForm(this)">
					<fieldset>
						<div class="form-group">
							<input class="form-control" placeholder="아이디를 입력하세요."
								id="resID" name="resID" type="text" autofocus/>
						</div>
						<div class="form-group">
							<input class="form-control" placeholder="패스워드를 입력하세요."
								id="resPW" name="resPW" type="password"/>
						</div>
						<div class="checkbox">
							<label> <input name="remember" type="checkbox"
								value="Remember Me">아이디 저장</label>
						</div>
						<button class="btn btn-lg btn-success btn-block" type="submit">로그인</button>
					</fieldset>
				</form>
			</div>
		</div>
	</div>
</div>

<script type="text/javascript">
function valForm(form) {
	if (!form.resID.value) {
		alert("아이디를 입력하세요.");
		return false;
	}

	if (!form.resPW.value) {
		alert("패스워드를 입력하세요.");
		return false;
	}

} //--valForm(form)
</script>

<%@ include file="../includes/footer2.jsp"%>
