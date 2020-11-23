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

</style>

</head>

<body>
<!---------- Header ------------>
 <c:import url="forumHeader.jsp"></c:import> 
 <div style="padding:10px;margin-bottom:5px;font-size:0.5cm;font-weight:900;font-familye:微軟正黑體;text-align: center;color:#FF44AA" id="wrapper"></div>
		<!-- end header -->
	<form method="post" action="<%=request.getContextPath()%>/saveOrUpdateArticle" enctype="multipart/form-data">
	  <input type = "hidden" name = "forumSeq" value = "${forumBean.forumSeq}">
	  <input type = "hidden" name = "code" value = "${forumBean.code}">
      <input type = "hidden" name = "activityCode" value = "${forumBean.activityCode}">
      <input type = "hidden" name = "type" value = "${forumBean.type}">
      <input type = "hidden" name = "author" value = "${forumBean.author}">
      <input type = "hidden" name = "title" value = "${forumBean.title}">
      <input type = "hidden" name = "location" value = "${forumBean.location}">
			             
		<table width="70%" border="1" align="center"  class="tbdetail"; >
		<tr>
		<td rowspan="2" colspan="2"  width="20%" height="100px" style="border-right: 0px;" class = "userInfoTd" name = "${forumBean.memberBean.account}">
			<table  width="100%" height="100%">
			  <tr height ="150px">
			  	<td valign="top"><img src="<c:url value='/getMemberPicture/${forumBean.memberBean.account}' />" class="imgRange" alt="圖片" style="width:100%" /></td>
			  </tr>
			   <tr>
			  	<td valign="top"  style="border-left: 0px;" >
		
				暱稱 ${forumBean.memberBean.nickname}<br />
		  		帳號 ${forumBean.memberBean.account}<br /> 
		 		等級 ${forumBean.memberBean.rolebean.level} <br />
		  		經驗 ${forumBean.memberBean.rolebean.emp}<br />
			</td>
			  </tr>
			</table>
				
			</td>
			<td width="60%"  height="100px" style="border-left: 0px;">
			<!---------- 抓照片 ------------>
			<c:import url="forumImgUpload.jsp"></c:import> 
			

			
			<textarea style="width:100%;height:200px;"  name ="article">${forumBean.article}</textarea>
			
			</td>
		</tr>
		<tr>
			<td>
				<table border="1" width="100%">
					<tr>
						<td width="25%">
						    <div>
						    	  <c:forEach var="i" begin="1" end="${forumBean.score}">
                                <img  class="star" width = "33" src="${pageContext.request.contextPath}/images/chngstar.gif" />
                                 </c:forEach>

	                          <c:forEach var="i" begin="1" end="${5-forumBean.score}">
                               <img  class="star" width = "33" src="${pageContext.request.contextPath}/images/star.gif" />
                                 </c:forEach>
						    </div>
						    <input type="hidden" name = "score" id = "score" value = "${forumBean.score}" />
    					</td>
						<td width="75%">
<button type="button" class ="evaTag"  name="Join無聊怪" value="Join無聊怪">Join無聊怪</button>
<button type="button" class="evaTag"  name="太失望了.." value="太失望了..">太失望了...</button>
<button type="button" class = "evaTag"  name="太好玩了" value="太好玩了">太好玩了</button>
<button type="button" class = "evaTag"  name="壓在地上打" value="壓在地上打">壓在地上打</button>
<button type="button" class = "evaTag"  name="團長超帥" value="團長超帥">團長超帥</button>
<button type="button" class = "evaTag"  name="團長超正" value="團長超正">團長超正</button>
<button type="button" class = "evaTag"  name="團長風趣" value="團長風趣">團長風趣</button>
<button type="button" class = "evaTag"  name="超讚的服務" value="超讚的服務">超讚的服務</button>
  <input type="hidden" name = "evaTag" id = "evaTag" value = "${forumBean.evaTag}" />
						</td>
					</tr>
				</table>
			</td>
		</tr>
			<tr>
				<td height ="70" colspan="3" align="center">
					<input type="submit" value="儲存貼文"> 
					<!-- <input type="reset" value="復原"> -->
					<input type="button" value="回討論內容" onclick="back()">
				</td>
			</tr>
			
		</table>
	</form>


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


function back () {
	history.go(-1) ;
}

$(".userInfoTd").click(function() { //點擊出現名片

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

//---------------處理SCORE SCRIPT START---------------//
var score = 0;
var scoreLock = $("#score").val() != 0;


$(".star").hover(function () {
    if (score == 0 && !scoreLock) {
        $(this).attr("src", "${pageContext.request.contextPath}/images/chngstar.gif");
        $(this).prevAll('img').attr("src", "${pageContext.request.contextPath}/images/chngstar.gif");
        let num = $(this).index()+1;
        $("#score").val(num);
        console.log($(".i").index($(this)))
    }
},
    function () {
        if (score == 0 && !scoreLock) {
            $(this).attr("src", "${pageContext.request.contextPath}/images/star.gif");
            $(this).prevAll('img').attr("src", "${pageContext.request.contextPath}/images/star.gif");
            $("#score").val(0);
        }
    });

$(".star").click(function () {
    score = ($(this).index()) + 1;
    console.log("score" + score);
    $(".star").attr("src", "${pageContext.request.contextPath}/images/star.gif");
    $(this).attr("src", "${pageContext.request.contextPath}/images/chngstar.gif");
    $(this).prevAll('img').attr("src", "${pageContext.request.contextPath}/images/chngstar.gif");
    $("#score").val(score);
    scoreLock = 0;
});

$(".star").dblclick(function () {
    $(".star").attr("src", "${pageContext.request.contextPath}/images/star.gif");
    score = 0;
    $("#score").val(score);
    scoreLock = 0;
});
//---------------處理SCORE SCRIPT END---------------//
/* $(".evaTag").css('background-color','white');  */

var fruits = [];
var dataEvaTagStr =  $("#evaTag").val();
if(dataEvaTagStr !== null){
	var dataEvaTags =dataEvaTagStr.split(',');
	dataEvaTags.forEach(function(item, index, array) {
			var evaName = "button[name='"+item+"']";
			$(evaName).css('background-color','black');
			$(evaName).css('color','white');
			  fruits.push(item);
			});
}

var evaTagStr = "";
$(".evaTag").click(function () {
	var tagVal = $(this).val();
	var pos = fruits.indexOf(tagVal);
	//console.log('pos:',pos);
	if(pos == -1){
	   $(this).css('background-color','black');
	   $(this).css('color','white');
	   fruits.push(tagVal);
	}else{
		fruits.splice(pos, 1);
	   $(this).css('background-color','white');
	   $(this).css('color','black')
	}
	$("#evaTag").val(fruits.join(','));
})

</script>

<div style="padding:20px;margin-bottom:5px;font-size:0.5cm;font-weight:900;font-familye:微軟正黑體;text-align: center;color:#FF44AA" id="wrapper"></div>
	
</body>
</html>