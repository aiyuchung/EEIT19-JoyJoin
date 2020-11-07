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
<link href="<c:url value='/css/style_one.css' />" rel="stylesheet"
	type="text/css" media="screen" />

<script src="https://code.jquery.com/jquery-3.5.1.js"
	integrity="sha256-QWo7LDvxbWT2tbbQ97B53yJnYU3WhH/C8ycbRAkjPDc="
	crossorigin="anonymous"></script>
<!--  -----------------------------------------------------------  -->


<!-- 	<!--Fonts-->
-->
<!-- 	<link href="http://maxcdn.bootstrapcdn.com/font-awesome/4.2.0/css/font-awesome.min.css" rel="stylesheet"> -->
<!-- 	<link href='https://fonts.googleapis.com/css?family=Open+Sans:400,300,600,700,800' rel='stylesheet' type='text/css'> -->

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
.video-frame div{
	border: 2px solid darkgrey;
/* 	width: auto; */ 
	height: 350px;
	overflow:hidden;
}
.msgbox{
	border:none;
	resize : none;
}

textarea:focus {
  outline : 0;
}

textarea{
  padding-right:0;
}
#headernav
	{
		position: absolute;
		right: 0em;
		top: 5em;
	}

		#headernav > ul > li
		{
			float: left !important;
			list-style-type: none;
		}
		
			#headernav > ul > li:last-child
			{
				padding-right: 0 !important;
			}

			#headernav > ul > li > a,
			#headernav > ul > li > span
			{
				display: block !important;
				margin-left: 0.7em !important;
				padding: 0.80em 1.2em !important;
				letter-spacing: 0.06em !important;
				text-decoration: none !important;
				font-size: 15px !important;
				outline: 0;
				color: #FFF;
				border-radius:10px;  
			}
			#headernav > ul > li > a:hover,
			#headernav > ul > li > span:hover
			{
				color:	#BBFFFF;
				font-weight: 700;
				box-shadow: rgba(255, 255, 255, 0.5) 0px 5px 15px;
			}

			#headernav li.active a
			{
				background: #56c9d6;
				border-radius: 5px;
				color: #FFF;
			}

			#headernav > ul > li > ul
			{
				display: none;
			}
#headerdiv
	{
		position: relative;
		height:150px;
	}

		#headerdiv .headernav
		{
			position: relative;
			padding: 6em 0em;
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
				<div class="content col-md-8 col-sm-12 col-xs-12" style="margin: auto">
				
				 	<form:form method="POST" action="newform" modelAttribute="newform" id="newform">
						<div class="section-block">
							<div class="funding-meta">
								<jsp:useBean id="now" class="java.util.Date" />
									
								<span class="type-meta"><i class="fa fa-user"></i> 
								發起日期:
								<fmt:formatDate value="${isoDate}" type="date" dateStyle="long"/>
								</span>
							<!-- 							<span class="type-meta"><i class="fa fa-tag"></i> <a href="#">crowdfunding</a>, <a href="#">launch</a> </span> -->
							<!--img src="assets/img/image-heartbeat.jpg" class="img-responsive" alt="launch HTML5 Crowdfunding"-->
								<h4>活動封面照</h4>
								
								<input type="file" id="imgInp">						
								<div class="video-frame">
									<div>
										<img src="<c:url value='/images/pics01.jpg' />" class="imgRange" alt="沒有圖片" />
		<!-- 							<iframe src="https://player.vimeo.com/video/67938315" width="500" height="281" frameborder="0" webkitallowfullscreen mozallowfullscreen allowfullscreen></iframe> -->
									</div>
								</div>
							</div>
						</div>
					
					<div class="section-block">
						<div class="tab-content">
							<div role="tabpanel" class="tab-pane active" id="about">
								<div class="about-information">
									<h1 class="section-title">活動細項</h1>
									<div class="info-block  ">
											<div class="fortitle">主辦人</div>
											<div class="forcontent"><a href="#">主辦人暱稱</a></div>
									</div>
									<div class="info-block  ">
											<div class="fortitle">活動類型</div>
											<div class="forcontent">
												<form:select path="activityTypeName" id="selecytType">
													<form:option value="請選擇" label="請選擇"/>
													<c:forEach var="type" items="${allTypes}">
														<form:option value="${type.activityType}" label="${type.activityTypeName}" />
													</c:forEach>
												</form:select>
											</div>
									</div>
									<div class="info-block  ">
											<div class="fortitle">活動性質</div>
											<div class="forcontent">
												<form:select path="activityClass">
													   <form:option class="showClass" value="請選擇" label="請選擇"/>
													  
													   <c:forEach var="category" items="${categoryList}">
														   <c:choose>
																<c:when test="${category.activityTypeBean.activityType == type.activityType}">
																	<form:option value="${category.activityClassNo}" label="${category.activityClass}" />
																</c:when>
															</c:choose>
														</c:forEach>
												</form:select>
											</div>
									</div>
									<div class="info-block  ">
											<div class="fortitle">活動所在縣市</div>
											<div class="forcontent">
												<form:select path="prov">
													<c:forEach var="prov" items="${provs}">
													<form:options value="${prov.provId}" label="${prov.prov}" />
													</c:forEach>
												</form:select>
											</div>
									</div>
									<div class="info-block  ">
											<div class="fortitle">活動日期</div>
											<div class="forcontent">
												<form:input type="text" path="activityDate" class="date-picker" />
												<!--  <form:input path="activityDate" placeholder="yyyy/mm/dd"/> -->
												<!-- 一定要 yyyy/mm/dd-->
											</div>
									</div>
									<div class="info-block  ">
											<div class="fortitle">集合地點</div>
											<div class="forcontent">
												<form:input path="meetPoint" />
											</div>
									</div>
									<div class="info-block  ">
											<div class="fortitle">集合時間</div>
											<div class="forcontent">
												<form:input path="meetTime" placeholder="下午一點請以'13:00'表達"/>
											</div>
									</div>
									<div class="info-block  ">
											<div class="fortitle">最低成行人數</div>
											<div class="forcontent">
												<form:input path="minLimit" />
												<!-- 必填 只能數字 -->
											</div>
									</div>
									<div class="info-block  ">
											<div class="fortitle">最高人數限制</div>
											<div class="forcontent">
												<form:radiobutton path="maxLimit" value="無限制" label="無限制" />
												<form:radiobutton path="maxLimit" value="" label="限制人數:" /><form:input path="maxLimit" />
											</div>
									</div>
							<!--  		<div class="info-block  ">
											<div class="fortitle">參加權限</div>
											<div class="forcontent">
												<form:select path="level">
													<form:option value="1" label="所有人"/>
													<form:option value="2" label="lv.2以下"/>
													<form:option value="3" label="lv.3以下"/>
												</form:select>
											</div>
									</div>  -->
									<div class="info-block  ">
											<div class="fortitle">報名截止日期</div>
											<div class="forcontent">
											<form:input type="text" path="finalDate" class="date-picker" />
											</div>
									</div>
									<div class="info-block  ">
											<div class="fortitle">所需費用</div>
											<div class="forcontent">
											<form:input path="price" />
											</div>
									</div>
									<div class="info-block  ">
											<div class="fortitle">活動介紹/提醒</div>
											<div class="forcontent">
											<form:textarea path="introduction" />
											</div>
									</div>
									
									<div>
										<button>送出</button>
									</div>
								</div>
							</div>
						</div>
					</div>
				 </form:form>
			  </div>
		  </div>
	  </div>
  </div>

</body>
<script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.14.3/umd/popper.min.js" integrity="sha384-ZMP7rVo3mIykV+2+9J3UJ46jBk0WLaUAdn689aCwoqbBJiSnjAK/l8WvCWPIPm49" crossorigin="anonymous"></script>
<script src="https://stackpath.bootstrapcdn.com/bootstrap/4.1.3/js/bootstrap.min.js" integrity="sha384-ChfqqxuZUCnJSK3+MXmPNIyE6ZbWh2IMqE241rYiqJxyMiZ6OW/JmZQ5stwEULTy" crossorigin="anonymous"></script>
<script>
	$("#selecytType").change(function(){
		var checkedtype = $("#selecytType").next().val();
		$.ajax({
			  url:"ajax_checktype",
			  type: "GET",
			  dataType: "json", //server送回
			  contentType: 'application/json; charset=utf-8',
			  data: {type:checkedtype}, 
			  success:function(data){
				  $(data).each(function(i, item){
					  $(".showClass").append('<form:option value="'+item.activityClassNo
							  +'" label="'+item.activityClass+'"/>"')

				  })
				  
				}
		})
		
	})
</script>	

</html>
