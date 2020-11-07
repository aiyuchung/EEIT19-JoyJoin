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
</head>
<body>
<input id="num" type="text" value="${activitiesNum}" hidden />
<span id="textSpan"></span>

		
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