<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib uri="http://www.springframework.org/tags/form" prefix="form" %>    
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Find Your Password</title>
<script src="https://code.jquery.com/jquery-3.5.1.js"></script>
<!-- <script type="text/javascript" src="http://libs.useso.com/js/jquery/1.11.1/jquery.min.js"></script> -->
<!-- <script type="text/javascript" src="jquery.label_better.js"></script> -->
</head>
<body>
	<div class="page-container">
		<form:form modelAttribute="memberBean" method="POST">	
			<form:input type="text" path="password" class="label_better" data-position="top" placeholder="輸入新密碼" id="type1"/><br><br><br>
			<input type="text" class="label_better" data-position="right" placeholder="再次輸入密碼" id="type2">
			<input type="button" id="btn" value="送出"/>
		</form:form>
	</div>
	<script>
// 		$("input.label_better").label_better({
// 		    position: "top",
// 		    animationTime: 500,
// 		    easing: "ease-in-out",
// 		    offset: 20
// 		  });
		
		$("#type2").on("blur",function(){
			if($("#type1").val().length<8){
				alert("密碼至少8個字")
			}
			
			if($("#type1").val()==$("#type2").val()){
				$("#btn").attr("type","submit")
			}else{
				alert("密碼需相同");
				$("#btn").attr("type","button");
			}
		})
	</script>
</body>
</html>