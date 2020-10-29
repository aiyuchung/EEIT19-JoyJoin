<%@ page language="java" contentType="text/html; charset=utf-8"
	pageEncoding="utf-8"%>
<%@page import="com.web.activity.model.ArtBean"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<script src="https://code.jquery.com/jquery-3.5.1.js" integrity="sha256-QWo7LDvxbWT2tbbQ97B53yJnYU3WhH/C8ycbRAkjPDc=" crossorigin="anonymous"></script>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
<title>Insert title here</title>
<style type="text/css">
body {
	background-image: url('images/greenbg.png');
	background-size: cover;
}

h1 {
	margin: 50px auto;
	text-align: center;
}

form {
	width: 310px;
	margin: 100px auto;
}

.item {
	color: red;
	width: 100px;
	display: inline-block;
	text-align: right;
}

.btn {
	width: 50px;
}
</style>

</head>
<body>
	<h1>活動連結網頁</h1>
	<form action="addServlet" method="post">
		<span class="item">ID：</span> <span><input type="text"
			name="id" /></span><br> <span class="item">username：</span> <span><input
			type="text" name="username" /></span><br> <span class="item">password：</span>
		<span><input type="text" name="password" /></span><br> <span
			class="item">sex：</span> <span><input type="text" name="sex" /></span><br>
		<span class="item">address：</span> <span><input type="text"
			name="address" /></span><br> <br>
		<br>
		<center>
			<input class="btn" type="submit" value="提交" /> <input class="btn"
				type="reset" value="重置" />
		</center>
	</form>
</body>
</html>
