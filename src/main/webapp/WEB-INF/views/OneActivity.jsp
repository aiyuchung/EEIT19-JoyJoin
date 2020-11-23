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
	body{
		
		background-image: url(${pageContext.request.contextPath}/images/leaves3_bg.jpg);
	 	background-size: 100%;
		background-repeat: no-repeat;
		background-attachment: fixed;
	}
	.video-frame div{
		border: 2px solid darkgrey;
	/* 	width: auto; */ 
		height: 350px;
		overflow:hidden;
	}
	.goal-summary .reminder .follow, .reminder .nofollow,  .reminder a  {
	
	padding:8px;
	margin:0px 0px 10px 0px;
	display:table;
	border-radius:4px;
	text-decoration:none;
	}
	.follow{
		background-color:#fff;
		color:#85AD90;
	}
	.follow:not(.nofollow):hover{
	}
	.reminder .follow:not(.nofollow):hover, .reminder .follow:focus{
		background-color:#85AD90;
		color:#fff;
	}
	.nofollow{
		background-color:#85AD90;
		color:#fff;
	}
	.nofollow:hover{
		cursor:pointer;
	}
	
	.msgbox{
		border:none;
		resize : none;
	}
	.header {
	position:relative;
	background-color: rgba(30,50,39,0.9);
	border-bottom: 5px solid #85AD90;
	padding: 10px 0px;
}
	
	textarea:focus {
	  outline : 0;
	}
	
	textarea{
	  padding-right:0;
	}
			
	.showmsg{
		padding: 2px;
		margin-top:2px;
	}
	.userpic{
		display:inline-block;
		width:60px;
		height:60px;
		border-radius:50%;
		border:2px solid grey;
	}
	.btn-cancel{
		background-color:#85AD90;
		color:#fff;
	}
	.btn-full{
		background-color:#85AD90;
		color:#fff;
	}
	
	.smbtn{
		position:relative;
	 	float:right;
	 	padding:2px;
	 	border:1px gray solid;
	 	border-radius:3px;
	 	background-color:dark-blue;
	
	}
	.smbtn:hover{
		border-radius:15px;
	 	cursor: pointer;
	 	
	}
	.msgbtnEdit{
	 	right:5px;
	}
	.btn.btn-contact:hover{
		background-color: #779A81
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
	<!--   header    -->
	<header class="header">
		<div class="container">
			<div class="row">
				<div class="goal-summary pull-left">
					<div class="backers">
						<h3>${one.joinedNum}</h3>
						<span>已參加人數</span>
					</div>
					<div class="funded">
						<h3>${hitCount.hitCount}</h3>
						<span>瀏覽次數</span>
					</div>
					<div class="time-left">
						<h3>${one.leftDays}</h3>
						<span>倒數截止天數</span>
					</div>
					<div class="reminder last">
						
							<c:if test="${isJoined == false}">
								<c:choose>
									<c:when test="${one.memberBean.account == account}">
										<a href="<c:url value='/updateActivity/${one.activityNo}'/>" class="btn btn-contact">
										<strong>修改活動</strong></a>
										<button class="btn btn-contact btn-sm delete">
										<strong>刪除活動</strong></button>
									</c:when>
									<c:when test="${isFollowed == true}">
										<div class="nofollow" >
										<strong><span style="font-size:18px">★</span>取消關注</strong></div>
									</c:when>
									<c:otherwise>
										<div class="follow">
<%-- 										<img src="<c:url value='/icons/star.png'/>"/> --%>
										<strong><span style="font-size:18px">✰</span>關注本活動</strong></div>
									</c:otherwise>
								</c:choose>
							</c:if>
							<c:if test="${isJoined == true}">
								<div class="nofollow" >
<%-- 								<img src="<c:url value='/icons/filled-star.png'/>" /> --%>
								<strong><span style="font-size:18px">★</span>取消關注</strong></div>
							</c:if>
						
						<!--   點選後可在個人頁面擁有此活動之連結    -->
					</div>
				</div>
			</div>
		</div>
	</header>
	<!--/header-->

	<!--main content-->
	<div class="main-content">
		<div class="container">
			<div class="row">
				<div class="content col-md-8 col-sm-12 col-xs-12">
					<div class="section-block">
						<div class="funding-meta">
							<h1>${one.name}</h1>
								<span class="type-meta"><i class="fa fa-user"></i> 發起日期: ${one.createdDate}</span>
							<!-- 							<span class="type-meta"><i class="fa fa-tag"></i> <a href="#">crowdfunding</a>, <a href="#">launch</a> </span> -->
							<!--img src="assets/img/image-heartbeat.jpg" class="img-responsive" alt="launch HTML5 Crowdfunding"-->
														
							<div class="video-frame">
								<h4>活動封面照</h4>
								<div align="center">
								
									<img src="<c:url value='/getPicture/${one.activityNo}' />" class="imgRange" alt="圖片" />
								</div>
							</div>
						</div>
					</div>
					<!--/tabs-->
					<!--tab panes-->
					<div class="section-block">
						<div class="tab-content">
							<div role="tabpanel" class="tab-pane active" id="about">
								<div class="about-information">
									<h1 class="section-title">活動細項</h1>
									<div class="info-block  ">
											<div class="fortitle">主辦人</div>
											<div class="forcontent"><a href="#">${one.memberBean.nickname}</a></div>
									</div>
									<div class="info-block  ">
											<div class="fortitle">活動類型</div>
											<div class="forcontent">${one.activityTypeName} (${one.activityClass})</div>
									</div>
									<div class="info-block  ">
											<div class="fortitle">活動所在縣市</div>
											<div class="forcontent">${one.prov}</div>
									</div>
									<div class="info-block  ">
											<div class="fortitle">活動日期</div>
											<div class="forcontent">${one.activityDate}</div>
									</div>
									<div class="info-block  ">
											<div class="fortitle">集合地點</div>
											<div class="forcontent">${one.meetPoint}</div>
									</div>
									<div class="info-block  ">
											<div class="fortitle">集合時間</div>
											<div class="forcontent">${one.meetTime}</div>
									</div>
									<div class="info-block  ">
											<div class="fortitle">最低成行人數</div>
											<div class="forcontent">${one.minLimit}</div>
									</div>
									<div class="info-block  ">
											<div class="fortitle">最高人數限制</div>
											<div class="forcontent">${one.maxLimit}</div>
									</div>
									<div class="info-block  ">
											<div class="fortitle">報名截止日期</div>
											<div class="forcontent">${one.finalDate}</div>
									</div>
								</div>
								
							</div>
						</div>
					</div>
					
					<div class="section-block">
						<div class="tab-content">
							<div role="tabpanel" class="tab-pane active" id="about">
								<div class="about-information">
									<h1 class="section-title">活動介紹/提醒</h1>
									<div class="info-block">
									<c:if test="${empty one.introduction}">
										<p>(此活動無說明/提醒事項)
									</c:if>
										<p>${one.introduction}</p>
									</div>
								</div>
							</div>
						</div>
					</div>

					<div class="section-block">
						<div class="tab-content">
							<div role="tabpanel" class="tab-pane active" id="about">
								<div class="about-information">
									<h2>
										<span>已有 </span>${one.joinedNum}<span>人參加</span>
									</h2>
									<c:if test="${isJoined}">
										<h5>參加人員:</h5>
											<c:forEach var="joined" items="${joined}">
											<span><a href="">${joined.memberBean.nickname}</a></span>
											<span>&nbsp;&nbsp;</span>
											</c:forEach>
									</c:if>
									<!-- 							<span class="contribution">raised by <strong>5,234</strong> ready to launch</span> -->
									<div class="progress" style="border:dotted white 2px">
<%-- 										<c:set var="persentage" value="${activity.joinedNum / activity.minLimit *100 }"/> --%>
										<div class="progress-bar" role="progressbar"
											aria-valuenow="45" aria-valuemin="0" aria-valuemax="100"
											>
<!-- 											<span class="sr-only">45% Complete</span> -->
										</div>
									</div>

									<span class="goal-progress">
									<strong><fmt:parseNumber integerOnly="true" value="${one.joinedNum / one.minLimit *100}" /> 
									</strong>%達成</span> 
									<span class="count-down">剩下<strong>${one.leftDays}</strong>天截止</span> 
									<c:if test="${isJoined == false}">
										<c:choose>
											<c:when test="${one.memberBean.account == account}">
											</c:when>
											<c:when test="${one.maxLimit == 'one.joinedNum'}">
												<button class="btn btn-full" disabled>已額滿</button>
											</c:when>
											<c:otherwise>
												<button class="btn btn-launch">參加活動</button>
											</c:otherwise>
										</c:choose>
									</c:if>
									<c:if test="${isJoined == true}">
										<button class="btn btn-cancel">取消參加</button>
									</c:if>
								</div>
							</div>
						</div>
					</div>
				</div>
				<!--/tabs-->
				<!--/main content-->
				<!--sidebar-->
				<div class="allmsg content col-md-4 col-sm-12 col-xs-12">
					
					<div class="section-block summary">
						<h1 class="section-title">留言板</h1>
						<div class="profile-contents">
							<h2 class="position">參加人員歡迎在此留言板討論及詢問</h2>
							<button class="btn btn-contact lookmsg">👇🏻看全部</button>
							<button class="btn btn-contact addmsg" data-toggle="collapse" data-target="#collapseExample" style="display:none">我要留言</button>
						</div>
						
					</div>
					<div class="section-block msgbox collapse" id="collapseExample">
						<h1 class="section-title" >新增留言</h1>
						<div class="credit-block sources ">
							<textarea rows="2" name="msg" cols="28" class="msgbox newmsg" placeholder="(打點什麼吧)"></textarea>
						</div>
						<button class="btn btn-contact sendmsg">送出</button>
						<i class="fa fa-twitter"></i>
					</div>
					
					<div class="section-block msgboard" style="display:none" >
						<c:if test="${msgNum == 0}">
						<p>目前還沒有人留言</p>
						</c:if>
						<c:if test="${msgNum != 0}">
						<h1 class="section-title" >留言板</h1>
						<c:forEach var="msg" items="${msgBox}">
						<div class="credit-block sources ">
							<div class="btnarea">
								<img src="" class="userpic msgpic"/><span>&nbsp;${nickname}<a href="#"> ( ${account} ) </a></span>
								<c:if test="${account == msg.memberBean.account}">
									<img  class="smbtn msgbtnDelete" title="刪除" src="https://img.icons8.com/material-rounded/24/000000/delete-trash.png"/>
									<img  class="smbtn msgbtnEdit" title="編輯" src="https://img.icons8.com/material-outlined/24/000000/edit.png"/>
									<img hidden="true" class="smbtn msgbtnCancel" title="取消" src="https://img.icons8.com/material-outlined/24/000000/cancel.png"/>
									<img hidden="true" class="smbtn msgbtnOkay" title="確認" src="https://img.icons8.com/material-outlined/24/000000/ok.png"/>
								</c:if>
							</div>
							<div class="showmsg">
								<textarea name="msg" cols="32" class="msgbox newmsg" readonly="readonly" id="${msg.msgNo}">${msg.msgContent}</textarea>
							</div>
						</div>
						</c:forEach>
						</c:if>
					</div>
						<!--/credits block-->
					</div>
					<!--/credits-->
				</div>
				<!--/sidebar-->
			</div>
		</div>
<!------------------------刪除活動------------------------->		
	<div class="modal fade bd-example-modal-sm" id="deleteModal" tabindex="-1" role="dialog" aria-labelledby="exampleModalLabel" aria-hidden="true">
	  <div class="modal-dialog modal-sm" role="document">
	    <div class="modal-content" style="background-color:#ECEBEB; border:0">
	      <div class="modal-header" style="background-color:#85AD90; border:2px solid #85AD90">
	        <h5 class="modal-title" id="exampleModalLabel" style="color:white;font-size:15px ">刪除活動確認</h5>
	      </div>
	      <div class="modal-body" style="color:black; font-size:19px">
	        	<p>真的要刪除本活動嗎?</p>
	        	<p>會少一次跟大家碰面的機會呢...</p>
	        	<p>刪除前用留言版說明一下吧</p>
	      </div>
	      <div class="modal-footer" style="padding:0 16 12 16">
	         <button type="button" class="btn btn-secondary" data-dismiss="modal" >保留活動</button>
	        <a type="button" class="btn btn-primary" href="<c:url value='/deleteActivity/${one.activityNo}' />" style="background-color:#85AD90;border:1px solid #85AD90">確定要刪除</a>
	      </div>
	    </div>
	  </div>
	</div>
<!------------------------參加活動------------------------->		
	<div class="modal fade bd-example-modal-sm" id="joinModal" tabindex="-1" role="dialog" aria-labelledby="exampleModalLabel" aria-hidden="true">
	  <div class="modal-dialog modal-sm" role="document">
	    <div class="modal-content" style="background-color:#ECEBEB; border:0">
	      <div class="modal-header" style="background-color:#85AD90; border:2px solid #85AD90">
	        <h5 class="modal-title" id="exampleModalLabel" style="color:white;font-size:15px ">活動已參加</h5>
	      </div>
	      <div class="modal-body" style="color:black; font-size:19px">
	        	<p>您已成功參加此活動👌👌👌</p>
	        	<p>幫你自動關注本活動囉!</p>
	        	<p>歡迎使用右邊留言板跟大家交流   👉👉👉👉👉👉👉👉👉👉</p>
	      </div>
	      <div class="modal-footer" style="padding:0 16 12 16">
	        <a type="button" class="btn btn-primary" href="<c:url value='/addActivity/${one.activityNo}' />" style="background-color:#85AD90;border:1px solid #85AD90">OK</a>
	      </div>
	    </div>
	  </div>
	</div>
<!------------------------取消參加活動------------------------->		
	<div class="modal fade bd-example-modal-sm" id="cancelModal" tabindex="-1" role="dialog" aria-labelledby="exampleModalLabel" aria-hidden="true">
	  <div class="modal-dialog modal-sm" role="document">
	    <div class="modal-content" style="background-color:#ECEBEB; border:0">
	      <div class="modal-header" style="background-color:#85AD90; border:2px solid #85AD90">
	        <h5 class="modal-title" id="exampleModalLabel" style="color:white;font-size:15px ">未登入提醒</h5>
	      </div>
	      <div class="modal-body" style="color:black; font-size:19px">
	        	<p>您確定不參加這個活動嗎?</p>
	        	<p>取消前可以在留言版說明一下喔</p>
	      </div>
	      <div class="modal-footer" style="padding:0 16 12 16">
	     	 <button type="button" class="btn btn-secondary" data-dismiss="modal" >還是參加</button>
	        <a type="button" class="btn btn-primary" href="<c:url value='/cancelActivity/${one.activityNo}' />" style="background-color:#85AD90;border:1px solid #85AD90">確定不參加</a>
	      </div>
	    </div>
	  </div>
	</div>
<!------------------------非參加者點留言板------------------------->		
	<div class="modal fade bd-example-modal-sm" id="msgModal" tabindex="-1" role="dialog" aria-labelledby="exampleModalLabel" aria-hidden="true">
	  <div class="modal-dialog modal-sm" role="document">
	    <div class="modal-content" style="background-color:#ECEBEB; border:0">
	      <div class="modal-header" style="background-color:#85AD90; border:2px solid #85AD90">
	        <h5 class="modal-title" id="exampleModalLabel" style="color:white;font-size:15px ">未開放功能</h5>
	      </div>
	      <div class="modal-body" style="color:black; font-size:19px">
	        	<p>您目前還沒有參加此活動，</p>
	        	<p>這個功能暫不開放喔~</p>
	      </div>
	      <div class="modal-footer" style="padding:0 16 12 16">
	        <button type="button" class="btn btn-primary" data-dismiss="modal" style="background-color:#85AD90;border:1px solid #85AD90">知道了</button>
	      </div>
	    </div>
	  </div>
	</div>
<script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.14.3/umd/popper.min.js" integrity="sha384-ZMP7rVo3mIykV+2+9J3UJ46jBk0WLaUAdn689aCwoqbBJiSnjAK/l8WvCWPIPm49" crossorigin="anonymous"></script>
<script src="https://stackpath.bootstrapcdn.com/bootstrap/4.1.3/js/bootstrap.min.js" integrity="sha384-ChfqqxuZUCnJSK3+MXmPNIyE6ZbWh2IMqE241rYiqJxyMiZ6OW/JmZQ5stwEULTy" crossorigin="anonymous"></script>

<script>
	$(document).ready(function(){ //幾人參加的長條顯示%
		var persentage= ${one.joinedNum/one.minLimit*100};
		$(".progress-bar").css("width", persentage+"%");
		var frombtn = ${frombtn};
		if (frombtn){
			looksmg();
		}
		
	})

	$(".reminder").click(function(){ //關注活動
		var isJoined = ${isJoined}
		var activityNo = ${one.activityNo};
		if (!isJoined){
			var text = $(this).text();
			var classname = $(this).find("div").attr("class")
			if (classname == "nofollow"){ //關注改成不關注
				$(".reminder").empty();
				$(".reminder").append('<div class="follow"><strong><span style="font-size:18px">✰</span>關注本活動</strong></div>')
	 			var curentUrl = location.href;
				$.ajax({
					  url:"<c:url value='/ajax_unfollow' />",
					  type: "POST",
// 					  dataType: "html", 
					  data:  {
						  activityUrl: curentUrl.toString(),
						  },
					  success:function(data){
						}
				})
			}
			else if (classname == "follow"){ //沒關注 點後就關注
				$(".reminder").empty();
				$(".reminder").append('<div class="nofollow"><strong><span style="font-size:18px">★</span>取消關注</strong></div>')
				$(".noclass").css("background-color","#85AD90").css("color","#fff");
				var curentUrl = location.href;
				$.ajax({
					  url:"<c:url value='/ajax_follow' />",
					  type: "POST",
					  dataType: "html", 
					  data:  {
						  activityUrl: curentUrl.toString(),
						  activityNo: parseInt(activityNo),
						  },
					  success:function(data){
						}
				})
			}
		}
	})
	
	
	$(".lookmsg").click(function(){ //看留言
		looksmg();
	})
	
	function looksmg(){
		var isJoined = ${isJoined};
		var visit = "${account}";
		var host = "${one.memberBean.account}";
		if(!isJoined){
			if(host != visit){
				$('#msgModal').modal('show');
			}else{
				$(".msgboard").show();
				$(".addmsg").show();
			}
		}else{
			$(".msgboard").show();
			$(".addmsg").show();
		}
	}
	
// 	$('textarea').autoResize();
	$(".btn-launch").one("click", function(){ //參加活動(跳出確認框)
		$('#joinModal').modal('show');
		
	})
	
	$(".btn-cancel").one("click", function(){ //取消參加活動(跳出確認框)
		$('#cancelModal').modal('show');
		
	})
	$(".delete").on("click", function(){ //下架活動
		$('#deleteModal').modal('show');
	})
	$(".sendmsg").click(function(){ //新增留言
		var msgContent = $(".newmsg").val();
		var activityNo = ${one.activityNo};
		$.ajax({
			
			  url:"<c:url value='/msgSend' />",
			  type: "POST",
			  dataType: "html", 
			  data:  {
				  msg: msgContent,
				  activityNo: parseInt(activityNo),
				  },
			  success:function(data){
				  $(".allmsg").empty();
				  $(".allmsg").append(data);
				}
		})
	})
	
	$(".msgbtnDelete").click(function(){ //刪除留言
		var activityNo = ${one.activityNo};
		var msgNo = $(this).parents(".sources").find(".msgbox").attr("id");
		$(this).parents(".credit-block").hide("500");
		
		$.ajax({
			
			  url:"<c:url value='/msgDelete' />",
			  type: "POST",
			  dataType: "html", 
			  data:  {
				  msgNo:  parseInt(msgNo),
				  activityNo: parseInt(activityNo),
				  },
			  success:function(data){
				  setTimeout(function(){
					  $(".allmsg").empty();
					  $(".allmsg").append(data);

	                },550);
				  
				  
				}
		})
		
		
	})
	
	$(".msgbtnEdit").click(function(){  //press "msg edit btn"
		var textarea = $(this).parents(".sources").find(".msgbox");
		var btnarea =  $(this).parent("div");
		textarea.prop("readonly",false);
		textarea.css("border","2px grey solid");
		btnarea.find(".msgbtnEdit, .msgbtnDelete").hide();
		btnarea.find(".msgbtnCancel, .msgbtnOkay").attr("hidden",false);
		
	})
	
	$(".msgbtnOkay").click(function(){ //更新留言
		var activityNo = ${one.activityNo};
		var msgContent = $(this).parents(".sources").find(".msgbox").val();
		var msgNo = $(this).parents(".sources").find(".msgbox").attr("id");
		$.ajax({
			
			  url:"<c:url value='/msgUpdate' />",
			  type: "POST",
			  dataType: "html", 
			  data:  {
				  msg:msgContent,
				  msgNo: msgNo,
				  activityNo: parseInt(activityNo),
				  },
			  success:function(data){
				  console.log("update fail");
				  $(".allmsg").empty();
				  $(".allmsg").append(data);
				}
		})
	})
	$(".msgbox").focus(function(){
		var originalText = $(this).parents(".sources").find(".msgbox").val();
		$(".msgbtnCancel").click(function(){
			var textarea = $(this).parents(".sources").find(".msgbox");
			var btnarea =  $(this).parent("div");
			textarea.prop("readonly",true);
			textarea.css("border","none");
			btnarea.find(".msgbtnEdit, .msgbtnDelete").show();
			btnarea.find(".msgbtnCancel, .msgbtnOkay").attr("hidden",true);
			textarea.val(originalText);
		})
	})
	
	
</script>
</body>
</html>
