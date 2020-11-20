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
<style>
/* #wrap { */
/* 	display: flex; */
/* } */
</style>
</head>
<body>
	<h2 class="sub-header">會員名單</h2>
	<div>
		<div id="wrap" class="table-responsive">
			<table class="table table-striped">
				<thead>
					<!-- 	這邊可以用個迴圈拉資料出圈拉資料出 -->
					<tr>
						<th>帳號</th>
						<th>性別</th>
						<th>信箱</th>
						<th>姓名</th>
						<th>暱稱</th>
						<th>星座</th>
						<!-- 						<th>update</th> -->
					</tr>
				</thead>
				<c:forEach var="CMS" items="${Members}">
					<tbody>
						<tr>
							<td>${CMS.account}</td>
							<td>${CMS.gender}</td>
							<td>${CMS.mail}</td>
							<td>${CMS.fullName}</td>
							<td>${CMS.nickname}</td>
							<td>${CMS.starSign}</td>
						</tr>
					</tbody>
				</c:forEach>
			</table>
		</div>
	</div>


</body>
</html>