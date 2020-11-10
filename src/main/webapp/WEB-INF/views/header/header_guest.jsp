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
				<c:choose>
					<c:when test="${level == '4'}  ">
						<ul>
							<li class="active"><span id="header-home">活動一覽</span></li> 
							<li><span id="header-talk">討論區</span></li>
							<li></li>
							<li>管理後臺</li>
						</ul>
					</c:when>
					<c:when test="${level  == '1'} ">
						<ul>
							<li class="active"><span id="header-home">活動一覽</span></li> 
							<li><span id="header-talk">討論區</span></li>
							<li>會員資料</li>
							<li>登出</li>
						</ul>	
					</c:when>	
					<c:otherwise>
						<ul>
							<li class="active"><span id="header-home">活動一覽</span></li> 
							<li><span id="header-talk">討論區</span></li>
							<li><span id="header-member">會員資料(暫)</span></li>
							<li><a id="header-login">會員登入</a></li>
						</ul>
					</c:otherwise>					
				</c:choose>
			</nav>

		</div>
	</div>
	<input type="hidden" id="test123">
<script>
	console.log(${level})
	document.getElementById("test123").value='${level}';
	console.log("${account}")

	document.getElementById("header-home").onclick = function(){
		location.href = "<c:url value = '/activities'/>";
	}
	
	document.getElementById("header-talk").onclick = function(){
		location.href = "<c:url value = '/'/>";		//改成討論版的路徑
	}
	
	document.getElementById("header-login").onclick = function(){
		location.href = "<c:url value = '/login'/>";
	}
	
	document.getElementById("header-member").onclick = function(){
		location.href = "<c:url value = '/member'/>";
	}
	
	
</script>	
</body>
</html>