<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

<!DOCTYPE html>
<html>
<%@ include file="../includes/header.jsp"%>
<head>
<meta charset="UTF-8">
<title>HappyTable-예약생성</title>
</head>
<body>
<section id="contact-us">	
		<div class="container">
			<div class="row">
				<div class="col-md-12">
					<div class="block">
						<h1 class="heading wow fadeInUp" data-wow-duration="500ms" data-wow-delay="300ms"><span>식사 예약 페이지에 어서오세요</span></h1>
						<form role="form" action="/order/insert" method="post">
						
							<input type='hidden' name='resNum' value='1'/>
							<input type='hidden' name='memUno' value='1'/>
							<input type='hidden' name='a_Status' value='예약 중'/>

							<div class="form-group wow fadeInDown" data-wow-duration="500ms" data-wow-delay="600ms">
								<label>예약일</label>
								<input type="date" class="form-control" name="a_Date">
							</div>
							<div class="form-group wow fadeInDown" data-wow-duration="500ms" data-wow-delay="800ms">
								<label>예약시간</label>
								<input type="time" class="form-control" name="time">
							</div>
							<div class="form-group wow fadeInDown" data-wow-duration="500ms" data-wow-delay="1000ms">
								<label>예약인수</label>
								<select name="a_NOP">
									<%
									int max_a_NOP = 10; // 예약 가능 최대 인원
									for(int i = 1; i<max_a_NOP; i++){%>
										<option value="<%=i%>"><%=i%></option>										
									
									<%} %>
									
								</select>
							</div>
							<button type="reset"  class="btn btn-default wow bounceIn">초기화하기</button>
							<button type="submit" class="btn btn-default wow bounceIn">예약하기</button>
						</form>	
					</div>
				</div><!-- .col-md-12 close -->
			</div><!-- .row close -->
		</div><!-- .container close -->
	</section><!-- #contact-us close -->
		
<%@ include file="../includes/footer.jsp"%>	
</body>

</html>