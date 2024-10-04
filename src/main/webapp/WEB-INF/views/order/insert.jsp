<%@page import="com.happytable.domain.OperationsVO"%>
<%@page import="java.util.Date"%>
<%@page import="java.text.SimpleDateFormat"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn"%>


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
						<h1 class="heading wow fadeInUp" data-wow-duration="500ms"
							data-wow-delay="300ms">
							<span>식사 예약 페이지에 어서오세요</span>
						</h1>
						<form role="form" action="/order/insert" method="post">

							<input type='hidden' name='resNum'
								value='<c:out value="${resVO.oper.resNum}"/>' /> <input
								type='hidden' name='memUno'
								value='<c:out value="${loginMember.getMemUno()}"/>' /> <input
								type='hidden' name='headCount'
								value='<c:out value="${resVO.salList[0].headCount}"/>' /> <input
								type='hidden' name='a_Status' value='예약 중' />

							<p style="text-align: center; color: red;">당일 예약은 불가합니다.
								${rest_day_log}입니다.</p>
							<table style="margin-left: 70px; margin-top: 20px; width: 90%;">
								<tr>

									<th>예약일</th>
									<th>
										<%-- <input type="date" class="form-control" name="date" required="required" min="${s_Date}" max="${e_Date}"> --%>
										<input type="text" id="datePicker" name="date"
										class="form-control" style="text-align: center;">
									</th>
									<th style="text-align: center;">예약시간</th>
									<th><select class="form-control" name="time"
										style="text-align: center;">
											<c:forEach var="i" begin="${open}" end="${close}">
												<option value="${i}:00">
													<c:out value="${i}:00" />
												</option>
											</c:forEach>
									</select></th>
								</tr>
								<tr>
									<th>예약인수</th>
									<th><select class="form-control" name="a_NOP" id="a_NOP"
										style="text-align: center;">
											<c:forEach var="j" begin="1" end="${p_Cnt}">
												<option value="${j}">
													<c:out value="${j}명" />
												</option>
											</c:forEach>
									</select></th>

									<th style="text-align: center;">요청테이블</th>
									<th><c:forEach var="i" begin="0"
											end="${fn:length(table_kind)-1}">
											<input type="checkbox" class="check" value="${table_kind[i]}"
												name="table" />
											<label for="${table_kind[i]}"> <c:out
													value="${table_kind[i]}" />
											</label>
										</c:forEach></th>
								</tr>
								<tr id="a_AdPay" style="display: none;">
									<th>예약금액</th>
									<th><input class="form-control" value="${a_AdPay}" id="adpay" name="adpay"
										readonly="readonly"
										style="margin-bottom: 10px; text-align: center;" /></th>
									<th><span id="beforePay" style="color: red; text-align: left; display:flex;">원
											예약금이 필요합니다.</span>
										<span id="afterPay" style="color: red; text-align: left; display:none;">원
											예약금을 입금하셨습니다.</span></th>
									<th>
										<button class="form-control" type="button" id="pay">결제하기</button>
									</th>
								</tr>


								<tr>
									<th>마일리지 사용</th>
									<th><input class="form-control" type="number" name="point"
										id="point" style="margin-bottom: 10px; text-align: center;" />
									</th>
									<th colspan="2">
										<p style="margin-left: 100px; color: red;">
											${loginMember.getNickName()}님의 마일리지는
											${loginMember.getPoint()}입니다.</p> <span id="pointError"
										style="display: none; color: red; margin-left: 100px;">마일리지가
											부족합니다.</span>
									</th>

								</tr>

								<tr>
									<th>문의사항</th>
									<th colspan='5'><textarea class="form-control" rows="3"
											name='a_Note'></textarea></th>
								</tr>
								<tr>
									<th></th>
									<th colspan='5'>
										<button class="form-control" style="margin-top: 10px;"
											type="button" id="subBtn" data-oper='appoint'>예약</button>
									</th>
								</tr>

							</table>



						</form>
					</div>
				</div>
				<!-- .col-md-12 close -->
			</div>
			<!-- .row close -->
		</div>
		<!-- .container close -->
		<!-- Modal 추가 -->
		<div class="modal fade" id="myModal" tabindex="-1" role="dialog"
			aria-labelledby="myModalLabel" aria-hidden="true">
			<div class="modal-dialog">
				<div class="modal-content">
					<div class="modal-header">
						<button type="button" class="close" data-dismiss="modal"
							aria-hidden="true">&times;</button>
						<h4 class="modal-title" id="myModalLabel">로그인 필요</h4>
					</div>
					<div class="modal-body">로그인 후에 사용할실 수 있습니다. 홈으로 돌아갑니다.</div>
					<div class="modal-footer">
						<button type="button" class="btn btn-default" data-oper="modal">Close</button>

					</div>
				</div>
				<!-- /.modal-content -->
			</div>
			<!-- /.modal-dialog -->
		</div>
		<!-- /.modal -->

	</section>
	<!-- #contact-us close -->
	<script type="text/javascript">
		
	
		var loggedIn =	<%=loggedInStr%>;
		
		if (!loggedIn) { // 로그인 상태가 아니면
			$("#myModal").modal("show"); // 로그인 필수 모달창 띄움
			$("#myModal").on("hidden.bs.modal", function() {
				window.location.href = "/"; // 모달창 꺼지면 홈으로 이동
			});
		}
			
		$(document).ready(function() {
			var formObj = $("form"); // form 찾아서 변수에저장
			$('button').on("click",function(e) { // 버튼 클릭시
			e.preventDefault(); // 기본 동작멈춤
			var operation = $(this).data("oper"); //data-oper의 정보를 받아 저장
			if (operation === 'appoint') { // appoint이면,
				formObj.attr("action", "/order/insert") // action변경
						.attr("method", "post"); // method는 post로
				formObj.submit(); // 폼 제출
			
			} else if (operation === 'modal') { // modal이면
				formObj.attr("action", "/") // action홈으로 변경
						.attr("method","get") // method는 get으로
				formObj.submit();// 폼 제출
			} 
				
			});
					
					$(".check").click(function(){  // 여기서 .click은 체크박스의 체크를 뜻한다.

						var str = "";  // 여러개가 눌렸을 때 전부 출력이 될 수 있게 하나의 객체에 담는다.

						$(".check").each(function(){  // .each()는 forEach를 뜻한다.

							if($(this).is(":checked"))  // ":checked"를 이용하여 체크가 되어있는지 아닌지 확인한다.

								str += $(this).val() + " ";  // 체크된 객체를 str에 저장한다.

						});

						$("#multiPrint").text(str);  // #multiPrint에 체크된 원소를 출력한다.

					});

				});
		console.log(loggedIn);
		
		
	</script>

	<script type="text/javascript">
	
	
	$(document).ready(function() {
	var pointValid = false;
	var dateValid =  false;
	
	var pointInput = $("#point");
	var pointError = $("#pointError");
	var $subBtn = $("#subBtn");
	updateSubmitButtonState();
	
	function updateSubmitButtonState() { // 버튼 활성화하는 기능
		if (dateValid){
			$subBtn.prop("disabled", false); // 버튼 활성화
		} else {
			$subBtn.prop("disabled", true); // 하나라도 실패하면 버튼 비활성화
		}
	
		if (pointValid) { 
			$subBtn.prop("disabled", false); // 버튼 활성화
		} else {// 아니면
			$subBtn.prop("disabled", true);
		}
	}
	
	
	
	$("#point").on("blur", function(){
		console.log("포인트 테스트 작동한다.");
		var point = pointInput.val();
		console.log(point);
		$.ajax({
			url : "/order/point",
			type : "get",
			data : {
				point : point							
			},
			dataType : "json",
			success: function(response){
				if(response.status === "error"){
					pointValid = false;
					pointInput.css("border-color", "red");
					pointError.css("display", "block");
					console.log("포인트 테스트 에러한다.");
				} else if (response.status === "success"){
					pointValid = true;
					pointInput.css("border-color", "");
					pointError.css("display", "none");
				}
				updateSubmitButtonState();
			},
			error:function(xhr, status, error){
				console.error("AJAX Error: ", status, error);
				pointValid = false;
				updateSubmitButtonState();
			}					
		});
		
		
	});	
	
	var a_NOP = $("#a_NOP");
	var a_AdPay = $("#a_AdPay");
	$("#a_NOP").on("click", function(){
		console.log("인원수에 따른 기능 추가");
		var person = a_NOP.val();
		var adPayCond = ${resVO.oper.adPayCond};
		console.log(person);
		console.log(adPayCond);
		
		$.ajax({
			url : "/order/person",
			type : "get",
			data : {
				person : person,
				adPayCond : adPayCond
			},
			dataType : "json",
			success: function(response){
				if(response.status === "success"){
					a_AdPay.css("display", "");
					console.log("사람 수에 따라 작동.");
					pointValid = false;
				} else if (response.status === "error"){
					a_AdPay.css("display", "none");
					pointValid = true;
				}
				updateSubmitButtonState();
			},
			error:function(xhr, status, error){
				alert("code:"+request.status+"\n"+"message:"+request.responseText+"\n"+"error:"+error);
				pointValid = false;
				updateSubmitButtonState();
			}
			
	});
		
	});
	
	var beforePay = $("#beforePay");
	var afterPay = $("#afterPay");	
	var adPay = $("#adPay");
	var pay;
	$("#pay").on("click", function(){
		console.log("결제 시스템 작동")
		
		beforePay.css("display", "none");
		afterPay.css("display", "flex");		
		pointValid = true;
		pay = adPay;
		updateSubmitButtonState();
		
	}); 
	

	$(function() {	
		console.log(${rest_day});
		$('#datePicker').datepicker({
		    format: "yyyy-mm-dd",	//데이터 포맷 형식(yyyy : 년 mm : 월 dd : 일 )
		    startDate: '+1d',	//달력에서 선택 할 수 있는 가장 빠른 날짜. 이전으로는 선택 불가능 ( d : 일 m : 달 y : 년 w : 주)
		    endDate: '+7d',	//달력에서 선택 할 수 있는 가장 느린 날짜. 이후로 선택 불가 ( d : 일 m : 달 y : 년 w : 주)
		    autoclose : true,	//사용자가 날짜를 클릭하면 자동 캘린더가 닫히는 옵션
		    datesDisabled : [${rest_day}],//선택 불가능한 일 설정 하는 배열 위에 있는 format 과 형식이 같아야함.
		    daysOfWeekHighlighted : [${everyWeek_day}], //강조 되어야 하는 요일 설정
		    daysOfWeekDisabled : [${everyWeek_day}],	//선택 불가능한 요일 설정 0 : 일요일 ~ 6 : 토요일
		    immediateUpdates: false,	//사용자가 보는 화면으로 바로바로 날짜를 변경할지 여부 기본값 :false 
		    showWeekDays : true ,// 위에 요일 보여주는 옵션 기본값 : true
		    todayHighlight : true ,	//오늘 날짜에 하이라이팅 기능 기본값 :false 
		    weekStart : 0 ,//달력 시작 요일 선택하는 것 기본값은 0인 일요일 
		    language : "ko"	//달력의 언어 선택, 그에 맞는 js로 교체해줘야한다.
		});//datepicker end
		dateValid = true;
	});//ready end
		
	
	});
	</script>


	<%@ include file="../includes/footer.jsp"%>
</body>

</html> 