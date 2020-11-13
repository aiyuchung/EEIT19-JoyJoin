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
	<div class="post newajaxlist">
		<div class="table-responsive">
			<table class="table table-striped">
				<thead>
					<!-- 	這邊可以用個迴圈拉資料出圈拉資料出 -->
					<tr>
						<th>account</th>
						<th>level</th>
						<th>emp</th>
						<th>accountType</th>
						<th>noticeType</th>
						<!-- 						<th>update</th> -->
					</tr>
				</thead>
				<c:forEach var="CMS" items="${Roles}">
					<tbody>
						<tr>
							<td>${CMS.account}</td>
							<td>${CMS.level}</td>
							<td>${CMS.emp}</td>
							<td>${CMS.accountType}</td>
							<td>${CMS.noticeType}</td>
							</tr>
						<tr>
						<td><a href="Javascript:;" class="updateMembers">修改會員</a></td>
						</tr>
					</tbody>

				</c:forEach>
			</table>
		</div>
	</div>
	
	<script>
			$(".updateMembers").click(function() { //click event

				$.ajax({
					url : "ajax_updateAllMembers",
					type : "POST",
					dataType : "html", //server送回
					contentType : 'application/json; charset=utf-8',
					data : {}, //data空的代表沒任何參數
					success : function(data) { //成功的話
						$(".newajaxlist").empty();
						$(".newajaxlist").append(data); //透過導向的URL到ajax方法 div class裝東西
					}
				})
			})
		</script>

</body>
</html>