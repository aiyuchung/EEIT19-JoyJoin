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
						<a href="#" class="follow"><strong><i class="fa fa-star"></i>關注本活動</strong></a> 
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
								<div>
									<img src="<c:url value='/images/pics01.jpg' />" class="imgRange" alt="沒有圖片" />
	<!-- 							<iframe src="https://player.vimeo.com/video/67938315" width="500" height="281" frameborder="0" webkitallowfullscreen mozallowfullscreen allowfullscreen></iframe> -->
								</div>
							</div>
						</div>
					</div>
					<!--signup-->
<!-- 					<div class="section-block signup"> -->
<!-- 						<div class="sign-up-form"> -->
<%-- 							<form> --%>
<!-- 								<p>Sign up now for updates and a chance to win a free -->
<!-- 									version of launch!</p> -->
<!-- 								<input class="signup-input" type="text" name="email" -->
<!-- 									placeholder="Email Address"> -->
<!-- 								<button class="btn btn-signup" type="submit"> -->
<!-- 									<i class="fa fa-paper-plane"></i> -->
<!-- 								</button> -->
<%-- 							</form> --%>
<!-- 						</div> -->
<!-- 					</div> -->
					<!--/signup-->
					<!--tabs-->
<!-- 					<div class="section-block"> -->
<!-- 						<div class="section-tabs"> -->
<!-- 							<ul class="nav nav-tabs" role="tablist"> -->
<!-- 								<li role="presentation" class="active"><a href="#about" -->
<!-- 									aria-controls="about" role="tab" data-toggle="tab">About</a></li> -->
<!-- 								<li role="presentation"><a href="#updates" -->
<!-- 									aria-controls="updates" role="tab" data-toggle="tab">Updates</a></li> -->
<!-- 							</ul> -->
<!-- 						</div> -->
<!-- 					</div> -->
					<!--/tabs-->
					<!--tab panes-->
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
											<div class="fortitle">最低成行人舒</div>
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
									<!-- 							<span class="contribution">raised by <strong>5,234</strong> ready to launch</span> -->
									<div class="progress">
										<div class="progress-bar" role="progressbar"
											aria-valuenow="45" aria-valuemin="0" aria-valuemax="100"
											style="width: 45%;">
											<span class="sr-only">45% Complete</span>
										</div>
									</div>

									<span class="goal-progress">
									<strong><fmt:parseNumber integerOnly="true" value="${one.joinedNum / one.minLimit *100}" /> 
									</strong>%達成</span> 
									<span class="count-down">剩下<strong>${one.leftDays}</strong>天截止</span> 
									<a href="#" class="btn btn-launch">參加活動</a>
								</div>
							</div>
<!-- 							<div role="tabpanel" class="tab-pane" id="updates"> -->
<!-- 								<div class="update-information"> -->
<!-- 								<h1 class="section-title">UPDATES</h1> -->
<!-- 									update items -->
<!-- 									<div class="update-post"> -->
<!-- 										<h4 class="update-title">We've started shipping!</h4> -->
<!-- 										<span class="update-date">Posted 2 days ago</span> -->
<!-- 										<p>Suspendisse luctus at massa sit amet bibendum. Cras commodo congue urna, vel dictum velit bibendum eget. Vestibulum quis risus euismod, facilisis lorem nec, dapibus leo. Quisque sodales eget dolor iaculis dapibus. Vivamus sit amet lacus ipsum. Nullam varius lobortis neque, et efficitur lacus. Quisque dictum tellus nec mi luctus imperdiet. Morbi vel aliquet velit, accumsan dapibus urna. Cras ligula orci, suscipit id eros non, rhoncus efficitur nisi.</p> -->
<!-- 									</div> -->
<!-- 									<div class="update-post"> -->
<!-- 										<h4 class="update-title">Launch begins manufacturing </h4> -->
<!-- 										<span class="update-date">Posted 9 days ago</span> -->
<!-- 										<p>Suspendisse luctus at massa sit amet bibendum. Cras commodo congue urna, vel dictum velit bibendum eget. Vestibulum quis risus euismod, facilisis lorem nec, dapibus leo. Quisque sodales eget dolor iaculis dapibus. Vivamus sit amet lacus ipsum. Nullam varius lobortis neque, et efficitur lacus. Quisque dictum tellus nec mi luctus imperdiet. Morbi vel aliquet velit, accumsan dapibus urna. Cras ligula orci, suscipit id eros non, rhoncus efficitur nisi.</p> -->
<!-- 									</div> -->
<!-- 									<div class="update-post"> -->
<!-- 										<h4 class="update-title">Designs have now been finalized</h4> -->
<!-- 										<span class="update-date">Posted 17 days ago</span> -->
<!-- 										<p>Suspendisse luctus at massa sit amet bibendum. Cras commodo congue urna, vel dictum velit bibendum eget. Vestibulum quis risus euismod, facilisis lorem nec, dapibus leo. Quisque sodales eget dolor iaculis dapibus. Vivamus sit amet lacus ipsum. Nullam varius lobortis neque, et efficitur lacus. Quisque dictum tellus nec mi luctus imperdiet. Morbi vel aliquet velit, accumsan dapibus urna. Cras ligula orci, suscipit id eros non, rhoncus efficitur nisi.</p> -->
<!-- 									</div> -->
<!-- 									/update items -->
<!-- 								</div> -->
<!-- 							</div> -->
						</div>
					</div>
				</div>
				<!--/tabs-->
				<!--/main content-->
				<!--sidebar-->
				<div class="content col-md-4 col-sm-12 col-xs-12">
					
					<div class="section-block summary">
						<h1 class="section-title">留言板</h1>
						<div class="profile-contents">
							<h2 class="position">參加人員歡迎在此留言板討論及詢問</h2>
<!-- 							<img src="assets/img/profile-img.jpg" -->
<!-- 								class="profile-image img responsive" alt="John Doe"> -->
							<!--social links-->
<!-- 							<ul class="list-inline"> -->
<!-- 								<li><a href="#"><i class="fa fa-twitter"></i></a></li> -->
<!-- 								<li><a href="#"><i class="fa fa-facebook"></i></a></li> -->
<!-- 								<li><a href="#"><i class="fa fa-google-plus"></i></a></li> -->
<!-- 								<li><a href="#"><i class="fa fa-linkedin"></i></a></li> -->
<!-- 								<li><a href="#"><i class="fa fa-git"></i></a></li> -->
<!-- 							</ul> -->
							<!--/social links-->
							<button class="btn btn-contact lookmsg">👇🏻看全部</button>

<!-- 							  <button class="btn btn-primary" type="button" data-toggle="collapse" data-target="#collapseExample" aria-expanded="false" aria-controls="collapseExample"> -->
<!-- 							    Button with data-target -->
<!-- 							  </button> -->
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
						</form>
					</div>
					
					<div class="section-block msgboard" style="display:none" >
						<div class="credit-block sources ">
							<img scr="" class="msgpic"/>
							
						</div>
					</div>
					
<!-- 					<div class="section-block"> -->
<!-- 						<h1 class="section-title">REWARDS</h1> -->
<!-- 						reward blocks -->
<!-- 						<div class="reward-block"> -->
<!-- 							<h3>$10</h3> -->
<!-- 							<h2>Early Bird</h2> -->
<!-- 							<p>Curabitur accumsan sem sed velit ultrices fermentum. -->
<!-- 								Pellentesque rutrum mi nec ipsum elementum aliquet. Sed id -->
<!-- 								vestibulum eros. Nullam nunc velit, viverra sed consequat ac, -->
<!-- 								pulvinar in metus.</p> -->
<!-- 							<span><i class="fa fa-users"></i> 180 backers</span> <a href="" -->
<!-- 								class="btn btn-reward">GET THIS REWARD</a> -->
<!-- 						</div> -->
<!-- 						<div class="reward-block popular"> -->
<!-- 							<h3>$20</h3> -->
<!-- 							<h2>Value Bird</h2> -->
<!-- 							<p>Curabitur accumsan sem sed velit ultrices fermentum. -->
<!-- 								Pellentesque rutrum mi nec ipsum elementum aliquet. Sed id -->
<!-- 								vestibulum eros. Nullam nunc velit, viverra sed consequat ac, -->
<!-- 								pulvinar in metus.</p> -->
<!-- 							<span><i class="fa fa-users"></i> 320 backers</span> <a href="" -->
<!-- 								class="btn btn-reward">GET THIS REWARD</a> -->
<!-- 						</div> -->
<!-- 						<div class="reward-block"> -->
<!-- 							<h3>$30</h3> -->
<!-- 							<h2>Super Bird</h2> -->
<!-- 							<p>Curabitur accumsan sem sed velit ultrices fermentum. -->
<!-- 								Pellentesque rutrum mi nec ipsum elementum aliquet. Sed id -->
<!-- 								vestibulum eros. Nullam nunc velit, viverra sed consequat ac, -->
<!-- 								pulvinar in metus.</p> -->
<!-- 							<span><i class="fa fa-users"></i> 105 backers</span> <a href="" -->
<!-- 								class="btn btn-reward">GET THIS REWARD</a> -->
<!-- 						</div> -->
<!-- 						<div class="reward-block last"> -->
<!-- 							<h3>$50</h3> -->
<!-- 							<h2>Premium Bird</h2> -->
<!-- 							<p>Curabitur accumsan sem sed velit ultrices fermentum. -->
<!-- 								Pellentesque rutrum mi nec ipsum elementum aliquet. Sed id -->
<!-- 								vestibulum eros. Nullam nunc velit, viverra sed consequat ac, -->
<!-- 								pulvinar in metus.</p> -->
<!-- 							<span><i class="fa fa-users"></i> 64 backers</span> <a href="" -->
<!-- 								class="btn btn-reward">GET THIS REWARD</a> -->
<!-- 						</div> -->
<!-- 						/reward blocks -->
<!-- 					</div> -->


					<!--credits-->
					<div class="section-block msgboard" style="display:none">
						<h1 class="section-title" >留言板</h1>
						<!--credits block-->
						<div class="credit-block sources">
							<ul class="list-unstyled">
								<li><a href="http://getbootstrap.com/"><i
										class="fa fa-external-link"></i>Bootstrap</a></li>
								<li><a href="http://fortawesome.github.io/Font-Awesome/"><i
										class="fa fa-external-link"></i>FontAwesome</a></li>
								<li><a href="https://www.google.com/fonts"><i
										class="fa fa-external-link"></i>Google Fonts</a></li>
								<li><a href="http://jquery.com/"><i
										class="fa fa-external-link"></i>jQuery</a></li>
								<li><a href="https://vimeo.com/67938315"><i
										class="fa fa-external-link"></i>Vimeo Video</a></li>
								<li><a href="http://uifaces.com/"><i
										class="fa fa-external-link"></i>Glasses Image</a></li>
							</ul>
						</div>
						<div class="credit-block license">
							<p>
								The Launch template was created by <a class="lined"
									href="http://themes.audaindesigns.com">Audain Designs</a> for
								use by anyone for <strong>FREE</strong> and is covered uner the
								<a class="lined"
									href="http://creativecommons.org/licenses/by/3.0/">Creative
									Commons Attribution 3.0 License</a>.
							</p>
							<p>As time goes on the template may receive updates, follow
								us on twitter to get notified when an update is released.</p>
							<a href="http://twitter.com/audaindesigns" class="btn btn-follow"><i
								class="fa fa-twitter"></i>FOLLOW US</a> <a href="#"
								class="btn btn-download"><i class="fa fa-download"></i>DOWNLOAD
								TEMPLATE</a>
						</div>
						<!--/credits block-->
					</div>
					<!--/credits-->
				</div>
				<!--/sidebar-->
			</div>
		</div>
	</div>
	<footer class="footer">
		<div class="container">
			<div class="row">
				<!--This template has been created under the Creative Commons Attribution 3.0 License. Please keep the attribution link below when using this template in your own project, thank you.-->
				<span class="copyright">Created by <a
					href="http://themes.audaindesigns.com" target="_blank">Audain
						Designs</a> for free use
				</span>
			</div>
		</div>
	</footer>
</body>
<script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.14.3/umd/popper.min.js" integrity="sha384-ZMP7rVo3mIykV+2+9J3UJ46jBk0WLaUAdn689aCwoqbBJiSnjAK/l8WvCWPIPm49" crossorigin="anonymous"></script>
<script src="https://stackpath.bootstrapcdn.com/bootstrap/4.1.3/js/bootstrap.min.js" integrity="sha384-ChfqqxuZUCnJSK3+MXmPNIyE6ZbWh2IMqE241rYiqJxyMiZ6OW/JmZQ5stwEULTy" crossorigin="anonymous"></script>
	
<script>
	$(".follow").click(function(){
		var text = $(this).text();
		if (text == "取消關注"){
			$(this).text("關注本活動");
			$(this).css("background-color","#fff").css("color","#85AD90");
		}else{
			$(this).text("取消關注");
		}
	})
	
	
	$(".lookmsg").click(function(){
		$(".msgboard").show();
		$(".addmsg").show();
	})
	
// 	$('textarea').autoResize();
	
	$(".sendmsg").click(function(){
		var msgContent = $(".newmsg").text();
		var userId = session.getMemberNo();
		var activityNo = ${one.activityNo};
		console.log(msgContent);
		console.log(userId);
		console.log(activityNo);
		$.ajax({
			  url:"ajax_msgSend",
			  type: "POST",
			  dataType: "html", 
			  contentType: 'application/json; charset=utf-8',
			  data: {
				msg: msgContent,
			  	userId: userId,
			  	activityNo: activityNo,
				}, 
			  success:function(data){
				  $(".msgboard").empty();
				  $(".msgboard").append(data);
				}
		})
	})



</script>
</html>
