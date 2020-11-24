<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ page import="java.util.*,com.web.activity.model.ActivityBean"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<!DOCTYPE html>
<head>
<meta charset="UTF-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<meta name="description" content="unititled">
<meta name="keywords" content="HTML5 Crowdfunding Profile Template">
<meta name="author" content="Audain Designs">
<!-- <link rel="shortcut icon" href="favicon.ico"> -->
<title>JoyJoin - 活動詳細資料</title>
<!--  -----------------------------------------------------------  -->
<link rel="stylesheet"
	href="https://stackpath.bootstrapcdn.com/bootstrap/4.1.3/css/bootstrap.min.css"
	integrity="sha384-MCw98/SFnGE8fJT3GXwEOngsV7Zt27NXFoaoApmYm81iuXoPkFOJwJ8ERdknLPMO"
	crossorigin="anonymous">
<link href="<c:url value='/css/style_new.css' />" rel="stylesheet"
	type="text/css" media="screen" />

<script src="https://code.jquery.com/jquery-3.5.1.js"
	integrity="sha256-QWo7LDvxbWT2tbbQ97B53yJnYU3WhH/C8ycbRAkjPDc="
	crossorigin="anonymous"></script>
	
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/bootstrap-datepicker/1.9.0/css/bootstrap-datepicker3.min.css">
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/bootstrap-datepicker/1.9.0/css/bootstrap-datepicker.min.css">
<!--  -----------------------------------------------------------  -->

<script>
	(function(i, s, o, g, r, a, m) {
		i['GoogleAnalyticsObject'] = r;
		i[r] = i[r] || function() {
			(i[r].q = i[r].q || []).push(arguments)
		}, i[r].l = 1 * new Date();
		a = s.createElement(o), m = s.getElementsByTagName(o)[0];
		a.async = 1;
		a.src = g;
		m.parentNode.insertBefore(a, m)
	})(window, document, 'script',
			'https://www.google-analytics.com/analytics.js', 'ga');

	ga('create', 'UA-12345678-9', 'auto');
	ga('send', 'pageview');
</script>
<style>
.main-content{
	background-image: url(${pageContext.request.contextPath}/images/leaves2_bg.jpg);
 	background-size: 100%; 
	background-repeat: no-repeat;
	background-attachment:fixed; 
}

	.video-frame div{
		border: 2px solid darkgrey;
	/*  	width: auto;  */
		height: 380px;
		overflow:hidden;
	}
	
	
	textarea:focus {
	  outline : 0;
	}
	
	textarea{
	  padding-right:0;
	}
	img{
	 max-width: 100%; 
	 max-height: 100%;
	 object-fit: cover;
	}

</style>
</head>

<body>
<!---------- Header ------------>		
		<div class="headerPage">
			<jsp:include page="header/header_guest.jsp"/>
		</div>

	<!--main content-->
	<div class="main-content">
		<div class="container addNew">
			<div class="row">
				<div class="content" style="margin: auto">
					<form:form method="POST" action="" modelAttribute="newform" id="newform" enctype="multipart/form-data">
<%-- 					<form method="POST" action="/newActivities" enctype="multipart/form-data" id="picform"> --%>
					
				 		<div class="section-block">
							<div class="tab-content">
								<div role="tabpanel" class="active" id="about">
										<h1 class="section-title">活動封面照</h1>

								<form:input type="file"  path="updateImg" id="file"/>
								
								<div class="video-frame">
									<div id="forimg" align="center">
<!-- 										<span> 未選取圖片</span> -->
<%-- 										<img src="<c:url value='/images/noImage.jpg' />"  /> --%>
										<c:choose>
											<c:when test="${newform.activityNo  == ''}">
												<img src="<c:url value='/images/noImage.jpg' />"  />
											</c:when>
											<c:otherwise>
												<img src="<c:url value='/getPicture/${newform.activityNo}' />" class="imgRange" alt="圖片" />
											</c:otherwise>
										</c:choose>
										<img id="demo" style="max-width: 100%; max-height: 100%;object-fit: cover"/>
									</div>
								</div>
							</div>
						</div>
					</div>
					
					
					
					<div class="section-block">
						<div class="tab-content">
							<div role="tabpanel" class="active" id="about">
<!-- 								<div class="about-information"> -->
									<h1 class="section-title">活動細項</h1>
									<div class="info-block  ">
											<div class="fortitle">主辦人 </div>
											<div class="forcontent"><a href="#">${nickname}</a></div>
									</div>
									<div class="info-block  ">
											<div class="fortitle">活動名稱</div>
											<div class="forcontent">
											<form:input path="name" class="form-control must"/>
											<form:errors path="name" />
											<div class="invalid-feedback" style="display:none"></div>
											</div>
									</div>
									<div class="info-block  ">
											<div class="fortitle">活動類型</div>
											<div class="forcontent">
												<form:select path="activityTypeName" id="selecytType" class="form-control must">
													<form:option value="" label="請選擇"/>
													<c:forEach var="type" items="${types}">
														<form:option value="${type.activityTypeName}" label="${type.activityTypeName}" class="${type.activityType}" />
													</c:forEach>
												</form:select>
												<div class="invalid-feedback" style="display:none"></div>
											</div>
									</div>
									<div class="info-block  ">
											<div class="fortitle">活動性質</div>
											<div class="forcontent">
												<form:select path="activityClass" class="form-control showClass must" >
												   <form:option  value="" label="請選擇"/>
											    	<form:options  items="${categoryList}" itemValue="activityClass" itemLabel="activityClass" style="display:none"/>  
												</form:select>
												<div class="invalid-feedback" style="display:none"></div>
											</div>
									</div>
									<div class="info-block  ">
											<div class="fortitle">活動所在縣市</div>
											<div class="forcontent">
												<form:select path="prov" class="form-control must" >
													<form:option value="" label="請選擇" />
													<form:options items="${provs}" itemValue="prov" itemLabel="prov"/> 
												</form:select>
												<div class="invalid-feedback" style="display:none"></div>
											</div>
									</div>
									<div class="info-block  ">
											<div class="fortitle">活動日期</div>
											<div class="forcontent">
												<form:input type="date" path="activityDate" class="date-picker form-control must" />
												<div class="invalid-feedback" style="display:none"></div>
											</div>
									</div>
									<div class="info-block  ">
											<div class="fortitle">集合地點</div>
											<div class="forcontent col">
												<form:input path="meetPoint" class="form-control" />
											</div>
									</div>
									<div class="info-block  ">
											<div class="fortitle">集合時間</div>
											<div class="forcontent">
												<form:input type="time" path="meetTime" placeholder="下午一點請以'13:00'表達" class="form-control must"/>
												<div class="invalid-feedback" style="display:none"></div>
											</div>
									</div>
								</div>
							</div>
						</div>
				
				 
				 <div class="section-block">
						<div class="tab-content">
							<div role="tabpanel" class="tab-pane active" id="about">
								<div class="about-information">
									<h1 class="section-title">活動限制</h1>
									<div class="info-block  ">
											<div class="fortitle">報名截止日期</div>
											<div class="forcontent">
											<form:input type="date" path="finalDate" class="date-picker form-control must" />
											<div class="invalid-feedback" style="display:none"></div>
											</div>
									</div>
									<div class="info-block  ">
											<div class="fortitle">最低成行人數</div>
											<div class="forcontent">
												<form:input path="minLimit" class="form-control must"/>
												<!-- 必填 只能數字 -->
												<div class="invalid-feedback" style="display:none"></div>
											</div>
									</div>
									<div class="info-block  ">
											<div class="fortitle">最高人數限制</div>
											<div class="forcontent">
												<form:radiobutton path="maxLimit" value="無限制" label="無限制" id="nolimitmax" checked="true"/> &nbsp;
												<form:radiobutton path="maxLimit" value="" label="限制人數:" id="limitmax" /><form:input disabled="true" path="maxLimit" class="form-control inputhide intOnly" style="width:100px; display:inline-block"/>
											</div>
									</div>
							  		<div class="info-block ">
											<div class="fortitle">參加權限</div>
											<div class="forcontent">
<%-- 												<c:set var="level" value="${level}" /> --%>
												<form:select path="levelLimit" id="levelOptions" class="form-control">
													<form:option value="1" label="所有人" checked="checked"/>
													<c:if test="${level == 2}">
													<form:option value="2" label="Lv.2以上" />
													</c:if>
													<<c:if test="${level > 2}">
													<form:option value="2" label="Lv.2以上" />
													<form:option value="3" label="Lv.3以上" />
													</c:if>
												</form:select>
											</div>
									</div>
									
									
									
									<div class="info-block  ">
											<div class="fortitle">所需費用</div>
											<div class="forcontent">
												<form:input path="price" value="0" class="form-control intOnly"/>
												<div class="invalid-feedback" style="display:none"></div>
											</div>
											
									</div>
									<div class="info-block  ">
											<div class="fortitle" style="vertical-align:top">活動介紹/提醒</div>
											<div class="forcontent">
											<form:textarea path="introduction" class="form-control"/>
											</div>
									</div>
								</div>  
							</div>
						</div>
					</div>
					<div align="center">
						<a href="#" id="autotext" class="btn btn-secondary btn-lg"  style="display:none;width:80%;background-color:#85AD99">一鍵輸入</a>
						<button id="createnew"  class="btn btn-secondary btn-lg" style="width:80%;background-color:#85AD90; margin-top:8px;">確認送出</button>
					</div>
					<div>
					
						
					</div>
					</form:form>
					</div>
					<div>
			  </div>
		  </div>
	  </div>
  </div>

</body>

<script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.14.3/umd/popper.min.js" integrity="sha384-ZMP7rVo3mIykV+2+9J3UJ46jBk0WLaUAdn689aCwoqbBJiSnjAK/l8WvCWPIPm49" crossorigin="anonymous"></script>
<script src="https://stackpath.bootstrapcdn.com/bootstrap/4.1.3/js/bootstrap.min.js" integrity="sha384-ChfqqxuZUCnJSK3+MXmPNIyE6ZbWh2IMqE241rYiqJxyMiZ6OW/JmZQ5stwEULTy" crossorigin="anonymous"></script>
<script>
	$(document).ready(function(){
		var id = ${newform.activityNo};
		if (id == 0){
			$("#newform").attr("action","newActivities");
			$("#autotext").css("display","block");
			$("#autotext").show();
		}else{
			var url = "../updateActivities/" + id;
			$("#newform").attr("action",url);
			
			var maxLimit = '${newform.maxLimit}';
			if (maxLimit == ""){
				$("#nolimitmax").attr("checked",true);
			}else{
				$("#nolimitmax").attr("checked",false);
				$("#limitmax").attr("checked",true);
				$(".inputhide").attr("disabled",false);
				
			}
		}
		
		
		
	})
	
	$('#file').change(function() {
	  var file = $('#file')[0].files[0];
	  var reader = new FileReader;
	  reader.onload = function(e) {
		$("#forimg").empty();
		$("#forimg").append('<img id="demo" style="max-width: 100%; max-height: 100%;object-fit: cover" src="'+ e.target.result +'" />')
// 	    $('#demo').attr('src', e.target.result);
		$('#activityPic').val(e.target.result);
	  };
	  reader.readAsDataURL(file);
	});
	
	
	$("#selecytType").change(function(){
		var checkedtype = $("#selecytType").find("option:checked").attr("class");
		console.log("type:"+checkedtype);
		$.ajax({
			  url:"ajax_checktype",
			  type: "GET",
			  dataType: "html", //server送回
			  contentType: 'application/json; charset=utf-8',
			  data: {type:checkedtype}, 
			  success:function(data){
				  console.log("OK");
					$(".showClass").empty().append(data);
				}
		})
	})
	$("#levelOptions").change(function(){
		var currentLevel;
		$("#levelOptions").each(function(){
			if ($(this).val > currentLevel){
				$("#levelOptions").remove($(this));
			}
		})
	})
	$(".must").blur(function(){
			var val = $(this).val();
			console.log(val);
			if (val ==""){
				$(this).addClass("is-invalid");
				$(this).parent().find(".invalid-feedback").css("display","block").text("必填欄位");
			}else{
				$(this).removeClass("is-invalid");
				$(this).parent().find(".invalid-feedback").css("display","none");
			}
	})
	
	$(".intOnly").keyup(function(){ //只能秀數字
		var val = $(this).val();
		 if (val != val.replace(/[^0-9\.]/g, '')){
				$(this).addClass("is-invalid");
				$(this).parent().find(".invalid-feedback").css("display","block").text("只能輸入數字");
		 }else{
				$(this).removeClass("is-invalid");
				$(this).parent().find(".invalid-feedback").css("display","none");
			}
	})
	
	$("#limitmax").click(function(){
		$(".inputhide").prop("disabled",false);
	})
	
	$("#nolimitmax").click(function(){
		$(".inputhide").prop("disabled",true);
	})
	
	$("#createnew").click(function(){  //送出表單
		$(".must").each(function(){
			if($(this).hasClass("is-invalid")){
				window.location.href = "#";
			}else{
				$("#newform").submit();
			}
		})
	})
	$("#autotext").click(function(){  //一鍵輸入
		$("input[name=name]").val("六福村");
		$("#selecytType").val("旅遊");
		$(".showClass").val("遊樂園");
		$("select[name=prov]").val("新竹縣");
		$("input[name=activityDate]").val("2020-11-30");
		$("input[name=meetPoint]").val("台北車站");
		$("input[name=meetTime]").val("07:00");
		$("input[name=finalDate]").val("2020-11-28");
		$("input[name=minLimit]").val("1");
		$("input[name=price]").val("999");
		$("textarea[name=introduction]").val("很久沒去遊樂園了，想說可以尖叫紓壓順便看看動物放鬆一下~");
		
	})
	
</script>	

</html>
