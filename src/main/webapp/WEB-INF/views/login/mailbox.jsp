<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@taglib uri="http://www.springframework.org/tags/form" prefix="form" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<div>
		<jsp:include page="../header/header_guest.jsp" />
	</div>
	<div>
		<h3>信箱</h3>
		<table>
			<c:forEach var="msg" items="msgList">
				<tr>
					<td>FROM${msg.account}</td>
					<td>TIME${msg.time}</td>
					<td>Subject${msg.subject}</td>
					<c:if test="${msg.readStatus ==0}">
						<td>未讀</td>
					</c:if>
					<c:if test="${msg.readStatus ==1}">
						<td>已讀</td>
					</c:if>
				</tr>
			</c:forEach>		
		</table>
	</div>




</body>
</html>