<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" import="java.util.*,com.web.activity.model.FoodBean"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert Page</title>
<style>

</style>
<script src="https://code.jquery.com/jquery-3.5.0.js"></script>
</head>
<body>
<div>
	<form method="post" action="../Food_Insert" align="center">
		<table align="center">
			<tr><td>活動編號</td>
				<td><input type="text" disabled value="******"></td>
			<tr><td>行程類型</td>
				<td><input type="text" name="itineraryType"></td></tr>
			<tr><td>餐廳種類</td>
				<td><input type="text" name="restaurantType"></td></tr>
			<tr><td>店名</td>
				<td><input type="text" name="restaurantName"></td></tr>
			<tr><td>電話</td>
				<td><input type="text" name="restaurantTel"></td></tr>
			<tr><td>地址</td>
				<td><input type="text" name="restaurantAdd"></td></tr>
			<tr><td>行程日期</td>
				<td><input type="text" name="itineraryDate"></td></tr>
			<tr><td>平均價位</td>
				<td><input type="text" name="averagePrice"></td></tr>
			<tr><td>參與人數</td>
				<td><input type="text" name="joinCount"></td></tr>						
		</table>
		<input type="submit" value="送出">
		<input type="button" value="返回" class="back">
	</form>
</div>

<script>
	$(".back").on("click", function() {
		window.location.href = "${pageContext.request.contextPath}/Food_SelectAll"
	})
</script>
</body>
</html>