<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>activity1</title>
<style>
.div{

}

</style>
</head>
<body style="background-color:#fdf5e6">
<div align="center">
<h1>發起活動</h1>
<jsp:useBean id="act" scope="request" class="com.web.activity.model.ActivityBean"/>

<form method="get" action="/movie_controller">
<table>
<tr><td>活動編號
	<td><input type="text" disabled value="<%= act.getActno() %>"> <!--系統自動給值  -->
	<tr><td>電影院型態
	<td><input type="text" name="actmode" value="">
	<tr><td>電影類型
	<td><input type="text" name="acttype" value="">
	<tr><td>電影名稱
	<td><input type="text"  name="actname" value="">
	<tr><td>電影院地區
	<td><select name="LivingIn">
			<option value="TPE">台北市</option>
			<option value="TPE">新北市</option>
			<option value="TPE">基隆市</option>
			</select>
			<select name="LivingIn">
			<option value="TPE">士林區</option>
			<option value="TPE">北投區</option>
			<option value="TPE">中山區</option>
			</select>
	<tr><td>電影院名稱
	<td><select name="LivingIn">
			<option value="TPE">台北市</option>
			<option value="TPE">新北市</option>
			<option value="TPE">基隆市</option>
			</select>
	<tr><td>參加人數
	<td><input type="text"  name="actnop" value="">
	<tr><td>活動發起人
	<td><input type="text"  name="actpeople" value="">
	<tr><td>發起人聯絡方式
	<td><input type="text"  name="actpcon" value="">
	<tr><td>活動日期
	<td><input type="text"  name="actdate" value="">
	<tr><td>集合時間
	<td><input type="text"  name="acttime" value="">
	<tr><td>截止日期
	<td><input type="text"  name="actendtime" value="">
	<tr><td>前往訂票
	<td><input type="text"  name="hyperlink" value="">
	<tr><td><tr><td><input type="submit" value="發起活動">
	<input type="reset" value="清除">
	
</table>
</form>
</div>

</body>
</html>