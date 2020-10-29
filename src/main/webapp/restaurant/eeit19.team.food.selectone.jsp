<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" import="java.util.*,com.web.activity.model.FoodBean"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<style>

</style>
<script src="https://code.jquery.com/jquery-3.5.0.js"></script>
</head>
<body>
<div>
	<form method="post">
		<table align="center">
			<tr><th></th></tr>
			<tr><td>活動編號</td>
				<td><input type="text" disabled value="${rest.itineraryNo}"></td></tr>
			<tr><td>行程類型</td>
				<td><input type="text" disabled value="${rest.itineraryType}"></td></tr>
			<tr><td>餐廳種類</td>
				<td><input type="text" disabled value="${rest.restaurantType}"></td></tr>
			<tr><td>店名</td>
				<td><input type="text" disabled value="${rest.restaurantName}"></td></tr>
			<tr><td>電話</td>
				<td><input type="text" disabled value="${rest.restaurantTel}"></td></tr>
			<tr><td>地址</td>
				<td><input type="text" disabled value="${rest.restaurantAdd}"></td></tr>
			<tr><td>行程日期</td>
				<td><input type="text" disabled value="${rest.itineraryDate}"></td></tr>
			<tr><td>平均價位</td>
				<td><input type="text" disabled value="${rest.averagePrice}"></td></tr>
			<tr><td>參與人數</td>
				<td><input type="text" disabled value="${rest.joinCount}"></td></tr>						
			<tr><td colspan="2" align="center"><a href="${pageContext.request.contextPath}/Food_SelectAll">返回</a></td></tr>
		</table>
	</form>
</div>
<script>
	
</script>
</body>
</html>