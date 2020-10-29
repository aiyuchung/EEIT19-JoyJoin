<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ page import="java.util.*,com.web.activity.model.Activebean"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>新刪修查</title>
<script src="https://code.jquery.com/jquery-3.5.0.js"></script>
</head>
<body>
	<h2>活動資料</h2>
	<table border="1">

		<tr style="background-color: #E2C2DE">
			<th>活動編號
			<th>運動類型
			<th>日期時間
			<th>運動地點
			<th>招收人數
			<th>發起人名
			<th>主辦電話
			<th>截止日期
			<th width='90px'>功能 
			
			
		<%-- 	<%
				List<Activebean> actives = new ArrayList<Activebean>();
				if (request != null && request.getAttribute("actives") != null) {
					actives = (ArrayList<Activebean>) request.getAttribute("actives");
				}
				for (Activebean active : actives) {
			%> <!-- sptype,spdate,splocation,spnop,spmajor,spphone,spenddate -->
		<tr>
			<td><%=active.getSpno()%>
			<td><%=active.getSptype()%>
			<td><%=active.getSpdate()%>
			<td><%=active.getSplocation()%>
			<td><%=active.getSpnop()%>
			<td><%=active.getSpmajor()%>
			<td><%=active.getSpphone()%>
			<td><%=active.getSpenddate()%>
			<td><form method="post" action="/sport/sport_controller2">
					<input type='submit' value='修改' />
					<input hidden type='text' name='spno' value=<%=active.getSpno()%> />
				</form>
					<form method="get" action="/sport/sport_controller2">
						<input type='submit' value='刪除' /><input hidden type='text'
							name='spno' value=<%=active.getSpno()%> />
					</form>
					<%
						}
					%> --%>
					
			 <!-- sptype,spdate,splocation,spnop,spmajor,spphone,spenddate -->
			 
			 <c:forEach var="active" items="${actives}">
			 <tr>
			<td> ${active.spno}</td>
						<c:choose>
							<c:when test="${active.sptype == 'basketball'}">
								<td>籃球</td>
							</c:when>
							<c:when test="${active.sptype == 'football'}">
								<td>足球</td>
							</c:when>
							<c:when test="${active.sptype == 'baseball'}">
								<td>棒球</td>
							</c:when>
						</c:choose>
			<td> ${active.spdate}</td>
			<td> ${active.splocation}</td>
			<td> ${active.spnop}</td>
			<td> ${active.spmajor}</td>
			<td> ${active.spphone}</td>
			<td> ${active.spenddate}</td>
			<td><form method="post" action="${pageContext.request.contextPath}/sport_controller2">
					<input type='submit' value='修改' />
					<input hidden type='text' name='spno' value= "${active.spno}" />
				</form>
					<form id="deleteForm${active.spno}" class = "subbtn" method="get" action="${pageContext.request.contextPath}/sport_controller2" >
						<input id = "deleteButton${active.spno}" type='button' value='刪除' /><input hidden type='text'
							name='spno' value= "${active.spno}" />
					</form>
			 </c:forEach>
		
					
	</table>
	<a href="sport/First.jsp"><input type="button" value="回首頁" /></a>

</body>
<script>
$(".subbtn").on("click",function(){
	var r = confirm("確認刪除?");
	if (r == true) {
		$(this).closest("form").submit();
	} else {
		alert("按爽沒?");
		confirm("還要按嗎?");
		confirm("還要按嗎?");
		confirm("還要按嗎?");
		alert("還敢亂按阿!");
	}
})

</script>
</html>