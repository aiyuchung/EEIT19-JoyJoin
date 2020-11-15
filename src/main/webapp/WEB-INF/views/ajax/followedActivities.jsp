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
	.links{
	color:white;
	}
</style>
</head>
<body>

<span id="textSpan"></span>
		<div class="links">
		<h1 style="color:white">HIHIHIHIH</h1>
		<c:forEach var="followed" items="${followed}">
			<ul>
				<li><a href="${followed.activityUrl}"></a></li>

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
	
</script>
</body>
</html>