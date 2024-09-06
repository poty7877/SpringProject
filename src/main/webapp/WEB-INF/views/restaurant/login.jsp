<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ include file="../includes/header2.jsp"%>
<body>
	<div class="container">
		<div class="row">
			<div class="col-md-12">
				<h1 class="heading wow fadeInUp" data-wow-duration="500ms"
					data-wow-delay="300ms">
					<span>Restaurant Login</span>
				</h1>
			</div>
			<!-- .col-md-12 close -->
		</div>
		<!-- .row close -->
		<div class="row">
			<div class="col-md-4 col-md-offset-4">
				<div class="login-panel panel panel-default">
					<div class="panel-heading">
						<h3 class="panel-title">기업회원 로그인</h3>
					</div>
					<div class="panel-body">
						<form role="form">
							<fieldset>
								<div class="form-group">
									<input class="form-control" placeholder="아이디를 입력하세요."
										name="resID" type="text" autofocus>
								</div>
								<div class="form-group">
									<input class="form-control" placeholder="패스워드를 입력하세요."
										name="resPW" type="password" value="">
								</div>
								<div class="checkbox">
									<label> <input name="remember" type="checkbox"
										value="Remember Me">Remember Me
									</label>
								</div>
								<!-- Change this to a button or input when using this as a form -->
								<a href="index.html" class="btn btn-lg btn-success btn-block">Login</a>
							</fieldset>
						</form>
					</div>
				</div>
			</div>
		</div>
	</div>
	<!-- .container close -->
</body>
<%@ include file="../includes/footer2.jsp"%>
