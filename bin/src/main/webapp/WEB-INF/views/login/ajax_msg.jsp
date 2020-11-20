<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ page import="java.util.*,com.web.activity.model.ActivityBean"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn"%>
<!DOCTYPE html>
<html>
<head>
</head>
<body>
	<%-- 	<input id="num" type="text" value="${activitiesNum}" hidden /> --%>
	<!-- 	<span id="textSpan"></span> -->

		<c:if test="${msg.readStatus == 1}">
			<h2>${msg.subject}</h2>
		</c:if>
		<c:if test="${msg.readStatus == 0}">
			<img src="${pageContext.request.contextPath}/images/notRead.png"><h2>${msg.subject}</h2>
		</c:if>				
<script>
	
</script>		
</body>
</html>