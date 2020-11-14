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
  <div class="post newajaxlist">
	<h2 class="sub-header">活動概況</h2>
	
						<form id="searchform" method="get" action="#">
							<h6>&nbsp;&nbsp;關鍵字搜尋</h6>
							<div>
								&nbsp;&nbsp;&nbsp;&nbsp;<input type="text" name="s" id="s" size="20" value="" placeholder="EX: 瑜珈" /> 
								<button type="button" class="btn btn-outline-light btn-sm">確認</button>
							</div>
						</form>
  <div class="post newajaxlist">	
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
  </div>
<script>	
	$(".btn-sm").click(function(){          //關鍵字篩選
		var keywords = $("#s").val();
		console.log(keywords);
		$.ajax({
			  url:"ajax_CM_keyWords",
			  type: "get",
			  dataType: "html",
			  contentType: 'application/json; charset=utf-8',
			  data: {
				  keyword: keywords
				},
// 				  JSON.stringify(keywords),
			  success:function(data){
				  $(".post").empty();
				  $(".newajaxlist").empty();
				  $(".newajaxlist").append(data);
					},
		})
	})
</script>
</body>
</html>