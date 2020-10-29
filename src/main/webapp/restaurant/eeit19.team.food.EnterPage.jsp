<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Choose a favorite itinerary</title>
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
<style>
img {
	height: 78vh;
	width: 33.333333%;
	float: left;
	opacity: 0.4;
}

</style>
<script src="https://code.jquery.com/jquery-3.5.0.js"></script>
</head>
<body>
<div class="headerPage"></div>
	<img id="img01" src="img/Party.jpg">
	<img id="img02" src="img/Date.jpg">
	<img id="img03" src="img/expensive.jpg">
	

	<script>
		$("#img01").mouseenter(function() {
			$(this).css("opacity", "1.0")
		}).mouseout(function() {
			$(this).css("opacity", "0.4")
		}).click(function() {
			window.location.href = "${pageContext.request.contextPath}/TypeSelect_1"
		})

		$("#img02").mouseenter(function() {
			$(this).css("opacity", "1.0")
		}).mouseout(function() {
			$(this).css("opacity", "0.4")
		}).click(function() {
			window.location.href = "${pageContext.request.contextPath}/TypeSelect_2"
		})

		$("#img03").mouseenter(function() {
			$(this).css("opacity", "1.0")
		}).mouseout(function() {
			$(this).css("opacity", "0.4")
		}).click(function() {
			window.location.href = "${pageContext.request.contextPath}/TypeSelect_3"
		})
	</script>
	<script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.14.3/umd/popper.min.js" integrity="sha384-ZMP7rVo3mIykV+2+9J3UJ46jBk0WLaUAdn689aCwoqbBJiSnjAK/l8WvCWPIPm49" crossorigin="anonymous"></script>
	<script src="https://stackpath.bootstrapcdn.com/bootstrap/4.1.3/js/bootstrap.min.js" integrity="sha384-ChfqqxuZUCnJSK3+MXmPNIyE6ZbWh2IMqE241rYiqJxyMiZ6OW/JmZQ5stwEULTy" crossorigin="anonymous"></script>
	
	<script>
		$(document).ready(function(){
			$(".headerPage").load("${pageContext.request.contextPath}/header3.jsp",function(){
				$("#nav>ul>li").removeClass("active");
				$("#header3").addClass("active");
			});

		})
	</script>
</body>
</html>