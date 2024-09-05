<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ include file="../includes/header2.jsp"%>
			<div class="row">
				<div class="col-md-12">
					<h1 class="heading wow fadeInUp" data-wow-duration="500ms"
						data-wow-delay="300ms">
						<span>Restaurant 메뉴등록</span>
					</h1>
				</div>
				<!-- .col-md-12 close -->
			</div>

			<!-- .row close -->
			<form id="regiForm" method="post" action="restaurant/register" onsubmit="return valForm(this)">
			<input type="hidden" name="resNum" value ="${rest.resNum}">
				
				<div class="col-md-12">
					<div class="panel panel-info">
						<div class="panel-heading">
							메뉴 입력
							<button>메뉴 추가</button>
						</div>
						<!-- panel-heading -->
						<div class="panel-body">
							<table width="80%"
								class="table table-striped table-bordered table-hover"
								id="dataTables-example">
								<thead>
									<tr>
										<th>메뉴명</th>
										<th>메뉴소개</th>
										<th>주재료</th>
										<th>구성*</th>
										<th>가격</th>
										<th>이미지 파일</th>
									</tr>
								</thead>
								<tbody>
									<tr>
										<td><input type="text" id="menuName" name="menuName" /></td>
										<td><textarea rows="2" placeholder="메뉴의 소개문구(50자 이내)" id="menuAcoount" name="menuAcoount" ></textarea> </td>
										<td><input type="text" id="mainIngredient" name="mainIngredient" /></td>
										<td><input type="text" id="serving" name="serving" placeholder="예 : 2인분"/>인분</td>
										<td><input type="text" id="unitCost" name="unitCost"/>원</td>
										<td><button>파일찾기</button></td>
									</tr>
								</tbody>
							</table>
							<!-- /.table-responsive -->
						</div>
						<!-- panel-body -->
						<div class="panel-footer">
							<button type="submit" class="btn btn-primary btn-lg btn-block">저장하기</button>
						</div>
					</div>
					<!--panel panel-info  -->
				</div>
				<!-- .col-md-12 close -->
			</form>

	<%@ include file="../includes/footer2.jsp"%>
