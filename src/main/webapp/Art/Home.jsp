<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>

<html>
<head>
<meta charset="UTF-8">
<title>HOME</title>
<script src="http://ajax.googleapis.com/ajax/libs/jquery/1.11.0/jquery.min.js"></script>
		<script src="/js/skel.min.js"></script>
		<script src="/js/skel-panels.min.js"></script>
		<script src="/js/init.js"></script>
		<link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.1.3/css/bootstrap.min.css" 
			integrity="sha384-MCw98/SFnGE8fJT3GXwEOngsV7Zt27NXFoaoApmYm81iuXoPkFOJwJ8ERdknLPMO" 
			crossorigin="anonymous">
		<script src="https://code.jquery.com/jquery-3.5.1.js"
			integrity="sha256-QWo7LDvxbWT2tbbQ97B53yJnYU3WhH/C8ycbRAkjPDc="
			crossorigin="anonymous"></script>
		
			<link rel="stylesheet" href="../css/skel-noscript.css" />
			<link rel="stylesheet" href="../css/style.css" />
			
			<link rel="stylesheet" href="../css/style-desktop.css" />
			<link rel="stylesheet" href="../css/carousel.css" />

<style type="text/css">

		body {
			background-image: url('images/greenbg.png');
			background-size: cover;
		}
		
		h1 {
			margin: 50px auto;
			text-align: center;
		}
		
		.wrapper {
			position: relative;
			width: 800px;
			height: 300px;
			overflow: hidden;
			margin: 0 auto;
		}
		
		.wrapper>ul {
			margin: 0;
			padding: 0;
			position: absolute;
		}
		
		.wrapper>li {
			margin: 0;
			padding: 0;
			list-style: none;
		}
		
		.wrapper>ul.slides {
			width: 3200px;
			left: 0px;
			transition: all .1s;
		}
		
		.wrapper>ul.slides li {
			width: 800px;
			height: 300px;
			overflow: hidden;
			float: left;
		}
		
		.wrapper>ul.slides li img {
			width: 100%;
			height: 100%;
			object-fit: cover;
		}
		
		.wrapper>.dot {
			bottom: 10px;
			width: 100%;
			display: flex;
			justify-content: center;
		}
		
		.wrapper>.dot li {
			border: 1px solid #fff;
			/* border-radius: 50%; */
			margin: 0 5px;
			width: 24px;
			height: 10px;
		}
		
		.wrapper>.dot li:hover {
			background: #fff;
		}
		
		.wrapper>.slide_btn {
			display: flex;
			justify-content: center;
			align-items: center;
			top: 0;
			bottom: 0;
			width: 30px;
			color: #fff;
			position: absolute;
			font-size: 24px;
		}
		
		.wrapper>#prevSlide {
			left: 0;
		}
		
		.wrapper>#nextSlide {
			right: 0;
		}
		
		.wrapper>.slide_btn i {
			color: rgba(255, 255, 255, .6);
			transition: .5s;
		}
		
		.wrapper>.slide_btn:hover i {
			color: rgba(255, 255, 255, 1);
		}
		
		
		footer {
		    background-color:	#ACD6FF;
		    border-radius:5px;
		    text-align:center;
		    line-height:2.5em;
		    color:	#4F4F4F;
		}
		.headerPage{
			background: #180E0B;
		}
		
		</style>
		
		</head>

<body style="background-color:	#019858">
<div class="headerPage"></div>


	<script src="https://code.jquery.com/jquery-3.5.1.js"
		integrity="sha256-QWo7LDvxbWT2tbbQ97B53yJnYU3WhH/C8ycbRAkjPDc="
		crossorigin="anonymous"></script>


	<h1>藝文活動</h1>
	<div class="wrapper">
		<ul class="slides">
			<li><img src="data/001.jpg" alt=""></li>
			<li><img src="data/002.jpg" alt=""></li>
			<li><img src="data/003.jpg" alt=""></li>
			<li><img src="data/004.jpg" alt=""></li>
		</ul>
		<ul class="dot">
			<li id="1"></li>
			<li id="2"></li>
			<li id="3"></li>
			<li id="4"></li>
		</ul>


		<div id="prevSlide" class="slide_btn">
			<i class="fa fa-caret-left"></i>
		</div>
		<div id="nextSlide" class="slide_btn">
			<i class="fa fa-caret-right"></i>
		</div>
	</div>


	<form>
		<table>

			<div align="center">
				<a href="../ArtSearchAll">查詢全部活動</a>
			</div>

			<div align="center">
				<a href="./ArtInsert.jsp">新增活動</a>
			</div>

			<!-- <table align="center"> -->
			<!-- <tr> -->
			<!-- <td><a href="./ArtInsert.jsp">旅遊</a> -->
			<!-- <td><a href="./ArtInsert.jsp">美食</a> -->
			<!-- <td><a href="./ArtInsert.jsp">電影</a> -->
			<!-- <td><a href="./ArtInsert.jsp">運動</a> -->
			<!-- <td><a href="./ArtInsert.jsp">藝文</a> -->

		</table>


	</form>
	
	<script>
        $(function () {
            let slideNum = 0;
            let slideCount = $(".slides li").length;
            let lastIndex = slideCount - 1;
            var picTimer;
            // console.log(slideCount);
            $(".dot li").eq(0).css("background-color", "white");
            $(".dot li").mouseenter(function () {
                slideNum = $(this).index();
                console.log(slideNum);

                show();

            });
            function show() {
                $(".dot li").eq(slideNum).css("background-color", "#fff")
                    .siblings().css("background-color", "transparent");


                let move = 0 - 800 * slideNum;
                $("ul.slides").css("left", move);

            }


            $("#prevSlide").click(function () {
                slideNum--;

                if (slideNum < 0) slideNum = lastIndex;
                show();

            })

            $("#nextSlide").click(function () {
                slideNum++;

                if (slideNum > lastIndex) slideNum = 0;
                show();

            })
           
            var times = setInterval(auto, 1500);
            function auto() {
                slideNum++;
                if (slideNum > lastIndex) slideNum = 0;
                show();
            }

            $(".slides").hover(function(){
                cl=clearInterval(times);
            },function(){
            	if(cl==undefined){
            	times=setInterval(auto,1500)}
            })

        })
	
	
	 </script>
<script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.14.3/umd/popper.min.js" integrity="sha384-ZMP7rVo3mIykV+2+9J3UJ46jBk0WLaUAdn689aCwoqbBJiSnjAK/l8WvCWPIPm49" crossorigin="anonymous"></script>
<script src="https://stackpath.bootstrapcdn.com/bootstrap/4.1.3/js/bootstrap.min.js" integrity="sha384-ChfqqxuZUCnJSK3+MXmPNIyE6ZbWh2IMqE241rYiqJxyMiZ6OW/JmZQ5stwEULTy" crossorigin="anonymous"></script>

<script>
	$(document).ready(function(){
		$(".headerPage").load("${pageContext.request.contextPath}/header3.jsp",function(){
			$("#nav>ul>li").removeClass("active");
			$("#header5").addClass("active");
		});
	
	})
</script>

</body>
<!-- <footer> -->
<!--                 <p>2020 All Rights EEIT19 . </p> -->
<!--         </footer> -->
</html>