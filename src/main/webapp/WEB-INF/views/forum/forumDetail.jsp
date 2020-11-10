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
	margin: 0 0 0 50px;
	padding: 12px 15px 10px 15px;
	border: none;
	text-decoration: none;
	text-transform: uppercase;
	font-family: Arial, Helvetica, sans-serif;
	font-size: 20px;
	color: #DDBB04;
}

#menu>ul>li>a:hover {
	margin: 0 0 0 50px;
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
    <!-- <script src="js/jquery-3.5.1.min.js"></script>
    <script>
        var score = 0;
        $(".i").hover(function () {
        	alert(1);
            if (score == 0) {
                $(this).attr("src", "images/chngstar.gif");
                $(this).prevAll('img').attr("src", "images/chngstar.gif");
                let num = $(this).index()+1;
                $("#score").text("獲得"+num+"星星")
                console.log($(".i").index($(this)))
            }
        },
            function () {
                if (score == 0) {
                    $(this).attr("src", "images/star.gif");
                    $(this).prevAll('img').attr("src", "images/star.gif");
                    
                    $("#score").text("獲得0星星")
                }
            });

        $(".i").click(function () {

            score = ($(this).index()) + 1;
            console.log("score" + score);

            $(this).attr("src", "images/chngstar.gif");
            $(this).prevAll('img').attr("src", "images/chngstar.gif");
            $("#score").text("獲得"+score+"星星")
        });

        $(".i").dblclick(function () {
            $(".i").attr("src", "images/star.gif");
            score = 0;
            $("#score").text("獲得"+score+"星星")
        });
        
        
    </script> -->
<body>
<!---------- Header ------------>		
		<div class="headerPage">
			<jsp:include page="../header/header_guest.jsp"/>
		</div>

		<div id="menu-bg">
			<div id="menu">
				<ul id="main">
					<li class="nav-item dropdown"><a href="#">熱門 </a></li>
					<li class="nav-item dropdown"><a href="#">電影 </a></li>
					<li class="nav-item dropdown"><a href="#">運動 </a></li>
					<li class="nav-item dropdown"><a href="#">美食 </a></li>
					<li class="nav-item dropdown"><a href="#">文青 </a></li>
					<li class="nav-item dropdown"><a href="#">旅遊 </a></li>
				</ul>
			</div>
		</div>
	
	<!-- end header -->
	<br>
	
	<table width="70%" border="1" align="center">
		<tr>
			<td>類型</td>
			<td>標題</td>
			<td>評分</td>
			<td>發文者</td>
			<td>發文時間</td>
			<td>地區</td>
			<td>點閱率</td>
		</tr>
		<tr>
			<td>旅遊</td>
			<td>粗乃玩啊</td>
			<td>4.5</td>
			<td>揪王之王</td>
			<td>2020-11-11</td>
			<td>台北市</td>
			<td>20</td>
		</tr>
	</table>
	
	<table width="70%" border="1" align="center"  style="border-top: 5px #ff0000;" >
		<tr>
			<td rowspan="2" width="10%" height="100px" style="border-right: 0px;">
				<img width = "100%" src="images/img02.jpg" alt=""/>
			</td>
			<td rowspan="2" width="10%" height="100px" style="border-left: 0px;">
			深海異音<br /> hbl917070<br /> 稱號 未夠班的勇者<br /> 種族 妖精<br /> 巴幣 226632 <br />GP 7881<br />
			</td>
			<!-- <td width="20%"  height="100px" style="border-right: 0px;">	<img width = "50%" src="images/img02.jpg" alt=""/><img width = "50%" src="images/img02.jpg" alt=""/><img width = "50%" src="images/img02.jpg" alt=""/></td> -->
			<td width="60%"  height="100px" style="border-left: 0px;">海詞詞典，<img width = "10%" src="images/img02.jpg" alt=""/><button>很讚</button>最權威的學習詞典，專業出版線上討論區的英文，線上討論區翻譯，線上討論區英語怎麼說等詳細講解。海詞詞典：學習變容易，記憶很深刻。</td>
		</tr>
		<tr>
			<td>
				<table border="1" width="100%">
					<tr>
						<td width="25%">
						    <div>
						        <img id="img1" class="i" width = "33" src="images/chngstar.gif" />
						        <img id="img2" class="i" width = "33" src="images/chngstar.gif" />
						        <img id="img3" class="i" width = "33" src="images/chngstar.gif" />
						        <img id="img4" class="i" width = "33" src="images/chngstar.gif" />
						        <img id="img5" class="i" width = "33" src="images/chngstar.gif" />
						    </div>
    					</td>
						<td width="75%"><button>很讚</button><button>很讚讚</button><button>很讚讚讚</button></td>
					</tr>
				</table>
			</td>
		</tr>
		
		<tr>
			<td rowspan="2" width="10%" height="100px" style="border-right: 0px;">
				<img width = "100%" src="images/img02.jpg" alt=""/>
			</td>
			<td rowspan="2" width="10%" height="100px" style="border-left: 0px;">
			深海異音<br /> hbl917070<br /> 稱號 未夠班的勇者<br /> 種族 妖精<br /> 巴幣 226632 <br />GP 7881<br />
			</td>
			<!-- <td width="20%"  height="100px" style="border-right: 0px;">	<img width = "50%" src="images/img02.jpg" alt=""/><img width = "50%" src="images/img02.jpg" alt=""/><img width = "50%" src="images/img02.jpg" alt=""/></td> -->
			<td width="60%"  height="100px" style="border-left: 0px;">海詞詞典，<img width = "10%" src="images/img02.jpg" alt=""/><button>很讚</button>最權威的學習詞典，專業出版線上討論區的英文，線上討論區翻譯，線上討論區英語怎麼說等詳細講解。海詞詞典：學習變容易，記憶很深刻。</td>
		</tr>
		<tr>
			<td>
				<table border="1" width="100%">
					<tr>
						<td width="25%">
						    <div>
						        <img id="img1" class="i" width = "33" src="images/chngstar.gif" />
						        <img id="img2" class="i" width = "33" src="images/chngstar.gif" />
						        <img id="img3" class="i" width = "33" src="images/chngstar.gif" />
						        <img id="img4" class="i" width = "33" src="images/chngstar.gif" />
						        <img id="img5" class="i" width = "33" src="images/star.gif" />
						    </div>
    					</td>
						<td width="75%"><button>很讚</button><button>很讚讚</button><button>很讚讚讚</button></td>
					</tr>
				</table>
			</td>
		</tr>
		
				<tr>
			<td rowspan="2" width="10%" height="100px" style="border-right: 0px;">
				<img width = "100%" src="images/img02.jpg" alt=""/>
			</td>
			<td rowspan="2" width="10%" height="100px" style="border-left: 0px;">
			深海異音<br /> hbl917070<br /> 稱號 未夠班的勇者<br /> 種族 妖精<br /> 巴幣 226632 <br />GP 7881<br />
			</td>
			<!-- <td width="20%"  height="100px" style="border-right: 0px;">	<img width = "50%" src="images/img02.jpg" alt=""/><img width = "50%" src="images/img02.jpg" alt=""/><img width = "50%" src="images/img02.jpg" alt=""/></td> -->
			<td width="60%"  height="100px" style="border-left: 0px;">海詞詞典，<img width = "10%" src="images/img02.jpg" alt=""/><button>很讚</button>最權威的學習詞典，專業出版線上討論區的英文，線上討論區翻譯，線上討論區英語怎麼說等詳細講解。海詞詞典：學習變容易，記憶很深刻。</td>
		</tr>
		<tr>
			<td>
				<table border="1" width="100%">
					<tr>
						<td width="25%">
						    <div>
						        <img id="img1" class="i" width = "33" src="images/chngstar.gif" />
						        <img id="img2" class="i" width = "33" src="images/chngstar.gif" />
						        <img id="img3" class="i" width = "33" src="images/chngstar.gif" />
						        <img id="img4" class="i" width = "33" src="images/star.gif" />
						        <img id="img5" class="i" width = "33" src="images/star.gif" />
						    </div>
    					</td>
						<td width="75%"><button>很讚</button><button>很讚讚</button><button>很讚讚讚</button></td>
					</tr>
				</table>
			</td>
		</tr>
		
		<tr>
			<td rowspan="2" width="10%" height="100px" style="border-right: 0px;">
				<img width = "100%" src="images/img02.jpg" alt=""/>
			</td>
			<td rowspan="2" width="10%" height="100px" style="border-left: 0px;">
			深海異音<br /> hbl917070<br /> 稱號 未夠班的勇者<br /> 種族 妖精<br /> 巴幣 226632 <br />GP 7881<br />
			</td>
			<!-- <td width="20%"  height="100px" style="border-right: 0px;">	<img width = "50%" src="images/img02.jpg" alt=""/><img width = "50%" src="images/img02.jpg" alt=""/><img width = "50%" src="images/img02.jpg" alt=""/></td> -->
			<td width="60%"  height="100px" style="border-left: 0px;">海詞詞典，<img width = "10%" src="images/img02.jpg" alt=""/><button>很讚</button>最權威的學習詞典，專業出版線上討論區的英文，線上討論區翻譯，線上討論區英語怎麼說等詳細講解。海詞詞典：學習變容易，記憶很深刻。</td>
		</tr>
		<tr>
			<td>
				<table border="1" width="100%">
					<tr>
						<td width="25%">
						    <div>
						        <img id="img1" class="i" width = "33" src="images/chngstar.gif" />
						        <img id="img2" class="i" width = "33" src="images/chngstar.gif" />
						        <img id="img3" class="i" width = "33" src="images/chngstar.gif" />
						        <img id="img4" class="i" width = "33" src="images/chngstar.gif" />
						        <img id="img5" class="i" width = "33" src="images/star.gif" />
						    </div>
    					</td>
						<td width="75%"><button>很讚</button><button>很讚讚</button><button>很讚讚讚</button></td>
					</tr>
				</table>
			</td>
		</tr>
		
		<tr>
			<td rowspan="2" width="10%" height="100px" style="border-right: 0px;">
				<img width = "100%" src="images/img02.jpg" alt=""/>
			</td>
			<td rowspan="2" width="10%" height="100px" style="border-left: 0px;">
			深海異音<br /> hbl917070<br /> 稱號 未夠班的勇者<br /> 種族 妖精<br /> 巴幣 226632 <br />GP 7881<br />
			</td>
			<!-- <td width="20%"  height="100px" style="border-right: 0px;">	<img width = "50%" src="images/img02.jpg" alt=""/><img width = "50%" src="images/img02.jpg" alt=""/><img width = "50%" src="images/img02.jpg" alt=""/></td> -->
			<td width="60%"  height="100px" style="border-left: 0px;">海詞詞典，<img width = "10%" src="images/img02.jpg" alt=""/><button>很讚</button>最權威的學習詞典，專業出版線上討論區的英文，線上討論區翻譯，線上討論區英語怎麼說等詳細講解。海詞詞典：學習變容易，記憶很深刻。</td>
		</tr>
		<tr>
			<td>
				<table border="1" width="100%">
					<tr>
						<td width="25%">
						    <div>
						        <img id="img1" class="i" width = "33" src="images/chngstar.gif" />
						        <img id="img2" class="i" width = "33" src="images/chngstar.gif" />
						        <img id="img3" class="i" width = "33" src="images/chngstar.gif" />
						        <img id="img4" class="i" width = "33" src="images/chngstar.gif" />
						        <img id="img5" class="i" width = "33" src="images/star.gif" />
						    </div>
    					</td>
						<td width="75%"><button>很讚</button><button>很讚讚</button><button>很讚讚讚</button></td>
					</tr>
				</table>
			</td>
		</tr>
		
		<tr>
			<td height ="70" colspan="3" align="center">
				<input type="submit" value="新增貼文" id="to_forumNewArticle">
				<input type="reset" value="編輯">
			</td>
		</tr>
	</table>


<script>	
	document.getElementById("to_forumNewArticle").onclick = function(){
		location.href = "<c:url value = '/forumNewArticle'/>";
	}
</script>


</body>
</html>