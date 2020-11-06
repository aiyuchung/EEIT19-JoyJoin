<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>	
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>的個人頁面</title>
	<link href='http://fonts.googleapis.com/css?family=Raleway:400,100,200,300,500,600,700,800,900' rel='stylesheet' type='text/css'>
	<script src="http://ajax.googleapis.com/ajax/libs/jquery/1.11.0/jquery.min.js"></script>
	<script src="js/skel.min.js"></script>
	<script src="js/skel-panels.min.js"></script>
	<script src="js/init.js"></script>
	<link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.1.3/css/bootstrap.min.css" 
		integrity="sha384-MCw98/SFnGE8fJT3GXwEOngsV7Zt27NXFoaoApmYm81iuXoPkFOJwJ8ERdknLPMO" 
		crossorigin="anonymous">
	<script src="https://code.jquery.com/jquery-3.5.1.js"
		integrity="sha256-QWo7LDvxbWT2tbbQ97B53yJnYU3WhH/C8ycbRAkjPDc="
		crossorigin="anonymous"></script>
	<link rel="stylesheet" href="css/skel-noscript.css" />
	<link rel="stylesheet" href="css/style.css" />
	<link rel="stylesheet" href="css/style-desktop.css" />
	<link rel="stylesheet" href="css/carousel.css" />
	<link rel="stylesheet" href="css/memberpage.css" />
	<link rel="stylesheet" type="text/css" href="path/to/css/bootstrap.min.css">
	<link rel="stylesheet" type="text/css" href="path/to/css/bootstrap-directional-buttons.css">
</head>
<body class="homepage">
		<!-- Header -->
	<div class="headerPage">
		<jsp:include page="../header/header_guest.jsp"/>
	</div>
	<span style="color:white">===============================================================================================================================================================================================================================================</span>
	<div style="margin:0 auto;width:70vw;height:95vh;background-color:red;padding:10px;position:static;">
		<div id="info" style="background-color:lime;height:100%;width:20vw;float:left;padding-top:25px;">
			<div id="picture" style="background-color:yellow;border-radius:99em;height:250px;width:250px;margin:0 auto;"></div>
			<div id="picture" style="background-color:orange;height:120px;width:80%;margin:0 auto;top:25px;"></div>
<!-- 		<table style="background-color:transparent;border:0px;position: relative;right:0;float:right;"> -->
		</div> 
		<div style="position: absolute;top:580px;left:350px">
			<button id="memberInfo-btn" >基本資料</button>
			<button id="roleInfo-btn">用戶資料</button>
			<button id="tripInfo-btn">參與活動</button>
			<button id="recommend-btn" >推薦好友</button>
		</div>
	
		
		<div id="showArea" style="background-color:pink;position: relative;height:100%;width:70%;float:right"></div>
	</div>






<!-- 	<div class="underlay-photo"></div> -->
<!-- 	<div class="underlay-black"></div> -->
	<script
		src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.14.3/umd/popper.min.js"
		integrity="sha384-ZMP7rVo3mIykV+2+9J3UJ46jBk0WLaUAdn689aCwoqbBJiSnjAK/l8WvCWPIPm49"
		crossorigin="anonymous"></script>
	<script
		src="https://stackpath.bootstrapcdn.com/bootstrap/4.1.3/js/bootstrap.min.js"
		integrity="sha384-ChfqqxuZUCnJSK3+MXmPNIyE6ZbWh2IMqE241rYiqJxyMiZ6OW/JmZQ5stwEULTy"
		crossorigin="anonymous"></script>
	<script>
	window.onload=function(){
		var area = document.getElementById("showArea");
		var btn1 = document.getElementById("memberInfo-btn");
		var btn2 = document.getElementById("roleInfo-btn");
		var btn3 = document.getElementById("tripInfo-btn");
		var btn4 = document.getElementById("recommend-btn");
		var str = "";
		btn1.onclick = function(){
			str = "姓名:<input type='text' size='10' style='background-color: aqua;border-top:transparent;border-left:transparent;border-right:transparent;' value='123'/><br>"
			+"性別:<input type='text' size='10' style='background-color: aqua;border-top:transparent;border-left:transparent;border-right:transparent;'/><br>"
            +"生日:<input type='text' size='5' style='background-color: aqua;border-top:transparent;border-left:transparent;border-right:transparent;'/>年"
                 +"<input type='text' size='2' style='background-color: aqua;border-top:transparent;border-left:transparent;border-right:transparent;'/>月<br>"
            +"星座:<input type='text' size='10' style='background-color: aqua;border-top:transparent;border-left:transparent;border-right:transparent;'/><br>"
            +"血型:<input type='text' size='10' style='background-color: aqua;border-top:transparent;border-left:transparent;border-right:transparent;'/><br>";
			
			area.innerHTML = str;
		}
		
		btn2.onclick = function(){
			area.innerHTML = "<h1>這裡放用戶組資料</h1>"
		}
		
		btn3.onclick = function(){
			area.innerHTML = "<h1>這裡放活動連結</h1>"
		}
		
		btn4.onclick = function(){
			area.innerHTML = "<h1>這裡放配對功能</h1>"
		}
	}
	
	
	
	</script>
</body>
</html>