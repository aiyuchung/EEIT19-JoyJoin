<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ page import="java.util.*,com.web.activity.model.ActivityBean"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>
<!DOCTYPE html>
<html>
<head>
<style>
	.showmsg{
		padding: 2px;
		margin-top:2px;
	}
	.userpic{
		display:inline-block;
		width:60px;
		height:60px;
		border-radius:50%;
		border:2px solid grey;
	}
</style>
</head>
<body>
<div class="section-block summary">
	<h1 class="section-title">留言板</h1>
	<div class="profile-contents">
		<h2 class="position">參加人員歡迎在此留言板討論及詢問</h2>
<!-- 							<img src="assets/img/profile-img.jpg" -->
<!-- 								class="profile-image img responsive" alt="John Doe"> -->
		<!--social links-->
<!-- 							<ul class="list-inline"> -->
<!-- 								<li><a href="#"><i class="fa fa-twitter"></i></a></li> -->
<!-- 								<li><a href="#"><i class="fa fa-facebook"></i></a></li> -->
<!-- 								<li><a href="#"><i class="fa fa-google-plus"></i></a></li> -->
<!-- 								<li><a href="#"><i class="fa fa-linkedin"></i></a></li> -->
<!-- 								<li><a href="#"><i class="fa fa-git"></i></a></li> -->
<!-- 							</ul> -->
		<!--/social links-->
		<button class="btn btn-contact lookmsg">👇🏻看全部</button>

<!-- 							  <button class="btn btn-primary" type="button" data-toggle="collapse" data-target="#collapseExample" aria-expanded="false" aria-controls="collapseExample"> -->
<!-- 							    Button with data-target -->
<!-- 							  </button> -->
		<button class="btn btn-contact addmsg" data-toggle="collapse" data-target="#collapseExample" >我要留言</button>
	</div>
	
</div>
<div class="section-block msgbox collapse" id="collapseExample">
	<h1 class="section-title" >新增留言</h1>
	<div class="credit-block sources ">
		<textarea rows="2" name="msg" cols="28" class="msgbox newmsg" placeholder="(打點什麼吧)"></textarea>
	</div>
	<button class="btn btn-contact sendmsg">送出</button>
	<i class="fa fa-twitter"></i>
</div>
<div class="section-block msgboard" >
<h1 class="section-title" >留言板</h1>
	<c:forEach var="msg" items="${msgBox}">
	<div class="credit-block sources ">
		<div class="">
			<img src="" class="userpic msgpic"/><a href="#"><h5 style="display: inline-block">${nickname} ( ${account} )</h5></a>
		</div>
		<div class="showmsg">
			<textarea rows="2" name="msg" cols="28" class="msgbox newmsg" readonly>${msg.msgContent}</textarea>
		</div>
	</div>
	</c:forEach>
</div>
<script type="text/javascript">
	var number = $("#num").val();
	if(number == 0){
		$("#textSpan").text("目前尚無活動");
	}else{
		console.log("else")
	}
	
</script>
</body>
</html>