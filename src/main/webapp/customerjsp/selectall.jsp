<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" import="java.util.* ,com.web.activity.model.CustomerBean"%>
    <%!@SuppressWarnings("unchecked")%>
    <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>客戶資料</title>
<script src="https://code.jquery.com/jquery-3.5.1.min.js" integrity="sha256-9/aliU8dGd2tb6OSsuzixeV4y/faTqgFtohetphbbj0=" 
crossorigin="anonymous"></script>
</head>
<body>
<div align="center">
		<h2>客戶資料</h2>
		
		<table border="1">
			<tr style="background-color: #a8fefa">
				<th>號<th>帳號<th>匿名<th>密碼<th>信箱<th>手機<th>出生日期<th>性別<th>婚姻	<th>身高<th>體重<th>學歷<th>收入<th>照片 
					
				<c:forEach items="${ cuss }" var="cus" varStatus="s">
			<tr>
				<td>${cus.entityID}
				<td>${cus.loginId}
				<td>${cus.name}
				<td>${cus.password}
				<td>${cus.email}
				<td>${cus.pho}
				<td>${cus.birthDate} 
				<td>${cus.gender == 'm' ? '男' : '女'}
				<td>${cus.maritalStatus  == 's' ? '未婚' : '已婚'}
				<td>${cus.height}
				<td>${cus.weight}
				<td>${cus.education}
				<td>${cus.salaried}
				<td>${cus.file}
				<c:set var="count" value="${s.count }" />
				<td><input type="button" value="更新" class="subbtn" >
				<td><input type="button" value="刪除" class="delbtn" >

 				</c:forEach>
		</table>
		<h3>共${count }筆客戶資料</h3>
		<p><input type="button" value="回首頁" class="select" ></p>
</div>
	<script >
		$(".subbtn").on("click",function(){
			let theNo = $(this).parents("tr").children("td").eq(0).text();
		
			location.href = '${pageContext.request.contextPath}/selectOne?entityID='+theNo;
		})
		$(".delbtn").on("click",function(){
			let theNo = $(this).parents("tr").children("td").eq(0).text();
	
			location.href = '${pageContext.request.contextPath}/Delete?entityID='+theNo;
	
		})
		$(".select").on("click",function(){
			location.href='/servlet/customerjsp/select.jsp';
			
		})
  </script>
</body>
</html>