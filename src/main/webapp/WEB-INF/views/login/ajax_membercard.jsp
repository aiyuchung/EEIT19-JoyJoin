<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>MEMBER CARD</title>
<link rel="stylesheet" href="<c:url value='css/membercard.css' />" />
</head>
<body>
<figure class="snip0056">
  <figcaption>
    <h2>${mbcard.nickname} <span>${mbcard.account}</span></h2>
    <p>${mbcard.gender}</p>
    <p>${mbcard.mail}</p>
    <p>${mbcard.signature}</p>
    <div class="icons">
    	<a href="#"><i class="ion-ios-home"></i></a>
    	<a href="#"><i class="ion-ios-email"></i></a>
    	<a href="#"><i class="ion-ios-telephone"></i></a>
    	<span>分數</span>
   	</div>
 </figcaption>
 <img src="<c:url value='/getMemberPicture/${account}' />" class="imgRange" alt="圖片"/>
 <div class="position">功能列表</div>
</figure>

</body>
</html>