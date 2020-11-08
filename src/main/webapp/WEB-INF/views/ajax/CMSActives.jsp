<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ page import="java.util.*,com.web.activity.model.ActivityBean"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn"%>
<!DOCTYPE html>
<html>
<head>
</head>
<body>
<%-- 	<input id="num" type="text" value="${activitiesNum}" hidden /> --%>
<!-- 	<span id="textSpan"></span> -->

	<h2 class="sub-header">活動概況</h2>
	<div class="table-responsive">
		<table class="table table-striped">
			<thead>
				<!-- 	這邊可以用個迴圈拉資料出圈拉資料出 -->
				<tr>
					<th>activityClass</th>
					<th>location</th>
					<th>activityStatus</th>
					<th>price</th>
					<th>name</th>
					<th>activityDate</th>
					<th>finalDate</th>
					<th>introduction</th>
					<th>createdDate</th>
				</tr>
			</thead>
			<c:forEach var="CMS" items="${activities}">
				<tbody>
					<tr>
						<td>${CMS.activityClass}</td>
						<td>${CMS.location}</td>
						<td>${CMS.activityStatus}</td>
						<td>${CMS.price}</td>
						<td>${CMS.name}</td>
						<td>${CMS.activityDate}</td>
						<td>${CMS.finalDate}</td>
						<td>${CMS.introduction}</td>
						<td>${CMS.createdDate}</td>
						
					</tr>
				</tbody>
			</c:forEach>
		</table>
	</div>
</body>
</html>