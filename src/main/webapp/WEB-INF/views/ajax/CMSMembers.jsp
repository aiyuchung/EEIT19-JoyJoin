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
	<script src="https://code.jquery.com/jquery-3.5.1.js"
		integrity="sha256-QWo7LDvxbWT2tbbQ97B53yJnYU3WhH/C8ycbRAkjPDc="
		crossorigin="anonymous"></script>
	<div>
		<h2 class="sub-header">會員名單</h2>
		<form id="searchform" method="get" action="#">
			<h6>&nbsp;&nbsp;搜尋</h6>
			<div>
				&nbsp;&nbsp;&nbsp;&nbsp;<input type="text" name="member" id="member"
					size="20" value="" placeholder="請輸入關鍵字尋找會員" />
				<button type="button" class="btn btn-outline-light btn-sm">確認</button>
			</div>
		</form>
		<div class="post oldajaxlist">
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
	</div>
	<script>
		$(".btn-sm").click(function() { //關鍵字篩選

			var keywords = $("#member").val();
			$.ajax({
				url : "ajax_member_keyWords",
				type : "get",
				dataType : "html",
				contentType : 'application/json; charset=utf-8',
				data : {
					keyword : keywords
				},
				// 				  JSON.stringify(keywords),
				success : function(data) {

					console.log(data);
					$(".post").empty();
					$(".oldajaxlist").empty();
					$(".oldajaxlist").append(data);
				},
			})
		})
	</script>

</body>
</html>