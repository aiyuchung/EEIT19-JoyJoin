<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8" import="java.util.*,com.web.activity.model.ActivityBean"%>
	<!DOCTYPE html>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<html>
<head>
<meta charset="UTF-8">
<title>員工資料</title>
<script src="https://code.jquery.com/jquery-3.5.1.js"
	integrity="sha256-QWo7LDvxbWT2tbbQ97B53yJnYU3WhH/C8ycbRAkjPDc="
	crossorigin="anonymous"></script>
<script>
	$(".subbtn").on("click",function(){
		
		let theEmpno = $(this).parents("tr").children("td").eq(0).text();	
	})
	
</script>
</head>
<body style="background-color: lightblue">

	<div align="center">
		<h2>員 工 資 料</h2>
		
		<form id="form1" method="get" action=''>
			<table border="1" id="myTable">
				<tr>
					<th>活動編號</th>
					<th>類別</th>
					<th>性質</th>
					<th>名稱</th>
					<th>縣市</th>
					<th>日期</th>
					<th>修改</th>
					<th>刪除</th>
				</tr>
				<c:forEach var="all" items="${emps}">
					<tr>
						<td><c:out value="${all.getEmpno()}" /></td>
						<td><c:out value="${all.getEname()}" /></td>
						<td><c:out value="${all.getHiredate()}" /></td>
						<td><c:out value="${all.getSalary()}" /></td>
						<td><c:out value="${all.getDeptno()}" /></td>
						<td><c:out value="${all.getTitle()}" /></td>
						<td><input type="button" value="修改" class="subbtn"></td>
						<td><input type="button" value="刪除"></td>
					</tr>
				</c:forEach>	
			</table>
		</form> 
		<h3>總共筆員工資料</h3>
<script>
	$(document).ready(function(){
		 let meg = "新增成功!"
		 alert(meg);
	})
	$(".subbtn").on("click",function(){
		let theEmpno = $(this).parents("tr").children("td").eq(0).text();
		window.location.href = "http://localhost:8080/servlet/trip/SelectOneController?empno="+theEmpno;
	})
	

</script>
	</div>

</body>
</html>