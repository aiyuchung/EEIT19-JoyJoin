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

	<div class="modal fade" id="resultModal" tabindex="-1" aria-labelledby="resultModalLabel" aria-hidden="true" style="top:100px">
	  <div class="modal-dialog">
	    <div class="modal-content" style="border-radius:99em;height:380px;width:380px;left:55px">
	      <div class="modal-header1">
	        <button type="button" class="close" data-dismiss="modal" aria-label="Close">
<!-- 	          <span aria-hidden="true">&times;</span> -->
	        </button>
	      </div>
	      <div class="modal-body" id="resultArea" style="height:380px;width:380px">
				${status}
	      </div>
	      <div class="modal-footer1">
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
				<td><input type="submit" value="登入" name="Login" class="login-submit" id="login btn" style="padding:4px;margin-right:10px"/></td>
				<td><input type="button" value="返回" class="login-submit" id="back btn"  style="padding:4px;margin-left:10px"/></td>
			</tr>
		</table>
		<a href="<c:url value='/insert'/>" class="login-forgot-pass" style="bottom:15px">現在註冊</a>
		<a href="<c:url value=''/>" class="login-forgot-pass">忘記密碼</a>
<!-- 		<input type="button" class="btn btn-primary" data-toggle="modal" data-target="#exampleModal" value="GO" /> -->

	</form>
	
	
	<div class="underlay-photo"></div>
	<div class="underlay-black"></div>
	<script>
			var t ="${status}" ;
			if( t !=""){
				$(window).on('load',function(){
			        $('#resultModal').modal('show');
			    });
			}

	
		document.getElementById("back btn").onclick = function(){
			location.href = "<c:url value = '/' />"
		}
		
		
		
	</script>
</body>
</html>