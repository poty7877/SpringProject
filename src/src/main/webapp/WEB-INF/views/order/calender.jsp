<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ page import="java.util.*"%>
<%
int year = 0;
int month = 0; // 0 ~ 11
int day = 0; // 1~31
int time = 0;

// 년도, 월 중 하나라도 지정(넘겨져 오지)되지 않으면 오늘날짜 기준으로 월달력 출력
if (request.getParameter("year") == null || request.getParameter("month") == null) {
	Calendar today = Calendar.getInstance();
	year = today.get(Calendar.YEAR);
	month = today.get(Calendar.MONTH);
	day = today.get(Calendar.DATE);
	
} else {
	// 출력하고자 하는 달력의 년도와 월
	year = Integer.parseInt(request.getParameter("year")); // 2022,..
	month = Integer.parseInt(request.getParameter("month")); // 0 ~ 11

	// 이전달 클릭 year, month-1 / 다음달 클릭 year, month+1
	// -1 -> 11,year--  12 -> 0,year++
	if (month == -1) {
		month = 11;
		year = year - 1;
	}
	if (month == 12) {
		month = 0;
		year = year + 1;
	}
}
// 출력하고자 달의 1일 객체 + 1일 요일 + 마지막 날짜
Calendar firstDate = Calendar.getInstance();
firstDate.set(Calendar.YEAR, year);
firstDate.set(Calendar.MONTH, month);
firstDate.set(Calendar.DATE, 1);
int firstDay = firstDate.get(Calendar.DAY_OF_WEEK); // 1일의 요일 정보(1일,2월,....,7토)
int lastDate = firstDate.getActualMaximum(Calendar.DATE);

// 출력 알고리즘(td의 개수 구하기)
int startBlankCnt = firstDay - 1;
int endBlankCnt = 0;
if ((startBlankCnt + lastDate) % 7 != 0) {
	endBlankCnt = 7 - (startBlankCnt + lastDate) % 7;
}
int tdCnt = startBlankCnt + lastDate + endBlankCnt;
%>
	<div align="center">				
			<div>
			<span class="fw-bold"><%=year%>년 <%=month + 1%>월</span>
				<table>
					<tr>
					<input type='text' name='resNum' value='<c:out value="${resVO.oper.resNum}"/>'/>
						<th class="text-danger">일</th>
						<th>월</th>
						<th>화</th>
						<th>수</th>
						<th>목</th>
						<th>금</th>
						<th class="text-primary">토</th>
					</tr>
					<tr>
						<%
						for (int i = 1; i <= tdCnt; i++) {
						%>
						<td>
							<%
							if (i > startBlankCnt && i <= startBlankCnt + lastDate) {
								if (i % 7 == 0) {
							%>
						<a href='/order/insert2?date=<%=year%>-<%=month+1%>-<%=i - startBlankCnt%>&resNum=${resVO.oper.resNum}' class="text-primary"><%=i - startBlankCnt%></a>
						<%
						} else if (i % 7 == 1) {
						%>
						<a href='/order/insert2?date=<%=year%>-<%=month+1%>-<%=i - startBlankCnt%>&resNum=${resVO.oper.resNum}' class="text-danger"><%=i - startBlankCnt%></a>
						<%
						 } else {
						%>
						<a href='/order/insert2?date=<%=year%>-<%=month+1%>-<%=i - startBlankCnt%>&resNum=${resVO.oper.resNum}' ><%=i - startBlankCnt%></a>
						<% }} else { %>
						&nbsp; <% } %>
						</td>
						<%
						if (i != tdCnt && i % 7 == 0) {
						%>
					</tr>
					<tr>
						<%}}%>
					</tr>
				</table>
			</div>
			<div>
			<table>
			<tr>
				<td> 예약일 </td>
				<td>
				<input id="selectedDate" name="date" value='<c:out value="${date}"/>' readonly="readonly">			
				</td>
			</tr>
			<tr>
				<td> 예약가능시간 </td>
				<td>
				<input id="selectedTime" name="selectedTime" value="<%
				if(time!=0){%>time<%}%>" readonly="readonly"/>
				</td>				
			</tr>
			<tr>
			<td>
			<%for(int i = 1; i<10; i++){ //1에 가게 시작 시간 10에 가게 종료 시간
			if(i!=3){%> <!-- /get메서드의 read에서 가게번호와 시간을 통해 검색 검색 결과가 존재할 경우 비활성화 -->
				<button data-oper='time' class="btn btn-info" value="<%= i %>">
				</button>
			<%}} %>
			</td>
			</tr>
			
			</table>			
			</div>
			</div>
			<script>
			
			</script>