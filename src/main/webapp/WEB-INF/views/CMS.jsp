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

img {
	width: 60%;
}
</style>

</head>

<body>
	<script src="https://code.jquery.com/jquery-3.5.1.js"
		integrity="sha256-QWo7LDvxbWT2tbbQ97B53yJnYU3WhH/C8ycbRAkjPDc="
		crossorigin="anonymous"></script>
	<script src="js/bootstrap.min.js"></script>


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
				<img src="${pageContext.request.contextPath}/images/JoyJoin.png">
			</div>
			<div class="navbar-collapse collapse">
				<ul class="nav navbar-nav navbar-right">
					<li><a href="<c:url value='/' />">前台</a></li>

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

				<c:if test="${level eq '5' || level eq '4' }"> 
				<!-- 4=工讀生=roleId=3(RoleSaveBean) -->
						<ul class="nav nav-sidebar">
							<c:forEach var="eachmenu" items="${checked}">
								<c:if test="${eachmenu == 1}"> 
									<li class="active"><a href="#" id="parentId0">功能總覽</a></li>
								</c:if>
								<c:if test="${eachmenu == 2}"> 
									<li><a href="Javascript:;" id="parentId${eachmenu}" class="allMembers">會員管理</a></li>
								</c:if>
								<c:if test="${eachmenu == 3}"> 
									<li><a href="Javascript:;" id="parentId${eachmenu}" class="allactives">活動管理</a></li>
								</c:if>
								<c:if test="${eachmenu == 4}"> 
									<li><a href="Javascript:;" id="parentId${eachmenu}" class="rights">權限管理</a></li>
								</c:if>
								</c:forEach>
						</ul>
						<ul class="nav nav-sidebar">
							<c:forEach var="eachmenu" items="${checked}">
								<c:if test="${eachmenu == 5}"> 
									<li class="active"><a href="#" id="parentId5">圖表即時分析</a></li>
								</c:if>
								<c:if test="${eachmenu == 6}"> 
									<li><a href="Javascript:;" id="parentId${eachmenu}" class="provStac">縣市統計</a></li>
								</c:if>
								<c:if test="${eachmenu == 7}"> 
									<li><a href="Javascript:;" id="parentId${eachmenu}" class="counts">區域活動</a></li>
								</c:if>
								<c:if test="${eachmenu == 8}"> 
									<li><a href="Javascript:;" id="parentId${eachmenu}" class="gender">性別分析</a></li>
								</c:if>
								<c:if test="${eachmenu == 9}"> 
									<li><a href="Javascript:;" id="parentId${eachmenu}" class="starSign">星座比較</a></li>
								</c:if>
								<c:if test="${eachmenu == 10}"> 
									<li><a href="Javascript:;" id="parentId${eachmenu}" class="log">日誌</a></li>
								</c:if>
							</c:forEach>
					</ul>
				</c:if>
		
				<!-- 			左邊項目 -->
				<c:if test="${level eq '6' }"> 
				<c:forEach var="Menu" items="${allactive}">
					<ul class="nav nav-sidebar">
						<li class="active"><a href="#" id="parentId${Menu.parentId}">${Menu.menuName}</a></li>
						<c:forEach var="Menu1" items="${allactive2}">
							<c:if test="${Menu1.parentId == Menu.menuId}">
								<li><a href="Javascript:;" id="parentId${Menu1.classId}"
									class="${Menu1.path}">${Menu1.menuName}</a></li>

							</c:if>

						</c:forEach>
					</ul>
				</c:forEach>
				</c:if>
			</div>


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
				<div>
					<!-- 				===============圖表=============== -->
					<div id="locBarChart" class="showhide"
						style="width: 800px; height: 600px;"></div>
					<div id="genderPie" class="showhide"
						style="width: 800px; height: 600px; -webkit-tap-highlight-color: transparent; user-select: none; position: relative;"
						_echarts_instance_="ec_1605084430430"></div>

					<!-- 							縣市活動數分析 -->

					<div id="provstatic" class="showhide"
						style="width: 800px; height: 600px; -webkit-tap-highlight-color: transparent; user-select: none; position: relative;"
						_echarts_instance_="ec_1605095908050">

						<div
							style="position: relative; width: 1024px; height: 444px; padding: 0px; margin: 0px; border-width: 0px; cursor: pointer;">
							<canvas data-zr-dom-id="zr_0" width="1920" height="832"
								style="position: absolute; left: 0px; top: 0px; width: 1024px; height: 444px; user-select: none; -webkit-tap-highlight-color: rgba(0, 0, 0, 0); padding: 0px; margin: 0px; border-width: 0px;"></canvas>
						</div>
						<div
							style="position: absolute; display: none; border-style: solid; white-space: nowrap; z-index: 9999999; transition: left 0.4s cubic-bezier(0.23, 1, 0.32, 1) 0s, top 0.4s cubic-bezier(0.23, 1, 0.32, 1) 0s; background-color: rgba(50, 50, 50, 0.7); border-width: 0px; border-color: rgb(51, 51, 51); border-radius: 4px; color: rgb(255, 255, 255); font: 14px/21px&amp; amp; amp; amp; amp; amp; amp; amp; amp; amp; amp; amp; amp; amp; amp; amp; amp; amp; amp; amp; amp; amp; amp; amp; quot; Microsoft YaHei&amp;amp; amp; amp; amp; amp; amp; amp; amp; amp; amp; amp; amp; amp; amp; amp; amp; amp; amp; amp; amp; amp; amp; amp; quot;; padding: 5px; left: 286px; top: 114px; pointer-events: none;">
							各縣市舉辦活動數<br> <span
								style="display: inline-block; margin-right: 5px; border-radius: 10px; width: 10px; height: 10px; background-color: #c23531;"></span>最新:
							<br>
						</div>
					</div>

					<div id="starstatic" class="showhide"
						style="width: 800px; height: 600px; -webkit-tap-highlight-color: transparent; user-select: none; position: relative;"
						_echarts_instance_="ec_1605095908050">

						<div
							style="position: relative; width: 1024px; height: 444px; padding: 0px; margin: 0px; border-width: 0px; cursor: pointer;">
							<canvas data-zr-dom-id="zr_0" width="1920" height="832"
								style="position: absolute; left: 0px; top: 0px; width: 1024px; height: 444px; user-select: none; -webkit-tap-highlight-color: rgba(0, 0, 0, 0); padding: 0px; margin: 0px; border-width: 0px;"></canvas>
						</div>
						<div
							style="position: absolute; display: none; border-style: solid; white-space: nowrap; z-index: 9999999; transition: left 0.4s cubic-bezier(0.23, 1, 0.32, 1) 0s, top 0.4s cubic-bezier(0.23, 1, 0.32, 1) 0s; background-color: rgba(50, 50, 50, 0.7); border-width: 0px; border-color: rgb(51, 51, 51); border-radius: 4px; color: rgb(255, 255, 255); font: 14px/21px&amp; amp; amp; amp; amp; amp; amp; amp; amp; amp; amp; amp; amp; amp; amp; amp; amp; amp; amp; amp; amp; amp; amp; amp; amp; amp; amp; quot; Microsoft YaHei&amp;amp; amp; amp; amp; amp; amp; amp; amp; amp; amp; amp; amp; amp; amp; amp; amp; amp; amp; amp; amp; amp; amp; amp; amp; amp; amp; quot;; padding: 5px; left: 286px; top: 114px; pointer-events: none;">
							註冊人口星座數分析<br> <span
								style="display: inline-block; margin-right: 5px; border-radius: 10px; width: 10px; height: 10px; background-color: #c23531;"></span>最新:
							<br>
						</div>
					</div>
					<!-- 				===============資料=============== -->
					<div id="activehideshow" class="post newajaxlist"></div>
					<div id="activehideshow" class="post oldajaxlist"></div>

				</div>

				<!-- <<START AJAX>><<=====================================================================================>> -->







				<!-- <<END>>====================================================================================================> -->
				<!-- end content -->
				<input type="text" id="userAccount" value="${account}" hidden>
				<div class="modal fade" id="exampleModal" tabindex="-1"
					role="dialog" aria-labelledby="exampleModalLabel"
					aria-hidden="true">
					<div class="modal-dialog" role="document">
						<div class="modal-content"
							style="background-color: #ECEBEB; border: 0">
							<div class="modal-header"
								style="background-color: #85AD90; border: 2px solid #85AD90">
								<h5 class="modal-title" id="exampleModalLabel"
									style="color: black; font-size: 15px">未登入提醒</h5>
							</div>
							<div class="modal-body" style="color: black; font-size: 19px">
								您現在正在前往會員才能使用的功能!</div>
							<div class="modal-footer">
								<button type="button" class="btn btn-secondary"
									data-dismiss="modal">晚點再登入</button>
								<a type="button" class="btn btn-primary"
									href="<c:url value='/login' />"
									style="background-color: #85AD90; border: 1px solid #85AD90">現在登入</a>
							</div>
						</div>
					</div>
				</div>


			</div>
			<!-- <++++++++++++++++++++++++++++++> -->



		</div>



		<!--/.container-->
		<!-- 請登入的modal  -->
		<script>
			
		</script>

		<script
			src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.14.3/umd/popper.min.js"
			integrity="sha384-ZMP7rVo3mIykV+2+9J3UJ46jBk0WLaUAdn689aCwoqbBJiSnjAK/l8WvCWPIPm49"
			crossorigin="anonymous"></script>
		<script
			src="https://stackpath.bootstrapcdn.com/bootstrap/4.1.3/js/bootstrap.min.js"
			integrity="sha384-ChfqqxuZUCnJSK3+MXmPNIyE6ZbWh2IMqE241rYiqJxyMiZ6OW/JmZQ5stwEULTy"
			crossorigin="anonymous"></script>



		<script
			src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.14.3/umd/popper.min.js"
			integrity="sha384-ZMP7rVo3mIykV+2+9J3UJ46jBk0WLaUAdn689aCwoqbBJiSnjAK/l8WvCWPIPm49"
			crossorigin="anonymous"></script>
		<script
			src="https://stackpath.bootstrapcdn.com/bootstrap/4.1.3/js/bootstrap.min.js"
			integrity="sha384-ChfqqxuZUCnJSK3+MXmPNIyE6ZbWh2IMqE241rYiqJxyMiZ6OW/JmZQ5stwEULTy"
			crossorigin="anonymous"></script>

		<script>
			$(document).ready(function() {
				$('[data-toggle=offcanvas]').click(function() {
					$('.row-offcanvas').toggleClass('active');
				});
			});
		</script>
		<!-- 	<script src="https://canvasjs.com/assets/script/canvasjs.min.js"></script> -->

		<script type="text/javascript"
			src="https://cdn.jsdelivr.net/npm/echarts/dist/echarts.min.js"></script>
		<script type="text/javascript"
			src="https://cdn.jsdelivr.net/npm/echarts-gl/dist/echarts-gl.min.js"></script>
		<script type="text/javascript"
			src="https://cdn.jsdelivr.net/npm/echarts-stat/dist/ecStat.min.js"></script>
		<script type="text/javascript"
			src="https://cdn.jsdelivr.net/npm/echarts/dist/extension/dataTool.min.js"></script>
		<script type="text/javascript"
			src="https://cdn.jsdelivr.net/npm/echarts/map/js/china.js"></script>
		<script type="text/javascript"
			src="https://cdn.jsdelivr.net/npm/echarts/map/js/world.js"></script>

		<script type="text/javascript"
			src="https://cdn.jsdelivr.net/npm/echarts/dist/extension/bmap.min.js"></script>


		<script>
			$(".more").click(function() {
				var account = $("#userAccount").val();
				console.log("account =" + account);
				if (account == "" || account == null) {
					$('#exampleModal').modal('show');
					event.preventDefault();
				}
			})
		</script>

		<!-- <===Location顯示====> -->

		<script>
			
			// 	<設定參數==========>
			var NorthSet = 0;
			var WestSet = 0;
			var SouthSet = 0;
			var EastSet = 0;

			//			document.getElementById("counts").onclick = function() 
			$(".counts").click(function() { //事件觸發
				$("#provstatic").hide(); //可隱藏
				
				$("#genderPie").hide();
				$("#starstatic").hide();
				$(".newajaxlist").hide();
				$(".oldajaxlist").hide();
				var xhr = new XMLHttpRequest();
				xhr.open("GET", "<c:url value='/ajax_counts' />", true); //抓到CONTROLLER路徑
				xhr.send();
				var message = "";
				xhr.onreadystatechange = function() {
					if (xhr.readyState == 4 && xhr.status == 200) {
						var result = JSON.parse(xhr.responseText);
						$("#locBarChart").show();
						NorthSet = result["north"];
						WestSet = result["west"];
						SouthSet = result["south"];
						EastSet = result["east"];
						console.log("NorthSet = " + NorthSet);
						console.log("WestSet = " + WestSet);
						console.log("SouthSet = " + SouthSet);
						console.log("EastSet = " + EastSet);
						myChart(NorthSet, WestSet, SouthSet, EastSet);
					}
				}
			});

			function myChart(North, West, South, East) {
				// 準備好的dom，初始化echarts
				//	var dom = echarts.init(document.getElementById('locBarChart'));
				var dom = document.getElementById('locBarChart');
				var myChart = echarts.init(dom);
				console.log("North = " + North);
				console.log("West = " + West);
				console.log("South = " + South);
				console.log("East = " + East);

				// 指定圖表配置跟數據(抓值)
				option = null;
				option = {
					title : {
						text : '活動區域數量示意圖'
					},
					tooltip : {},
					legend : {
						data : [ '舉辦次數' ]
					},
					xAxis : {
						data : [ "北部", "西部", "南部", "東部" ]
					},
					yAxis : {},
					series : [ {
						name : '區域次數',
						type : 'bar',
						data : [ North, West, South, East ]
					//參數已經設定好再函示裡面定義好
					} ]

				};
				// 使用刚指定的配置项和数据显示图表。
				myChart.setOption(option, true);
			}
		</script>




		<!-- <===Gender顯示====> -->

		<!-- 	<=====性別圓餅圖比例=========> -->

		<script>
	
			// 	<設定參數==========>
			var MaleSet = 0;
			var FemaleSet = 0;
			var NoSet = 0;

			//			document.getElementById("gender").onclick = function() 
			$(".gender")
					.click(
							function() { //事件觸發
								$("#provstatic").hide(); //可隱藏
								$("#locBarChart").hide();//可隱藏
							
								$("#starstatic").hide();
								$(".newajaxlist").hide();
								$(".oldajaxlist").hide();
								var xhr = new XMLHttpRequest();
								xhr.open("GET",
										"<c:url value='/ajax_gender' />", true); //抓到CONTROLLER路徑
								xhr.send();
								var message = "";
								xhr.onreadystatechange = function() {
									if (xhr.readyState == 4
											&& xhr.status == 200) {
										var result = JSON
												.parse(xhr.responseText);
										$("#genderPie").show();
										MaleSet = result["男"];
										FemaleSet = result["女"];
										NoSet = result["無"];
										console.log("MaleSet = " + MaleSet);
										console.log("FemaleSet = " + FemaleSet);
										console.log("NoSet = " + NoSet);
										makepie(MaleSet, FemaleSet, NoSet);
									}
								}

								function makepie(MaleSet, FemaleSet, NoSet) {
									// 準備好的dom，初始化echarts
									var dom = document
											.getElementById('genderPie');
									var myChart = echarts.init(dom);
									var malep = (MaleSet / (MaleSet + FemaleSet + NoSet)) * 100;
									var femalep = (FemaleSet / (MaleSet
											+ FemaleSet + NoSet)) * 100;
									var NoSet = (NoSet / (MaleSet + FemaleSet + NoSet)) * 100;

									console.log("MaleSet = " + MaleSet);
									console.log("FemaleSet = " + FemaleSet);
									console.log("NoSet = " + NoSet);

									// 指定圖表配置跟數據(抓值)
									option = null;
									option = {
										title : {
											text : 'JoyJoin註冊性別比',
											subtext : '性別比例',
											left : 'center'
										},
										tooltip : {
											trigger : 'item',
											formatter : '{a} <br/>{b} : {c} ({d}%)'
										},
										legend : {
											orient : 'vertical',
											left : 'left',
											data : [ 'MaleSet', 'FemaleSet',
													'NoSet' ]
										},
										series : [ {
											name : '性別',
											type : 'pie',
											radius : '55%',
											center : [ '50%', '60%' ],
											data : [ {
												value : MaleSet,
												name : '男性'
											}, {
												value : FemaleSet,
												name : '女性'
											}, {
												value : NoSet,
												name : '無'
											},

											],
											emphasis : {
												itemStyle : {
													shadowBlur : 10,
													shadowOffsetX : 0,
													shadowColor : 'rgba(0, 0, 0, 0.5)'
												}
											}
										} ]
									}
									if (option && typeof option === "object") {
										myChart.setOption(option, true);
									}
								}
							});
		</script>

		<!-- 	start<========================================縣市比較========================================================> -->

		<script>
	
			var KLUSet = 0; //基隆市
			var TPESet = 0; //台北市
			var TPHSet = 0; //新北市
			var TYCSet = 0; //桃園市
			var HSCSet = 0; //新竹市
			var HSHSet = 0; //新竹縣
			var ILNSet = 0; //宜蘭縣
			var MALSet = 0; //苗栗縣
			var TXGSet = 0; //台中市
			var CWHSet = 0; //彰化縣
			var NTOSet = 0; //南投縣
			var YLHSet = 0; //雲林縣
			var CYISet = 0; //嘉義市
			var CHYSet = 0; //嘉義縣
			var TNNSet = 0; //台南市
			var KHHSet = 0; //高雄市
			var IUHSet = 0; //屏東縣
			var TTTSet = 0; //台東縣
			var HWASet = 0; //花蓮縣
			var PEHSet = 0; //澎湖縣
			var KMNSet = 0; //金門市
			var LNNSet = 0; //連江縣

			//			document.getElementById("provStac").onclick = function() 
			$(".provStac").click(
					
					
					function() { //事件觸發
						$("#locBarChart").hide();//可隱藏
						$("#genderPie").hide();
						$("#starstatic").hide();
						$(".newajaxlist").hide();
						$(".oldajaxlist").hide();
						var xhr = new XMLHttpRequest();
						xhr.open("GET", "<c:url value='/ajax_prov' />", true); //抓到CONTROLLER路徑
						xhr.send();
						var message = "";
						xhr.onreadystatechange = function() {
							if (xhr.readyState == 4 && xhr.status == 200) {
								var result = JSON.parse(xhr.responseText);
								$("#provstatic").show();
								KLUSet = result["基隆市"]; //基隆市
								TPESet = result["台北市"]; //台北市
								TPHSet = result["新北市"]; //新北市
								TYCSet = result["桃園市"]; //桃園市
								HSCSet = result["新竹市"]; //新竹市
								HSHSet = result["新竹縣"]; //新竹縣
								ILNSet = result["宜蘭縣"]; //宜蘭縣
								MALSet = result["苗栗縣"]; //苗栗縣
								TXGSet = result["台中市"]; //台中市
								CWHSet = result["彰化縣"]; //彰化縣
								NTOSet = result["南投縣"]; //南投縣
								YLHSet = result["雲林縣"]; //雲林縣
								CYISet = result["嘉義市"]; //嘉義市
								CHYSet = result["嘉義縣"]; //嘉義縣
								TNNSet = result["台南市"]; //台南市
								KHHSet = result["高雄市"]; //高雄市
								IUHSet = result["屏東縣"]; //屏東縣
								TTTSet = result["台東縣"]; //台東縣
								HWASet = result["花蓮縣"]; //花蓮縣
								PEHSet = result["澎湖縣"]; //澎湖縣
								KMNSet = result["金門市"]; //金門市
								LNNSet = result["連江縣"]; //連江縣

								console.log("TXGSet = " + TXGSet);
								console.log("TPESet = " + TPESet);
								console.log("TPHSet = " + TPHSet);
								console.log("KHHSet = " + KHHSet);
								myChart(KLUSet, TPESet, TPHSet, TYCSet, HSCSet,
										HSHSet, ILNSet, MALSet, TXGSet, CWHSet,
										NTOSet, YLHSet, CYISet, CHYSet, TNNSet,
										KHHSet, IUHSet, TTTSet, HWASet, PEHSet,
										KMNSet, LNNSet);
							}
						}

						function myChart(KLU, TPE, TPH, TYC, HSC, HSH, ILN,
								MAL, TXG, CWH, NTO, YLH, CYI, CHY, TNN, KHH,
								IUH, TTT, HWA, PEH, KMN, LNN) {
							var dom = document.getElementById("provstatic");
							var myChart = echarts.init(dom);
							var app = {};
							option = null;
							option = {
								title : {
									text : '各縣市活動總數比較',
									subtext : '數據來自註冊會員資料'
								},
								tooltip : {
									trigger : 'axis',
									axisPointer : {
										type : 'shadow'
									}
								},
								legend : {
									data : [ '最新' ]
								},
								grid : {
									left : '3%',
									right : '4%',
									bottom : '3%',
									containLabel : true
								},
								xAxis : {
									type : 'value',
									boundaryGap : [ 0, 0.01 ]
								},
								yAxis : {
									type : 'category',
									data : [ '基隆市', '台北市', '新北市', '桃園縣', '新竹市',
											'新竹縣', '宜蘭縣', '苗栗縣', '台中市', '彰化縣',
											'南投縣', '雲林縣', '嘉義市', '嘉義縣', '台南市',
											'高雄市', '屏東縣', '台東縣', '花蓮縣', '澎湖縣',
											'金門縣', '連江縣' ]
								},
								series : [ {
									name : '最新',
									type : 'bar',
									data : [ KLU, TPE, TPH, TYC, HSC, HSH, ILN,
											MAL, TXG, CWH, NTO, YLH, CYI, CHY,
											TNN, KHH, IUH, TTT, HWA, PEH, KMN,
											LNN ]
								} ]
							};
							;
							if (option && typeof option === "object") {
								myChart.setOption(option, true);
							}
						}
					});
		</script>


		<!-- 		星座 -->
		<script>
// 			$("#starstatic").hide();
			var Aries = 0; //"白羊座
			var Taurus = 0; //金牛座
			var Gemini = 0; //雙子座
			var Cancer = 0; //巨蟹座
			var Leo = 0; //獅子座
			var Virgo = 0; //處女座
			var Libra = 0; //天秤座
			var Scorpio = 0; //天蠍座
			var Sagittarius = 0; //射手座
			var Capricorn = 0; //魔羯座
			var Aquarius = 0; //水瓶座
			var Pisces = 0; //雙魚座"

			// 		document.getElementById("starSign").onclick = function() { //事件觸發
			$(".starSign").click(
					function() {
						$("#provstatic").hide(); //可隱藏
						$("#locBarChart").hide();//可隱藏
						$("#genderPie").hide();
						$(".newajaxlist").hide();
						$(".oldajaxlist").hide();
						var xhr = new XMLHttpRequest();
						xhr.open("GET", "<c:url value='/ajax_starSign' />",
								true); //抓到CONTROLLER路徑
						xhr.send();
						var message = "";
						xhr.onreadystatechange = function() {
							if (xhr.readyState == 4 && xhr.status == 200) {
								var result = JSON.parse(xhr.responseText);
								$("#starstatic").show();
								Aries = result["白羊座"];
								Taurus = result["金牛座"];
								Gemini = result["雙子座"];
								Cancer = result["巨蟹座"];
								Leo = result["獅子座"];
								Virgo = result["處女座"];
								Libra = result["天秤座"];
								Scorpio = result["天蠍座"];
								Sagittarius = result["射手座"];
								Capricorn = result["摩羯座"];
								Aquarius = result["水瓶座"];
								Pisces = result["雙魚座"];

								console.log("Pisces = " + Pisces);
								console.log("Cancer = " + Cancer);
								myChart(Aries, Taurus, Gemini, Cancer, Leo,
										Virgo, Libra, Scorpio, Sagittarius,
										Capricorn, Aquarius, Pisces);
							}
						}

						function myChart(Aries, Taurus, Gemini, Cancer, Leo,
								Virgo, Libra, Scorpio, Sagittarius, Capricorn,
								Aquarius, Pisces) {
							var dom = document.getElementById("starstatic");
							var myChart = echarts.init(dom);
							var app = {};
							option = null;
							option = {
								title : {
									text : '註冊人口星座數分析',
									subtext : '數據來自註冊會員資料'
								},
								tooltip : {
									trigger : 'axis',
									axisPointer : {
										type : 'shadow'
									}
								},
								legend : {
									data : [ '最新' ]
								},
								grid : {
									left : '3%',
									right : '4%',
									bottom : '3%',
									containLabel : true
								},
								xAxis : {
									type : 'value',
									boundaryGap : [ 0, 0.01 ]
								},
								yAxis : {
									type : 'category',
									data : [ '白羊座', '金牛座', '雙子座', '巨蟹座', '獅子座',
											'處女座', '天秤座', '天蠍座', '射手座', '摩羯座',
											'水瓶座', '雙魚座' ]
								},
								series : [ {
									name : '最新',
									type : 'bar',
									data : [ Aries, Taurus, Gemini, Cancer,
											Leo, Virgo, Libra, Scorpio,
											Sagittarius, Capricorn, Aquarius,
											Pisces ]
								} ]
							};
							;
							if (option && typeof option === "object") {
								myChart.setOption(option, true);
							}
						}
					})
		</script>




		<!-- 	end<========================================縣市比較========================================================> -->

		<script>
			$(document).ready(function() {
				$(".showhide").click(function() {
					$(".showhide").hide(1000);
				});
			});
		</script>



		<!-- 		活動部分 -->
		<script>
			$(".allactives").click(function() { //click event
				$("#provstatic").hide(); //可隱藏
				$("#locBarChart").hide();//可隱藏
				$("#genderPie").hide();
				$("#starstatic").hide();
				$(".oldajaxlist").hide();
				$(".newajaxlist").show();

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
			});
			
			
			<!-- 		權限管理 -->
			$(".rights").click(function() { //click event
				$("#provstatic").hide(); //可隱藏
				$("#locBarChart").hide();//可隱藏
				$("#genderPie").hide();
				$("#starstatic").hide();
				$(".oldajaxlist").hide();
				$(".newajaxlist").show();

				$.ajax({
					url : "ajax_rights",
					type : "GET",
					dataType : "html", //server送回
					contentType : 'application/json; charset=utf-8',
					data : {}, //data空的代表沒任何參數
					success : function(data) { //成功的話
						$(".newajaxlist").empty();
						$(".newajaxlist").append(data); //透過導向的URL到ajax方法 div class裝東西
					}
				})
			});
			
			
			
			// 			<!-- ========日誌========= -->
			$(".log").click(function() { //click event
				$("#provstatic").hide(); //可隱藏
				$("#locBarChart").hide();//可隱藏
				$("#genderPie").hide();
				$("#starstatic").hide();
				$(".oldajaxlist").hide();
				
				$(".newajaxlist").show();
				$.ajax({
					url : "ajax_selectSystemLog",
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
		<!-- 		查詢成員-->



		<script>
			$(".allMembers").unbind('click').bind('click', function() { //click event
				$("#provstatic").hide(); //可隱藏
				$("#locBarChart").hide();//可隱藏
				$("#genderPie").hide();
				$("#starstatic").hide();
				$(".oldajaxlist").show();
				$(".newajaxlist").show();
				$.ajax({
					url : "ajax_selectAllMembers",
					type : "GET",
					dataType : "html", //server送回
					contentType : 'application/json; charset=utf-8',
					data : {}, //data空的代表沒任何參數
					success : function(data) { //成功的話
						$(".oldajaxlist").empty();
						$(".oldajaxlist").append(data); //透過導向的URL到ajax方法 div class裝東西
					}
				})
				$.ajax({
					url : "ajax_selectAllRoles",
					type : "GET",
					dataType : "html", //server送回
					contentType : 'application/json; charset=utf-8',
					data1 : {}, //data空的代表沒任何參數
					success : function(data1) { //成功的話
						$(".newajaxlist").empty();
						$(".newajaxlist").append(data1); //透過導向的URL到ajax方法 div class裝東西
					}
				})
			})
			$(".oldajaxlist").show();
			$(".newajaxlist").show();
		</script>
</body>

</html>