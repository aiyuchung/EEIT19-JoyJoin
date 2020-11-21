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
<c:forEach var="one" items="${keywords}" varStatus="status">
 <a href="Javascript:;" class="searchForKey">${one} </a>
</c:forEach>

<script>
$(document).on('click','.searchForKey',function(){ //熱門搜尋
	var keyword = $(this).text();
	$.ajax({
		  url:"ajax_keyWords",
		  type: "get",
		  dataType: "html",
//			  contentType: 'application/json; charset=utf-8',
		  data: {
			  keyword: keyword
			},
		  success:function(data){
			  $(".post").empty();
			  $(".newajaxlist").empty();
			  $(".newajaxlist").append(data);
				},
			error:function(){
			 	$(".newajaxlist").empty();
	 			$(".newajaxlist").append(
	 					'<c:forEach var="all" items="${activities}"><div class="post oldajaxlist"><h2 class="title"><strong>${all.activityDate} </strong> (${all.prov})</h2>'
	 				        +'<h1 class="title"><a href="#">${all.name}</a></h1><p class="byline"><small><a href="#發起人的超連結" rel="nofollow">${all.memberBean.nickname}</a>於 ${all.createdDate} 發起</small></p>'
	 				        +'<div class="entry"><p>本 <strong>${all.activityTypeName}</strong> 活動將於${all.finalDate}截止</p>'
	 				        +'<p>只要 ${all.minLimit}人即可成公開團!     本活動最高上限人數:  ${all.maxLimit}</p>'
	 				        +'<p class="links"><a href="#" class="more">(看詳細內容)</a> &nbsp;&nbsp;&nbsp;</p></div></div></c:forEach>'
		 		);
			  }
	})
})
</script>
</body>
</html>