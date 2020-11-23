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
#ccc {
 	font-size: 0.5cm;
	font-family: 微軟正黑體;
	font-weight: 900;	
}
#ccc tbody{
border:none;


}
#ccc thead tr {
	background-color:rgba(102,153,204,0.9);
	color: white;
}

#ccc tbody tr:nth-child(odd) {
	background-color: rgba(255,255,255,0.8);
	color: black;
}

#ccc tbody tr:nth-child(odd):hover {
	background:#FFFFCE;
}

#ccc tbody tr:nth-child(even) {
	background-color:  rgba(210,233,255,0.8);
	color: black;
}

#ccc tbody tr:nth-child(even):hover {
	background: #FFFFCE	;
}

#ccc thead td:first-child {
	border-radius: 20px 0 0 0;
	outline:0;
}

#ccc thead td:last-child {
	border-radius: 0 20px 0 0;
	outline:0;
}

#ccc tbody tr:last-child td:first-child {
	border-radius: 0 0 0 20px;
	outline:0;
}

#ccc tbody tr:last-child td:last-child {
	border-radius: 0 0 20px 0;
	outline:0;
}

</style>
</head>
<body>
	<form id="formToDetail" method="get"
		action="<%=request.getContextPath()%>/forumDetail">
		<input type="hidden" id="forumSeqInput" name="forumSeq" />
	</form>
	<table  id="ccc" width="70%" border="1" align="center" style="padding:10px;background-color:green;opacity:0.8;">
		<thead>
			<tr style="text-align: center" height="60px" >
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
			<tr  style="text-align: center" height="60px" class="to_detail" name="${forum.forumSeq}">
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
	$(".submitBtn").click(function() { //關鍵字搜尋
		var keyWord = $('#keyWord').val();
		if (isCodeExists) {
			$("#keyWordInput").val(keyWord);
			$("#backHomeForm").submit();
		} else {
			$.ajax({
				url : "ajax_forum",
				type : "GET",
				dataType : "html", //server送回
				contentType : 'application/json; charset=utf-8',
				data : {
					keyWord : keyWord
				},
				success : function(data) {
					$(".newajaxlist").empty();
					$(".newajaxlist").append(data);
				}
			})
		}
	})
	
	
	$(".to_detail").click(function(){

		var account = $("#userAccount").val();

		console.log("account ="+account);

		if (account == "" || account == null){

			$('#exampleModal').modal('show');

			event.preventDefault();

		}else{
			var forumSeq = $(this).attr('name');
			$("#forumSeqInput").val(forumSeq);
			$("#formToDetail").submit();
		}
	})
	</script>
</body>
</html>