<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ page import="java.util.*,com.web.activity.model.ActivityBean"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn"%>
<!DOCTYPE html>

<html>

<head>
<meta charset="UTF-8">
<title>JoinJoy Content Manager System</title>

<link rel="stylesheet" href="css/bootstrap.min.css">
<script src="js/bootstrap.min.js"></script>

<meta name="viewport" content="width=device-width, initial-scale=1">

<style>
body {
	padding-top: 50px;
	background-color: #f5f5f5;
}

footer {
	padding-left: 15px;
	padding-right: 15px;
	background-color: #fff;
}

/*
 * Off Canvas
 * --------------------------------------------------
 */
@media screen and (max-width: 768px) {
	.row-offcanvas {
		position: relative;
		-webkit-transition: all 0.25s ease-out;
		-moz-transition: all 0.25s ease-out;
		transition: all 0.25s ease-out;
	}
	.row-offcanvas-left .sidebar-offcanvas {
		left: -33%;
	}
	.row-offcanvas-left.active {
		left: 33%;
	}
	.sidebar-offcanvas {
		position: absolute;
		top: 0;
		width: 33%;
		margin-left: 10px;
	}
}

/* Sidebar navigation */
.nav-sidebar {
	background-color: #f5f5f5;
	margin-right: -15px;
	margin-bottom: 20px;
	margin-left: -15px;
}

.nav-sidebar>li>a {
	padding-right: 20px;
	padding-left: 20px;
}

.nav-sidebar>.active>a {
	color: #fff;
	background-color: #428bca;
}

/*
 * Main content
 */
.main {
	padding: 20px;
	background-color: #fff;
}

@media ( min-width : 768px) {
	.main {
		padding-right: 40px;
		padding-left: 40px;
	}
}

.main .page-header {
	margin-top: 0;
}
</style>
<script src="https://cdn.staticfile.org/echarts/4.3.0/echarts.min.js"></script>

</head>

<body>
<script src="https://code.jquery.com/jquery-3.5.1.js"
	integrity="sha256-QWo7LDvxbWT2tbbQ97B53yJnYU3WhH/C8ycbRAkjPDc="
	crossorigin="anonymous"></script>


	<div class="container"></div>
	<nav class="navbar navbar-inverse navbar-fixed-top" role="navigation">
		<div class="container-fluid">
			<div class="navbar-header">
				<button type="button" class="navbar-toggle" data-toggle="collapse"
					data-target=".navbar-collapse">
					<span class="sr-only">Toggle navigation</span> <span
						class="icon-bar"></span> <span class="icon-bar"></span> <span
						class="icon-bar"></span>
				</button>
				<a class="navbar-brand" href="#">JoinJoy</a>
			</div>
			<div class="navbar-collapse collapse">
				<ul class="nav navbar-nav navbar-right">
					<li><a href="${pageContext.request.contextPath}/..">前台</a></li>
					<li><a href="#">前台設定</a></li>
					<li><a href="#">還沒想到</a></li>
					<li><a href="#">還沒想到</a></li>
				</ul>
				<!-- 				<form class="navbar-form navbar-right"> -->
				<!-- 					<input type="text" class="form-control" placeholder="Search..."> -->
				<!-- 				</form> -->
			</div>
		</div>
	</nav>

	<div class="container-fluid">

		<div class="row row-offcanvas row-offcanvas-left">

			<div class="col-sm-3 col-md-2 sidebar-offcanvas" id="sidebar"
				role="navigation">

				<ul class="nav nav-sidebar">
					<li class="active"><a href="#">功能總覽</a></li>
					<li><a href="">會員管理</a></li>
					<li><a href="Javascript:;" class="allactives">活動管理</a></li>
					<li><a href="https://www.investing.com/"
						target="_ext">前台管理</a></li>
					
				</ul>
				<ul class="nav nav-sidebar">
					<li class="active"><a href="#">圖表即時分析</a></li>
					<li><a href="Javascript:;" class="counts">圓餅圖</a></li>
					<li><a href="">暫缺功能</a></li>
					<li><a href="">暫缺功能</a></li>
					<li><a href="">暫缺功能</a></li>
				</ul>
				<!-- 				<ul class="nav nav-sidebar"> -->
				<!-- 					<li><a href="">暫缺功能</a></li> -->
				<!-- 					<li><a href="">暫缺功能</a></li> -->
				<!-- 					<li><a href="">暫缺功能</a></li> -->
				<!-- 				</ul> -->

			</div>
			<!--/span-->

			<div class="col-sm-9 col-md-10 main">

				<!--toggle sidebar button-->
				<p class="visible-xs">
					<button type="button" class="btn btn-primary btn-xs"
						data-toggle="offcanvas">
						<i class="glyphicon glyphicon-chevron-left"></i>
					</button>
				</p>

				<!-- start content -->
				<!-- 其他 (未寫) ======================================================================================================= -->
				<div class="post newajaxlist">
					<h1 class="page-header">
						圖表分析
						<p class="lead">
							(<a href="http://www.bootply.com/128936">with off-canvas
								sidebar</a>)
						</p>
					</h1>

					<div class="row placeholders">
						<div class="col-xs-6 col-sm-3 placeholder text-center">
							<img src="//placehold.it/200/6666ff/fff"
								class="center-block img-responsive img-circle"
								alt="Generic placeholder thumbnail">
							<h4>Gender</h4>
							<span class="text-muted">性別比</span>
						</div>
						<div class="col-xs-6 col-sm-3 placeholder text-center">
							<img src="//placehold.it/200/66ff66/fff"
								class="center-block img-responsive img-circle"
								alt="Generic placeholder thumbnail">
							<!-- 					<div id="chartContainer" style="height: 370px; width: 100%;"></div> -->
							<h4>Location</h4>
							<span class="text-muted">地區比<c:out
									value="${location.location}"></c:out></span>

						</div>
						<div class="col-xs-6 col-sm-3 placeholder text-center">
							<img src="//placehold.it/200/6666ff/fff"
								class="center-block img-responsive img-circle"
								alt="Generic placeholder thumbnail">
							<h4>Age</h4>
							<span class="text-muted">年齡比</span>
						</div>
						<div class="col-xs-6 col-sm-3 placeholder text-center">
							<img src="//placehold.it/200/66ff66/fff"
								class="center-block img-responsive img-circle"
								alt="Generic placeholder thumbnail">
							<h4>Label</h4>
							<span class="text-muted">Something else</span>
						</div>
					</div>
					<!-- <<START AJAX>><<=====================================================================================>> -->
					<hr>

					<h2 class="sub-header">活動概況</h2>
					<div class="table-responsive">
						<table class="table table-striped">
							<thead>
								<!-- 	這邊可以用個迴圈拉資料出圈拉資料出 -->
								<tr>
									<th>activityClass</th>
									<th>location</th>
									<th>activityStatus</th>
									<th>price</th>
									<th>name</th>
								</tr>
							</thead>
							<c:forEach var="CMS" items="${activities}">
								<tbody>
									<tr>
										<td>${CMS.activityClass}</td>
										<td>${CMS.location}</td>
										<td>${CMS.activityStatus}</td>
										<td>${CMS.price}</td>
										<td>${CMS.name}</td>
									</tr>
								</tbody>
							</c:forEach>
							<%-- 						<c:forEach var="count" items="${location}"> --%>
							<!-- 							<tbody> -->
							<!-- 								<tr> -->
							<%-- 									<td>${count.location}</td> --%>
							<!-- 								</tr> -->
							<!-- 								</tbody> -->
							<%-- 						</c:forEach> --%>
						</table>
					</div>
				</div>
				<!-- <<END>>====================================================================================================> -->
				<br>
<!-- 				<div id="ID3" style="width: 800px; height: 400px;"></div> -->
<!-- 				<div> -->
<%-- 				<c:out value="${location}" escapeXml="false"></c:out> --%>
<!-- 				</div> -->
				<!-- 				活動網頁贊助，可自由輸入				 -->
				<a href="http://www.bootply.com/gkTHCwjLO9">Get the Source Code</a>
				| <a href="http://bootstrap.theme.cards">More free Bootstrap
					themes</a>
				<!-- end content -->
				<!-- 其他 (未寫) ======================================================================================================= -->

			</div>
			<!--/row-->
		</div>
	</div>
	<!--/.container-->

	<footer>
		<p class="pull-right">©2016 Company</p>
	</footer>

	<script>
		$(document).ready(function() {
			$('[data-toggle=offcanvas]').click(function() {
				$('.row-offcanvas').toggleClass('active');
			});
		});
	</script>
	<!-- 	<script src="https://canvasjs.com/assets/script/canvasjs.min.js"></script> -->

	<script type="text/javascript">
		// 準備好的dom，初始化echarts
		var myChart = echarts.init(document.getElementById('ID3'));

		// 指定圖表配置跟數據(抓值)
		var option = {
			title : {
				text : '活動成功舉辦數'
			},
			tooltip : {},
			legend : {
				data : [ '活動數' ]
			},
			xAxis : {
				data : [ "1月", "2月", "3月", "4月", "5月", "6月", "7月", "8月", "9月",
						"10月", "11月", "12月" ]
			},
			yAxis : {},
			series : [ {
				name : '活動數',
				type : 'bar',
				data : [ 5, 20, 36, 10, 10, 20, 36, 10, 10, 20, 44, 60 ]
			} ]
		};

		// 使用刚指定的配置项和数据显示图表。
		myChart.setOption(option);
	</script>
	<script>
		$(".allactives").click(function() { //click event

			$.ajax({
				url : "ajax_selallactive",
				type : "GET",
				dataType : "html", //server送回
				contentType : 'application/json; charset=utf-8',
				data : {}, //data空的代表沒任何參數
				success : function(data) { //成功的話
					$(".newajaxlist").empty();
					$(".newajaxlist").append(data); //透過導向的URL到ajax方法 div class裝東西
				}
			})
		})
	</script>
	<script>
		$(".counts").click(function() { //click event

			$.ajax({
				url : "ajax_counts",
				type : "GET",
				dataType : "html", //server送回
				contentType : 'application/json; charset=utf-8',
				data : {}, //data空的代表沒任何參數
				success : function(data) { //成功的話
					$(".newajaxlist").empty();
					$(".newajaxlist").append(data); //透過導向的URL到ajax方法 div class裝東西
				}
			})
		})
	</script>
</body>

</html>