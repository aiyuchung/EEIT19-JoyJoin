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
	body{
		font-family: Microsoft JhengHei;
	}
	.links{
		color:white;
		margin-top:8px;
	}
	.showurl a{
		color:white;
		font-size:20px;
	}
	
	li{
	list-style-type: none;
	
		
	}
	.lititle{
		text-align:left;
		float:left;
		list-style-type: none;
		width:400px;
		overflow : hidden;
 		text-overflow : ellipsis;
	}
	.litime{
		font-family: Microsoft JhengHei;
		font-size:15px;
		text-align:left;
		float:left;
		width:170px;
		display:inline;
 		padding:7px 0;
		list-style-type: none;
		vertical-align:bottom;
	}
</style>
</head>
<body>

<span id="textSpan"></span>
		<div class="links">
		
			
			<c:forEach var="followed" items="${followed}">
			
			<ul class="showurl">
				<li class="lititle litime">活動日期: ${followed.activityBean.activityDate}</li>
				<li class="lititle"><a href="${followed.activityUrl}">${followed.activityBean.name}</a></li>
				<c:if test="${followed.condition eq '關注'}">
					<li><button type="button" class="btn btn-outline-light follow">取消關注</button></li>
				</c:if>	
				<c:if test="${followed.condition eq '舉辦'}">
					<li><button type="button" class="btn btn-outline-danger hold">修改</button></li>
				</c:if>
				<c:if test="${followed.condition eq '參加'}">
					<li><button type="button" class="btn btn-outline-warning join">去留言</button></li>
				</c:if>		
			</ul>
			</c:forEach>
			
			
		
		</div>
		
	
<input id="num" type="text" value="${activitiesNum}" hidden="true" />
<script type="text/javascript">
// 	var number = $("#num").val();
// 	if(number == 0){
// 		$("#textSpan").text("目前尚無活動");
// 	}else{
// 		console.log("else")
// 	}
	
	
// 	List<ActivityJoinedBean> joined = service.joinedMember(activityNo); //取得本活動參加名單
// 	boolean isJoined = false;
// 	for(ActivityJoinedBean ajb:joined) {
// 		String joinedAccount = ajb.getMemberBean().getAccount();
// 		if (joinedAccount.equals(account)) {  //如果使用者在參加名單內回傳true
// 			isJoined = true;
// 			break;
// 		}
// 	}
	$(".follow").click(function(){
		var url = $(this).parents("ul").find('a').attr('href');
		var tokens = url.split("/");
		var no = tokens[5];
		$(this).parents(".showurl").hide("500");
		$.ajax({
			  url:"<c:url value='/ajax_unfollow' />",
			  type: "POST",
			  dataType: "html", //server送回
			  data: {
				  activityUrl:url.toString(),
			  }, 
			  success:function(data){
				}
		})
	})
	$(".join").click(function(){
		var url = $(this).parents("ul").find('a').attr('href');
		var tokens = url.split("/");
		console.log(tokens);
		var no = tokens[5];
		console.log(no);
		var newurl = "oneActivity/"+ no +"?condition=join";
		window.location.href = '<c:url value="'+newurl+'" />';
		
	})
	$(".hold").click(function(){
		var url = $(this).parents("ul").find('a').attr('href');
		var tokens = url.split("/");
		var no = tokens[5];
		var newurl = "updateActivity/"+no;
		window.location.href = '<c:url value="'+ newurl +'"/>';
		
	})
	
	$(".btn").mouseenter(function(){
		$(this).parents(".showurl").find(".lititle").css("background-color","rgba(255, 255, 255, 0.3)");
	})
	$(".btn").mouseleave(function(){
		$(this).parents(".showurl").find(".lititle").css("background-color","none");
	})
</script>
</body>
</html>