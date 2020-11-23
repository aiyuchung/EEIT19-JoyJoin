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
	<h2 class="sub-header">日誌</h2>
	<div>
		<div id="wrap" class="table-responsive">
			<table class="table table-striped">
				<thead>
					<!-- 	這邊可以用個迴圈拉資料出圈拉資料出 -->
					<tr>
						<th>使用者</th>
						<th>請求時間</th>
						<th>請求方法</th>
						<th>請求IP</th>
						
						<!-- 						<th>update</th> -->
					</tr>
				</thead>
				<c:forEach var="CMS" items="${Log}">
					<tbody>
						<tr>
							<td>${CMS.createBy}</td>
							<td>${CMS.createDate}</td>
							<td>${CMS.method}</td>
							<td>${CMS.requestIp}</td>
						
						</tr>
					</tbody>
				</c:forEach>
			</table>
		</div>
	</div>


</body>
</html>