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
<script src="https://code.jquery.com/jquery-3.5.1.js"	integrity="sha256-QWo7LDvxbWT2tbbQ97B53yJnYU3WhH/C8ycbRAkjPDc="	crossorigin="anonymous"></script>
<link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.5.0/css/bootstrap.min.css" integrity="sha384-9aIt2nRpC12Uk9gS9baDl411NQApFmC26EwAOH8WgZl5MYYxFfc+NcPb1dKGj7Sk" crossorigin="anonymous">
<script src="https://stackpath.bootstrapcdn.com/bootstrap/4.5.0/js/bootstrap.min.js" integrity="sha384-OgVRvuATP1z7JjHLkuOU7Xw704+h835Lr+6QL9UvYjZE3Ipu6Tp75j7Bh/kR0JKI" crossorigin="anonymous"></script>

<style>
	#showAreaTop div{
		color:white;
	}
	
	#showAreaTop li{
		list-style-type:none;
		text-align:left;
		
	}
	tr{
		border-bottom: dotted 1px white;
	}
	thead{
		padding:10px;
		color:	#CAFFFF;
		
		border-bottom: double 2px #CAFFFF;
		
	}
	table{
		margin-top:20px;
		font-size: 23px;
	}

</style>
</head>
<body>
	<div>
		<table>
			<thead>
				<tr>
					<td style="width:300px;">好友帳號</td>
					<td style="width:100px;">名片</td>
					<td style="width:100px;">刪除</td>
				</tr>
			</thead>
			<tbody>
			<c:forEach var="ff" items="${friend}">
				<tr>
					<td>${ff}</td>
					<td><input type="button" id="seeCard" onclick="see()"/></td>
					<td><input type="button" id="delCard" onclick="del()"/></td>
				</tr>
			</c:forEach>	
			</tbody>
		</table>
	</div>
<script>
	console.log(ff)

	function see(){
		var id = document.getElementById("account")
		console.log("=======>"+id)
		location.href="http://localhost:8080/JoyJoin/detailCard/"+id
	}
	
	function del(){
		var id = document.getElementById("account")
		location.href="http://localhost:8080/JoyJoin/delFriend/"+id

	}
	
</script>	
</body>
</html>