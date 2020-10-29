<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<style>
	.st2{
	width:450px;
	margin:auto;
	border-radius:15px;
	}
</style>

<title>select</title>
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
</style>
</head>
<body>
	<div class="headerPage"></div>
	<fieldset class="st2">
		<br>
		<h2>會員管理者介面</h2>
		<form method="get" action="../customer.java">
			<input type="button" name="selempno" value="查詢全部會員" class="buttonselse"/><br><br>
	
			 <a href="../customerjsp/insert.jsp"></a>
	 		 <input type="button" name="newempno" value="新增會員" class="insert" />
	
			</form>
		</fieldset>
<script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.14.3/umd/popper.min.js" integrity="sha384-ZMP7rVo3mIykV+2+9J3UJ46jBk0WLaUAdn689aCwoqbBJiSnjAK/l8WvCWPIPm49" crossorigin="anonymous"></script>
<script src="https://stackpath.bootstrapcdn.com/bootstrap/4.1.3/js/bootstrap.min.js" integrity="sha384-ChfqqxuZUCnJSK3+MXmPNIyE6ZbWh2IMqE241rYiqJxyMiZ6OW/JmZQ5stwEULTy" crossorigin="anonymous"></script>
<script >
		$(document).ready(function(){
			$(".headerPage").load("${pageContext.request.contextPath}/header3.jsp");
		})
		$(".buttonselse").on("click",function(){
			location.href='${pageContext.request.contextPath}/customer';
			})
		$(".insert").on("click",function(){
			location.href='insert.jsp';
			
			})
		
</script>	
</body>

</html>