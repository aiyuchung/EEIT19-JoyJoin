<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ page import="java.util.*,com.web.activity.model.ActivityBean"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
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

<link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.1.3/css/bootstrap.min.css" 
	integrity="sha384-MCw98/SFnGE8fJT3GXwEOngsV7Zt27NXFoaoApmYm81iuXoPkFOJwJ8ERdknLPMO" 
	crossorigin="anonymous">
<link href="css/default.css" rel="stylesheet" type="text/css" media="screen" />

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
.dropdown-item label{
	color: black;
	font-size: 1em;
}

</style>

</head>
<body>
<!-- start header -->
<div id="header">
  <div id="logo">
    <h1><a href="#">Bryce <span>Sunrise</span> </a></h1>
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
      
      <li class="nav-item dropdown">
        <a class="nav-link dropdown-toggle" href="#" id="navbarCheckboxMenuLink" role="button" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">
         	條件篩選
        </a>
      	<div class="dropdown-menu dropdown-checkbox" aria-labelledby="navbarDropdown">
      	
      		<div class="dropdown-item">
      		<p>區域</p>
    		  <input type="checkbox" name="" id="n" value=""/><label for="n" >北部</label>
	      	  <input type="checkbox" name="" id="w" value=""/><label for="w" >中部</label>
	      	  <input type="checkbox" name="" id="s" value=""/><label for="s" >南部</label>
	      	  <input type="checkbox" name="" id="e" value=""/><label for="e" >東部</label>
	      	  <input type="checkbox" name="" id="o" value=""/><label for="o" >福建省</label>
      		</div>
      		<div class="dropdown-item">
      		<p>費用 </p>
      		  <input type="checkbox" name="u" id="0" value=""/><label for="0" >0元</label>
	      	  <input type="checkbox" name="u" id="500" value=""/><label for="500" >500元以下</label>
	      	  <input type="checkbox" name="u" id="1000" value=""/><label for="1000" >500~1000元</label>
	      	  <input type="checkbox" name="u" id="2000" value=""/><label for="2000" >1000~2000元</label>
	      	  <input type="checkbox" name="u" id="2000up" value=""/><label for="2000up" >2000元以上</label>
      		</div>
      		<div class="dropdown-item">
      		<p>人數上限 </p>
      		  <input type="checkbox" name="u" id="3" value=""/><label for="3" >3人以下</label>
	      	  <input type="checkbox" name="u" id="10" value=""/><label for="10" >3~10人</label>
	      	  <input type="checkbox" name="u" id="20" value=""/><label for="20" >10~20人</label>
	      	  <input type="checkbox" name="u" id="any" value=""/><label for="any" >不限人數</label>
      		</div>
      	  
		
        </div>
      </li>
      
      <li class="nav-item dropdown">
        <a class="nav-link dropdown-toggle" href="#" id="navbarDropdownMenuLink" role="button" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">
         	活動排序
        </a>
      	<div class="dropdown-menu" id="dropdown-menu" aria-labelledby="navbarDropdown">
          <a class="dropdown-item" href="#">活動日期↑　(近到遠)</a>
          <a class="dropdown-item" href="#">活動日期↓　(遠到近)</a>
          <a class="dropdown-item" href="#">截止日期↑　(近到遠)</a>
          <a class="dropdown-item" href="#">截止日期↑　(近到遠)</a>
          <a class="dropdown-item" href="#">活動地點　(由北至南)</a>
          <a class="dropdown-item" href="#">活動地點　(由南至北)</a>
          <a class="dropdown-item" href="#">參加人數　(少數優先)</a>
          <a class="dropdown-item" href="#">參加人數　(多數優先)</a>
        </div>
      </li>
      
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
              <input type="text" name="s" id="s" size="15" value="" />
              <br />
            </div>
          </form>
        </li>
        <li>
          <h2>Tags</h2>
          <p><a href="#">dolor</a> <a href="#">ipsum</a> <a href="#">lorem</a> <a href="#">sit amet</a> <a href="#">dolor</a> <a href="#">ipsum</a> <a href="#">lorem</a> <a href="#">sit amet, integer nisl risus, sagittis convallis, rutrum id, elementum congue</a></p>
        </li>
        
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
	              
	              <tbody  id="calBody">
	              <!--求星期幾 -->
	              	<fmt:formatDate var="year" value="${day}" pattern="E" /> 
				  <!--求本月份第幾個星期幾-->	
	              	<fmt:formatDate var="year" value="${day}" pattern="FE" />
	                <tr id="w1"> <td></td><td></td><td></td><td></td><td></td><td></td><td></td> </tr>
	                <tr id="w2"> <td></td><td></td><td></td><td></td><td></td><td></td><td></td> </tr>
	                <tr> <td></td><td></td><td></td><td></td><td></td><td></td><td></td> </tr>
	                <tr> <td></td><td></td><td></td><td></td><td></td><td></td><td></td> </tr>
	                <tr> <td></td><td></td><td></td><td></td><td></td><td></td><td></td> </tr>
	              </tbody>
	              
	              <tfoot>
	                <tr>
	                  <td abbr="September" colspan="3" id="prev"><a href="#" title="View posts for September 2007">&laquo; ${mon-1}月</a></td>
	                  <td class="pad">&nbsp;</td>
	                  <td abbr="September" style="text-align:right" colspan="3" id="prev"><a href="#" title="View posts for September 2007">${mon+1}月 &raquo;</a></td>
	                </tr>
	              </tfoot>
	            </table>
          </div>
        </li>
        <li>
          <h2>活動分類</h2>
          
          	<ul id="categories">
          		<c:forEach var="types" items="${allTypes}">
            	<li><a href="#" id="${types.activityType}">${types.activityTypeName}</a>
            	
	            	<div style="display:none">
						<form:form method="POST" modelAttribute="activityBean">
	            	  	<div><form:checkboxes path="activityClassNo" element="span class='checkbox'" items="${categoryList.activityClass}"/></div>
	            		</form:form>          		
	            	</div>
            	
            </li>
            </c:forEach>
          </ul>
          
        </li>
        <li>
          <h2>近期活動</h2>
          <ul>
          	<c:forEach var="recentOnes" items="${recentOnes}">
	            <li><a href="#">${recentOnes}</a></li>
	         </c:forEach>
          </ul>
        </li>
      </ul>
    </div>
    
    <!-- start content -->
    <div id="content">
      <div style="padding-bottom: 20px;"><img src="images/img02.jpg" alt="" /></div>
      
<!--       活動列表 (活動名稱v/活動日期v/截止日期/活動類別/最高人數/發起人v/發起日期v) -->
      <c:forEach var="all" items="${activities}">
      <div class="post">
      	<h2 class="title"><strong>${all.activityDate}</strong></h2>
        <h1 class="title"><a href="#">${all.name}</a></h1>
        <p class="byline"><small><a href="#發起人的超連結" rel="nofollow">${all.customerBean.nickname}</a>於 ${all.createdDate} 發起</small></p>
        <div class="entry">
        	<p>本 <strong>${all.activityTypeName}</strong> 活動將於${all.finalDate}截止</p>
        	<p>只要 ${all.minLimit}人即可成公開團!     本活動最高上限人數:  ${all.maxLimit}</p>
<!--           <p><strong>Bryce Sunrise</strong> is a free, fully standards-compliant CSS template designed by <a href="http://templated.co" rel="nofollow">TEMPLATED</a>. This free template is released under the <a href="http://templated.co/license">Creative Commons Attribution</a> license, so you're pretty much free to do whatever you want with it  (even use it commercially) provided you give us credit for it. Have fun with it :)</p> -->
          <p class="links"><a href="#" class="more">(看詳細內容)</a> &nbsp;&nbsp;&nbsp;</p>
        </div>
      </div>
      </c:forEach>
<!--       <div class="post"> -->
<!--         <h2 class="title"><a href="#">Nulla luctus eleifend</a></h2> -->
<!--         <p class="byline"><small>Posted on October 1st, 2007 by <a href="http://templated.co" rel="nofollow">TEMPLATED</a></small></p> -->
<!--         <div class="entry"> -->
<!--           <p>Pellentesque viverra vulputate enim. Aliquam erat volutpat. Pellentesque tristique ante ut risus. Quisque dictum. Integer nisl risus, sagittis convallis, rutrum id, elementum congue, nibh. Suspendisse dictum porta lectus. Donec placerat odio vel elit. Nullam ante orci, pellentesque eget, tempus quis, ultrices in, est. Curabitur sit amet nulla. Nam in massa. Sed vel tellus. </p> -->
<!--           <p class="links"><a href="#" class="more">Read Full Story</a> &nbsp;&nbsp;&nbsp;</p> -->
<!--         </div> -->
<!--       </div> -->
<!--       <div class="post"> -->
<!--         <h2 class="title"><a href="#">Nulla luctus eleifend</a></h2> -->
<!--         <p class="byline"><small>Posted on October 1st, 2007 by <a href="http://templated.co" rel="nofollow">TEMPLATED</a></small></p> -->
<!--         <div class="entry"> -->
<!--           <p>Pellentesque viverra vulputate enim. Aliquam erat volutpat. Pellentesque tristique ante ut risus. Quisque dictum. Integer nisl risus, sagittis convallis, rutrum id, elementum congue, nibh. Suspendisse dictum porta lectus. </p> -->
<!--           <p class="links"><a href="#" class="more">Read Full Story</a> &nbsp;&nbsp;&nbsp;</p> -->
<!--         </div> -->
<!--       </div> -->
    </div>
    <!-- end content -->
    <!-- start sidebars -->
    <div id="sidebar1" class="sidebar">
      <ul>
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
        
        <li>
          <h2>最新發起</h2>
          	  <c:forEach var="latest" items="${latestOnes}">
	          <ul>
	            <li><a href="#">${latest.name}</a> (${latest.createdDate})</li>
	          </ul>
	          </c:forEach>
        </li>
        <li>
          <h2>Recent Comments</h2>
          <ul>
            <li><a href="http://templated.co" rel="nofollow">TEMPLATED</a> on <a href="#">Aliquam libero</a></li>
            <li><a href="http://templated.co" rel="nofollow">TEMPLATED</a> on <a href="#">Consectetuer adipiscing elit</a></li>
            <li><a href="http://templated.co" rel="nofollow">TEMPLATED</a> on <a href="#">Metus aliquam pellentesque</a></li>
            <li><a href="http://templated.co" rel="nofollow">TEMPLATED</a> on <a href="#">Suspendisse iaculis mauris</a></li>
            <li><a href="http://templated.co" rel="nofollow">TEMPLATED</a> on <a href="#">Urnanet non molestie semper</a></li>
            <li><a href="http://templated.co" rel="nofollow">TEMPLATED</a> on <a href="#">Proin gravida orci porttitor</a></li>
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
    <p>&copy;2007 All Rights Reserved. &nbsp;&nbsp; Design by <a href="http://templated.co" rel="nofollow">TEMPLATED</a>.</p>
  </div>
</div>
<!-- <script type="text/javascript"> -->
//     $(function () {
//         $('#datetimepicker1').datetimepicker({
//         	 format:"YYYY/MM/DD";
//        		defaultDate:new Date()
//         });
//     });
<!-- </script> -->
<script>
  //判斷當前年份是否是閏年(閏年2月份有29天，平年2月份只有28天)
  function isLeap(year) {
  return year % 4 == 0 ? (year % 100 != 0 ? 1 : (year % 400 == 0 ? 1 : 0)) : 0;
  }
  var i, k,
  today = new Date(),                 //獲取當前日期
  y = today.getFullYear(),              //獲取日期中的年份
  m = today.getMonth(),                //獲取日期中的月份(需要注意的是：月份是從0開始計算，獲取的值比正常月份的值少1)
  d = today.getDate(),                //獲取日期中的日(方便在建立日期表格時高亮顯示當天)
  firstday = new Date(y, m, 1),            //獲取當月的第一天
  dayOfWeek = firstday.getDay(),           //判斷第一天是星期幾(返回[0-6]中的一個，0代表星期天，1代表星期一，以此類推)
  days_per_month = new Array(31, 28 + isLeap(y), 31, 30, 31, 30, 31, 31, 30, 31, 30, 31),         //建立月份陣列
  str_nums = Math.ceil((dayOfWeek + days_per_month[m]) / 7);                        //確定日期表格所需的行數

		var calendarbody = document.getElementById("calBody");
		for (i = 0; i < str_nums; i ++) {         //二維陣列建立日期表格
		  
		  var newTr = document.createElement("tr");
			  for (k = 0; k < 7; k++) {
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
</script>
<script>

	$("#navbarDropdownMenuLink").click(function() {
		 $("#dropdown-menu").toggle();
		 $(".dropdown-checkbox").hide();
	});
	
	$("#navbarCheckboxMenuLink").click(function() {
		 $(".dropdown-checkbox").toggle();
		 $("#dropdown-menu").hide();
	});
	
	$.ajax({
		  url:"/findCategories",
		  type: "GET",
		  dataType: "json",
		  data: { 
              activityType : $(this).attr("id"),                            
          },
		  cache: false,
		  
			  
		  success:function(res){console.log(res)},
		  error:function(err){console.log(err)},
		});
</script> 
</body>
</html>
