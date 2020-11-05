<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Header what Guest can see</title>
</head>
<body>
	<div id="header">
		<div class="container">

			<!-- Logo -->
			<div id="logo">
				<h1>
					<a href="/index.html">JOYJOIN LOGO</a>
				</h1>
			</div>

			<!-- Nav -->
			<nav id="nav">
				<c:set var="level" value="${level}"/>
				<c:choose>
					<c:when test="${level} == 4">
						<ul>
							<li class="active"><span id="header-home">活動一覽</span></li> 
							<li><span id="header-talk">討論區</span></li>
							<li></li>
							<li>管理後臺</li>
						</ul>
					</c:when>
					<c:when test="${level} == 1">
						<ul>
							<li class="active"><span id="header-home">活動一覽</span></li> 
							<li><span id="header-talk">討論區</span></li>
							<li></li>
							<li></li>
						</ul>	
					</c:when>
					<c:otherwise>
						<ul>
							<li class="active"><span id="header-home">活動一覽</span></li> 
							<li><span id="header-talk">討論區</span></li>
							<li></li>
							<li></li>
						</ul>
					</c:otherwise>					
				</c:choose>
			</nav>

		</div>
	</div>
<script>
	document.getElementById("header-home").onclick = function(){
		location.href="<c:url value = '/'/>"
	}
	
	document.getElementById("header-talk").onclick = function(){
		location.href="<c:url value = '/'/>"		//改成討論版的路徑
	}
	
	document.getElementById("header-login").onclick = function(){
		location.href="<c:url value = 'login'/>"
	}
	
	
</script>	
</body>
</html>