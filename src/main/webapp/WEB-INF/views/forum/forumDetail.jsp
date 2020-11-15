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
<title>JoyJoin - 活動總覽 </title>
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
		
		<div class="newajaxlist">
	 <c:import url="../ajax/forumTable.jsp"></c:import> 
</div>
		<script>
			$(".activeType").click(function(){ //以活動類型作為快速篩選
				var activeType = $(this).attr('name');
				var keyWord = $('#keyWord').val();
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
			})
			$(".submitBtn").click(function(){ //關鍵字搜尋
				var keyWord = $('#keyWord').val();
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
			})
		</script>
	
	<table width="70%" border="1" align="center">
		<tr>
			<td><c:out value="${forumTitle.type}" default="no values"/></td>
			<td><c:out value="${forumTitle.title}" default="no values"/></td>
			<td><c:out value="${forumTitle.score}" default="no values"/></td>
			<td><c:out value="${forumTitle.author}" default="no values"/></td>
			<td><fmt:formatDate value="${forumTitle.time}" type="both"/></td>
			<td><c:out value="${forumTitle.location}" default="no values"/></td>
			<td><c:out value="${forumTitle.popularity}" default="no values"/></td>
		</tr>
	</table>
	
	<table width="70%" border="1" align="center"  style="border-top: 5px #ff0000;" >

		 <c:forEach var="forum" items="${forumDetailList}">
		<tr>
			<td rowspan="2" width="10%" height="100px" style="border-right: 0px;">
				<img width = "100%" src="images/img02.jpg" alt=""/>
			</td>
			<td rowspan="2" width="10%" height="100px" style="border-left: 0px;">
			深海異音<br /> 
			hbl917070<br /> 
			稱號 未夠班的勇者<br /> 
			種族 妖精<br />
			 巴幣 226632 <br />
			 GP 7881<br />
			</td>
			<!-- <td width="20%"  height="100px" style="border-right: 0px;">	<img width = "50%" src="images/img02.jpg" alt=""/><img width = "50%" src="images/img02.jpg" alt=""/><img width = "50%" src="images/img02.jpg" alt=""/></td> -->
			<td width="60%"  height="100px" style="border-left: 0px;">
		    <!----------------------------------內容開始------------------------------------ -->
		    <table>
		    <tr height="200px"><td><img width = "50%" src="images/img02.jpg" alt=""/></td></tr>
		      <tr><td>${forum.article}</td></tr>
		      <tr  height="50px"><td style="text-align :right"><input class = "forumEdit" type="button" name = "${forum.forumSeq}" value="編輯">&nbsp;</td></tr>
		    </table>
		  
			<!-- --------------------------------內容結束------------------------------------ -->			
			</td>
		</tr>
			
				<tr>
			<td>
				<table border="1" width="100%">
					<tr>
						<td width="25%">
						    <div>
						  <c:forEach var="i" begin="1" end="${forum.score}">
                                <img  class="i" width = "33" src="images/chngstar.gif" />
                                 </c:forEach>

	                          <c:forEach var="i" begin="1" end="${5-forum.score}">
                               <img id="img5" class="i" width = "33" src="images/star.gif" />
                                 </c:forEach>
						       
						      <!--   <img id="img2" class="i" width = "33" src="images/chngstar.gif" />
						        <img id="img3" class="i" width = "33" src="images/chngstar.gif" />
						        <img id="img4" class="i" width = "33" src="images/chngstar.gif" />
						        <img id="img5" class="i" width = "33" src="images/star.gif" /> -->
						    </div>
    					</td>
						<td width="75%">
						  <input type="hidden" name = "evaTag" id = "evaTag${forum.forumSeq}" value = "${forum.evaTag}" />
						<div id="evaTagArea${forum.forumSeq}"></div>
						
						</td>
					</tr>
				</table>
			</td>
		</tr>
			  </c:forEach>	
		<tr>
			<td height ="70" colspan="3" align="center">
			<form method ="get" action="<%=request.getContextPath()%>/forumNewArticle">
			 	    <input type = "hidden" name = "code" value = "${forumTitle.code}">
		<input type = "hidden" name = "activityCode" value = "${forumTitle.activityCode}">
		<input type = "hidden" name = "type" value = "${forumTitle.type}">
		<input type = "hidden" name = "author" value = "${forumTitle.author}">
		<input type = "hidden" name = "title" value = "${forumTitle.title}">
		<input type = "hidden" name = "location" value = "${forumTitle.location}">
			   <input type="submit" value="新增貼文" id="to_forumNewArticle">
			</form>	
			</td>
		</tr>
		
		
		<form  id = "updateForm" method ="get" action="<%=request.getContextPath()%>/forumUpdateArticle">
			<input type = "text" id = "detailForumSeq" name = "forumSeq" >
		</form>
	</table>


<script>	
$(".forumEdit").click(function(){ //以活動類型作為快速篩選
	var detailForumSeq = $(this).attr('name');
	$("#detailForumSeq").val(detailForumSeq);
	$("#updateForm").submit();
})

<c:forEach items="${forumDetailList}" var="forum">
  var dataEvaTagStr =  $("#evaTag"+${forum.forumSeq}).val();
  var combineHtml = "";
  if(dataEvaTagStr !== null){
  	var dataEvaTags =dataEvaTagStr.split(',');
  	dataEvaTags.forEach(function(item, index, array) {
  		if(item!=null && item != ''){
  			combineHtml+="<button>"+item+"</button>";
  		}
  		});

  		$("#evaTagArea"+${forum.forumSeq}).html(combineHtml);
  }
  
</c:forEach>




</script>




</body>
</html>