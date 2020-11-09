<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>的個人頁面</title>
	<link href='http://fonts.googleapis.com/css?family=Raleway:400,100,200,300,500,600,700,800,900' rel='stylesheet'
        type='text/css'>
    <script src="http://ajax.googleapis.com/ajax/libs/jquery/1.11.0/jquery.min.js"></script>
    <script src="js/skel.min.js"></script>
    <script src="js/skel-panels.min.js"></script>
    <script src="js/init.js"></script>

    <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.1.3/css/bootstrap.min.css"
        integrity="sha384-MCw98/SFnGE8fJT3GXwEOngsV7Zt27NXFoaoApmYm81iuXoPkFOJwJ8ERdknLPMO" crossorigin="anonymous">
    <script src="https://code.jquery.com/jquery-3.5.1.js"
        integrity="sha256-QWo7LDvxbWT2tbbQ97B53yJnYU3WhH/C8ycbRAkjPDc=" crossorigin="anonymous"></script>
    <link rel="stylesheet" href="css/style.css" />
    <link rel="stylesheet" href="css/memberpage.css" />
    <link rel="stylesheet" type="text/css" href="path/to/css/bootstrap.min.css">
    <link rel="stylesheet" type="text/css" href="path/to/css/bootstrap-directional-buttons.css">
    <!-- ====================文字特效======================= -->
    <link href="css/bootstrap.css" rel="stylesheet">
    <link href="https://fonts.googleapis.com/css?family=Cabin+Sketch:700&display=swap" rel="stylesheet">

</head>
<body class="homepage" id="backArea">
	<!-- Header -->
<!-- 	<div class="headerPage"> -->
<%-- 		<jsp:include page="../header/header_guest.jsp" /> --%>
<!-- 	</div> -->
	
	<div id="infoArea">
		<div id="info">
			<div id="pictureArea"></div>
			<div id="nicknameArea" class="text-effect">
				<p>暱稱啦 ( 帳號啦 )</p>
				<p>放你的Email啦</p>
			</div>
		</div>
		<div id="btnArea">
			<br>
			<a class='superBtn' id='memberInfo-btn'>個人資料</a><br>
			<br> <a class='superBtn' id='roleInfo-btn'>用戶資料</a><br>
			<br> <a class='superBtn'>出遊資料</a>
		</div>
		<div id="showAreaTop" class="text-effect">
			<div id="pushArea" class="text-effect">
				<div id="showArea" class="text-effect"></div>
			</div>
		</div>
	</div>


	<!-- 	<div class="underlay-photo"></div> -->
	<!-- 	<div class="underlay-black"></div> -->
		<script
			src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.14.3/umd/popper.min.js"
			integrity="sha384-ZMP7rVo3mIykV+2+9J3UJ46jBk0WLaUAdn689aCwoqbBJiSnjAK/l8WvCWPIPm49"
			crossorigin="anonymous"></script>
		<script
			src="https://stackpath.bootstrapcdn.com/bootstrap/4.1.3/js/bootstrap.min.js"
			integrity="sha384-ChfqqxuZUCnJSK3+MXmPNIyE6ZbWh2IMqE241rYiqJxyMiZ6OW/JmZQ5stwEULTy"
			crossorigin="anonymous"></script>
	<script>
	$(document).ready(function () {
        var str = "";
        $('#memberInfo-btn').on('click', function () {
            str = '<span>姓名</span><br>王大狗<br><br>' +
                '<span>性別</span><br>公狗<br><br>' +
                '<span>電話</span><br>0988888888<br><br>' +
                '<span>出生日期</span><br>____年__月<br><br>' +
                '<span>星座</span><br>大狗座<br><br>' +
                '<span>血型</span><br>AB型<br><br>' +
                '<span>居住地址</span><br>台北市_狗窩<br><br>' +
                '<span>興趣</span><br>打球<br><br>' +
                '<span>學歷</span><br>高中<br><br>' +
                '<span>學校</span><br>小山高中<br><br>' +
                '<span>公司</span><br>不顯示<br><br>' +
                '<span>職業</span><br>HR<br><br>' +
                '<span>收入情況</span><br>小康<br><br>';
            
            $("#showArea").css("border","0").addClass("animated").html(str);
        })

        $('#roleInfo-btn').on('click', function () {
            str = '<span>等級</span><br>1<br><br>' +
                '<span>經驗</span><br>400/500<br><br>' +
                '<span>登入次數</span><br>31<br><br>' +
                '<span>發文次數</span><br>5<br><br>' +
                '<span>出行次數</span><br>3<br><br>' +
                '<span>簽名</span><br>汪汪汪汪<br><br>' +
                '<span>自我介紹</span><br>大家好,我是汪<br><br>';

            $("#showArea").css("border","2px solid blanchedalmond").addClass("animated").html(str);

        })

        $('#showArea').on("animationend webkitAnimationEnd oAnimationEnd MSAnimationEnd", function () {
            $(this).removeClass("animated");
        });
    })
	</script>
</body>
</html>