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
table {
	font-size: 0.5cm;
	font-family: 微軟正黑體;
	font-weight: 900;
}

table thead tr {
	background-color: #800080;
	color: white;
}

table tbody tr:nth-child(odd) {
	background-color: #FF30FF;
	color: black
}

table tbody tr:nth-child(odd):hover {
	background: #FFFF6E;
}

table tbody tr:nth-child(even) {
	background-color: #FFC9FF;
	color: black
}

table tbody tr:nth-child(even):hover {
	background: #FFFF45;
}

table thead td:first-child {
	border-radius: 20px 0 0 0;
}

table thead td:last-child {
	border-radius: 0 20px 0 0;
}

table tbody tr:last-child td:first-child {
	border-radius: 0 0 0 20px;
}

table tbody tr:last-child td:last-child {
	border-radius: 0 0 20px 0;
}
</style>
</head>
<body>
	<form id="formToDetail" method="get"
		action="<%=request.getContextPath()%>/forumDetail">
		<input type="hidden" id="forumSeqInput" name="forumSeq" />
	</form>
	<table width="70%" border="1" align="center">
		<thead>
			<tr style="text-align: center" height="60px">
				<td width="10%">類型</td>
				<td width="30%">標題</td>
				<td width="5%">評分</td>
				<td width="15%">發文者</td>
				<td width="20%">發文時間</td>
				<td width="10%">地區</td>
				<td width="10%">點閱率</td>
			</tr>
		</thead>
		<c:forEach var="forum" items="${forumList}">
			<tr style="text-align: center" height="60px" class="to_detail"
				name="${forum.forumSeq}">
				<td>${forum.type}</td>
				<td>${forum.title}</td>
				<td>${forum.score}</td>
				<td>${forum.memberBean.nickname}</td>
				<jsp:useBean id="now" class="java.util.Date" />
				<td><fmt:formatDate value="${forum.time}" type="both" /></td>
				<td>${forum.location}</td>
				<td>${forum.popularity}</td>
			</tr>
		</c:forEach>
	</table>

	<script type="text/javascript">
		$(".to_detail").click(function() { //以活動類型作為快速篩選
			var forumSeq = $(this).attr('name');
			$("#forumSeqInput").val(forumSeq);
			$("#formToDetail").submit();
		})
	</script>
</body>
</html>