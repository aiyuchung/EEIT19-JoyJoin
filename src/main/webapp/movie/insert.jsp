<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ page import="java.util.*,com.web.activity.model.ActivityBean"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>

<!DOCTYPE html>
<html>
<head>
<title>activity1</title>
<script src="https://code.jquery.com/jquery-3.5.0.js"></script>
</head>
<body>
	<h1>發起活動</h1>
	<form method="post" action="<%=request.getContextPath()%>/movie_controller">
		<table>
			<tr>
				<td>電影院型態
				<td><select name="actmode">
						<option value="上映中">上映中</option>
						<option value="二輪片">二輪片</option>
						<option value="MTV">MTV</option>
				</select>
			<tr>
				<td>電影類型
				<td><input type="text" name="acttype" value="">
			<tr>
				<td>電影名稱
				<td><input type="text" name="actname" value="">
			<tr>
				<td>電影院地區
				<td><input type="text" name="actlocation" value="">
			<tr>
				<td>電影院名稱
				<td><input type="text" name="actmvtheater" value="">
			<tr>
				<td>參加人數
				<td><input type="text" name="actnop" value="">
			<tr>
				<td>活動發起人
				<td><input type="text" name="actpeople" value="">
			<tr>
				<td>發起人聯絡方式
				<td><input type="text" name="actpcon" value="">
			<tr>
				<td>活動日期
				<td><input type="text" name="actdate" value="">
			<tr>
				<td>集合時間
				<td><input type="text" name="acttime" value="">
			<tr>
				<td>截止日期
				<td><input type="text" name="actendtime" value="">
			<tr>
				<td>前往訂票
				<td><input type="text" name="hyperlink" value="">
			<tr>
				<td>
			<tr>
				<td><input type="submit" value="發起活動"> <input
					type="reset" value="清除">
		</table>
		<a href="<%=request.getContextPath()%>/movie/First.jsp"><input
			type="button" value="回首頁" /></a>
	</form>
	<form id = "listForm" method="get" action="<%=request.getContextPath()%>/movie_controller">
		</form>

</body>
<script>
	let sucessMsg = '${sucessMsg}';
	let errorMsg = '${errorMsg}';
	if (!!sucessMsg) {
		alert(sucessMsg);
		$('#listForm').submit();
	}
	if (!!errorMsg) {
		alert(errorMsg);
		window.location.href = "${pageContext.request.contextPath}/movie/insert.jsp";
	}
</script>
</html>