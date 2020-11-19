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
<link rel="stylesheet" href="<c:url value='css/mailbox.css' />" />

</head>
<body>
	<div>
		<jsp:include page="../header/header_guest.jsp" />
	</div>
	<div id="back-div">
		<div id="mailFeatures">
			<table>
				<tr>
					<td><input type="button" value="撰寫新信" id="writeNewLetter-btn"></td>
				</tr>
			</table>
		</div>
		<div id="mailBox">
			<c:forEach var="msg" items="${msgList}">
				<div class	="mail" id="${msg.msgNo}">
					<c:if test="${msg.readStatus == 1}">
						<h2>${msg.subject}</h2>
					</c:if>
					<c:if test="${msg.readStatus == 0}">
						<h2><img src="${pageContext.request.contextPath}/images/notRead.png">${msg.subject}</h2>
					</c:if>				
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
				<h2 id='msg'>${mailMsg}</h2><span id='msg2'>點選空白處返回</span>
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
	                <button type="button" class="close" data-dismiss="modal" aria-label="Close">X</button> 
	            </div>
	            <div class="modal-body" id="msgArea"  style="padding:15px;margin:0 auto;color:black;font-size:30px;height:220px">
	            </div>
	            <div class="modal-footer">
	                <input type="button" class="btn btn-primary" id="returnLetter-btn" value="回覆信件">
	            </div>
	       </div>
	   </div>
	</div>
	
<!-- ============================寫信的Modal===============================	 -->
	
	<div class="modal" tabindex="-1" role="dialog" id="letterArea">
	     <div class="modal-dialog" role="document"> 
	        <div class="modal-content"  style="position:relative;top:100px;color:black">
	            <form:form modelAttribute="msgBean">
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
            type:"Put",
            contentType:"application/json",
            dataType:"json",
            data:{msgNo:no},
            timeout:1000,
            success:function(msg){}
		 })
		//SHOW的部分
		var textMsg = $(this).find('input').val();
		var textFrom = $(this).find('h5').text();
		console.log(textFrom)
		$("#msgArea").text(textMsg)
		$("#account-from").text(textFrom)
		$("#showMsgArea").modal("show")
		var aa1 = $("#msgArea").text()
		console.log(aa1)
		
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