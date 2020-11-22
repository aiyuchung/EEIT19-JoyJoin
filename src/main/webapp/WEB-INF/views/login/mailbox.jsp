<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@taglib uri="http://www.springframework.org/tags/form" prefix="form" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>${account } 的信箱</title>
<!-- ====================Modal特效======================= -->
<script src="https://code.jquery.com/jquery-3.5.1.slim.min.js" integrity="sha384-DfXdz2htPH0lsSSs5nCTpuj/zy4C+OGpamoFVy38MVBnE+IbbVYUew+OrCXaRkfj" crossorigin="anonymous"></script>
<link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.5.0/css/bootstrap.min.css" integrity="sha384-9aIt2nRpC12Uk9gS9baDl411NQApFmC26EwAOH8WgZl5MYYxFfc+NcPb1dKGj7Sk" crossorigin="anonymous">
<script src="https://stackpath.bootstrapcdn.com/bootstrap/4.5.0/js/bootstrap.min.js" integrity="sha384-OgVRvuATP1z7JjHLkuOU7Xw704+h835Lr+6QL9UvYjZE3Ipu6Tp75j7Bh/kR0JKI" crossorigin="anonymous"></script>
<script src="https://code.jquery.com/jquery-3.5.1.js"	integrity="sha256-QWo7LDvxbWT2tbbQ97B53yJnYU3WhH/C8ycbRAkjPDc="	crossorigin="anonymous"></script>
<!-- ====================信箱樣式======================= -->
<%-- <link rel="stylesheet" href="<c:url value='css/mailbox.css' />" /> --%>
<!-- ====================icon樣式======================= -->
<link rel="stylesheet" href="path/to/font-awesome/css/font-awesome.min.css">
<style>
article,aside,details,figcaption,figure,footer,header,hgroup,main,nav,section,summary{display:block;}audio,canvas,video{display:inline-block;}audio:not([controls]){display:none;height:0;}[hidden]{display:none;}html{font-family:sans-serif;-ms-text-size-adjust:100%;-webkit-text-size-adjust:100%;}body{margin:0;}a:focus{outline:thin dotted;}a:active,a:hover{outline:0;}h1{font-size:2em;margin:0.67em 0;}abbr[title]{border-bottom:1px dotted;}b,strong{font-weight:bold;}dfn{font-style:italic;}hr{-moz-box-sizing:content-box;box-sizing:content-box;height:0;}mark{background:#ff0;color:#000;}code,kbd,pre,samp{font-family:monospace,serif;font-size:1em;}pre{white-space:pre-wrap;}q{quotes:"\201C" "\201D" "\2018" "\2019";}small{font-size:80%;}sub,sup{font-size:75%;line-height:0;position:relative;vertical-align:baseline;}sup{top:-0.5em;}sub{bottom:-0.25em;}img{border:0;}svg:not(:root){overflow:hidden;}figure{margin:0;}fieldset{border:1px solid #c0c0c0;margin:0 2px;padding:0.35em 0.625em 0.75em;}legend{border:0;padding:0;}button,input,select,textarea{font-family:inherit;font-size:100%;margin:0;}button,input{line-height:normal;}button,select{text-transform:none;}button,html input[type="button"],input[type="reset"],input[type="submit"]{-webkit-appearance:button;cursor:pointer;}button[disabled],html input[disabled]{cursor:default;}input[type="checkbox"],input[type="radio"]{box-sizing:border-box;padding:0;}input[type="search"]{-webkit-appearance:textfield;-moz-box-sizing:content-box;-webkit-box-sizing:content-box;box-sizing:content-box;}input[type="search"]::-webkit-search-cancel-button,input[type="search"]::-webkit-search-decoration{-webkit-appearance:none;}button::-moz-focus-inner,input::-moz-focus-inner{border:0;padding:0;}textarea{overflow:auto;vertical-align:top;}table{border-collapse:collapse;border-spacing:0;}

@font-face {
	font-family: 'icomoon';
	src:url('../fonts/icomoon.eot?rretjt');
	src:url('../fonts/icomoon.eot?#iefixrretjt') format('embedded-opentype'),
		url('../fonts/icomoon.woff?rretjt') format('woff'),
		url('../fonts/icomoon.ttf?rretjt') format('truetype'),
		url('../fonts/icomoon.svg?rretjt#icomoon') format('svg');
	font-weight: normal;
	font-style: normal;
}

body, html { font-size: 100%; 	padding: 0; margin: 0; color: white;}

.homepage {
  overflow-y: auto;
  font-family: 'Roboto Condensed', sans-serif;
  background-size:100% ;
  background-repeat: no-repeat;
  background-image: url(images/ogspot_bg.jpg);  
  background-attachment: fixed;
}
#keepread{
	color:	#46A3FF;
	border-bottom-style:solid;
	border-width:	thin;
	border-color:	#46A3FF;
	position:relative;
	left:20px
}
#mailFeatures{
	width:50px;
	position:relative;
	top:20px;
	left:120px;
	
}

#mailBox{
	margin:0 auto;
	background:rgba(0, 0, 0, 0.5);
	padding:10px;
	width:60%;
/* 	border:4px solid #9F5000; */
	box-shadow: 0 0 25px 15px #9F5000;
	overflow-y: auto;
	-ms-overflow-style: none;
	border-radius:1em;
	
}

.mail{
	border-bottom-style:double;
	border-width:medium;
	border-color:white;
}

.mail:hover{
	box-shadow: 0 0 15px 5px #f3d42e;
}

#mailTime{
	position:relative;
	left:650px;
}

div::-webkit-scrollbar {
	display: none;
}
.modal-content{
	width:500px;
	height:380px;
}

div.modal-body {
	padding:15px;
	margin:0 auto;
	color:black;
	font-size:30px;
	height:220px;
}
#ajax_subject{
	border-radius:1em;
	
}
h2{
	padding-left:10px;
}
.mail{
	border-radius:1em;
	padding:5px;
}
#ajax_subject, #mailTime {
    padding:10px;    
}

</style>
</head>
<body>
	<div>
		<jsp:include page="../header/header_guest.jsp" />
	</div>
	
	<div class="homepage" >
	
	<div id="back-div">
		<div id="mailFeatures" style="width:50px;	position:relative;top:20px;left:120px;">
			<table id="boxbox">
				<tr>
					<td><i class="fa fa-paper-plane-o" aria-hidden="true" id="writeNewLetter-btn">寫信</i></td>
				</tr>
			</table>
		</div>
		<div id="mailBox">
			<c:forEach var="msg" items="${msgList}">
				<div class	="mail" id="${msg.msgNo}">
					<div id="ajax_subject">
						<c:if test="${msg.readStatus == 1}">
							<i class="fa fa-envelope-open-o" aria-hidden="true"></i><h2>${msg.subject}</h2>
						</c:if>
						<c:if test="${msg.readStatus == 0}">
							<i class="fa fa-envelope-o" aria-hidden="true"></i><h2>${msg.subject}</h2>
						</c:if>
					</div>					
					<span id="keepread">繼續閱讀...</span><br>
					<div id="mailTime">
						<h5>寄件人:${msg.fromAccount}</h5>
						<h6>時間:${msg.time}</h6>
					</div>
					<input type="hidden" value="${msg.msg}"/>
				</div>
			</c:forEach>	
		</div>
	</div>
	

	
<!-- ============================SUCCESS MSG===============================	 -->
	
	<div class="modal fade" id="successMsgArea" tabindex="-1" aria-labelledby="successLabel" aria-hidden="true" style="top:100px">
	  <div class="modal-dialog">
	    <div class="modal-content" style="border-radius:99em;height:380px;width:380px;left:55px;background-color:	#F0F0F0"">
	      <div class="modal-header1">
	        <button type="button" class="close" data-dismiss="modal" aria-label="Close">
<!-- 	          <span aria-hidden="true">&times;</span> -->
	        </button>
	      </div>
	      <div class="modal-body" id="resultArea" style="height:380px;width:380px">
<%-- 				<h2 id='msg'>${mailMsg}</h2><span id='msg2'>點選空白處返回</span> --%>
	      </div>
	      <div class="modal-footer1">
	      </div>
	    </div>
	  </div>
	</div>
	
<!-- ============================Show單筆資料的Modal===============================	 -->
	
	<div class="modal" tabindex="-1" role="dialog" id="showMsgArea">
	     <div class="modal-dialog" role="document"> 
	        <div class="modal-content" style="position:relative;top:100px">
	            <div class="modal-header">
	                <h4 class="modal-title" id="account-from" style="color:black"></h4>
	                <input type="hidden" id="number-hid">
	                <button type="button" class="close" data-dismiss="modal" aria-label="Close">X</button> 
	            </div>
	            <div class="modal-body" id="msgArea"  style="padding:15px;margin:0 auto;color:black;font-size:30px;height:220px">
	            </div>
	            <div class="modal-footer">
	           		<input type="button" class="btn btn-primary" id="delMsg-btn" value="刪除信件">
	                <input type="button" class="btn btn-primary" id="returnLetter-btn" value="回覆信件">
	            </div>
	       </div>
	   </div>
	</div>
	
<!-- ============================寫信的Modal===============================	 -->
	
	<div class="modal" tabindex="-1" role="dialog" id="letterArea">
	     <div class="modal-dialog" role="document"> 
	        <div class="modal-content"  style="position:relative;top:100px;color:black">
	            <form:form modelAttribute="msgBean" method="POST">
	            <div class="modal-header">
	                發送給: <form:input path="account" type="text" id="account-sendTo"/>
	                <button type="button" class="close" data-dismiss="modal" aria-label="Close">X</button> 
	            </div>
	            <div class="modal-body">
	            	主旨: <form:input path="subject" type="text"/>
	            	<form:textarea path="msg" style="resize: none" rows="3" cols="29"/>	        
	            </div>
	            <div class="modal-footer">
	                <input type="button" class="btn btn-secondary" data-dismiss="modal" value="返回">
	                <input type="submit" class="btn btn-primary" value="發送">
	            </div>
	            </form:form>
	       </div>
	   </div>
	</div>

</div>
<script src="http://ajax.googleapis.com/ajax/libs/jquery/1.11.0/jquery.min.js"></script>
<script src="https://stackpath.bootstrapcdn.com/bootstrap/4.1.3/js/bootstrap.min.js" integrity="sha384-ChfqqxuZUCnJSK3+MXmPNIyE6ZbWh2IMqE241rYiqJxyMiZ6OW/JmZQ5stwEULTy" crossorigin="anonymous"></script>
<script>	

//===================送信成功=======================	

	if("${mailMsg}" != ""){
		$(window).load(function(){
			$('#successMsgArea').modal('show')
			setTimeout(function(){
				window.location.reload();//刷新當前頁面
			},2000)
		})
	}
	
// ===================寄信=======================	
	
	$("#writeNewLetter-btn").on("click",function(){
		$("#account-sendTo").attr("value", "")
		$('#letterArea').modal('show');
	})
	
	$("#returnLetter-btn").on("click",function(){
		var strAccount = $("#account-from").text().substring(4);
		console.log("=================>"+strAccount)
		$("#account-sendTo").attr("value", strAccount)
		$("#showMsgArea").modal('hide');
		$('#letterArea').modal('show');
	})
	
// ===================看信=======================	
	
	$(".mail").on("click",function(){
		console.log("msgid4====>"+$(this).prop("id"))
		var no = $(this).prop("id")
		//AJAX的部分
		 $.ajax({
            url:"changeStatus",
            type:"GET",
//             contentType:"application/json",
            dataType:"html",
            data:{msgNo:no},
            timeout:1000,
            success:function(msg){
            	$("#ajax_subject").empty();
            	$("#ajax_subject").append(msg);
            	
            }
		 })
		//SHOW的部分
		var textMsg = $(this).find('input').val();
		var textFrom = $(this).find('h5').text();
		var textNo = $('div').find('.mail').prop('id')
		console.log("No======>"+textNo)
		$("#msgArea").text(textMsg)
		$("#account-from").text(textFrom)
		$("#number-hid").val(textNo)
		console.log("number==========>"+$("#number-hid").val())
		$("#showMsgArea").modal("show")
		var aa1 = $("#msgArea").text()
		console.log(aa1)
		
	})
	
// ===================刪信=======================
	
		$("#delMsg-btn").on("click",function(){
			var number = $("#number-hid").val()
			console.log("number==========>"+number)
			location.href = "<c:url value='/delMsg/"+number+"'/>";
		})
		
	
// 	$(document).ready(function(){
// 		$('#msg-btn').on('click',function(){
// 			$.ajax({
// 				url : "showAllMsg",
// 				type : "GET",
// 				dataType : "html", 
// 				contentType : 'application/json; charset=utf-8',
// 				data : {}, //data空的代表沒任何參數
// 				success : function(data) { 
// 					$('#mailBox').empty();
// 					$('#mailBox').append(data);
// 				}
// 			})
// 		})
// 	})
		
	
		
		
		

</script>
</body>
</html>