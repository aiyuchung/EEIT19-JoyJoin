<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ page import="java.util.*,com.web.activity.model.Activebean"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="BIG5">
<title>HOME</title>
<script src="http://ajax.googleapis.com/ajax/libs/jquery/1.11.0/jquery.min.js"></script>
		<script src="/js/skel.min.js"></script>
		<script src="/js/skel-panels.min.js"></script>
		<script src="/js/init.js"></script>
		<link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.1.3/css/bootstrap.min.css" 
			integrity="sha384-MCw98/SFnGE8fJT3GXwEOngsV7Zt27NXFoaoApmYm81iuXoPkFOJwJ8ERdknLPMO" 
			crossorigin="anonymous">
		<script src="https://code.jquery.com/jquery-3.5.1.js"
			integrity="sha256-QWo7LDvxbWT2tbbQ97B53yJnYU3WhH/C8ycbRAkjPDc="
			crossorigin="anonymous"></script>
		
			<link rel="stylesheet" href="../css/skel-noscript.css" />
			<link rel="stylesheet" href="../css/style.css" />
			
			<link rel="stylesheet" href="../css/style-desktop.css" />
			<link rel="stylesheet" href="../css/carousel.css" />
<style>
	body {
		margin: 0px;
		padding: 0px;
		background: white;
		font-family: 'Raleway', sans-serif;
		font-size: 11pt;
		color: #000000;
	}
	.headerPage{
		background: #180E0B;
	}
	form{
		margin:50px;
	}
</style>
</head>
<body >
<div class="headerPage"></div>
<form>
<div align="center">
<a href="../trip/SelectAllController">查詢全部活動</a>
</div>
<div align="center">
<a href="InsertTrip.jsp">新增活動</a>
</div>
</form>
<script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.14.3/umd/popper.min.js" integrity="sha384-ZMP7rVo3mIykV+2+9J3UJ46jBk0WLaUAdn689aCwoqbBJiSnjAK/l8WvCWPIPm49" crossorigin="anonymous"></script>
<script src="https://stackpath.bootstrapcdn.com/bootstrap/4.1.3/js/bootstrap.min.js" integrity="sha384-ChfqqxuZUCnJSK3+MXmPNIyE6ZbWh2IMqE241rYiqJxyMiZ6OW/JmZQ5stwEULTy" crossorigin="anonymous"></script>

</body>
<script>
$(document).ready(function(){
	$(".headerPage").load("${pageContext.request.contextPath}/header3.jsp",function(){
		$("#nav>ul>li").removeClass("active");
		$("#header4").addClass("active");
	});

})
</script>
</html>