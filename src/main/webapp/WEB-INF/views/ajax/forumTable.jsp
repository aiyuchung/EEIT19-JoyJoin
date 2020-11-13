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
table {
	font-size: 0.5cm;
	font-family: 微軟正黑體;
	font-weight: 900;
}
table thead tr{
	background-color: #800080;
	color: white;
}

table tbody tr:nth-child(odd) {
	background-color: #FF30FF;
	color: black
}
table tbody tr:nth-child(odd):hover{
  background: #FFFF6E;
}
table tbody tr:nth-child(even) {
	background-color: #FFC9FF;
	color: black
}
table tbody tr:nth-child(even):hover{
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
			 		<form id>
			 		<input type="hidden" name="forumSeq" value="${forum.forumSeq}"/>
			 		<input type="hidden" name="code" value="${forum.type}${forum.forumSeq}"/>
			</form>
			 	<tr style="text-align: center" height="60px">
				<td><a id="to_detail">${forum.type}</a></td>
				<td>${forum.title}</td>
				<td>${forum.score}</td>
				<td>${forum.author}</td>
				<jsp:useBean id="now" class="java.util.Date"  />
				<td><fmt:formatDate value="${forum.time}" type="both"/></td>
				<td>${forum.location}</td>
				<td>${forum.popularity}</td>
			</tr>
			  </c:forEach>
			
			
	<!-- 		<tr>
				<td><a id="to_detail">旅遊xxxx</a></td>
				<td>粗乃玩啊</td>
				<td>4.5</td>
				<td>揪王之王</td>
				<td>2020-11-11</td>
				<td>台北市</td>
				<td>20</td>
			</tr>

			<tr>
				<td><a id="">電影</a></td>
				<td>粗乃看啊</td>
				<td>4.5</td>
				<td>揪王之王</td>
				<td>2020-11-11</td>
				<td>台東縣</td>
				<td>20</td>
			</tr>

			<tr>
				<td><a id="">美食</a></td>
				<td>粗乃吃啊</td>
				<td>4.5</td>
				<td>揪王之王</td>
				<td>2020-11-11</td>
				<td>高雄市</td>
				<td>20</td>
			</tr> -->
		</table>
<script type="text/javascript">
document.getElementById("to_detail").onclick = function() {
	location.href = "<c:url value = '/forumDetail'/>"; //改成討論版的路徑
}
</script>
</body>
</html>