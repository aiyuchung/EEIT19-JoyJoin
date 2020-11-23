<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1"> 
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>MEMBER CARD</title>
<link rel="stylesheet" href="<c:url value='css/membercard.css' />" />
<script src="https://code.iconify.design/1/1.0.7/iconify.min.js"></script>
</head>
<body>
<c:choose>
	<c:when test="${mbcard.gender == 'F'}">
		<figure class="snip0056 yellow"><span class="iconify" data-icon="ion:mail-sharp" data-inline="false"></span>
			<figcaption>
				<h4>${luckyguy.nickname} <span class='id'>${luckyguy.account}</span></h4>
				<p>${luckyguy.gender}</p>
				<p>${luckyguy.mail}</p>
				<p>${luckyguy.signature}</p>
				<div class="icons">
					<a href="#"><i class="ion-ios-home"></i></a>
					<a href="#"><span class="iconify" data-icon="ion:mail-sharp" data-inline="false" id="msg"></span></a>
				</div>
			</figcaption>
			<img src="<c:url value='/getMemberPicture/${luckyguy.account}' />" alt="picture" />
			<div class="position">${score }</div>
		</figure>
	</c:when>
	<c:otherwise>
		<figure class="snip0056 red">
			<figcaption>
				<h2>${luckyguy.nickname} <span class='id'>${luckyguy.account}</span></h2>
				<p>${luckyguy.gender}<br>
					${luckyguy.mail}<br>
					${luckyguy.signature}</p>
				<div class="icons">
					<a href="#"><i class="ion-ios-home"></i></a>
					<a href="#"><span class="iconify" data-icon="ion:mail-sharp" data-inline="false" id="msg"></span></a>
				</div>
			</figcaption>
			<img src="<c:url value='/getMemberPicture/${luckyguy.account}' />" alt="picture" />
			<div class="position">${score }</div>
		</figure>
	</c:otherwise>
</c:choose>
 <script>
 	
	("#msg").on("click",function(){
		if(confirm("請輸入訊息")){
				
		}else{
		;	
		}		
	})

 
 </script>

</body>
</html>