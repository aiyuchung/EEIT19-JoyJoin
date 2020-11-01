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
<title>Brycesunrise by TEMPLATED</title>
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
#thiscap {
	padding-top: .75rem;
	padding-bottom: .75rem;
	color: white;
	text-align: center;
	caption-side: top;
}

.dropdown-item {
	display: block;
	float: left;
	margin: 0 3px 0 0;
	padding: 12px 15px 10px 15px;
	border: none;
	text-decoration: none;
	text-transform: uppercase;
	font-family: Arial, Helvetica, sans-serif;
	font-size: 11px;
	color: #DDBB04;
}


.dropdown-menu {
    position: absolute;
    top: 100%;
    left: 0;
    z-index: 1000;
    display: none;
    float: left;
    min-width: 10rem;
    padding: .5rem 0;
    margin: .125rem 0 0;
    font-size: 1rem;
    color: #212529;
    text-align: left;
    list-style: none;
    background-color: #fff;
    background-clip: padding-box;
    border: 1px solid rgba(0,0,0,.15);
    border-radius: .25rem;
}

#menu ul {
    margin: 0;
    padding: 0;
    list-style: none;

}

#menu> .dropdown-checkbox:hover {
	margin: 0 3px 0 0;
	background: #191E1A;
	border-bottom: 3px solid #DDBB04;
	color: #FFFFFF;
}

.panel {
  padding: 0 18px;
  background-color: dark-gray;
  display: none;
  overflow: hidden;
}
.dropdown-item.active, .dropdown-item:active {
 
    text-decoration: none;

}
.dropdown-item:focus, .dropdown-item:hover {
    color: #16181b;
    text-decoration: none;
    background-color: #f8f9fa;
}
</style>

</head>
<body>
	<!-- start header -->
	<div id="header">
		<div id="logo">
			<h1>
				<a href="#">Bryce <span>Sunrise</span>
				</a>
			</h1>
			<p>Designed By TEMPLATED</p>
		</div>

		<!--   header   -->
		<div id="menu-bg">
			<div id="menu">
				<ul id="main">
					<li class="current_page_item"><a href="#">Homepage</a></li>
					<li><a href="#">Products</a></li>
					<li><a href="#">Services</a></li>
					<li><a href="#">About Us</a></li>
					<li><a href="#">Contact Us</a></li>
<!-- 查詢按鈕  -->
					<li class="nav-item dropdown">
					<a id="navbarCheckboxMenuLink" href="#" class="dropdown-toggle" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false"><buttton>條件篩選</buttton></a>
<!-- 					<a -->
<!-- 						class="nav-link dropdown-toggle" href="#" -->
<!-- 						id="navbarCheckboxMenuLink" role="button" data-toggle="dropdown" -->
<!-- 						aria-haspopup="true" aria-expanded="false"> 條件篩選 </a> -->
						<form>
<!-- 							<div class="dropdown-menu dropdown-checkbox" aria-labelledby="navbarDropdown"> -->
							<div class="dropdown-menu dropdown-checkbox" aria-labelledby="navbarDropdown">
								<div class="dropdown-item ">
									<h6><strong>活動類型</strong></h6>
										<c:forEach var="type" items="${allTypes}">
											<ul class="ulof${type.activityType}">
											<input type="checkbox" name="" id="Bigtype${type.activityType}" value="" class="Bigtype ${type.activityType}" />
											<label for="Bigtype${type.activityType}">${type.activityTypeName}</label>
											<span style="color:blue" class="navTypeList"> (更多分類 ▷)  </span>
											
												<c:forEach var="category" items="${categoryList}">
												<li class="classCheckbox"  style="display: none">
													<c:choose>
														<c:when test="${category.activityTypeBean.activityType == type.activityType}">
															<input class="Smalltype ${type.activityType}" id="Smalltype${category.activityClassNo}"
																type="checkbox" value="${category.activityClass}" name="activityClass">
															<label for="Smalltype${category.activityClassNo}">${category.activityClass}</label>
														</c:when>
													</c:choose>
												</li> 
												</c:forEach>
											</ul>		
										</c:forEach>
									</div> 
								<div class="dropdown-item">
									<h6><strong>區域</strong></h6>
									<input type="checkbox" name="" id="north" value="" /><label for="north">北部</label> 
									<input type="checkbox" name="" id="west" value="" /><label for="west">中部</label> 
									<input type="checkbox" name="" id="south" value="" /><label for="south">南部</label> 
									<input type="checkbox" name="" id="east" value="" /><label for="east">東部</label>
									<input type="checkbox" name="" id="outofisland" value="" /><label for="outofisland">福建省</label>
								</div>
<%-- 								<class="nav-item dropdown"class="dropdown-item">  --%>
								<div class="dropdown-item">
									<h6><strong>費用</strong></h6>
									<input type="checkbox" name="u" id="0" value="" /><label for="0">0元</label> 
									<input type="checkbox" name="u" id="500" value="" /><label for="500">500元以下</label> 
									<input type="checkbox" name="u" id="1000" value="" /><label for="1000">500~1000元</label> 
									<input type="checkbox" name="u" id="2000" value="" /><label for="2000">1000~2000元</label> 
									<input type="checkbox" name="u" id="2000up" value="" /><label for="2000up">2000元以上</label>
								</div>
								<div class="dropdown-item">
									<h6><strong>人數上限</strong></h6>
									<input type="checkbox" name="u" id="3" value="" /><label for="3">3人以下</label> 
									<input type="checkbox" name="u" id="10" value="" /><label for="10">3~10人</label> 
									<input type="checkbox" name="u" id="20" value="" /><label for="20">10~20人</label>
									<input type="checkbox" name="u" id="any" value="" /><label for="any">不限人數</label>
								</div>
								
								<div>
									<input type="submit" value="查詢" />
								</div>
							</div>
						</form></li>
<!-- 排序按鈕  -->
					<li class="nav-item dropdown"><a
						class="nav-link dropdown-toggle" href="#"
						id="navbarDropdownMenuLink" role="button" data-toggle="dropdown"
						aria-haspopup="true" aria-expanded="false"> 活動排序 </a>
						<div class="dropdown-menu" id="dropdown-menu"
							aria-labelledby="navbarDropdown">
							<a class="dropdown-item" id="startFromLatest" href="javascript:;">活動日期↑ (近到遠)</a> 
							<a class="dropdown-item" id="startFromEarlest" href="javascript:;">活動日期↓ (遠到近)</a>
							<a class="dropdown-item" id="endFromLatest" href="javascript:;">截止日期↑ (近到遠)</a>
							<a class="dropdown-item" id="endFromEarlest" href="javascript:;">截止日期↓ (遠到近)</a>
							<a class="dropdown-item" id="placeFromNorth" href="javascript:;">活動地點 (由北至南)</a>
							<a class="dropdown-item" id="placeFromSouth" href="javascript:;">活動地點 (由南至北)</a> 
							<a class="dropdown-item" id="peopleFromFew" href="javascript:;">參加人數限制 (少數優先)</a> 
							<a class="dropdown-item" id="peopleFromMany" href="javascript:;">參加人數限制(多數優先)</a>
						</div></li>

				</ul>
			</div>
		</div>
	</div>
	<!-- end header -->


	<div id="wrapper">
		<!-- start page -->
		<!-- soide bar  -->
		<div id="page">

			<div id="sidebar2" class="sidebar">
				<ul>
					<li>
						<form id="searchform" method="get" action="#">
							<div>
								<input type="text" name="s" id="s" size="15" value="" /> <br />
							</div>
						</form>
					</li>
<!-- tags未寫 -->					
					<li>
						<h2>Tags</h2>
						<p>
							<a href="#">dolor</a> <a href="#">ipsum</a> <a href="#">lorem</a>
							<a href="#">sit amet</a> <a href="#">dolor</a> <a href="#">ipsum</a>
							<a href="#">lorem</a> <a href="#">sit amet, integer nisl
								risus, sagittis convallis, rutrum id, elementum congue</a>
						</p>
					</li>
<!-- 日曆 -->
					<li>
						<h2>Calendar</h2>
						<div id="calendar_wrap">
							<table summary="Calendar">
								<caption id="thiscap">
									<jsp:useBean id="now" class="java.util.Date" />
									<fmt:formatDate var="year" value="${now}" pattern="yyyy" />
									<fmt:formatDate var="mon" value="${now}" pattern="M" />
									${year}&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;${mon}月
								</caption>
								<thead>
									<tr>
										<th abbr="Sunday" scope="col" title="Sunday">日</th>
										<th abbr="Monday" scope="col" title="Monday">一</th>
										<th abbr="Tuesday" scope="col" title="Tuesday">二</th>
										<th abbr="Wednesday" scope="col" title="Wednesday">三</th>
										<th abbr="Thursday" scope="col" title="Thursday">四</th>
										<th abbr="Friday" scope="col" title="Friday">五</th>
										<th abbr="Saturday" scope="col" title="Saturday">六</th>
									</tr>
								</thead>

								<tbody id="calBody">
									<!--求星期幾 -->
									<fmt:formatDate var="year" value="${day}" pattern="E" />
									<!--求本月份第幾個星期幾-->
									<fmt:formatDate var="year" value="${day}" pattern="FE" />
									<tr id="w1"><td></td><td></td><td></td><td></td><td></td><td></td><td></td>
									</tr>
									<tr id="w2"><td></td><td></td><td></td><td></td><td></td><td></td><td></td>
									</tr>
									<tr><td></td><td></td><td></td><td></td><td></td><td></td><td></td>
									</tr>
									<tr><td></td><td></td><td></td><td></td><td></td><td></td><td></td>
									</tr>
									<tr><td></td><td></td><td></td><td></td><td></td><td></td><td></td>
									</tr>
									</tr >
									<tr><td id="w61"></td><td id="w62"></td><td></td><td></td><td></td><td></td><td></td>
									</tr>
								</tbody>
								<tfoot>
									<tr>
										<td style="text-align: left" colspan="3" ><a id="prev" href="Javascript:;" title="View previous month" onclick="showPrev()">&laquo;${mon-1}月</a></td>
										<td class="pad">&nbsp;</td>
										<td style="text-align: right" colspan="3"><a  id="next" href="Javascript:;" title="View next month" onclick="showNext()">${mon+1}月 &raquo;</a></td>
									</tr>
								</tfoot>
							</table>
						</div>
					</li>
					<li>
						<h2>活動分類</h2>
<!-- 活動分類 (大類 & 小類checkbox) -->
						<ul id="categories">
							<c:forEach var="type" items="${allTypes}">
								<li id="${type.activityType}"><a href="javascript:;"
									class="TypeList">${type.activityTypeName}</a> 
									<c:forEach var="category" items="${categoryList}">
										<div class="classCheckbox panel" style="display: none">
											<c:choose>
												<c:when
													test="${category.activityTypeBean.activityType == type.activityType}">
													<input class="selectClass ${type.activityType}"
														type="checkbox" value="${category.activityClass}"
														name="activityClass">${category.activityClass}</p>
												</c:when>
											</c:choose>
										</div>
									</c:forEach></li>
							</c:forEach>
						</ul>
					</li>
<!-- 近期活動(最近四個月)  -->					
					<li>
						<h2>近期活動</h2>
						<ul>
							<li><a href="#searchform" class="recentOne">${recentOnes.thismon}月 (${recentOnes.thissum})</a></li>
							<li><a href="#searchform" class="recentOne">${recentOnes.nextmon}月 (${recentOnes.nextsum})</a></li>
							<li><a href="#searchform" class="recentOne">${recentOnes.next2mon}月 (${recentOnes.next2sum})</a></li>
							<li><a href="#searchform" class="recentOne">${recentOnes.next3mon}月 (${recentOnes.next3sum})</a></li>
						</ul>
					</li>
				</ul>
			</div>

			<!-- start content -->
			<div id="content">
				<div style="padding-bottom: 20px;">
					<img src="images/img02.jpg" alt="" />
				</div>
				<div class="post newajaxlist"></div>
<!-- 活動列表 (活動名稱v/活動日期v/截止日期/活動類別/最高人數/發起人v/發起日期v) -->
				<div id="oldajaxlist">
					<c:forEach var="all" items="${activities}">
						<div class="post">
							<h2 class="title">
								<strong>${all.activityDate} </strong> (${all.prov})
							</h2>
							<h1 class="title">
								<a href="#">${all.name}</a>
							</h1>
							<p class="byline">
								<small><a href="#發起人的超連結" rel="nofollow">${all.customerBean.nickname}</a>於
									${all.createdDate} 發起</small>
							</p>
							<div class="entry">
								<p>
									本 <strong>${all.activityTypeName}</strong>
									活動將於${all.finalDate}截止
								</p>
								<p>只要 ${all.minLimit}人即可成公開團! 本活動最高上限人數: ${all.maxLimit}</p>
								<p class="links">
									<a href="#" class="more">(看詳細內容)</a> &nbsp;&nbsp;&nbsp;
								</p>
							</div>
						</div>
					</c:forEach>
				</div>
			</div>
			<!-- end content -->
			<!-- start sidebars -->
			<div id="sidebar1" class="sidebar">
				<ul>
<!-- 最後倒數(截止日期<3天)  -->					
					<li>
						<h2>最後倒數</h2>
						<ul>
							<c:forEach var="finalOnes" items="${finalOnes}">
								<c:set var="days" scope="session" value="${finalOnes.leftDays}" />
								<c:choose>
									<c:when test="${days == 0}">
										<li><a href="#"><strong>(今天結單!)</strong>${finalOnes.name}</a></li>
									</c:when>
									<c:otherwise>
										<li><a href="#"><strong>(只剩${days}天)</strong>${finalOnes.name}</a></li>
									</c:otherwise>
								</c:choose>
							</c:forEach>
						</ul>
					</li>
<!-- 最新發起(最新建立)  -->	
					<li>
						<h2>最新發起</h2> <c:forEach var="latest" items="${latestOnes}">
							<ul>
								<li><a href="#">${latest.name}</a> (${latest.createdDate})</li>
							</ul>
						</c:forEach>
					</li>
<!-- 其他 (未寫)  -->						
					<li>
						<h2>Recent Comments</h2>
						<ul>
							<li><a href="http://templated.co" rel="nofollow">TEMPLATED</a>
								on <a href="#">Aliquam libero</a></li>
							<li><a href="http://templated.co" rel="nofollow">TEMPLATED</a>
								on <a href="#">Consectetuer adipiscing elit</a></li>
							<li><a href="http://templated.co" rel="nofollow">TEMPLATED</a>
								on <a href="#">Metus aliquam pellentesque</a></li>
							<li><a href="http://templated.co" rel="nofollow">TEMPLATED</a>
								on <a href="#">Suspendisse iaculis mauris</a></li>
							<li><a href="http://templated.co" rel="nofollow">TEMPLATED</a>
								on <a href="#">Urnanet non molestie semper</a></li>
							<li><a href="http://templated.co" rel="nofollow">TEMPLATED</a>
								on <a href="#">Proin gravida orci porttitor</a></li>
						</ul>
					</li>


				</ul>
			</div>

			<!-- end sidebars -->
			<div style="clear: both;">&nbsp;</div>
		</div>
		<!-- end page -->
	</div>
	<div id="footer">
		<div id="footer-content">
			<p>
				&copy;2007 All Rights Reserved. &nbsp;&nbsp; Design by <a
					href="http://templated.co" rel="nofollow">TEMPLATED</a>.
			</p>
		</div>
	</div>

<script>
var 
today,y,m,d,firstday

window.onload= function (){
	today = new Date(),                 //獲取當前日期
	y = today.getFullYear(),              //獲取日期中的年份
	m = today.getMonth(),                //獲取日期中的月份(需要注意的是：月份是從0開始計算，獲取的值比正常月份的值少1)
	d = today.getDate(),                //獲取日期中的日(方便在建立日期表格時高亮顯示當天)
	firstday = new Date(y, m, 1)            //獲取當月的第一天
	 showCalendar(y,m,firstday);
}

function showPrev(){
	m = m-1; //上個月是10月 m就=9
	if (m < 0){
		m=11
		y -= 1
	}
	console.log("m=" +m);

	var string = y + "-" + (m+1) + "-1";
	console.log("string=" +string);
	firstday = new Date(string);
	console.log(firstday);
	document.getElementById("w61").innerText="";
	document.getElementById("w62").innerText="";
	
	showCalendar(y,m,firstday);
	
	document.getElementById("prev").innerHTML="&laquo;"+ (m==0?12:m) +"月";
	document.getElementById("thiscap").innerHTML=y+"&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;" + (m+1)+"月"
} 

function showNext(){
	m = m+1; //上個月是10月 m就=9
	if (m > 11){
		m=0
		y += 1
	}
	console.log("m=" +m);

	var string = y + "-" + (m+1) + "-1";
	console.log("string=" +string);
	firstday = new Date(string);
	console.log(firstday);
	document.getElementById("w61").innerText="";
	document.getElementById("w62").innerText="";
	
	showCalendar(y,m,firstday);
	
	document.getElementById("next").innerHTML=((m+2)>12?1:m+2)+"月 &raquo;";
	document.getElementById("thiscap").innerHTML=y+"&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;" + (m+1)+"月"
} 
		 //判斷當前年份是否是閏年(閏年2月份有29天，平年2月份只有28天)
		  function isLeap(year) {
		  return year % 4 == 0 ? (year % 100 != 0 ? 1 : (year % 400 == 0 ? 1 : 0)) : 0;
		  }
		 
		  function showCalendar(y,m,firstday){
		  dayOfWeek = firstday.getDay(),           //判斷第一天是星期幾(返回[0-6]中的一個，0代表星期天，1代表星期一，以此類推)
		  console.log(dayOfWeek);
		  days_per_month = new Array(31, 28 + isLeap(y), 31, 30, 31, 30, 31, 31, 30, 31, 30, 31),         //建立月份陣列
		  str_nums = Math.ceil((dayOfWeek + days_per_month[m]) / 7);                        //確定日期表格所需的行數

				var calendarbody = document.getElementById("calBody");
				for (var i = 0; i < str_nums; i ++) {         //二維陣列建立日期表格
				  
					  for (var k = 0; k < 7; k++) {
					  var idx = 7 * i + k;                //為每個表格建立索引,從0開始
					  var date = idx - dayOfWeek + 1;          //將當月的1號與星期進行匹配
					  (date <= 0 || date > days_per_month[m]) ? date = ' ': date = idx - dayOfWeek + 1;  //索引小於等於0或者大於月份最大值就用空表格代替
					  calendarbody.rows[i].cells[k].innerText=date;
					 <%--  date == d ? 
							  newTr.appendChild(document.createElement('<td class="today">'+ date +'</td>')) : 
							  newTr.appendChild(document.createElement('<td>'+ date +'</td>'));  //高亮顯示當天
					  --%>
					  }
		 		}
		  }

</script>
	<script>
	$("#navbarDropdownMenuLink").click(function() {
		 $("#dropdown-menu").toggle();
		 $(".dropdown-checkbox").hide();
	})
	
	$("#navbarCheckboxMenuLink").click(function() {
		 $(".dropdown-checkbox").toggle();
		 $("#dropdown-menu").hide();
	})
	$(".dropdown-checkbox").click(function() {
		 $(".dropdown-checkbox").show();
	})
	
	$(".TypeList").click(function(){ //點選大類別
		$(this).parent().find("div").toggle();
	})
	
	$(".navTypeList").click(function(){ //導覽列點選大類別旁邊的小勾勾
		$(this).siblings('li').toggle();
	})
	
	$(".selectClass").click(function(){
		var categories = new Array();
		$('input[name="activityClass"]:checked').each(function(i, item){
			categories.push($(item).val());
			
		})
		
		$.ajax({
				  url:"ajax_checkedClass",
				  type: "POST",
				  dataType: "html", //server送回
				  contentType: 'application/json; charset=utf-8',
				  data:  
					   JSON.stringify(categories),
		          
				  cache: false,
				  beforeSend:function(){
					  console.log("beforesend: data ==>"+categories);
				  },
				  success:function(data){
					  $(".post").empty();
					  $(".newajaxlist").append(data);				  
				  },
				  error:function(){
					 	$(".newajaxlist").empty();
			 			$(".newajaxlist").append(
			 					'<c:forEach var="all" items="${activities}"><div class="post oldajaxlist"><h2 class="title"><strong>${all.activityDate} </strong> (${all.prov})</h2>'
			 				        +'<h1 class="title"><a href="#">${all.name}</a></h1><p class="byline"><small><a href="#發起人的超連結" rel="nofollow">${all.customerBean.nickname}</a>於 ${all.createdDate} 發起</small></p>'
			 				        +'<div class="entry"><p>本 <strong>${all.activityTypeName}</strong> 活動將於${all.finalDate}截止</p>'
			 				        +'<p>只要 ${all.minLimit}人即可成公開團!     本活動最高上限人數:  ${all.maxLimit}</p>'
			 				        +'<p class="links"><a href="#" class="more">(看詳細內容)</a> &nbsp;&nbsp;&nbsp;</p></div></div></c:forEach>'
				 		);
				  }
		})
	})
	//排序ajax
	$("#startFromLatest").click(function(){
		$.ajax({
			  url:"ajax_ordered1",
			  type: "GET",
			  dataType: "html", //server送回
			  contentType: 'application/json; charset=utf-8',
			  data: {}, 
			  success:function(data){
				  $(".newajaxlist").empty();
				  $(".newajaxlist").append(data);
				}
		})
	})
	$("#startFromEarlest").click(function(){
		$.ajax({
			  url:"ajax_ordered2",
			  type: "GET",
			  dataType: "html", //server送回
			  contentType: 'application/json; charset=utf-8',
			  data: {}, 
			  success:function(data){
				  $(".newajaxlist").empty();
				  $(".newajaxlist").append(data);
				}
		})
	})
	$("#endFromLatest").click(function(){
		$.ajax({
			  url:"ajax_ordered3",
			  type: "GET",
			  dataType: "html", //server送回
			  contentType: 'application/json; charset=utf-8',
			  data: {}, 
			  success:function(data){
				  $(".newajaxlist").empty();
				  $(".newajaxlist").append(data);
				}
		})
	})
	$("#endFromEarlest").click(function(){
		$.ajax({
			  url:"ajax_ordered4",
			  type: "GET",
			  dataType: "html", //server送回
			  contentType: 'application/json; charset=utf-8',
			  data: {}, 
			  success:function(data){
				  $(".newajaxlist").empty();
				  $(".newajaxlist").append(data);
				}
		})
	})
	$("#peopleFromFew").click(function(){
		$.ajax({
			  url:"ajax_ordered5",
			  type: "GET",
			  dataType: "html", //server送回
			  contentType: 'application/json; charset=utf-8',
			  data: {}, 
			  success:function(data){
				  $(".newajaxlist").empty();
				  $(".newajaxlist").append(data);
				}
		})
	})
	$("#peopleFromMany").click(function(){
		$.ajax({
			  url:"ajax_ordered6",
			  type: "GET",
			  dataType: "html", //server送回
			  contentType: 'application/json; charset=utf-8',
			  data: {}, 
			  success:function(data){
				  $(".newajaxlist").empty();
				  $(".newajaxlist").append(data);
				}
		})
	})
	$("#placeFromNorth").click(function(){
		$.ajax({
			  url:"ajax_ordered7",
			  type: "GET",
			  dataType: "html", //server送回
			  contentType: 'application/json; charset=utf-8',
			  data: {}, 
			  success:function(data){
				  $(".newajaxlist").empty();
				  $(".newajaxlist").append(data);
				}
		})
	})
	$("#placeFromSouth").click(function(){
		$.ajax({
			  url:"ajax_ordered8",
			  type: "GET",
			  dataType: "html", //server送回
			  contentType: 'application/json; charset=utf-8',
			  data: {}, 
			  success:function(data){
				  $(".newajaxlist").empty();
				  $(".newajaxlist").append(data);
				}
		})
	})
	
	$(".recentOne").click(function(){
		var thismon = $(this).text().split("月");
		$.ajax({
			  url:"ajax_recentOnes",
			  type: "GET",
			  dataType: "html", //server送回
			  contentType: 'application/json; charset=utf-8',
			  data: {thismon: thismon[0]},
			  success:function(data){
				  $(".post").empty();
				  $(".newajaxlist").empty();
				  $(".newajaxlist").append(data);
				}
		})
	})
	//nav的大小類選擇
	$(".Bigtype").click(function(){
		if ($(".Bigtype").is(":checked")){
			$(".Smalltype").prop("checked",true);
		}else{
			$(".Smalltype").prop("checked",false);
		}
	})
	
	$(".Smalltype").click(function(){
		var judge = false;
		$(this).parents("ul").find(".Smalltype").each(function(){
			if ($(this).is(":checked")){
				judge = true;
			}else{
				judge = false;
				return false;
			}
		})
		if (judge){
			$(ulclass).find("input").prop("checked",true);
		}
		
	})

	
</script>
</body>
</html>
