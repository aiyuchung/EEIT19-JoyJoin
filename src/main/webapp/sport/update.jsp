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
<%Activebean active = (Activebean)request.getAttribute("returnActive"); %>
<script src="https://code.jquery.com/jquery-3.5.1.js"
	integrity="sha256-QWo7LDvxbWT2tbbQ97B53yJnYU3WhH/C8ycbRAkjPDc="
	crossorigin="anonymous"></script>


	<h2>修改活動</h2>
	<form method="post" action="<%=request.getContextPath()%>/sport_controller">
	
		<!--  運動類型: <input type="text"  name="sptype" /><br><br>-->
		運動類型: <select  name="sptype" id ="sptype">
			<option value = 'basketball'>籃球</option>
			<option  value = 'football'>足球</option>
			<option  value = 'baseball'>棒球</option>

		</select><br>
	<br> 日期時間: <input type="text" name="spdate"  value = '<%=active.getSpdate()%>'/><br>
<br> 運動地點: <input type="text" name="splocation"   value = '<%=active.getSplocation()%>'/><br>
<br> 招收人數: <input type="text" name="spnop"  value = '<%=active.getSpnop()%>'/><br>
<br> 發起人名: <input type="text" name="spmajor"  value = '<%=active.getSpmajor()%>'/><br>
<br> 主辦電話: <input type="text" name="spphone"  value = '<%=active.getSpphone()%>'/><br>
<br> 截止日期: <input type="text" name="spenddate"  value = '<%=active.getSpenddate()%>'/><br>
    <input type="hidden" name="spno"  value = '<%=active.getSpno()%>'/>
		<br> <input type="submit" value="送出" />
		<a href ="<%=request.getContextPath()%>/sport/First.jsp"><input type="button" value="回首頁" /></a>
	</form>
</body>
<script type="text/javascript">
var something = '${returnActive.sptype}';
$("#sptype").val(something);
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