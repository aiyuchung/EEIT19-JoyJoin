<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ page import="java.util.*,com.web.activity.model.ActivityBean"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>新刪修查</title>
</head>
<body>
<%ActivityBean act = (ActivityBean)request.getAttribute("returnActive"); %>
<script src="https://code.jquery.com/jquery-3.5.1.js"
	integrity="sha256-QWo7LDvxbWT2tbbQ97B53yJnYU3WhH/C8ycbRAkjPDc="
	crossorigin="anonymous"></script>


	<h2>修改活動</h2>
	<form method="post" action="<%=request.getContextPath()%>/movie_controller">
<table>
			<tr>
				<td>活動編號
				<td><input type="text" disabled value="<%=act.getActno()%>">
					<!--系統自動給值  -->
			<tr>
				<td>電影院型態
				<td><select name="actmode" id="actmode">
						<option value="上映中">上映中</option>
						<option value="二輪片">二輪片</option>
						<option value="MTV">MTV</option>
				</select>
			<tr>
				<td>電影類型
				<td><input type="text" name="acttype" value="<%=act.getActtype()%>">
			<tr>
				<td>電影名稱
				<td><input type="text" name="actname" value="<%=act.getActname()%>">
			<tr>
				<td>電影院地區
				<td><input type="text" name="actlocation" value="<%=act.getActlocation()%>">
			<tr>
				<td>電影院名稱
				<td><input type="text" name="actmvtheater" value="<%=act.getActmvtheater()%>">
			<tr>
				<td>參加人數
				<td><input type="text" name="actnop" value="<%=act.getActnop()%>">
			<tr>
				<td>活動發起人
				<td><input type="text" name="actpeople" value="<%=act.getActpeople()%>">
			<tr>
				<td>發起人聯絡方式
				<td><input type="text" name="actpcon" value="<%=act.getActpcon()%>">
			<tr>
				<td>活動日期
				<td><input type="text" name="actdate" value="<%=act.getActdate()%>">
			<tr>
				<td>集合時間
				<td><input type="text" name="acttime" value="<%=act.getActtime()%>">
			<tr>
				<td>截止日期
				<td><input type="text" name="actendtime" value="<%=act.getActendtime()%>">
			<tr>
				<td>前往訂票
				<td><input type="text" name="hyperlink" value="<%=act.getHyperlink()%>">
			<tr>
				<td>
			<tr>
				<td> <input type="reset" value="清除">
		</table>
    <input type="hidden" name="actno"  value = "<%=act.getActno()%>"/>
		<br> <input type="submit" value="送出" />
	<%-- 	<a href ="<%=request.getContextPath()%>/jsp/First.jsp"><input type="button" value="回首頁" /></a> --%>
	</form>
			<form method="get" action="<%=request.getContextPath()%>/movie_controller">
		   <input type="submit" value="回活動專區" />
		</form>
</body>
<script type="text/javascript">
var something = '${returnActive.actmode}';
$("#actmode").val(something);
let sucessMsg = '${sucessMsg}';
let errorMsg = '${errorMsg}';
if(!!sucessMsg){
	alert(sucessMsg);
}
if(!!errorMsg){
	alert(errorMsg);
}
</script>
</html>