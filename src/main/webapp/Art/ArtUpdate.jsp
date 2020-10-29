<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Update</title>
</head>
<body style="background-color:#CEFFCE">
	<div align="center">
		<script src="https://code.jquery.com/jquery-3.5.1.js"
			integrity="sha256-QWo7LDvxbWT2tbbQ97B53yJnYU3WhH/C8ycbRAkjPDc="
			crossorigin="anonymous"></script>
		<h2>藝文資料</h2>
		<form id="form1" method="post" action='../ArtUpdate'>
			<table border="1">
				<tr>
					<td>號
					<td><input type="text" name="artno" disabled
						value="${artno.artno}">
				<tr>
					<td>藝文活動類別
					<td><input type="text" readonly name="arttype" value="${artno.arttype}">
				<tr>
					<td>區域
					<td><input type="text" readonly name="area" value="${artno.area}">
				<tr>
					<td>活動時間
					<td><input type="text" readonly name="arttime" value="${artno.arttime}">
				<tr>
					<td>活動名稱
					<td><input type="text" readonly name="artname" value="${artno.artname}">
			</table>
<!-- 			<input type="button" value="" name="artno"> -->
			
			<div align="center">
			<a href="${pageContext.request.contextPath}/Art/Home.jsp">HomrPage</a>
			</div>
			
		</form>
		
		<script>
			$(document).ready(function() {
				let meg = "修改資料成功!"
				alert(meg);
			})
		</script>
		<footer>
                <p>2020 All Rights EEIT19 . </p>
        </footer>
	</div>
</body>
</html>