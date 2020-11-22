<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<table>
		<th>
			<td>好友帳號</td>
			<td>查看名片</td>
			<td>刪除好友</td>
		</th>
		<c:forEach var="ff" items="${friend}" begin="0" step="1">
			<tr>
				<td id="account">${ff}</td>
				<td><input type="button" id="seeCard" onclick="see()"/></td>
				<td><input type="button" id="delCard" onclick="del()"/></td>
			</tr>
		</c:forEach>
	</table>
<script>
	function see(){
		var id = document.getElementById("account")
		location.href="<c:url value='/detailCard/'+id/>"
	}
	
	function del(){
		var id = document.getElementById("account")
		location.href="<c:url value='/delFriend/'+id/>"
	}
	
</script>	
</body>
</html>