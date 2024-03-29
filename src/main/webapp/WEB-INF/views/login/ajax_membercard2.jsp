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
</head>
<style>
 figcaption>p {
 font-size:10px;
 }
</style>
<body>
<c:choose>
	<c:when test="${mbcard.gender == 'F'}">
		<figure class="snip0056 yellow">
			<figcaption>
				<h4>${mbcard.nickname} <span>${mbcard.account}</span></h4>
				<p>性別:${mbcard.gender}</p>
				<p>${mbcard.mail}</p>
				<p>${mbcard.signature}</p>
				
			</figcaption>
			<img src="<c:url value='/getMemberPicture/${mbcard.account}' />" alt="picture" />
			<div class="position">${score }</div>
		</figure>
	</c:when>
	<c:otherwise>
		<figure class="snip0056 red">
			<figcaption>
				<h2>${mbcard.nickname} <span>${mbcard.account}</span></h2>
				<p>性別:${mbcard.gender}<br>
					${mbcard.mail}<br>
					${mbcard.signature}</p>

			</figcaption>
			<img src="<c:url value='/getMemberPicture/${mbcard.account}' />" alt="picture" />
			<div class="position">${score }</div>
		</figure>
	</c:otherwise>
</c:choose>
 

</body>
</html>