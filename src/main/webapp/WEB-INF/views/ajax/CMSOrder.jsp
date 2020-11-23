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
	<h2 class="sub-header">訂單</h2>
	<div>
		<div id="wrap" class="table-responsive">
			<table class="table table-striped">
				<thead>
					<!-- 	這邊可以用個迴圈拉資料出圈拉資料出 -->
					<tr>
						<th>訂單號碼</th>
						<th>訂單價格</th>
						<th>訂單項目</th>
						<th>訂單數量</th>
						<th>訂單日期</th>
						<!-- 						<th>update</th> -->
					</tr>
				</thead>
				<c:forEach var="CMS" items="${Order}">
					<tbody>
						<tr>
							<td>${CMS.orderNo}</td>
							<td>${CMS.orderPrice}</td>
							<td>${CMS.orderItem}</td>
							<td>${CMS.orderNum}</td>
							<td>${CMS.orderDate}</td>
				
						</tr>
					</tbody>
				</c:forEach>
			</table>
		</div>
	</div>


</body>
</html>