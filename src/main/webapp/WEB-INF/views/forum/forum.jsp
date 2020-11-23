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
body{
/* 	background-size:100%; */
	background-image: url(images/stars_bg.jpg);
	background-attachment:fixed; 
}

</style>

</head>
<body>
	<!---------- Header ------------>
 <c:import url="forumHeader.jsp"></c:import> 
 <div style="background-color:black;padding:20px;margin-bottom:5px;font-size:0.5cm;font-weight:900;font-familye:微軟正黑體;text-align: center;color:#FF44AA">揪in 祝您約會愉快!!!</div>
		
		
		<!-- 請登入的modal  -->	

<input type="text" id="userAccount" value="${account}" hidden>

	<div class="modal fade" id="exampleModal" tabindex="-1" role="dialog" aria-labelledby="exampleModalLabel" aria-hidden="true">

	  <div class="modal-dialog" role="document">

	    <div class="modal-content" style="background-color:#ECEBEB; border:0">

	      <div class="modal-header" style="background-color:#85AD90; border:2px solid #85AD90">

	        <h5 class="modal-title" id="exampleModalLabel" style="color:black;font-size:15px ">未登入提醒</h5>

	      </div>

	      <div class="modal-body" style="color:black; font-size:19px">

	        	您現在正在前往會員才能使用的功能!

	      </div>

	      <div class="modal-footer">

	        <button type="button" class="btn btn-secondary" data-dismiss="modal" >晚點再登入</button>

	        <a type="button" class="btn btn-primary" href="<c:url value='/login' />" style="background-color:#85AD90;border:1px solid #85AD90">現在登入</a>

	      </div>

	    </div>

	  </div>

	</div>

<script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.14.3/umd/popper.min.js" integrity="sha384-ZMP7rVo3mIykV+2+9J3UJ46jBk0WLaUAdn689aCwoqbBJiSnjAK/l8WvCWPIPm49" crossorigin="anonymous"></script>

<script src="https://stackpath.bootstrapcdn.com/bootstrap/4.1.3/js/bootstrap.min.js" integrity="sha384-ChfqqxuZUCnJSK3+MXmPNIyE6ZbWh2IMqE241rYiqJxyMiZ6OW/JmZQ5stwEULTy" crossorigin="anonymous"></script>

<script>
</script>

		
</body>
</html>
