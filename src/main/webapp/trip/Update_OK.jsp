<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>活 動 明 細</title>
<script src="https://code.jquery.com/jquery-3.5.1.js"
	integrity="sha256-QWo7LDvxbWT2tbbQ97B53yJnYU3WhH/C8ycbRAkjPDc="
	crossorigin="anonymous"></script>
</head>
<body>
<div align="center">
<h2>活 動 明 細</h2>
<form>
<table>

	<tr><td>活動編號</td>
		<td><input type="text" name="tripNo" disabled value="${trip.tripNo}"></td>
	<tr><td>類別</td>
		<td><input type="text" name="tripClass" disabled value="${trip.tripClass}"></td>
	<tr><td>性質</td>
		<td><input type="text" name="tripType" disabled value="${trip.tripType}"></td>
	<tr><td>名稱</td>
		<td><input type="text" name="tripName" disabled value="${trip.tripName}"></td>
	<tr><td>地區</td>
		<td><input type="text" name="tripProv" disabled value="${trip.tripLocation}"></td>
	<tr><td>縣市</td>
		<td><input type="text" name="tripDate" disabled value="${trip.tripProv}"></td>
	<tr><td>日期</td>
		<td><input type="text" name="tripDate" disabled value="${trip.tripDate}"></td>
	<tr><td>費用</td>
		<td><input type="text" name="tripDate" disabled value="${trip.tripFee}"></td>
	<tr>
		<td><input type="button" value="回首頁" 
		onclick="javascript:location.href='${pageContext.request.contextPath}/trip/homePage.jsp'"></td>	
	
</table>
</form>
</div>
<script>
 $(document).ready(function(){
	 let meg = "修改資料成功!"
	 alert(meg);
 })
</script>

</body>
</html>