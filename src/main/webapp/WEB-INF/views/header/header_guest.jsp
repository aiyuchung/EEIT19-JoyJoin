<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Header what Guest can see</title>
<script src="https://code.jquery.com/jquery-3.5.1.js"	integrity="sha256-QWo7LDvxbWT2tbbQ97B53yJnYU3WhH/C8ycbRAkjPDc="	crossorigin="anonymous"></script>
<script src="https://code.iconify.design/1/1.0.7/iconify.min.js"></script>
<style>
body{
	-webkit-user-select:none;
	-moz-user-select:none;
	-o-user-select:none;
	user-select:none;
	background-size:cover; 
	background-repeat: no-repeat;
	
}

.neverRead{
	box-shadow: 0 0 15px 5px #f3d42e;
}
</style>
<style>
#headernav
	{
		position: absolute;
		right: 0em;
		top: 5em;
	}

		#headernav > ul > li
		{
			float: left !important;
			list-style-type: none;
		}
		
			#headernav > ul > li:last-child
			{
				padding-right: 0 !important;
			}

			#headernav > ul > li > a,
			#headernav > ul > li > span
			{
				display: block !important;
				margin-left: 0.7em !important;
				padding: 0.80em 1.2em !important;
				letter-spacing: 0.06em !important;
				text-decoration: none !important;
				font-size: 15px !important;
				outline: 0;
				color: #FFF;
				border-radius:10px;  
			}
			#headernav > ul > li > a:hover,
			#headernav > ul > li > span:hover
			{
				color:	#BBFFFF;
				font-weight: 700;
				box-shadow: rgba(255, 255, 255, 0.5) 0px 5px 15px;
			}

			#headernav li.active a
			{
				background: #56c9d6;
				border-radius: 5px;
				color: #FFF;
			}

			#headernav > ul > li > ul
			{
				display: none;
			}
#headerdiv
	{
		background-color:black;
		position: relative;
		height:150px;
	}

		#headerdiv .headernav
		{
			position: relative;
			padding: 6em 0em;
		}
#logo img {
   position:absolute;
   top:35px;
}
#logo{
	top:0;
}

		
</style>
</head>
<body>
	<div id="headerdiv">
		<div class="container headernav">

			<!-- Logo -->
			<div id="logo">
			<a href="<c:url value='/' />">
			<img src="${pageContext.request.contextPath}/images/JoyJoin.png"></a>			
			<h1>
					
				</h1>
			</div>

			<!-- Nav -->
			<nav id="headernav">
				<ul>
					<li ><a href = "<c:url value = '/activities'/>">活動一覽</a></li>
					<li><a href = "<c:url value = '/forum'/>">討論區</a></li>
<%-- 					<li><a href = "<c:url value = '/allactive'>">後台管理暫時</a></li> --%>
					<c:choose>
						<c:when test="${level < 4}">
							<li><a href = "<c:url value = '/mailMsg'/>" id="mailbox">信箱</a></li>
							<li><a href = "<c:url value = '/member'/>">${account}</a></li>
							<li><a href = "<c:url value = '/out'/>">登出</a></li>
						</c:when>
						<c:when test="${level == 4}">
							<li><a href = "<c:url value = '/allactive'/>">後台管理</a></li>
							<li><a href = "<c:url value = '/out'/>">登出</a></li>
						</c:when>
						<c:when test="${empty level}">
<%-- 							<li><a href = "<c:url value = '/check'/>">測試</a></li> --%>
							<li><a href = "<c:url value = '/login'/>">會員登入</a></li>
						</c:when>
					</c:choose>
				</ul>
			</nav>
		</div>
	</div>

<script>
	$(document).ready(function(){
		$.ajax({
			  url:"/JoyJoin/checkStatus",
			  type: "GET",
			  dataType: "text", //server送回
			  contentType: 'application/json; charset=utf-8',
			  data: {}, 
			  success:function(data){
				  console.log(data)
				  if(data=="yes"){
					  $("#mailbox").addClass("neverRead").addClass("iconify").attr("data-icon","ion:mail-unread").attr("data-inline","false")
// 					  .text("你有未讀信件");
				  }else{
					  $("#mailbox").removeClass("neverRead").text("信箱");
				  }
				}
		})
	})
</script>
</body>
</html>