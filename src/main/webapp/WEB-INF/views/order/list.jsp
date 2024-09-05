<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

<!DOCTYPE html>
<html>
<%@ include file="../includes/header.jsp"%>
<head>
<meta charset="UTF-8">
<title>HappyTable</title>
</head>
<body>
<section id="contact-us">
		<div class="container">
			<div class="row">
				<div class="col-md-12">
					<div class="block">
						<h1 class="heading wow fadeInUp" data-wow-duration="500ms" data-wow-delay="300ms"><span>식사 예약 페이지에 어서오세요</span></h1>
						<form role="form" action="/order/list" method="get">
						
							<%-- <input type='hidden' name='resNum' value='<c:out value="${#}"/>'>
							<input type='hidden' name='memUno' value='<c:out value="${#}"/>'> --%>
						
						
							<div class="form-group wow fadeInDown" data-wow-duration="500ms" data-wow-delay="600ms">
								<input type="date" class="form-control" id="date"
									placeholder="예약일">
							</div>
							<div class="form-group wow fadeInDown" data-wow-duration="500ms" data-wow-delay="800ms">
								<input type="time" class="form-control" id="time" placeholder="예약시간">
							</div>
							<div class="form-group wow fadeInDown" data-wow-duration="500ms" data-wow-delay="1000ms">
								<input type="" class="form-control" id="a_NOP" placeholder="예약인수"></input>
							</div>
						</form>
						<button type="submit" data-oper='back' class="btn btn-default wow bounceIn">다른가게보기(미구현)</button>
						<button type="submit" data-oper='insert' class="btn btn-default wow bounceIn">예약하기</button>
					</div>
				</div><!-- .col-md-12 close -->
			</div><!-- .row close -->
		</div><!-- .container close -->
	</section><!-- #contact-us close -->
	
	<script type="text/javascript">
	$(document).ready(function(){
		var formObj = $("form");
		$('button').on("click", function(e){
			e.preventDefault();
		});

	    var operation = $(this).data("oper");
	    
	    console.log(operation);
	    
	    if(operation === 'back'){
	      formObj.attr("action", "/");
	      
	    }else if(operation === 'insert'){
	      //move to list
	      formObj.attr("action", "/order/insert").attr("method","post");
	      
	      var pageNumTag = $("input[name='pageNum']").clone();
	      var amountTag = $("input[name='amount']").clone();
	      var keywordTag = $("input[name='keyword']").clone();
	      var typeTag = $("input[name='type']").clone();      
	      
	      formObj.empty();
	      
	      formObj.append(pageNumTag);
	      formObj.append(amountTag);
	      formObj.append(keywordTag);
	      formObj.append(typeTag);	       
	    }
	    
	    formObj.submit();
	  });
		
	});	
	</script>
<%@ include file="../includes/footer.jsp"%>	
</body>

</html>