<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" import="java.util.* ,com.web.activity.model.ArtBean"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>

<%!@SuppressWarnings("unchecked")%>
    
<!DOCTYPE html>
<html>

<head>
<meta charset="UTF-8">
<title>藝文活動資料</title>
</head>
<body style="background-color:#CEFFCE">
<div align="center" >
<script src="https://code.jquery.com/jquery-3.5.1.js" integrity="sha256-QWo7LDvxbWT2tbbQ97B53yJnYU3WhH/C8ycbRAkjPDc=" crossorigin="anonymous"></script>

		<h2>藝文活動資料</h2>
		<form id="form1" method="get" action='../ArtSearchAll'>
		<table border="1"  id="myTable">
			<tr style="background-color: #a8fefa">
				<th>號
				<th>藝文活動類別
				<th>區域
				<th>活動時間
				<th>活動名稱
				<th>修改
				<th>刪除
			</th>	
			<c:forEach var="all" items="${artno}">  
<!-- 			迴圈 跑出清單全部東西-->
			<tr>
				<td><c:out value="${all.getArtno()}" />
				<td><c:out value="${all.getArttype()}" />
				<td id="area1"><c:out value="${all.getArea()}" />
				<td><c:out value="${all.getArttime()}" />
				<td><c:out value="${all.getArtname()}" />
				<td><input type="button" value="修改" class="subbtn" >
				<td><input type="button" value="刪除" class="delbtn">
			</c:forEach>	
		</table>
		<div align="center">
			<a href="<%=request.getContextPath()%>/Art/Home.jsp">HomrPage</a>
			</div>
		</form>
	</div>
	<script>
	$(".subbtn").on("click",function(){
		let theNo = $(this).parents("tr").children("td").eq(0).text();
		window.location.href = "${pageContext.request.contextPath}/ArtSearch?artno="+theNo;
	})
	$(".delbtn").on("click",function(){
		let theNo = $(this).parents("tr").children("td").eq(0).text();
	
		console.log(typeof(theNo));
		let meg = "確定刪除 編號:" + String(theNo).substring(0,2) +" 資料?"
		if (confirm(meg)){
			window.location.href = "${pageContext.request.contextPath}/ArtDelete?artno="+theNo;
		}

	})

</script>	
</body>
</html>