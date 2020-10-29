<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ page import="java.util.*"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>查詢</title>
<script src="https://code.jquery.com/jquery-3.5.0.js"></script>
</head>
<body>
	<h1>查詢活動</h1>
	<a href="<%=request.getContextPath()%>/movie/insert.jsp"><input type="button" value="新增" /></a>
		<a href="<%=request.getContextPath()%>/movie/First.jsp"><input type="button" value="回首頁" /></a>
	<table border="1">
		<tr style="background-color: #E2C2DE">
			<th>活動編號
			<th>電影院型態
			<th>電影類型
			<th>電影名稱
			<th>電影院地區
			<th>電影院名稱
			<th>參加人數
			<th>活動發起人
			<th>發起人聯絡方式
			<th>活動日期
			<th>集合時間
			<th>截止日期
			<th>前往訂票
			<th width='90px'>功能 	
			 
			 <c:forEach var="active" items="${actives}">
			 <tr>
			<td> ${active.actno}</td>
			<td> ${active.actmode}</td>
			<td> ${active.acttype}</td>
			<td> ${active.actname}</td>
			<td> ${active.actlocation}</td>
			<td> ${active.actmvtheater}</td>
			<td> ${active.actnop}</td>
			<td> ${active.actpeople}</td>
			<td> ${active.actpcon}</td>
			<td> ${active.actdate}</td>
			<td> ${active.acttime}</td>
			<td> ${active.actendtime}</td>
			<td> ${active.hyperlink}</td>
			<td><form method="post" action="<%=request.getContextPath()%>/movie_controller2">
					<input type='submit' value='修改' />
					<input hidden type='text' name='actno' value= "${active.actno}" />
				</form>
					<form id="deleteForm${active.actno}" class = "subbtn" method="get" action="<%=request.getContextPath()%>/movie_controller2" >
						<input id = "deleteButton${active.actno}" type='button' value='刪除' /><input hidden type='text'
							name='actno' value= "${active.actno}" />
					</form>
			 </c:forEach>
		
					
	</table>


</body>
<script>
$(".subbtn").on("click",function(){
	var r = confirm("確認刪除?");
	if (r == true) {
		$(this).closest("form").submit();
	}
})

</script>
</html>