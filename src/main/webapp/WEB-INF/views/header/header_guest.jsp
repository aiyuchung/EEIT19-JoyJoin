<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Header what Guest can see</title>
<style>
body{
	-webkit-user-select:none;
	-moz-user-select:none;
	-o-user-select:none;
	user-select:none;
	background-size:cover; 
	background-repeat: no-repeat;
}

</style>
</head>
<body>
	<div id="headerdiv">
		<div class="container headernav">

			<!-- Logo -->
			<div id="logo">
				<h1>
					<a href="<c:url value='/'/>">JOYJOIN LOGO</a>
				</h1>
			</div>

			<!-- Nav -->
			<nav id="headernav">
				<ul>
					<li ><a href = "<c:url value = '/activities'/>">活動一覽</a></li>
					<li><a href = "<c:url value = '/forum'/>">討論區</a></li>
					<c:choose>
						<c:when test="${level == 1}">
							<li><a href = "<c:url value = '/member'/>">會員資料</a></li>
							<li><a href = "<c:url value = '/out'/>">登出</a></li>
						</c:when>
						<c:when test="${level == 4}">
							<li><a href = "<c:url value = '/'/>">後台管理</a></li>
							<li><a href = "<c:url value = '/out'/>">登出</a></li>
						</c:when>
						<c:when test="${empty level}">
							<li><a href = "<c:url value = '/member'/>">會員資料</a></li>
							<li><a href = "<c:url value = '/login'/>">會員登入</a></li>
						</c:when>
					</c:choose>
				</ul>
			</nav>
		</div>
	</div>

<script>
	
</script>
</body>
</html>