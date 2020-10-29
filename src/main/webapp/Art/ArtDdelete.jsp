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
		<h2>藝文資料</h2>
		
		<form id="form1" method="get" action='../ArtDelete'>
			<table border="1">
			
				<tr>
					<td>號
					<td><input type="text"  value="${artno.gArtno}">
				<tr>
					<td>藝文活動類別
					<td><input type="text" value="${artno.Arttype}">
				<tr>
					<td>區域
					<td><input type="text" value="${artno.Area}">
				<tr>
					<td>活動時間
					<td><input type="text" value="${artno.Arttime}">
				<tr>
					<td>活動名稱
					<td><input type="text" value="${artno.Artname}">
			</table>
<!-- 			<input type="button" value="修改"  name="artno"> <input -->
<!-- 				type="submit" /> -->
		</form>
<!-- 		<script> -->
			
<!-- 		</script> -->
	</div>
</body>
</html>