<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ page import="java.util.*,com.web.activity.model.Activebean"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>新刪修查</title>
</head>
<body>
	<h2>新增活動</h2>
	<form method="post" action="../sport_controller">
		<!--  運動類型: <input type="text"  name="sptype" /><br><br>-->
		運動類型: <select name="sptype">
			<option value = 'basketball'>籃球</option>
			<option  value = 'football'>足球</option>
			<option  value = 'baseball'>棒球</option>

		</select><br>
		<br> 日期時間: <input type="text" name="spdate" /><br>
		<br> 運動地點: <input type="text" name="splocation" /><br>
		<br> 招收人數: <input type="text" name="spnop" /><br>
		<br> 發起人名: <input type="text" name="spmajor" /><br>
		<br> 主辦電話: <input type="text" name="spphone" /><br>
		<br> 截止日期: <input type="text" name="spenddate" /><br>
		<br> <input type="submit" value="送出" />
		<a href ="<%=request.getContextPath()%>/sport/First.jsp"><input type="button" value="回首頁" /></a>
	</form>
	
	
</body>
<script>
let sucessMsg = '${sucessMsg}';
let errorMsg = '${errorMsg}';
if(!!sucessMsg){
	alert(sucessMsg);
	window.location.href = "${pageContext.request.contextPath}/sport/First.jsp";
}
if(!!errorMsg){
	alert(errorMsg);
	window.location.href = "${pageContext.request.contextPath}/sport/insert.jsp";
}

</script>
</html>