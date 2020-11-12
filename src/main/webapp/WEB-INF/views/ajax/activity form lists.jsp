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
</head>
<body>
<input id="num" type="text" value="${activitiesNum}" hidden />
<span id="textSpan"></span>
<%-- <c:set var="aa" value="${activitiesNum}"/> --%>
<%-- <c:if test="${aa==0}"> --%>
<%-- 	<span id="textSpan">${aa}目前尚無活動12312</span> --%>
<%-- </c:if> --%>


<%-- <span></span><c:set var="num" value="${activitiesNum}"/> --%>

<%-- <c:choose> --%>
<%-- 	<c:when test=" ${num == 0}"> --%>
<!-- 		activitiesNum: test -->
<%-- 		${activitiesNum} --%>
<!-- 		alert("test OK"); -->
<!-- 			<span>目前尚無活動</span> -->

<%-- 	</c:when> --%>
<%-- 	<c:otherwise> --%>
<%-- 	activitiesNum !=0 strange : ${activitiesNum} --%>
<!-- 	alert("test NONO"); -->
		<c:forEach var="all" items="${activities}">
			<div class="post">
				<h2 class="title">
					<strong>${all.activityDate} </strong> (${all.prov})
				</h2>
				<h1 class="title">
					<a href="#">${all.name}</a>
				</h1>
				<p class="byline">
					<small><a href="#發起人的超連結" rel="nofollow">${all.MemberBean.nickname}</a>於
						${all.createdDate} 發起</small>
				</p>
				<div class="entry">
					<p>
						本 <strong>${all.activityTypeName}</strong> 活動將於${all.finalDate}截止
					</p>
					<p>只要 ${all.minLimit}人即可成公開團! 本活動最高上限人數: ${all.maxLimit}</p>
					<p class="links">
						<a href="#" class="more">(看詳細內容)</a> &nbsp;&nbsp;&nbsp;
					</p>
				</div>
			</div>
		</c:forEach>
<%-- 	</c:otherwise> --%>
<%-- </c:choose> --%>
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