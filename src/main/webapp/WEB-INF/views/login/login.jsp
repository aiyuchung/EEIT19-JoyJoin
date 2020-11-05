<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@taglib uri="http://www.springframework.org/tags/form" prefix="from"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Login Page</title>
<link rel="stylesheet"
	href="https://stackpath.bootstrapcdn.com/bootstrap/4.1.3/css/bootstrap.min.css"
	integrity="sha384-MCw98/SFnGE8fJT3GXwEOngsV7Zt27NXFoaoApmYm81iuXoPkFOJwJ8ERdknLPMO"
	crossorigin="anonymous">
<script src="https://code.jquery.com/jquery-3.5.1.js"
	integrity="sha256-QWo7LDvxbWT2tbbQ97B53yJnYU3WhH/C8ycbRAkjPDc="
	crossorigin="anonymous"></script>
<link rel="stylesheet"
	href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.14.0/css/all.min.css"
	integrity="sha512-1PKOgIY59xJ8Co8+NE6FZ+LOAZKjy+KY8iq0G4B3CyeY6wYHN3yt9PW0XpSriVlkMXe40PTKnXrLnZ9+fkDaog=="
	crossorigin="anonymous" />

<link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.2.1/css/bootstrap.min.css" integrity="sha384-GJzZqFGwb1QTTN6wy59ffF1BuGJpLSa9DkKMp0DgiMDm4iYMj70gZWKYbI706tWS" crossorigin="anonymous">
 
<script src="https://code.jquery.com/jquery-3.3.1.slim.min.js" integrity="sha384-q8i/X+965DzO0rT7abK41JStQIAqVgRVzpbzo5smXKp4YfRvH+8abtTE1Pi6jizo" crossorigin="anonymous"></script>
<script src="https://stackpath.bootstrapcdn.com/bootstrap/4.2.1/js/bootstrap.min.js" integrity="sha384-B0UglyR+jN6CkvvICOB2joaf5I4l3gm9GU6Hc1og6Ls7i6U/mkkaduKaBhlAXv9k" crossorigin="anonymous"></script>
<link rel="stylesheet" href="<c:url value = 'css/signIn.css'/>" />
<style>
	
</style>
</head>

<body>
	<div class="modal fade" id="resultModal" tabindex="-1" aria-labelledby="exampleModalLabel" aria-hidden="true" style="top:100px">
	  <div class="modal-dialog">
	    <div class="modal-content" style="border-radius:99em;height:380px;width:380px;left:55px">
	      <div class="modal-header1">
	        <button type="button" class="close" data-dismiss="modal" aria-label="Close">
<!-- 	          <span aria-hidden="true">&times;</span> -->
	        </button>
	      </div>
	      <div class="modal-body" id="resultArea" style="height:380px;width:380px">
							<!-- 傳送回來的內容 -->
	      </div>
	      <div class="modal-footer1">
	<!-- 	        <button type="button" class="btn btn-secondary" data-dismiss="modal">Close</button> -->
	<!-- 	        <button type="button" class="btn btn-primary">Save changes</button> -->
	      </div>
	    </div>
	  </div>
	</div>
	
	<form class="login-form">
		<p class="login-text">
			<span class="fa-stack fa-lg"> 
				<i class="fa fa-circle fa-stack-2x"></i>
				<i class="fa fa-lock fa-stack-1x"></i>
			</span>
		</p>
		<input type="text" class="login-username" autofocus="true"	placeholder="Account" /> 
		<input type="password"	class="login-password" placeholder="Password" /> 
		<table align='center'>
			<tr>
				<td><input type="button" value="登入" name="Login" class="login-submit" id="login btn" data-toggle="modal" data-target="#resultModal" style="padding:4px;margin-right:10px"/></td>
				<td><input type="button" value="返回" class="login-submit" id="back btn"  style="padding:4px;margin-left:10px"/></td>
			</tr>
		</table>
		

<!-- 		<input type="button" class="btn btn-primary" data-toggle="modal" data-target="#exampleModal" value="GO" /> -->
		
	</form>
	
	
	<div class="underlay-photo"></div>
	<div class="underlay-black"></div>
	<script>
		var btn = document.getElementById("login btn");
		var area = document.getElementById("resultArea");
		btn.onclick = function(){
			var xhr = new XMLHttpRequest();
			if ( xhr != null ){
				xhr.onreadystatechange = function(){
					if( xhr.readyState === 4 ){
						if( xhr.status === 200){
							area.innerHTML = "<font color='red'>" + xhr.responseText + "</font>";
						}else if( xhr.status === 404) {
							div1.innerHTML = "<font color='red'>查無該物件</font>";
						} else if (xhr.status === 500) {
							div1.innerHTML = "<font color='red'>系統異常，請聯絡開發人員</font>";
						}
					}
				}
				xhr.open('GET', 'checkID', true);
				xhr.send();
			}
		}

		document.getElementById("back btn").onclick = function(){
			location.href = "<c:url value = '/' />"
		}
		
		
		
	</script>
</body>
</html>