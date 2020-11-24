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
<div class="section-block msgboard">
	<c:if test="${msgNum == 0}">
	<p>目前還沒有人留言</p>
	</c:if>
	<c:if test="${msgNum != 0}">
	<h1 class="section-title" >留言板</h1>
	<c:forEach var="msg" items="${msgBox}">
	<div class="credit-block sources ">
		<div class="btnarea">
			<img src="${pageContext.request.contextPath}/getMemberPicture/${msg.memberBean.account}" class="userpic msgpic"/><span>&nbsp;${msg.memberBean.nickname}<a href="#"> ( ${msg.memberBean.account} ) </a></span>
			<c:if test="${account == msg.memberBean.account}">
				<img  class="smbtn msgbtnDelete" title="刪除" src="https://img.icons8.com/material-rounded/24/000000/delete-trash.png"/>
				<img  class="smbtn msgbtnEdit" title="編輯" src="https://img.icons8.com/material-outlined/24/000000/edit.png"/>
				<img hidden="true" class="smbtn msgbtnCancel" title="取消" src="https://img.icons8.com/material-outlined/24/000000/cancel.png"/>
				<img hidden="true" class="smbtn msgbtnOkay" title="確認" src="https://img.icons8.com/material-outlined/24/000000/ok.png"/>
			</c:if>
		</div>
		<div class="showmsg">
			<textarea name="msg" cols="32" class="msgbox newmsg" readonly="readonly" id="${msg.msgNo}">${msg.msgContent}</textarea>
		</div>
	</div>
	</c:forEach>
	</c:if>
</div>
<script type="text/javascript">
	$(document).ready(function(){
	var number = $("#num").val();
	if(number == 0){
		$("#textSpan").text("目前尚無活動");
	}else{
		console.log("else")
	}
	$(document).on("click",".sendmsg",function(){
		var msgContent = $(".newmsg").val();
		var activityNo = ${activityNo};
		$.ajax({
			
			  url:"<c:url value='/msgSend' />",
			  type: "POST",
			  dataType: "html", 
			  data:  {
				  msg: msgContent,
				  activityNo: parseInt(activityNo),
				  },
			  success:function(data){
				  $(".allmsg").empty();
				  $(".allmsg").append(data);
				}
		})
	})
// 	$(".sendmsg").click(function(){ //新增留言
// 		var msgContent = $(".newmsg").val();
// 		var activityNo = ${activityNo};
// 		$.ajax({
			
// 			  url:"<c:url value='/msgSend' />",
// 			  type: "POST",
// 			  dataType: "html", 
// 			  data:  {
// 				  msg: msgContent,
// 				  activityNo: parseInt(activityNo),
// 				  },
// 			  success:function(data){
// 				  $(".allmsg").empty();
// 				  $(".allmsg").append(data);
// 				}
// 		})
// 	})
	
	$(".msgbtnDelete").click(function(){ //刪除留言
		var activityNo = ${activityNo};
		var msgNo = $(this).parents(".sources").find(".msgbox").attr("id");
		$(this).parents(".credit-block").hide("500");
		
		$.ajax({
			
			  url:"<c:url value='/msgDelete' />",
			  type: "POST",
			  dataType: "html", 
			  data:  {
				  msgNo:  parseInt(msgNo),
				  activityNo: parseInt(activityNo),
				  },
			  success:function(data){
				  setTimeout(function(){
					  $(".allmsg").empty();
					  $(".allmsg").append(data);

	                },550);
				  
				  
				}
		})
		
		
	})
	
	$(".msgbtnEdit").click(function(){  //press "msg edit btn"
		var textarea = $(this).parents(".sources").find(".msgbox");
		var btnarea =  $(this).parent("div");
		textarea.prop("readonly",false);
		textarea.css("border","2px grey solid");
		btnarea.find(".msgbtnEdit, .msgbtnDelete").hide();
		btnarea.find(".msgbtnCancel, .msgbtnOkay").attr("hidden",false);
		
	})
	
	$(".msgbtnOkay").click(function(){ //更新留言
		var activityNo = ${activityNo};
		var msgContent = $(this).parents(".sources").find(".msgbox").val();
		console.log(msgContent);
		var msgNo = $(this).parents(".sources").find(".msgbox").attr("id");
		console.log(msgNo);
		$.ajax({
			
			  url:"<c:url value='/msgUpdate' />",
			  type: "POST",
			  dataType: "html", 
			  data:  {
				  msg:msgContent,
				  msgNo:  parseInt(msgNo),
				  activityNo: parseInt(activityNo),
				  },
			  success:function(data){
				  console.log("ajax update fail")
				  $(".allmsg").empty();
				  $(".allmsg").append(data);
				}
		})
	})
	
	$(".msgbox").focus(function(){
		var originalText = $(this).parents(".sources").find(".msgbox").val();
		$(".msgbtnCancel").click(function(){
			var textarea = $(this).parents(".sources").find(".msgbox");
			var btnarea =  $(this).parent("div");
			textarea.prop("readonly",true);
			textarea.css("border","none");
			btnarea.find(".msgbtnEdit, .msgbtnDelete").show();
			btnarea.find(".msgbtnCancel, .msgbtnOkay").attr("hidden",true);
			textarea.val(originalText);
		})
	})
	})
</script>
</body>
</html>