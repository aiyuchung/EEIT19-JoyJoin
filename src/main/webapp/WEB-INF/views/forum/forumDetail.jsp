<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ page import="java.util.*,com.web.activity.model.ActivityBean"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<!DOCTYPE html>
<!--
Design by TEMPLATED
http://templated.co
Released for free under the Creative Commons Attribution License

Name       : Bryce Sunrise
Description: A three-column, fixed-width blog design.
Version    : 1.0
Released   : 20100501

-->
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="content-type" content="text/html; charset=utf-8" />
<title>JoyJoin - 活動總覽 </title>
<meta name="keywords" content="" />
<meta name="Bryce Sunrise" content="" />

<link rel="stylesheet"
	href="https://stackpath.bootstrapcdn.com/bootstrap/4.1.3/css/bootstrap.min.css"
	integrity="sha384-MCw98/SFnGE8fJT3GXwEOngsV7Zt27NXFoaoApmYm81iuXoPkFOJwJ8ERdknLPMO"
	crossorigin="anonymous">
<link href="css/default.css" rel="stylesheet" type="text/css"
	media="screen" />

<script src="https://code.jquery.com/jquery-3.5.1.js"
	integrity="sha256-QWo7LDvxbWT2tbbQ97B53yJnYU3WhH/C8ycbRAkjPDc="
	crossorigin="anonymous"></script>

<style>
#wrapper{

	width:100%;
	background-image: url(images/forumBg1.jpg);
 	background-size: 100%;
	background-repeat: no-repeat;
	background-attachment: fixed;
}

#wrapper3{

	width:100%;
	background-image: url(images/forumBg3.jpg);
 	background-size: 100%;
	background-repeat: no-repeat;
	background-attachment: fixed;
}
</style>

</head>

<body>
<!---------- Header ------------>
 <c:import url="forumHeader.jsp"></c:import> 
 <div style="padding:10px;margin-bottom:5px;font-size:0.5cm;font-weight:900;font-familye:微軟正黑體;text-align: center;color:#FF44AA" id="wrapper"></div>
 <div id="wrapper3">
	<table width="70%" border="1" align="center" class="tbdetail" >
	 <c:forEach var="forum" items="${forumDetailList}">
		<tr>
			<td rowspan="4" valign="top" style="width:20%" class = "userInfoTd" name = "${forum.memberBean.account}">
				<table>
					<tr>
						<td><img style="width:180px" src="<c:url value='/getMemberPicture/${forum.memberBean.account}' />" style="width:100%" /></td>
					</tr>
					<tr>
						<td>
						暱稱 ${forum.memberBean.nickname}<br />
		  				帳號 ${forum.memberBean.account}<br /> 
		 				等級 ${forum.memberBean.rolebean.level} <br />
		  				經驗 ${forum.memberBean.rolebean.emp}<br />
		  				</td>
					</tr>
				</table>
			</td>
			<c:if test="${forum.photo != null}">
		    
		    <td height="150px" style="width:35%">
			 	<img  src="<c:url value='/getForumPicture/${forum.forumSeq}/1' />" class="post" alt="" />
		    </td>
		    
		    <td height="150px" style="width:40%">
		        <c:if test="${forum.photo2 != null}">
		        <img   src="<c:url value='/getForumPicture/${forum.forumSeq}/2' />" class="post" alt="" />
		        </c:if>
		    </td>
		 	</c:if>
		</tr>
		
		<tr>
			<td colspan="2">${forum.article} </td>
		</tr>
		
		<tr>
			<td  style="text-align :left; color:purple"  style="border: solid 1px blue;">
		      <fmt:formatDate value="${forum.time}" type="both"/>
		    </td>
		      <td  style="text-align :right; color:purple"  style="border: solid 1px blue;">
		      <c:if test="${forum.memberBean.account == account }">
		      
		       <input class = "forumEdit" type="button" name = "${forum.forumSeq}" value="編輯">&nbsp;
		      </c:if>
		      </td>
			
		</tr>
		<tr>
			<td colspan="2">
				<table style="width:100%">
				<tr>
					<td style="width:25%">
						<div>
							<c:forEach var="i" begin="1" end="${forum.score}">
                    		<img  class="i" width = "33" src="images/chngstar.gif" />
                    		</c:forEach>

	                		<c:forEach var="i" begin="1" end="${5-forum.score}">
                    		<img id="img5" class="i" width = "33" src="images/star.gif" />
                    		</c:forEach>
						</div>
					</td>
				
					<td style="width:75%">
						<input type="hidden" name = "evaTag" id = "evaTag${forum.forumSeq}" value = "${forum.evaTag}" />
						<div id="evaTagArea${forum.forumSeq}"></div>
					</td>
					</tr>
				</table>
			</td>
		</tr>

	
	</c:forEach>
	
			<tr>
			<td height ="70" colspan="3" align="center">
			<form method ="get" action="<%=request.getContextPath()%>/forumNewArticle">
			 	    <input type = "hidden" name = "code" value = "${forumBean.code}">
					<input type = "hidden" name = "activityCode" value = "${forumBean.activityCode}">
					<input type = "hidden" name = "type" value = "${forumBean.type}">
					<input type = "hidden" name = "author" value = "${forumBean.author}">
					<input type = "hidden" name = "title" value = "${forumBean.title}">
					<input type = "hidden" name = "location" value = "${forumBean.location}">
			   		<input type="submit" value="新增貼文" id="to_forumNewArticle">
			</form>	
			</td>
		</tr>
		
		
		 <form  id = "updateForm" method ="get" action="<%=request.getContextPath()%>/forumUpdateArticle">
			<input type = "hidden" id = "detailForumSeq" name = "forumSeq" >
		</form> 
	
	</table>
	
	
	
	
	<%-- <table width="70%" border="1" align="center" class="tbdetail">

		 <c:forEach var="forum" items="${forumDetailList}">
		<tr >
			<td rowspan="2" colspan="2"  width="20%" height="100px" style="border-right: 0px;" class = "userInfoTd" name = "${forum.memberBean.account}">
			<table  width="100%" height="100%">
			  <tr height ="150px">
			  	<td valign="top"><img src="<c:url value='/getMemberPicture/${forum.memberBean.account}' />" class="imgRange" alt="圖片" style="width:100%" /></td>
			  </tr>
			   <tr>
			  	<td valign="top"  style="border-left: 0px;" >
		
				暱稱 ${forum.memberBean.nickname}<br />
		  		帳號 ${forum.memberBean.account}<br /> 
		 		等級 ${forum.memberBean.rolebean.level} <br />
		  		經驗 ${forum.memberBean.rolebean.emp}<br />
			</td>
			  </tr>
			</table>
				
			</td>
			
			
			<td width="80%"  height="100px" style="border-left: 0px;">
		    <!----------------------------------內容開始------------------------------------ -->
		    <table width="100%">
		     <c:if test="${forum.photo != null}">
		    <tr >
		    <td height="150px">

		    <img  src="<c:url value='/getForumPicture/${forum.forumSeq}/1' />" class="post" alt="" />
		      </td>
		      <td height="150px">
		        <c:if test="${forum.photo2 != null}">
		         <img   src="<c:url value='/getForumPicture/${forum.forumSeq}/2' />" class="post" alt="" />
		        </c:if>
		    </td>
		    
		 
		    </tr>
		       </c:if>
		       
		       
		      <tr>
		      <td colspan="2">${forum.article}  </td>
		      </tr>
		      
		      <tr  height="10%" valign="bottom">
		      <td  style="text-align :left; color:purple"  style="border: solid 1px blue;">
		      <fmt:formatDate value="${forum.time}" type="both"/>
		    </td>
		      <td  style="text-align :right; color:purple"  style="border: solid 1px blue;">
		      <c:if test="${forum.memberBean.account == account }">
		      
		       <input class = "forumEdit" type="button" name = "${forum.forumSeq}" value="編輯">&nbsp;
		      </c:if>
		      </td>
		      
		      </tr>
		    </table>
		  
			<!-- --------------------------------內容結束------------------------------------ -->			
			</td>
		</tr>
			
				<tr valign="bottom" height ="1%">
			<td >
				<table border="1" width="100%" >
					<tr>
						<td width="25%">
						    <div>
						  <c:forEach var="i" begin="1" end="${forum.score}">
                                <img  class="i" width = "33" src="images/chngstar.gif" />
                                 </c:forEach>

	                          <c:forEach var="i" begin="1" end="${5-forum.score}">
                               <img id="img5" class="i" width = "33" src="images/star.gif" />
                                 </c:forEach>
						    </div>
    					</td>
						<td width="75%">
						  <input type="hidden" name = "evaTag" id = "evaTag${forum.forumSeq}" value = "${forum.evaTag}" />
						<div id="evaTagArea${forum.forumSeq}"></div>
						
						</td>
					</tr>
				</table>
			</td>
		</tr>
			  </c:forEach>	
		<tr>
			<td height ="70" colspan="3" align="center">
			<form method ="get" action="<%=request.getContextPath()%>/forumNewArticle">
			 	    <input type = "hidden" name = "code" value = "${forumBean.code}">
					<input type = "hidden" name = "activityCode" value = "${forumBean.activityCode}">
					<input type = "hidden" name = "type" value = "${forumBean.type}">
					<input type = "hidden" name = "author" value = "${forumBean.author}">
					<input type = "hidden" name = "title" value = "${forumBean.title}">
					<input type = "hidden" name = "location" value = "${forumBean.location}">
			   		<input type="submit" value="新增貼文" id="to_forumNewArticle">
			</form>	
			</td>
		</tr>
		
		
		 <form  id = "updateForm" method ="get" action="<%=request.getContextPath()%>/forumUpdateArticle">
			<input type = "hidden" id = "detailForumSeq" name = "forumSeq" >
		</form> 
	</table> --%>

<div class="modal" tabindex="-1" role="dialog" id="showMsgArea">
      <div class="modal-dialog" role="document"> 
         <div class="modal-content" style="position:relative;top:100px">
             <div class="modal-header">
                 <h4 class="modal-title" id="account-from" style="color:black"></h4>
                 <input type="hidden" id="number-hid">
                 <button type="button" class="close" data-dismiss="modal" aria-label="Close">X</button> 
             </div>
             <div class="modal-body" id="msgArea"  style="padding:15px;margin:0 auto;color:black;font-size:30px;height:300px">
             </div>
             <div class="modal-footer">
<!--               <input type="button" class="btn btn-primary" id="delMsg-btn" value="刪除信件"> -->
<!--                  <input type="button" class="btn btn-primary" id="returnLetter-btn" value="回覆信件"> -->
             </div>
        </div>
    </div>
 </div>
<script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.14.3/umd/popper.min.js" integrity="sha384-ZMP7rVo3mIykV+2+9J3UJ46jBk0WLaUAdn689aCwoqbBJiSnjAK/l8WvCWPIPm49" crossorigin="anonymous"></script>
<script src="https://stackpath.bootstrapcdn.com/bootstrap/4.1.3/js/bootstrap.min.js" integrity="sha384-ChfqqxuZUCnJSK3+MXmPNIyE6ZbWh2IMqE241rYiqJxyMiZ6OW/JmZQ5stwEULTy" crossorigin="anonymous"></script>
<script>	

$(".userInfoTd").click(function() { //關鍵字搜尋

	var userAccount = $(this).attr('name');
	if (userAccount != null) {
		$.ajax({
			url : "detailCard/"+userAccount,
			type : "GET",
			dataType : "html", //server送回
			contentType : 'application/json; charset=utf-8',
			  data: {},
			  success:function(data){
				  $("#msgArea").empty();
				  $("#msgArea").append(data);
				}
		})
		$('#showMsgArea').modal('show');
	} 
})


$(".forumEdit").click(function(){ //以活動類型作為快速篩選
	var detailForumSeq = $(this).attr('name');
	$("#detailForumSeq").val(detailForumSeq);
	$("#updateForm").submit();
})

<c:forEach items="${forumDetailList}" var="forum">
  var dataEvaTagStr =  $("#evaTag"+${forum.forumSeq}).val();
  var combineHtml = "";
  if(dataEvaTagStr !== null){
  	var dataEvaTags =dataEvaTagStr.split(',');
  	dataEvaTags.forEach(function(item, index, array) {
  		if(item!=null && item != ''){
  			combineHtml+="<button style='background-color:black; color:white; outline:0; border:0; border-radius:20px; font-family:微軟正黑體;'>"+item+"</button>";
  		}
  		});

  		$("#evaTagArea"+${forum.forumSeq}).html(combineHtml);
  }
  
</c:forEach>

/* 檢查圖片大小，等比例縮小 */

$(document).ready(function() {
     $('.post').each(function() {
     var maxWidth = 400; // 圖片最大寬度
     var maxHeight = 300;    // 圖片最大高度
     var ratio = 0;  // 縮放比例
     var width = $(this).width();    // 圖片實際寬度
     var height = $(this).height();  // 圖片實際高度
     console.log('原始寬度',width);
	 console.log('最大寬度',maxWidth);
	 

     // 檢查圖片是否超寬
     if(width > maxWidth){
         ratio = maxWidth / width;   // 計算縮放比例
         $(this).css("width", maxWidth); // 設定實際顯示寬度
         height = height * ratio;    // 計算等比例縮放後的高度
         $(this).css("height", height);  // 設定等比例縮放後的高度
         console.log('高度比例',ratio);
         console.log('最後高度',height);
     }

     // 檢查圖片是否超高
/*      if(height > maxHeight){
    	 console.log('高度超過');
         ratio = maxHeight / height; // 計算縮放比例
         $(this).css("height", maxHeight);   // 設定實際顯示高度
         width = width * ratio;    // 計算等比例縮放後的高度
         $(this).css("width", width * ratio);    // 設定等比例縮放後的高度
         console.log('寬度比例',ratio);
         console.log('最後寬度',width);
     } */
 });
 });


</script>


</div>
<div style="padding:20px;margin-bottom:5px;font-size:0.5cm;font-weight:900;font-familye:微軟正黑體;text-align: center;color:#FF44AA" id="wrapper"></div>
	
</body>
</html>