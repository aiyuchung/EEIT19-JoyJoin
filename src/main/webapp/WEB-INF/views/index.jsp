<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
	<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%-- <%@ page import="java.util.*,com.web.activity.model.ActivityBean"%> --%>
<!DOCTYPE html>
<html>
	<head>
		<title>Welcome!</title>
		<meta http-equiv="content-type" content="text/html; charset=utf-8" />
		<meta name="description" content="" />
		<meta name="keywords" content="" />
		<link href='http://fonts.googleapis.com/css?family=Raleway:400,100,200,300,500,600,700,800,900' rel='stylesheet' type='text/css'>
		<!--[if lte IE 8]><script src="js/html5shiv.js"></script><![endif]-->
		<script src="http://ajax.googleapis.com/ajax/libs/jquery/1.11.0/jquery.min.js"></script>
		<script src="js/skel.min.js"></script>
		<script src="js/skel-panels.min.js"></script>
		<script src="js/init.js"></script>
		<link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.1.3/css/bootstrap.min.css" 
			integrity="sha384-MCw98/SFnGE8fJT3GXwEOngsV7Zt27NXFoaoApmYm81iuXoPkFOJwJ8ERdknLPMO" 
			crossorigin="anonymous">
		<script src="https://code.jquery.com/jquery-3.5.1.js"
			integrity="sha256-QWo7LDvxbWT2tbbQ97B53yJnYU3WhH/C8ycbRAkjPDc="
			crossorigin="anonymous"></script>
		
			<link rel="stylesheet" href="css/skel-noscript.css" />
			<link rel="stylesheet" href="css/style.css" />
			<link rel="stylesheet" href="css/style-desktop.css" />
			<link rel="stylesheet" href="css/carousel.css" />
<style>
.enterbtn{
/* 	backtgrond-color: white; */
	color:white;
	border: 3px solid white;
	width:100px;
	height:50px;
	
}
.hvr-shutter-out-horizontal {
	border: 3px solid black;
  	width:150px;
	height:80px;
	font-size:2rem;
	font-family: MV Boli;
	padding-top:12px;
	border-radius:25px;
	color:black;
	
  display: inline-block;
  vertical-align: middle;
  -webkit-transform: perspective(1px) translateZ(0);
  transform: perspective(1px) translateZ(0);
  box-shadow: 0 0 2px rgba(0, 0, 0, 0);
  position: relative;
  background: #BC8F8F;
  -webkit-transition-property: color;
  transition-property: color;
  -webkit-transition-duration: 0.3s;
  transition-duration: 0.3s;
}
.hvr-shutter-out-horizontal:before {
	border-radius:25px;
	font-size:35px;
  content: "";
  position: absolute;
  z-index: -1;
  top: 0;
  bottom: 0;
  left: 0;
  right: 0;
/*   background: #A16B47; */
  background: rgba(100, 70, 71); 
  -webkit-transform: scaleX(0);
  transform: scaleX(0);
  -webkit-transform-origin: 50%;
  transform-origin: 50%;
  -webkit-transition-property: transform;
  transition-property: transform;
  -webkit-transition-duration: 0.3s;
  transition-duration: 0.3s;
  -webkit-transition-timing-function: ease-out;
  transition-timing-function: ease-out;
}
.hvr-shutter-out-horizontal:hover, .hvr-shutter-out-horizontal:focus, .hvr-shutter-out-horizontal:active {
  color: white;
  font-size:35px;
}
.hvr-shutter-out-horizontal:hover:before, .hvr-shutter-out-horizontal:focus:before, .hvr-shutter-out-horizontal:active:before {
  -webkit-transform: scaleX(1);
  transform: scaleX(1);
}

.ptext{
	text-align:center;
/* 	align:center; */
}	
.ptext p{
	color: 	#FFF5EE;
	font-size: 20px;
	font-family:Microsoft YaHei;
}		
</style>
	</head>
	<body class="homepage">

<!---------- Header ------------>		
		<div class="headerPage">
			<jsp:include page="header/header_guest.jsp"/>
		</div>
<!---------- 輪播 ------------>		
		<div id="carouselExampleFade" class="carousel slide carousel-fade" data-ride="carousel">	
				<div class="carousel-inner wrapper">
  					<div class="carousel-item active" data-interval="1000">
    				 	<img src="images/slide3.jpg" class="d-block w-100" style="vertical-align:bottom" alt="..."> 
  					</div>
  				 	<div class="carousel-item" data-interval="2000">
     					<img src="images/slide2.jpg"  class="d-block w-100" style="vertical-align:bottom"alt="...">
   					</div>
   					<div class="carousel-item">
     					<img src="images/slide1.jpg"  class="d-block w-100" alt="...">
   					</div>
   					<div class="carousel-item">
     					<img src="images/slide6.jpg"  class="d-block w-100" alt="...">
   					</div>
   					<div class="carousel-item">
     					<img src="images/slide4.jpg"  class="d-block w-100" alt="...">
    				</div>
    				<div class="carousel-item">
      					<img src="images/slide5.jpg"  class="d-block w-100" alt="...">
    				</div>
    				<div class="carousel-item">
      					<img src="images/slide7.jpg"  class="d-block w-100" alt="...">
    				</div>
  				</div>
  				<a class="carousel-control-prev" href="#carouselExampleFade" role="button" data-slide="prev">
   					<span class="carousel-control-prev-icon" aria-hidden="true"></span>
    				<span class="sr-only">Previous</span>
  				</a>
  				<a class="carousel-control-next" href="#carouselExampleFade" role="button" data-slide="next">
					<span class="carousel-control-next-icon" aria-hidden="true"></span>
					<span class="sr-only">Next</span>
 				</a>
 				
 				
 				
 				
		</div>
<!-- 		<div id=""> -->
<!-- 			<div class=""> -->
<!-- 				<div class="ptext" > -->
<!-- 					<P>這裡是提供人們有機會踏出家門、結交志同道合的朋友們的一個平台</P> -->
<!-- 					<p>台灣各處總有最適合自己的那個地方</p> -->
<!-- 					<p>一起走吧</p> -->
<!-- 					<div align="center"> -->
<!--  						<div class="btn hvr-shutter-out-horizontal">ENTER</div> -->
<!--  					</div> -->
<!-- 				</div> -->
<!-- 			</div> -->
<!-- 		</div> -->
		
		<div id="main">
			<div class="container">
				<div class="ptext" >
					<P>這裡是提供人們有機會踏出家門、結交志同道合的朋友們的一個平台</P>
					<p>台灣各處總有最適合自己的那個地方</p>
					<p>一起走吧</p>
					<div align="center">
 						<div class="btn hvr-shutter-out-horizontal">ENTER</div>
 					</div>
				</div>
			</div>
		</div>
		
		
<!---------- 進入主畫面 ------------>	
<!-- 		<div id="featured"> -->
<!-- 			<div class="container"> -->
<!-- 				<div class="row" id="allClass"> -->
<!-- 					<div class="3u"> -->
<!-- 						<section> -->
<%-- 							<a href="<c:url value='/activities' />" class="image full"><img src="images/pics02.jpg" alt=""></a> --%>
<!-- 							<header> -->
<!-- 								<h2>運動 Sport</h2> -->
<!-- 							</header> -->
<!-- 							<p>(活動類型描述)</p>				 -->
<!-- 						</section> -->
<!-- 					</div> -->

<!-- 					<div class="3u"> -->
<!-- 						<section> -->
<%-- 							<a href="<c:url value='/oneActivity' />" class="image full"><img src="images/pics03.jpg" alt=""></a> --%>
<!-- 							<header> -->
<!-- 								<h2>電影 Movies</h2> -->
<!-- 							</header> -->
<!-- 							<p>(活動類型描述)</p>				 -->
<!-- 						</section> -->
<!-- 					</div> -->

<!-- 					<div class="3u"> -->
<!-- 						<section> -->
<!-- 							<a href="restaurant/eeit19.team.food.EnterPage.jsp" class="image full"><img src="images/pics04.jpg" alt=""></a> -->
<!-- 							<header> -->
<!-- 								<h2>餐廳 Restaurant</h2> -->
<!-- 							</header> -->
<!-- 							<p>(活動類型描述)</p>				 -->
<!-- 						</section> -->
<!-- 					</div> -->

<!-- 					<div class="3u"> -->
<!-- 						<section> -->
<!-- 							<a href="trip/homePage.jsp" class="image full"><img src="images/pics05.jpg" alt=""></a> -->
<!-- 							<header> -->
<!-- 								<h2>旅遊 Trip</h2> -->
<!-- 							</header> -->
<!-- 							<p>(活動類型描述)</p>				 -->
<!-- 						</section> -->
<!-- 					</div> -->
					
<!-- 					<div class="3u"> -->
<!-- 						<section> -->
<!-- 							<a href="Art/Home.jsp" class="image full"><img src="images/pics05.jpg" alt=""></a> -->
<!-- 							<header> -->
<!-- 								<h2>藝文 Art</h2> -->
<!-- 							</header> -->
<!-- 							<p>(活動類型描述)</p>				 -->
<!-- 						</section> -->
<!-- 					</div> -->

<!-- 				</div> -->
<!-- 			</div> -->
<!-- 		</div> -->



<!-- 		<div id="main"> -->
<!-- 			<div class="container"> -->
<!-- 				<div class="row"> -->
<!-- 					<div class="8u"> -->
<!-- 						<section> -->
<!-- 							<header> -->
<!-- 								<h2>網站聲明</h2> -->
<!-- 							</header> -->
<!-- <!--							<p>This is <strong>Autonomy</strong>, a responsive HTML5 site template freebie by <a href="http://templated.co">TEMPLATED</a>. Released for free under the <a href="http://templated.co/license">Creative Commons Attribution</a> license, so use it for whatever (personal or commercial) &ndash; just give us credit! Check out more of our stuff at <a href="http://templated.co">our site</a> or follow us on <a href="http://twitter.com/templatedco">Twitter</a>.</p> -->
<!-- 							<p>Donec leo. Vivamus fermentum nibh in augue. Praesent a lacus at urna congue rutrum. Nulla enim eros, porttitor eu, tempus id, varius non, nibh. Duis enim nulla, luctus eu, dapibus lacinia, venenatis id, quam. Vestibulum imperdiet, magna nec eleifend rutrum, nunc lectus vestibulum velit, euismod lacinia quam nisl id lorem. Quisque erat. Vestibulum pellentesque, justo mollis pretium suscipit, justo nulla blandit libero, in blandit augue justo quis nisl. Fusce mattis viverra elit. Fusce quis tortor. Consectetuer adipiscing elit. Nam pede erat, porta eu, lobortis eget, tempus et, tellus. Etiam neque. Vivamus consequat lorem at nisl. Nullam non wisi a sem semper eleifend.</p> -->
<!-- 							<p>Sed etiam vestibulum velit, euismod lacinia quam nisl id lorem. Quisque erat. Vestibulum pellentesque, justo mollis pretium suscipit, justo nulla blandit libero, in blandit augue justo quis nisl. Fusce mattis viverra elit. Fusce quis tortor. Consectetuer adipiscing elit. Nam pede erat, porta eu, lobortis eget lorem ipsum dolor.</p> -->
<!--  -->						</section> -->
<!-- 					</div> -->
<!-- 					<div class="4u"> -->
<!-- 						<section> -->
<!-- 							<header> -->
<!-- 								<h2>(下面放連結)</h2> -->
<!-- 							</header> -->
<!-- 							<ul class="style"> -->
<!-- <!-- 								<li><a href="#">Pellentesque quis elit non gravida blandit.</a></li> -->
<!-- 								<li><a href="#">Lorem ipsum dolor sit amet, adipiscing elit.</a></li> -->
<!-- 								<li><a href="#">Phasellus nec erat sit pellentesque congue.</a></li> -->
<!-- 								<li><a href="#">Cras vitae metus pellentesque pharetra.</a></li> -->
<!-- 								<li><a href="#">Maecenas vitae orci vitae  feugiat eleifend.</a></li> -->
<!-- 								<li><a href="#">Pellentesque quis elit non gravida blandit.</a></li> -->
<!-- 								<li><a href="#">Lorem ipsum dolor sit amet, adipiscing elit.</a></li> -->
<!-- 								<li><a href="#">Maecenas vitae orci  tellus feugiat eleifend.</a></li> -->
<!--  -->							</ul> -->
<!-- 						</section> -->
<!-- 					</div> -->
<!-- 				</div> -->
<!-- 			</div> -->
<!-- 		</div> -->


	<script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.14.3/umd/popper.min.js" integrity="sha384-ZMP7rVo3mIykV+2+9J3UJ46jBk0WLaUAdn689aCwoqbBJiSnjAK/l8WvCWPIPm49" crossorigin="anonymous"></script>
	<script src="https://stackpath.bootstrapcdn.com/bootstrap/4.1.3/js/bootstrap.min.js" integrity="sha384-ChfqqxuZUCnJSK3+MXmPNIyE6ZbWh2IMqE241rYiqJxyMiZ6OW/JmZQ5stwEULTy" crossorigin="anonymous"></script>
	<script>
// 		$(".headerPage").load("header.html");
// 		$(document).ready(function(){
// 			$('.carousel').carousel({
// 				  interval: 2000
// 				})
// 		})
	$(".hvr-shutter-out-horizontal").click(function(){
		window.location.href = "<c:url value='/activities' />";
	})
		
	</script>
	</body>
	
</html>