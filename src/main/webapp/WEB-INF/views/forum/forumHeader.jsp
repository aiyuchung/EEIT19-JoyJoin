<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ page import="java.util.*,com.web.activity.model.ActivityBean"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>

<!DOCTYPE html>
<!--
Design by TEMPLATED
http://templated.co
Released for free under the Creative Commons Attribution License

Name       : Bryce Sunrise
Description: A three-column, fixed-width blog design.
Version    : 1.0
Released   : 20100501

-->
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="content-type" content="text/html; charset=utf-8" />
<title>JoyJoin - 活動總覽</title>
<meta name="keywords" content="" />
<meta name="Bryce Sunrise" content="" />

<link rel="stylesheet"
	href="https://stackpath.bootstrapcdn.com/bootstrap/4.1.3/css/bootstrap.min.css"
	integrity="sha384-MCw98/SFnGE8fJT3GXwEOngsV7Zt27NXFoaoApmYm81iuXoPkFOJwJ8ERdknLPMO"
	crossorigin="anonymous">
<link href="css/default.css" rel="stylesheet" type="text/css"
	media="screen" />

<script src="https://code.jquery.com/jquery-3.5.1.js"
	integrity="sha256-QWo7LDvxbWT2tbbQ97B53yJnYU3WhH/C8ycbRAkjPDc="
	crossorigin="anonymous"></script>

<style>
#menu-bb {
	background: #E0E000;
	height: 50px;
	
}
#thiscap {
	padding-top: .75rem;
	padding-bottom: .75rem;
	color: white;
	text-align: center;
	caption-side: top;
}

#menu>ul>li>a {
	display: block;
	float: left;
	margin: 0 0 0 50px;
	padding: 12px 15px 10px 15px;
	border: none;
	text-decoration: none;
	text-transform: uppercase;
	font-family: 微軟正黑體;
	font-weight:900;
	font-size: 20px;
	color: BLACK;
}

#menu>ul>li>a:hover {
	margin: 0 0 0 50px;
	background: #191E1A;
	border-bottom: 3px solid #FF30FF;
	color: white;
}

#selectAll1>a:hover {
	background: red;
	margin: 0 0 0 70px;
	background: #191E1A;
	border-bottom: 3px solid #FF30FF;
	color: #FFFFFF;
}

#selectAll1>a {
	background: none;
	margin: 0 0 0 70px;
	background: #191E1A;
	border-bottom: 3px solid #DDBB04;
	color: #FFFFFF;
}

/* #dropdown-menu { */
/*     position: absolute; */
/*     top: 45px; */

/*     left: 0; */
/*     z-index: 1000; */
/*     display: none; */
/*     float: left; */
/*     min-width: 10rem; */
/*     padding: .5rem 0; */
/*     margin: .125rem 0 0; */
/*     font-size: 1rem; */
/*     color: #212529; */
/*     text-align: left; */
/*     list-style: none; */
/*     background-color: #fff; */
/*     background-clip: padding-box; */
/*     border: 1px solid rgba(0,0,0,.15); */
/*     border-radius: .25rem; */
/* } */
.dropdown-item {
	display: block;
	float: left;
	margin: 0 3px 0 0;
	padding: 12px 15px 10px 15px;
	border: none;
	text-decoration: none;
	text-transform: uppercase;
	font-family: Arial, Helvetica, sans-serif;
	font-size: 11px;
	color: #DDBB04;
}

.dropdown-menu {
	position: absolute;
	top: 44px;
	left: 0;
	z-index: 1000;
	display: none;
	float: left;
	min-width: 10rem;
	padding: .5rem 0;
	margin: .125rem 0 0;
	font-size: 1rem;
	color: #212529;
	text-align: left;
	list-style: none;
	background-color: #fff;
	background-clip: padding-box;
	border: 1px solid rgba(0, 0, 0, .15);
	border-radius: .25rem;
}

#menu ul {
	margin: 0;
	padding: 0;
	list-style: none;
}

#menu>.dropdown-checkbox:hover {
	margin: 0 3px 0 0;
	background: #E0E0000;
	border-bottom: 3px solid #DDBB04;
	color: #FFFFFF;
}

.panel {
	padding: 0.3px 15px 0px 15px;
	background-color: dark-gray;
	display: none;
	overflow: hidden;
	vertical-align: middle;
	line-height: 1.8rem;
}

.panel>label {
	margin-bottom: 0rem;
}

.dropdown-item.active, .dropdown-item:active {
	text-decoration: none;
}

.dropdown-item:focus, .dropdown-item:hover {
	color: #16181b;
	text-decoration: none;
	background-color: yellow;
}

#searchform {
	margin: 0;
	padding: 20px 0;
}

.today {
	border: solid 2px lightblue;
}

#headernav {
	position: absolute;
	right: 0em;
	top: 5em;
}

#headernav>ul>li {
	float: left !important;
	list-style-type: none;
}

#headernav>ul>li:last-child {
	padding-right: 0 !important;
}

#headernav>ul>li>a, #headernav>ul>li>span {
	display: block !important;
	margin-left: 0.7em !important;
	padding: 0.80em 1.2em !important;
	letter-spacing: 0.06em !important;
	text-decoration: none !important;
	font-size: 15px !important;
	outline: 0;
	color: #FFF;
	border-radius: 10px;
}

#headernav>ul>li>a:hover, #headernav>ul>li>span:hover {
	color: #BBFFFF;
	font-weight: 700;
	box-shadow: rgba(255, 255, 255, 0.5) 0px 5px 15px;
}

#headernav li.active a {
	background: yellow;
	border-radius: 5px;
	color: #FFF;
}

#headernav>ul>li>ul {
	display: none;
}

#headerdiv {
	position: relative;
	height: 150px;
}

#headerdiv .headernav {
	position: relative;
	padding: 6em 0em;
}
</style>

</head>
<body>
	<!---------- Header ------------>
	<div class="headerPage">
		<jsp:include page="../header/header_guest.jsp" />
	</div>

	<div id="menu-bb">
		<div id="menu">
			<ul id="main">
				<li class="nav-item dropdown"><a href="#" name = "熱門" class="activeType">熱門 </a></li>
				<li class="nav-item dropdown"><a href="#" name = "電影" class="activeType">電影 </a></li>
				<li class="nav-item dropdown"><a href="#" name = "運動" class="activeType">運動 </a></li>
				<li class="nav-item dropdown"><a href="#" name = "美食" class="activeType">美食 </a></li>
				<li class="nav-item dropdown"><a href="#" name = "旅遊" class="activeType">旅遊 </a></li>
				<li class="nav-item dropdown"><a href="#" name = "音樂藝文 " class="activeType">音樂藝文 </a></li>
			</ul>
		</div>
	</div>
		<!-- end header -->

		
		<!-- 關鍵字搜尋   -->					
						<div id="searchform" method="get" action="#">
							<h6>&nbsp;&nbsp;關鍵字搜尋</h6>
							<div>
								&nbsp;&nbsp;&nbsp;&nbsp;<input type="text"  id="keyWord" size="20" value="" placeholder="EX: 籃球、和牛" /> <br />
								<button type="button" class="btn btn-outline-light btn-sm submitBtn">確認</button>
							</div>
						</div>
						
						<form  id = "backHomeForm" method ="get" action="<%=request.getContextPath()%>/forum">
			                <input type = "hidden" id = "keyWordInput" name = "keyWord" >
			                <input type = "hidden" id = "activeTypeInput" name = "type" >
		                 </form> 

<div class="newajaxlist">
	 <c:import url="../ajax/forumTable.jsp"></c:import> 
</div>
		<script>
		var code = '${forumBean.code}';
		var isCodeExists = code != null && code != '';
		console.log('是否存在主要標題代碼',isCodeExists);
		$(".activeType").click(function(){ //以活動類型作為快速篩選
			var activeType = $(this).attr('name');
			var keyWord = $('#keyWord').val();
			if(isCodeExists){
				$("#keyWordInput").val(keyWord);
				$("#activeTypeInput").val(activeType);
				$("#backHomeForm").submit();
			}else{
				$.ajax({
					  url:"ajax_forum",
					  type: "GET",
					  dataType: "html", //server送回
					  contentType: 'application/json; charset=utf-8',
					  data: {activeType: activeType,keyWord: keyWord},
					  success:function(data){
						  $(".newajaxlist").empty();
						  $(".newajaxlist").append(data);
						}
				}) 
			}
	 	
		})
		$(".submitBtn").click(function(){ //關鍵字搜尋
			var keyWord = $('#keyWord').val();
			if(isCodeExists){
				$("#keyWordInput").val(keyWord);
				$("#backHomeForm").submit();
			}else{
				$.ajax({
					  url:"ajax_forum",
					  type: "GET",
					  dataType: "html", //server送回
					  contentType: 'application/json; charset=utf-8',
					  data: {keyWord: keyWord},
					  success:function(data){
						  $(".newajaxlist").empty();
						  $(".newajaxlist").append(data);
						}
				}) 
			}
		})
		
		if(isCodeExists){
			$.ajax({
				  url:"ajax_forum",
				  type: "GET",
				  dataType: "html", //server送回
				  contentType: 'application/json; charset=utf-8',
				  data: {code: code},
				  success:function(data){
					  $(".newajaxlist").empty();
					  $(".newajaxlist").append(data);
					}
			}) 
		}
		</script>
</body>
</html>
