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
	<table width="70%" border="1" align="center">
			<tr>
				<td>類型</td>
				<td>標題</td>
				<td>評分</td>
				<td>發文者</td>
				<td>發文時間</td>
				<td>地區</td>
				<td>點閱率</td>
			</tr>
			 <c:forEach var="forum" items="${forumList}">
			 		<form id>
			 		<input type="hidden" name="forumSeq" value="${forum.forumSeq}"/>
			 		<input type="hidden" name="code" value="${forum.type}${forum.forumSeq}"/>
			</form>
			 	<tr>
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