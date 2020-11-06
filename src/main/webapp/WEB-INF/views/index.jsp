<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ page import="java.util.*,com.web.activity.model.ActivityBean"%>
<!DOCTYPE html>
<!--
	Autonomy by TEMPLATED
    templated.co @templatedco
    Released for free under the Creative Commons Attribution 3.0 license (templated.co/license)
-->
<html>
	<head>
		<title>Welcome!</title>
		<meta http-equiv="content-type" content="text/html; charset=utf-8" />
		<meta name="description" content="" />
		<meta name="keywords" content="" />
		<link href='http://fonts.googleapis.com/css?family=Raleway:400,100,200,300,500,600,700,800,900' rel='stylesheet' type='text/css'>
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

	</head>
	<body class="homepage">

		<!-- Header -->
		<div class="headerPage">
			<jsp:include page="header/header_guest.jsp"/>
		</div>

		<!--<div id="banner">&nbsp;</div>-->
	<!--		<div id="carousel-example-generic" class="carousel slide" data-ride="carousel" align="center">
		  	<ol class="carousel-indicators">
			    <li data-target="#carousel-example-generic" data-slide-to="0" class="active"></li>
			    <li data-target="#carousel-example-generic" data-slide-to="1"></li>
			    <li data-target="#carousel-example-generic" data-slide-to="2"></li>
			</ol>
		  	<div class="carousel-inner wrapper" role="listbox">
		    	<div class="carousel-item active">
					<p class="carouselTitle">Arashiyama</p>
		     		<img src="images/slide1.jpg" alt="First slide">
		   	 	</div>
		    	<div class="carousel-item">
					<p class="carouselTitle">Uji</p>
			      	<img src="images/slide2.jpg" alt="Second slide">
			    </div>
			    <div class="carousel-item">
					<p class="carouselTitle">Kiyomizu-dera</p>
			      	<img src="images/slide3.jpg" alt="Third slide">
			    </div>
		 	 </div>
		 		<a class="left carousel-control" href="#carousel-example-generic" role="button" data-slide="prev">
		    		<span class="icon-prev" aria-hidden="true"></span>
		    		<span class="sr-only">Previous</span>
		 		</a>
			 	<a class="right carousel-control" href="#carousel-example-generic" role="button" data-slide="next">
			    	<span class="icon-next" aria-hidden="true"></span>
			    	<span class="sr-only">Next</span>
			  	</a>
		</div>  -->
		
		
		
	<div id="carouselExampleFade" class="carousel slide carousel-fade" data-ride="carousel">	
					<div class="carousel-inner wrapper">
   						<div class="carousel-item active" data-interval="1000">
   							<!-- div style="background-image: url('images/slide1.jpg');" class="d-block w-100"></div> -->
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

		<div id="featured">
			<div class="container">
			
			<!-- bootstrap輪播畫面 -->
				
				
				<div class="row" id="allClass">

					<div class="3u">
						<section>
							<a href="<c:url value='/activities' />" class="image full"><img src="images/pics02.jpg" alt=""></a>
							<header>
								<h2>運動 Sport</h2>
							</header>
							<p>(活動類型描述)</p>				
						</section>
					</div>

					<div class="3u">
						<section>
							<a href="<c:url value='/oneActivity' />" class="image full"><img src="images/pics03.jpg" alt=""></a>
							<header>
								<h2>電影 Movies</h2>
							</header>
							<p>(活動類型描述)</p>				
						</section>
					</div>

					<div class="3u">
						<section>
							<a href="restaurant/eeit19.team.food.EnterPage.jsp" class="image full"><img src="images/pics04.jpg" alt=""></a>
							<header>
								<h2>餐廳 Restaurant</h2>
							</header>
							<p>(活動類型描述)</p>				
						</section>
					</div>

					<div class="3u">
						<section>
							<a href="trip/homePage.jsp" class="image full"><img src="images/pics05.jpg" alt=""></a>
							<header>
								<h2>旅遊 Trip</h2>
							</header>
							<p>(活動類型描述)</p>				
						</section>
					</div>
					
					<div class="3u">
						<section>
							<a href="Art/Home.jsp" class="image full"><img src="images/pics05.jpg" alt=""></a>
							<header>
								<h2>藝文 Art</h2>
							</header>
							<p>(活動類型描述)</p>				
						</section>
					</div>

				</div>
			</div>
		</div>
<!--		<div id="marketing">
			<div class="container">
				<div class="row">
					<div class="3u">
						<section>
							<header>
								<h2>Praesent eleifend</h2>
							</header>
							<ul class="style1">
								<li class="first"><img src="images/pics06.jpg" width="80" height="80" alt="">
									<p>Nullam non wisi a sem eleifend. Donec mattis libero eget urna. </p>
								</li>
								<li><img src="images/pics07.jpg" width="80" height="80" alt="">
									<p>Nullam non wisi a sem eleifend. Donec mattis libero eget urna. </p>
								</li>
								<li><img src="images/pics08.jpg" width="80" height="80" alt="">
									<p>Nullam non wisi a sem eleifend. Donec mattis libero eget urna. </p>
								</li>
							</ul>
						</section>
					</div>
					<div class="3u">
						<section>
							<header>
								<h2>Maecenas lectus</h2>
							</header>
							<ul class="style1">
								<li class="first"><img src="images/pics09.jpg" width="80" height="80" alt="">
									<p>Nullam non wisi a sem eleifend. Donec mattis libero eget urna. </p>
								</li>
								<li><img src="images/pics10.jpg" width="80" height="80" alt="">
									<p>Nullam non wisi a sem eleifend. Donec mattis libero eget urna. </p>
								</li>
								<li><img src="images/pics11.jpg" width="80" height="80" alt="">
									<p>Nullam non wisi a sem eleifend. Donec mattis libero eget urna. </p>
								</li>
							</ul>
						</section>
					</div>
					<div class="6u">
						<section>
							<header>
								<h2>Aenean elementum facilisis ligula</h2>
							</header>
							<a href="#" class="image full"><img src="images/pics12.jpg" alt=""></a>
							<p>Consectetuer adipiscing elit. Nam pede erat, porta eu, lobortis eget, tempus et, tellus. Etiam neque. Vivamus consequat lorem at nisl. Nullam non wisi a sem semper eleifend. Donec mattis libero eget urna. Duis pretium velit ac mauris. Proin eu wisi suscipit nulla suscipit interdum. Aenean lectus lorem, imperdiet. Donec mattis libero eget urna. Duis pretium velit ac mauris.</p>
						</section>
					</div>
				</div>
			</div>
		</div>
! -->
		<div id="main">
			<div class="container">
				<div class="row">
					<div class="8u">
						<section>
							<header>
								<h2>網站聲明</h2>
							</header>
<!--							<p>This is <strong>Autonomy</strong>, a responsive HTML5 site template freebie by <a href="http://templated.co">TEMPLATED</a>. Released for free under the <a href="http://templated.co/license">Creative Commons Attribution</a> license, so use it for whatever (personal or commercial) &ndash; just give us credit! Check out more of our stuff at <a href="http://templated.co">our site</a> or follow us on <a href="http://twitter.com/templatedco">Twitter</a>.</p>
							<p>Donec leo. Vivamus fermentum nibh in augue. Praesent a lacus at urna congue rutrum. Nulla enim eros, porttitor eu, tempus id, varius non, nibh. Duis enim nulla, luctus eu, dapibus lacinia, venenatis id, quam. Vestibulum imperdiet, magna nec eleifend rutrum, nunc lectus vestibulum velit, euismod lacinia quam nisl id lorem. Quisque erat. Vestibulum pellentesque, justo mollis pretium suscipit, justo nulla blandit libero, in blandit augue justo quis nisl. Fusce mattis viverra elit. Fusce quis tortor. Consectetuer adipiscing elit. Nam pede erat, porta eu, lobortis eget, tempus et, tellus. Etiam neque. Vivamus consequat lorem at nisl. Nullam non wisi a sem semper eleifend.</p>
							<p>Sed etiam vestibulum velit, euismod lacinia quam nisl id lorem. Quisque erat. Vestibulum pellentesque, justo mollis pretium suscipit, justo nulla blandit libero, in blandit augue justo quis nisl. Fusce mattis viverra elit. Fusce quis tortor. Consectetuer adipiscing elit. Nam pede erat, porta eu, lobortis eget lorem ipsum dolor.</p>
 -->						</section>
					</div>
					<div class="4u">
						<section>
							<header>
								<h2>(下面放連結)</h2>
							</header>
							<ul class="style">
<!-- 								<li><a href="#">Pellentesque quis elit non gravida blandit.</a></li>
								<li><a href="#">Lorem ipsum dolor sit amet, adipiscing elit.</a></li>
								<li><a href="#">Phasellus nec erat sit pellentesque congue.</a></li>
								<li><a href="#">Cras vitae metus pellentesque pharetra.</a></li>
								<li><a href="#">Maecenas vitae orci vitae  feugiat eleifend.</a></li>
								<li><a href="#">Pellentesque quis elit non gravida blandit.</a></li>
								<li><a href="#">Lorem ipsum dolor sit amet, adipiscing elit.</a></li>
								<li><a href="#">Maecenas vitae orci  tellus feugiat eleifend.</a></li>
 -->							</ul>
						</section>
					</div>
				</div>
			</div>
		</div>

		<!-- Copyright -->
		<div id="copyright">
			<div class="container">
				Design: <a href="http://templated.co">TEMPLATED</a> Images: <a href="http://unsplash.com">Unsplash</a> (<a href="http://unsplash.com/cc0">CC0</a>)
			</div>
		</div>
	<script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.14.3/umd/popper.min.js" integrity="sha384-ZMP7rVo3mIykV+2+9J3UJ46jBk0WLaUAdn689aCwoqbBJiSnjAK/l8WvCWPIPm49" crossorigin="anonymous"></script>
	<script src="https://stackpath.bootstrapcdn.com/bootstrap/4.1.3/js/bootstrap.min.js" integrity="sha384-ChfqqxuZUCnJSK3+MXmPNIyE6ZbWh2IMqE241rYiqJxyMiZ6OW/JmZQ5stwEULTy" crossorigin="anonymous"></script>
	<script>
// 		$(".headerPage").load("header.html");
// 		$(document).ready(function(){
// 			$('.carousel').carousel({
// 				  interval: 2000
// 				})
// 		})
		
	</script>
	</body>
	
</html>