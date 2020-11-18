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

	<h2 class="sub-header">站內信箱</h2>
	<div class="post newajaxlist">
		<div class="table-responsive">
			<table class="table table-striped" style="color:white">
<!-- 				<thead> -->
<!-- 						這邊可以用個迴圈拉資料出圈拉資料出 -->
<!-- 					<tr> -->
<!-- 						<th>account</th> -->
<!-- 						<th>level</th> -->
<!-- 						<th>emp</th> -->
<!-- 						<th>accountType</th> -->
<!-- 						<th>noticeType</th> -->
<!-- 												<th>update</th> -->
<!-- 					</tr> -->
<!-- 				</thead> -->
				<c:forEach var="msg" items="${msgList}">

					<tr id="${msg.msgNo}">
						<td>寄件人:${msg.account}</td>
						<td>收件人:${msg.account2}</td>
						<td>時間:${msg.time}</td>
						<td>
							<c:if test="${msg.readStatus == 0}">未讀</c:if>
							<c:if test="${msg.readStatus == 1}">已讀</c:if>						
						</td>
					</tr>


				</c:forEach>
			</table>
		</div>
	</div>
	
	<script>
			console.log("${msg.msgNo}")
			console.log("${msg.readStatus}")
	</script>

</body>
</html>