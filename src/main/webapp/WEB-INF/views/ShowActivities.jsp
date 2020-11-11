<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ page import="java.util.*,com.web.activity.model.ActivityBean"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<!DOCTYPE html>
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
#thiscap {
	padding-top: .75rem;
	padding-bottom: .75rem;
	color: white;
	text-align: center;
	caption-side: top;
}

#menu>ul>li>a {
	display: block;
	float: left;
	margin: 0 0 0 70px;
	padding: 12px 15px 10px 15px;
	border: none;
	text-decoration: none;
	text-transform: uppercase;
	font-family: Arial, Helvetica, sans-serif;
	font-size: 11px;
	color: #DDBB04;
}

#menu>ul>li>a:hover {
	margin: 0 0 0 70px;
	background: #191E1A;
	border-bottom: 3px solid #DDBB04;
	color: #FFFFFF;
}


#selectAll1>a:hover {
	background: red;
	margin: 0 0 0 70px;
	background: #191E1A;
	border-bottom: 3px solid #DDBB04;
	color: #FFFFFF;
}

#selectAll1>a {
	background: none;
	margin: 0 0 0 70px;
	background: #191E1A;
	border-bottom: 3px solid #DDBB04;
	color: #FFFFFF;
}

/* #dropdown-menu { */
/*     position: absolute; */
/*     top: 45px; */
    
/*     left: 0; */
/*     z-index: 1000; */
/*     display: none; */
/*     float: left; */
/*     min-width: 10rem; */
/*     padding: .5rem 0; */
/*     margin: .125rem 0 0; */
/*     font-size: 1rem; */
/*     color: #212529; */
/*     text-align: left; */
/*     list-style: none; */
/*     background-color: #fff; */
/*     background-clip: padding-box; */
/*     border: 1px solid rgba(0,0,0,.15); */
/*     border-radius: .25rem; */
/* } */

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
    top: 44px;
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
  padding: 0.3px 15px 0px 15px;
  background-color: dark-gray;
  display: none;
  overflow: hidden;
  
  vertical-align:middle;
  line-height: 1.8rem;
}

.panel>label{
	margin-bottom: 0rem;
}
.dropdown-item.active, .dropdown-item:active {
 
    text-decoration: none;

}
.dropdown-item:focus, .dropdown-item:hover {
    color: #16181b;
    text-decoration: none;
    background-color: #f8f9fa;
}
#searchform {
	margin: 0;
	padding: 20px 0;
}
.today{
	border: solid 2px lightblue;
}



		
.btn-primary:hover, .btn-primary:focus {
	background-color: #779A81;
</style>

</head>
<body>
<input type="text" id="userAccount" value="${account}" hidden>
</button>
<!---------- Header ------------>		
		<div class="headerPage">
			<jsp:include page="header/header_guest.jsp"/>
		</div>

		<div id="menu-bg">
			<div id="menu">
				<ul id="main">
					<li class="current_page_item" id="selectAll1"><a href="#"  style="font-size:15px">活動總覽</a></li>
					<li class="nav-item dropdown"><a href="<c:url value='/newActivities' />" class="more" style="font-size:15px"> 新增活動</a></li>
					
<!-- 查詢按鈕  -->
					<li class="nav-item dropdown">
					<a id="navbarCheckboxMenuLink" href="#" class="dropdown-toggle" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false"  style="font-size:15px">
					<buttton>條件篩選</buttton></a>
<!-- 					<a -->
<!-- 						class="nav-link dropdown-toggle" href="#" -->
<!-- 						id="navbarCheckboxMenuLink" role="button" data-toggle="dropdown" -->
<!-- 						aria-haspopup="true" aria-expanded="false"> 條件篩選 </a> -->
						<form:form method="POST" action="form" modelAttribute="form" id="form">
<!-- 							<div class="dropdown-menu dropdown-checkbox" aria-labelledby="navbarDropdown"> -->
							<div class="dropdown-menu dropdown-checkbox" aria-labelledby="navbarDropdown">
<!-- 								<div> -->
<!-- 									<button type="button" class="close" aria-label="Close"> -->
<!-- 									<span aria-hidden="true">&times;</span> -->
<!-- 									</button> -->
<!-- 									</div> -->
								<div class="dropdown-item  dropdown-foreach" id="check1">
									<h6><strong>活動類型</strong><span class="reminder" style='color:red; font-size: 10px'></span></h6>
										<c:forEach var="type" items="${allTypes}">
											<ul class="ulof${type.activityType}" id="ulid${type.activityType}">
											<form:checkbox path="Bigtype" id="Bigtype${type.activityType}" value="${type.activityType}" class="Bigtype ${type.activityType}" />
											<form:label path="Bigtype" for="Bigtype${type.activityType}">${type.activityTypeName}</form:label>
											<span style="color:blue" class="navTypeList"> (更多分類 ▷)  </span>
											
												<c:forEach var="category" items="${categoryList}">
												<li class="classCheckbox"  style="display: none">
													<c:choose>
														<c:when test="${category.activityTypeBean.activityType == type.activityType}">
															<form:checkbox path="Smalltype" class="Smalltype ${type.activityType}" id="Smalltype${category.activityClassNo}"
																value="${category.activityClassNo}" />
															<form:label path="Smalltype" for="Smalltype${category.activityClassNo}">${category.activityClass}</form:label>
														</c:when>
													</c:choose>
												</li> 
												</c:forEach>
											</ul>		
										</c:forEach>
									</div> 
								<div class="dropdown-item dropdown-foreach" id="check2">
									<h6><strong>區域</strong><span class="reminder" style='color:red; font-size: 10px'></span></h6>
									<form:checkbox path="location" id="north" value="north" /><form:label path="location" for="north">北部</form:label> 
									<form:checkbox path="location" id="west" value="west" /><form:label path="location" for="west">中部</form:label> 
									<form:checkbox path="location" id="south" value="south" /><form:label path="location" for="south">南部</form:label> 
									<form:checkbox path="location" id="east" value="east" /><form:label path="location" for="east">東部</form:label>
									<form:checkbox path="location" id="outofisland" value="outofisland" /><form:label path="location" for="outofisland">福建省</form:label>
								</div>
								<div class="dropdown-item dropdown-foreach" id="check3">
									<h6><strong>費用</strong><span class="reminder" style='color:red; font-size: 10px'></span></h6>
									<form:checkbox path="price" id="0" value="0" /><form:label path="price" for="0">0元</form:label> 
									<form:checkbox path="price" id="500" value="BETWEEN '1' AND '500'" /><form:label path="price" for="500">500元以下</form:label> 
									<form:checkbox path="price" id="1000" value="BETWEEN '501' AND '1000'" /><form:label path="price" for="1000">500~1000元</form:label> 
									<form:checkbox path="price" id="2000" value="BETWEEN '1001' AND '2000'" /><form:label path="price" for="2000">1000~2000元</form:label> 
									<form:checkbox path="price" id="2000up" value="BETWEEN '2001' AND '99999'" /><form:label path="price" for="2000up">2000元以上</form:label>
								</div>
								<div class="dropdown-item dropdown-foreach" id="check4">
									<h6><strong>人數上限</strong><span class="reminder" style='color:red; font-size: 10px'></span></h6>
									<form:checkbox path="minLimit" id="3" value="BETWEEN '0' AND '3'" /><form:label path="minLimit" for="3">3人以下</form:label> 
									<form:checkbox path="minLimit" id="10" value="BETWEEN '4' AND '10'" /><form:label path="minLimit" for="10">3~10人</form:label> 
									<form:checkbox path="minLimit" id="20" value="BETWEEN '11' AND '20'" /><form:label path="minLimit" for="20">10~20人</form:label>
									<form:checkbox path="minLimit" id="any" value="BETWEEN '21' AND '9999'" /><form:label path="minLimit" for="any">不限人數</form:label>
								</div>
								
								<div align ="center">
									<button type="button" class="btn btn-outline-warning cancelChecked">取消勾選</button>
									<button type="button" class="btn btn-outline-success" id="submitForm">條件查詢</button>
									<button type="button" class="btn btn-outline-primary" id="selectAll">查詢全部</button>
									
								</div>
							</div>
						</form:form></li>
					
<!-- 排序按鈕  -->
					<li class="nav-item dropdown"><a
						class="nav-link dropdown-toggle" href="#"
						id="navbarDropdownMenuLink" role="button" data-toggle="dropdown"
						aria-haspopup="true" aria-expanded="false"  style="font-size:15px"> 活動排序 </a>
						
						<div class="dropdown-menu" id="dropdown-menu"
							aria-labelledby="navbarDropdown">
							<a class="dropdown-item fororder" id="startFromLatest" href="javascript:;">活動日期↑ (近到遠)</a> 
							<a class="dropdown-item fororder" id="startFromEarlest" href="javascript:;">活動日期↓ (遠到近)</a>
							<a class="dropdown-item fororder" id="endFromLatest" href="javascript:;">截止日期↑ (近到遠)</a>
							<a class="dropdown-item fororder" id="endFromEarlest" href="javascript:;">截止日期↓ (遠到近)</a>
							<a class="dropdown-item fororder" id="placeFromNorth" href="javascript:;">活動地點 (由北至南)</a>
							<a class="dropdown-item fororder" id="placeFromSouth" href="javascript:;">活動地點 (由南至北)</a> 
							<a class="dropdown-item fororder" id="peopleFromFew" href="javascript:;">參加人數限制 (少數優先)</a> 
							<a class="dropdown-item fororder" id="peopleFromMany" href="javascript:;">參加人數限制(多數優先)</a>
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
<!-- 關鍵字搜尋   -->					
					<li>
						<form id="searchform" method="get" action="#">
							<h6>&nbsp;&nbsp;關鍵字搜尋</h6>
							<div>
								&nbsp;&nbsp;&nbsp;&nbsp;<input type="text" name="s" id="s" size="20" value="" placeholder="EX: 瑜珈" /> <br />
								<button type="button" class="btn btn-outline-light btn-sm">確認</button>
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
						<h2>日曆</h2>
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
					
<!-- 最後倒數(截止日期<3天)  -->					
					<li>
						<h2>最後倒數</h2>
						<ul>
							<li>
							<input id="finalNum" type="text" value="${finalNum}" hidden />
							<span id="noLessThan3"></span>
							</li>
								<c:forEach var="finalOnes" items="${finalOnes}">
								<c:set var="days" scope="session" value="${finalOnes.leftDays}" />
								<c:choose>
									<c:when test="${days == 0}">
										<li><a href="<c:url value='/oneActivity/${finalOnes.activityNo}' />" class="more"><strong>(今天結單!)</strong>${finalOnes.name}</a></li>
									</c:when>
									<c:otherwise>
										<li><a href="<c:url value='/oneActivity/${finalOnes.activityNo}' />" class="more"><strong>(只剩${days}天)</strong>${finalOnes.name}</a></li>
									</c:otherwise>
								</c:choose>
							</c:forEach>
						</ul>
					</li>
<!-- 最新發起(最新建立)  -->	
					<li>
						<h2>最新發起</h2> <c:forEach var="latest" items="${latestOnes}">
							<ul>
								<li><a href="<c:url value='/oneActivity/${latest.activityNo}' />" class="more">${latest.name}</a> (${latest.createdDate})</li>
							</ul>
						</c:forEach>
					</li>
					<li>
						<h2>活動分類快篩</h2>
<!-- 活動分類 (大類 & 小類checkbox) -->
						<ul id="categories">
							<c:forEach var="type" items="${allTypes}">
								<li id="${type.activityType}">
								
								<a href="javascript:;" class="TypeList"><span class="triIcon">►</span>${type.activityTypeName}</a> 
									<c:forEach var="category" items="${categoryList}">
										<div class="classCheckbox panel" style="display:none">
											<c:choose>
												<c:when
													test="${category.activityTypeBean.activityType == type.activityType}">
													<input class="selectClass ${type.activityType}" id="classId${category.activityClass}"
														type="checkbox" value="${category.activityClass}"
														name="activityClass"><label for="classId${category.activityClass}">${category.activityClass}</label>
												</c:when>
											</c:choose>
										</div>
									</c:forEach></li>
							</c:forEach>
						</ul>
					</li>
<!-- 近期活動(最近四個月)  -->					
					<li>
						<h2>近期活動快篩</h2>
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
<!-- 活動列表圖片 -->
			<div id="content">
				<div style="padding-bottom: 20px; overflow:hidden">
					<img src="images/img02.jpg" alt=""/>
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
								<a href="<c:url value='/oneActivity/${all.activityNo}' />" class="more">${all.name}</a>
							</h1>
							<p class="byline">
								<small><a href="#發起人的超連結" rel="nofollow">${all.memberBean.nickname}</a>於
									${all.createdDate} 發起</small>
							</p>
							<div class="entry">
								<p>
									本 <strong>${all.activityTypeName}</strong>
									活動將於${all.finalDate}截止
								</p>
								<p>只要 ${all.minLimit}人即可成公開團! 本活動最高上限人數: ${all.maxLimit}</p>
								<p class="links">
									<a href="<c:url value='/oneActivity/${all.activityNo}' />" class="more"> (看詳細內容) </a> &nbsp;&nbsp;&nbsp;
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

<!-- 其他 (未寫)  -->						
<!-- 					<li> -->
<!-- 						<h2>Recent Comments</h2> -->
<!-- 						<ul> -->
<!-- 							<li><a href="http://templated.co" rel="nofollow">TEMPLATED</a> -->
<!-- 								on <a href="#">Aliquam libero</a></li> -->
<!-- 							<li><a href="http://templated.co" rel="nofollow">TEMPLATED</a> -->
<!-- 								on <a href="#">Consectetuer adipiscing elit</a></li> -->
<!-- 							<li><a href="http://templated.co" rel="nofollow">TEMPLATED</a> -->
<!-- 								on <a href="#">Metus aliquam pellentesque</a></li> -->
<!-- 							<li><a href="http://templated.co" rel="nofollow">TEMPLATED</a> -->
<!-- 								on <a href="#">Suspendisse iaculis mauris</a></li> -->
<!-- 							<li><a href="http://templated.co" rel="nofollow">TEMPLATED</a> -->
<!-- 								on <a href="#">Urnanet non molestie semper</a></li> -->
<!-- 							<li><a href="http://templated.co" rel="nofollow">TEMPLATED</a> -->
<!-- 								on <a href="#">Proin gravida orci porttitor</a></li> -->
<!-- 						</ul> -->
<!-- 					</li> -->


				</ul>
			</div>

			<!-- end sidebars -->
			<div style="clear: both;">&nbsp;</div>
		</div>

<!-- 請登入的modal  -->	
	<div class="modal fade" id="exampleModal" tabindex="-1" role="dialog" aria-labelledby="exampleModalLabel" aria-hidden="true">
	  <div class="modal-dialog" role="document">
	    <div class="modal-content" style="background-color:#ECEBEB; border:0">
	      <div class="modal-header" style="background-color:#85AD90; border:2px solid #85AD90">
	        <h5 class="modal-title" id="exampleModalLabel" style="color:black;font-size:15px ">未登入提醒</h5>
	      </div>
	      <div class="modal-body" style="color:black; font-size:19px">
	        	您現在正在前往會員才能使用的功能!
	      </div>
	      <div class="modal-footer">
	        <button type="button" class="btn btn-secondary" data-dismiss="modal" >晚點再登入</button>
	        <a type="button" class="btn btn-primary" href="<c:url value='/login' />" style="background-color:#85AD90;border:1px solid #85AD90">現在登入</a>
	      </div>
	    </div>
	  </div>
	</div>
<script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.14.3/umd/popper.min.js" integrity="sha384-ZMP7rVo3mIykV+2+9J3UJ46jBk0WLaUAdn689aCwoqbBJiSnjAK/l8WvCWPIPm49" crossorigin="anonymous"></script>
<script src="https://stackpath.bootstrapcdn.com/bootstrap/4.1.3/js/bootstrap.min.js" integrity="sha384-ChfqqxuZUCnJSK3+MXmPNIyE6ZbWh2IMqE241rYiqJxyMiZ6OW/JmZQ5stwEULTy" crossorigin="anonymous"></script>

<script>
var 
today,y,m,d,firstday

window.onload= function (){
	today = new Date(),                 //獲取當前日期
	y = today.getFullYear(),              //獲取日期中的年份
	m = today.getMonth(),                //獲取日期中的月份(需要注意的是：月份是從0開始計算，獲取的值比正常月份的值少1)
	d = today.getDate(),                //獲取日期中的日(方便在建立日期表格時高亮顯示當天)
	firstday = new Date(y, m, 1)            //獲取當月的第一天
	 showCalendar(y,m,d,firstday);
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
	document.getElementById("w61").innerText="";
	document.getElementById("w62").innerText="";
	
	showCalendar(y,m,d,firstday);
	
	document.getElementById("prev").innerHTML="&laquo;"+ (m==0?12:m) +"月";
	document.getElementById("thiscap").innerHTML=y+"&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;" + (m+1)+"月"
} 

function showNext(){
	m = m+1; //下個月是11月 m就=10
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
	
	showCalendar(y,m,d,firstday);
	
	document.getElementById("next").innerHTML=((m+2)>12?1:m+2)+"月 &raquo;";
	document.getElementById("thiscap").innerHTML=y+"&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;" + (m+1)+"月"
} 
		 //判斷當前年份是否是閏年(閏年2月份有29天，平年2月份只有28天)
		  function isLeap(year) {
		  return year % 4 == 0 ? (year % 100 != 0 ? 1 : (year % 400 == 0 ? 1 : 0)) : 0;
		  }
		 
		  function showCalendar(y,m,d,firstday){
		  dayOfWeek = firstday.getDay(),           //判斷第一天是星期幾(返回[0-6]中的一個，0代表星期天，1代表星期一，以此類推)
		  days_per_month = new Array(31, 28 + isLeap(y), 31, 30, 31, 30, 31, 31, 30, 31, 30, 31),         //建立月份陣列
		  str_nums = Math.ceil((dayOfWeek + days_per_month[m])/ 7);                        //確定日期表格所需的行數

				var calendarbody = document.getElementById("calBody");
				for (var i = 0; i < str_nums; i ++) {         //二維陣列建立日期表格
				  
					  for (var k = 0; k < 7; k++) {
					  var idx = 7 * i + k;                //為每個表格建立索引,從0開始
					  var date = idx - dayOfWeek + 1;          //將當月的1號與星期進行匹配
					  (date <= 0 || date > days_per_month[m]) ? date = ' ': date = idx - dayOfWeek + 1;  //索引小於等於0或者大於月份最大值就用空表格代替
					  calendarbody.rows[i].cells[k].innerText=date;
					  var tdtag = calendarbody.rows[i].cells[k].classList;
					  thismon = (new Date()).getMonth();
					  if (thismon == m ){
						  date == d ? 
								  calendarbody.rows[i].cells[k].classList.add("today"): 
									calendarbody.rows[i].cells[k].classList.remove("today")
								;  //當天以today類別的Border做標示
					  }else{
						  calendarbody.rows[i].cells[k].classList.remove("today");
					  }
					 
					  }
		 		}
		  }

</script>
	<script>
	$(document).ready(function(){
		var finalNum = $("#finalNum").val();
		if(finalNum == 0){
			$("#noLessThan3").text("目前沒有3天內要截止的活動");
		}
	})
	
	$("#selectAll, #selectAll1").click(function(){
		window.location.href = "<c:url value='/activities' />";
	})
	
	
	
	$("#navbarDropdownMenuLink").click(function() { //導覽列的"活動排序"控制下方區塊隱藏或顯示
		 $("#dropdown-menu").toggle();
		 $(".dropdown-checkbox").hide();
	})
	
	$("#navbarCheckboxMenuLink").click(function() { //導覽列的"條件篩選"控制下方區塊隱藏或顯示
		 $(".dropdown-checkbox").toggle();
		 $("#dropdown-menu").hide();
	})
	
	$(".close").click(function() { 
		console.log("close!");
		$(".dropdown-checkbox").hide();
	})
	
	$(".dropdown-checkbox").click(function() { //勾選條件篩選下的方框時持續顯示整個區塊
		 $(".dropdown-checkbox").show();
	})
	$(".fororder").click(function() { //如按"條件篩選"時"活動排序"未隱藏區塊直接隱藏"活動排序"之區塊
		$("#dropdown-menu").toggle();
	})
	
	$(".TypeList").click(function(){ //點選左列大類別
		$(this).parent().find("div").toggle();

		if($(this).parent().find("div").is(":hidden") ){ //三角形icon隨div是否隱藏而改變
			$(this).find(".triIcon").text("►");
		}else{
			$(this).find(".triIcon").text("▼");
		}
		
	})
	
	$(".navTypeList").click(function(){ //導覽列點選大類別旁邊的小勾勾
		$(this).siblings('li').toggle();
	})
	
	$(".cancelChecked").click(function(){ //取消全部選取
		$(".dropdown-foreach").find("input").prop("checked",false);
	})
		
	$(".selectClass").click(function(){ //左列以類別快速篩選
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
			 				        +'<h1 class="title"><a href="#">${all.name}</a></h1><p class="byline"><small><a href="#發起人的超連結" rel="nofollow">${all.memberBean.nickname}</a>於 ${all.createdDate} 發起</small></p>'
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
	
	$(".recentOne").click(function(){ //以近期月份作為快速篩選
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
	
	$(".btn-sm").click(function(){          //關鍵字篩選
		var keywords = $("#s").val();
		console.log(keywords);
		$.ajax({
			  url:"ajax_keyWords",
			  type: "get",
			  dataType: "html",
			  contentType: 'application/json; charset=utf-8',
			  data: {
				  keyword: keywords
				},
// 				  JSON.stringify(keywords),
			  success:function(data){
				  $(".post").empty();
				  $(".newajaxlist").empty();
				  $(".newajaxlist").append(data);
					},
				error:function(){
				 	$(".newajaxlist").empty();
		 			$(".newajaxlist").append(
		 					'<c:forEach var="all" items="${activities}"><div class="post oldajaxlist"><h2 class="title"><strong>${all.activityDate} </strong> (${all.prov})</h2>'
		 				        +'<h1 class="title"><a href="#">${all.name}</a></h1><p class="byline"><small><a href="#發起人的超連結" rel="nofollow">${all.memberBean.nickname}</a>於 ${all.createdDate} 發起</small></p>'
		 				        +'<div class="entry"><p>本 <strong>${all.activityTypeName}</strong> 活動將於${all.finalDate}截止</p>'
		 				        +'<p>只要 ${all.minLimit}人即可成公開團!     本活動最高上限人數:  ${all.maxLimit}</p>'
		 				        +'<p class="links"><a href="#" class="more">(看詳細內容)</a> &nbsp;&nbsp;&nbsp;</p></div></div></c:forEach>'
			 		);
				  }
		})
	})
//條件篩選中的大小類選擇
	$(".Bigtype").click(function(){
		var liClass= "."+$(this).val();
		if ($(this).is(":checked")){  //大類如果打勾
// 			console.log(liClass);
			$(this).parents("ul").find(liClass).prop("checked",true);  //小類全部的checkbox也要打勾
// 			console.log($(this).parents("ul").find(liClass));
// 			console.log("smalltype value=" + $("#ulidart .art").val());
		}else{
			$(this).parents("ul").find(liClass).prop("checked",false); //反之小類全部的checkbox要取消
			console.log($(this).parents("ul").find(liClass));
		}
	})
	
	$(".Smalltype").click(function(){
		var judge = false;
		var ulId = "#"+$(this).parents("ul").attr("id"); //抓直屬ul的id
// 		console.log(ulId);
// 		console.log($(ulId).find(".Smalltype")); //可以抓到所屬ul全部li之checkbox
		$(ulId).find(".Smalltype").each(function(){
			if ($(this).is(":checked")){ 
				judge = true;
			}else{					//如果有一項li沒勾選 則judge=false並跳出迴圈
				judge = false;
				return false;
			}
		})
		if (judge){
			$(ulId).find(".Bigtype").prop("checked",true); //li全部勾選 大類則也要勾
		}else{
			$(ulId).find(".Bigtype").prop("checked",false); //li沒有全選 大類就取消勾選
		}
		
	})
//條件篩選	
	$("#submitForm").click(function(){
		
		var judge1 = false;
		 $("#check1").find(".Smalltype").each(function(){
			 console.log($(this));
			 if ($(this).is(":checked")){ 
				 console.log("checked");
				 judge1 = true;
				 return false;
			 }
		 })

		if (judge1 == false){
			$("#check1").find(".reminder").text("  *至少選擇一個小類別")
		};	
		
		var judge2 = false;
		$("#check2").find("input[type=checkbox]").each(function(){
			 if($("#check2").find("input[type=checkbox]").is(":checked")){
				 judge2 = true;
				 return false;
			 }
		})
		if (judge2 == false){
			$("#check2").find(".reminder").text("  *至少選擇一個區域")
		};
		
		var judge3 = false;	
		$("#check3").find("input[type=checkbox]").each(function(){
			 if($("#check3").find("input[type=checkbox]").is(":checked")){
				 judge3 = true;
				 return false;
			 }
		})
		if (judge3 == false){
			$("#check3").find(".reminder").text("  *至少選擇一個費用區段")
		};
		
		var judge4 = false;	
		$("#check4").find("input[type=checkbox]").each(function(){
			 if($("#check4").find("input[type=checkbox]").is(":checked")){
				 judge4 = true;
				 return false;
			 }
		})	
		if (judge4 == false){
			$("#check4").find(".reminder").text("  *至少選擇一個最高人數限制")
		};
		
		if (judge1 == true && judge2 == true && judge3 == true && judge4 == true){
			$("#form").submit();
		}
	})
	
	$(".more").click(function(){
		var account = $("#userAccount").val();
		console.log("account ="+account);
		if (account == "" || account == null){
			$('#exampleModal').modal('show');
			event.preventDefault();
		}
		
	})

	
	
</script>
</body>
</html>
