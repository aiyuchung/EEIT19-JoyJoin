<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ page import="java.util.*,com.web.activity.model.ActivityBean"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>
<!DOCTYPE html>
<html>
<head>
<style>
	.showmsg{
		padding: 2px;
		margin-top:2px;
	}
	.userpic{
		display:inline-block;
		width:60px;
		height:60px;
		border-radius:50%;
		border:2px solid grey;
	}
</style>
</head>
<body>


<h1 class="section-title" >new留言板</h1>
<c:forEach var="msg" items="${msgBox}">
<div class="credit-block sources ">
	<div class="">
		<img src="" class="userpic msgpic"/><a href="#"><h5 style="display: inline-block">${member.nickname} ( ${account} )</h5></a>
	</div>
	<div class="showmsg">
		<textarea rows="2" name="msg" cols="28" class="msgbox newmsg" readonly>${msg.msgContent}</textarea>
	</div>
</div>
</c:forEach>
<script type="text/javascript">
	var number = $("#num").val();
	if(number == 0){
		$("#textSpan").text("目前尚無活動");
	}else{
		console.log("else")
	}
	
</script>
</body>
</html>