<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@taglib uri="http://www.springframework.org/tags/form" prefix="form" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>${account}的個人頁面</title>
<!-- 	<link href='http://fonts.googleapis.com/css?family=Raleway:400,100,200,300,500,600,700,800,900' rel='stylesheet' -->
<!--         type='text/css'> -->
    
<!--     <script src="js/skel.min.js"></script> -->
<!--     <script src="js/skel-panels.min.js"></script> -->
<!--     <script src="js/init.js"></script> -->

<!--     <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.1.3/css/bootstrap.min.css" -->
<!--         integrity="sha384-MCw98/SFnGE8fJT3GXwEOngsV7Zt27NXFoaoApmYm81iuXoPkFOJwJ8ERdknLPMO" crossorigin="anonymous"> -->
<script src="https://code.jquery.com/jquery-3.5.1.js"	integrity="sha256-QWo7LDvxbWT2tbbQ97B53yJnYU3WhH/C8ycbRAkjPDc="	crossorigin="anonymous"></script>
<!--     <link rel="stylesheet" href="css/style.css" /> -->
<link rel="stylesheet" href="<c:url value='css/memberpage.css' />" />

<!--     <link rel="stylesheet" type="text/css" href="path/to/css/bootstrap.min.css"> -->
<!-- <link rel="stylesheet" type="text/css" -->
<!-- 	href="path/to/css/bootstrap-directional-buttons.css"> -->
<!-- ====================Modal特效======================= -->
<link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.5.0/css/bootstrap.min.css" integrity="sha384-9aIt2nRpC12Uk9gS9baDl411NQApFmC26EwAOH8WgZl5MYYxFfc+NcPb1dKGj7Sk" crossorigin="anonymous">
<script src="https://code.jquery.com/jquery-3.5.1.slim.min.js" integrity="sha384-DfXdz2htPH0lsSSs5nCTpuj/zy4C+OGpamoFVy38MVBnE+IbbVYUew+OrCXaRkfj" crossorigin="anonymous"></script>
<script src="https://stackpath.bootstrapcdn.com/bootstrap/4.5.0/js/bootstrap.min.js" integrity="sha384-OgVRvuATP1z7JjHLkuOU7Xw704+h835Lr+6QL9UvYjZE3Ipu6Tp75j7Bh/kR0JKI" crossorigin="anonymous"></script>
<!-- ====================文字特效======================= -->
<%-- <link href="<c:url value='css/bootstrap.css' />" rel="stylesheet"> --%>
<link	href="https://fonts.googleapis.com/css?family=Cabin+Sketch:700&display=swap"rel="stylesheet">

<style>
  a.superBtn:hover {
	color: #2af1fc;
	text-shadow: 0 -1px 0 rgba(0, 0, 0, 0.8);
	background-image: url('data:image/svg+xml;base64,PD94bWwgdmVyc2lvbj0iMS4wIiBlbmNvZGluZz0idXRmLTgiPz4gPHN2ZyB2ZXJzaW9uPSIxLjEiIHhtbG5zPSJodHRwOi8vd3d3LnczLm9yZy8yMDAwL3N2ZyI+PGRlZnM+PGxpbmVhckdyYWRpZW50IGlkPSJncmFkIiBncmFkaWVudFVuaXRzPSJvYmplY3RCb3VuZGluZ0JveCIgeDE9IjAuNSIgeTE9IjAuMCIgeDI9IjAuNSIgeTI9IjEuMCI+PHN0b3Agb2Zmc2V0PSIwJSIgc3RvcC1jb2xvcj0iIzU0NTQ1NCIvPjxzdG9wIG9mZnNldD0iMTAwJSIgc3RvcC1jb2xvcj0iIzM3MzczOCIvPjwvbGluZWFyR3JhZGllbnQ+PC9kZWZzPjxyZWN0IHg9IjAiIHk9IjAiIHdpZHRoPSIxMDAlIiBoZWlnaHQ9IjEwMCUiIGZpbGw9InVybCgjZ3JhZCkiIC8+PC9zdmc+IA==');
	background-size: 100%;
	background-image: -webkit-gradient(linear, 50% 0%, 50% 100%, color-stop(0%, #545454), color-stop(100%, #373738));
	background-image: -moz-linear-gradient(#545454, #373738);
	background-image: -webkit-linear-gradient(#545454, #373738);
	background-image: linear-gradient(#545454, #373738);
  }
  
</style>
</head>
<!-- Header -->
<body>
<div>
	<jsp:include page="../header/header_guest.jsp" />
</div>

	<div class="homepage" style="background-image: url(images/memberBack.jpg);background-size: 100%;background-repeat: no-repeat;height: 1100px;">
		

		<div id="infoArea">
			<div id="info">
				<div id="pictureArea">${member.picture }</div>
				<div id="nicknameArea" class="text-effect">
					<p>
						<span>${member.nickname}</span> ( ${account} )
					</p>
					<p style="text-shadow:2px 2px 2px #00FF00">${member.mail}</p>
				</div>
			</div>
			<div id="btnArea">
				<br><a class='superBtn' id='memberInfo-btn'>個人資料</a><br>
				<br><a class='superBtn' id='roleInfo-btn'>用戶資料</a><br> 
				<br><a class='superBtn' id='trip-btn'>出遊資料</a><br>
				<br><a class='superBtn' id='update-btn'>修改資料</a>
			</div>
			<div id="showAreaTop" class="text-effect">
				<div id="pushArea" class="text-effect">
					<div id="showArea" class="text-effect"></div>
				</div>
			</div>
		</div>
		
<!-- 		Model UPDATE FORM     -->
		<div class="modal fade" id="updateForm" tabindex="-1" aria-labelledby="resultModalLabel" aria-hidden="true">
		  <div class="modal-dialog">
		    <div class="modal-content">
		      <div class="modal-header1">
<!-- 		        <button type="button" class="close" data-dismiss="modal" aria-label="Close"> -->
<!-- 		          <span aria-hidden="true">&times;</span> -->
<!-- 		        </button> -->
		      </div>
		      <div class="modal-body" style="">
						<form:form modelAttribute = "memberBean" method = "POST" >
							<div id = "update-header" class="text-effect1">
								<h3>${account}的個人資料</h3><hr>
								<td><form:input path = "account" type = "hidden" placeholder = "${account}"/>
							</div>
								<table class="tableForm">
								<tr>
									<td><form:label path = "password">密碼</form:label></td>
									<td><form:input path = "password" type = "password" id="pwd"/>
									<span id="seePwd">顯示密碼</span></td>
								</tr>
								<tr>
									<td><form:label path = "fullName">姓名</form:label></td>
									<td><form:input path = "fullName" type = "text" placeholder = "${member.fullName}"/></td>
								</tr>
								<tr>
									<td><form:label path = "nickname">暱稱</form:label></td>
									<td><form:input path = "nickname" type = "text" placeholder = "${member.nickname}"/></td>
								</tr>
								<tr>
									<td><form:label path = "gender">性別</form:label></td>
									<td><form:select path = "gender" id = "drop-select" placeholder = "${member.gender}">
											<form:option value="N" id="dropdown-list">不顯示</form:option>						    
											<form:option value="M" id="dropdown-list">男性</form:option>
											<form:option value="F" id="dropdown-list">女性</form:option>
									</form:select></td>
								</tr>
								<tr>
									<td><form:label path = "phone">電話</form:label></td>
									<td><form:input path = "phone" type = "text" placeholder = "${member.phone}"/></td>
								</tr>
								<tr>
									<td><form:label path = "birthYear">出生日期</form:label></td>
									<td><form:input path = "birthYear" size="5" maxlength="4" type = "text" placeholder = "${member.birthYear}"/>
										<form:select path = "birthMonth" id = "drop-select1" placeholder = "${member.birthMonth}">										
										<form:option id="dropdown-list" value = "不顯示" />
										<form:option id="dropdown-list" value = "1月" />
										<form:option id="dropdown-list" value = "2月"/>
										<form:option id="dropdown-list" value = "3月"/>
										<form:option id="dropdown-list" value = "4月"/>
										<form:option id="dropdown-list" value = "5月"/>
										<form:option id="dropdown-list" value = "6月"/>
										<form:option id="dropdown-list" value = "7月"/>
										<form:option id="dropdown-list" value = "8月"/>
										<form:option id="dropdown-list" value = "9月"/>
										<form:option id="dropdown-list" value = "10月"/>
										<form:option id="dropdown-list" value = "11月"/>
										<form:option id="dropdown-list" value = "12月"/>
									</form:select></td>
								</tr>
								<tr>
									<td><form:label path = "starSign">星座</form:label></td>
									<td><form:select path = "starSign" id = "drop-select" placeholder = "${member.starSign }">
										<form:option id="dropdown-list" value = "不顯示" />
										<form:option id="dropdown-list" value = "水瓶座" />
										<form:option id="dropdown-list" value = "雙魚座" />
										<form:option id="dropdown-list" value = "牡羊座" />
										<form:option id="dropdown-list" value = "金牛座" />
										<form:option id="dropdown-list" value = "雙子座" />
										<form:option id="dropdown-list" value = "巨蟹座" />
										<form:option id="dropdown-list" value = "獅子座" />
										<form:option id="dropdown-list" value = "處女座" />
										<form:option id="dropdown-list" value = "天秤座" />
										<form:option id="dropdown-list" value = "天蠍座" />
										<form:option id="dropdown-list" value = "摩羯座" />
									</form:select></td>
								</tr>
								<tr>
									<td><form:label path = "bloodType" >血型</form:label></td>
									<td><form:select path="bloodType" id = "drop-select" placeholder = "${member.bloodType}">
										<form:option id="dropdown-list" value = "不顯示" />
										<form:option id="dropdown-list" value = "A型" />
										<form:option id="dropdown-list" value = "B型" />
										<form:option id="dropdown-list" value = "O型" />
										<form:option id="dropdown-list" value = "AB型" />
									</form:select></td>
								</tr>
								<tr>
									<td><form:label path = "address">居住地址</form:label></td>
									<td><form:input path = "address" type = "text"/></td>
								</tr>
								<tr>
									<td><form:label path = "hobby">興趣</form:label></td>
									<td><form:input path = "hobby" type = "text"/></td>
								</tr>
								<tr>
									<td><form:label path = "education">學歷</form:label></td>
									<td><form:select path = "education" id = "drop-select" placeholder = "${member.education}">
										<form:option id="dropdown-list" value = "不顯示" />
										<form:option id="dropdown-list" value="國中"/>
										<form:option id="dropdown-list" value="高中職"/>
										<form:option id="dropdown-list" value="大學"/>
										<form:option id="dropdown-list" value="研究所"/>
										<form:option id="dropdown-list" value="博士"/>
									</form:select></td>
								</tr>
								<tr>
									<td><form:label path = "school">學校</form:label></td>
									<td><form:input path = "school" type = "text"/></td>
								</tr>
								<tr>
									<td><form:label path = "company">公司</form:label></td>
									<td><form:input path = "company" type = "text"/></td>
								</tr>
								<tr>
									<td><form:label path = "job">職業</form:label></td>
									<td><form:input path = "job" type = "text"/></td>
								</tr>
								<tr>
									<td><form:label path = "income">收入情形</form:label></td>
									<td><form:select path = "income" id = "drop-select" placeholder = "${member.income}">
										<form:option value="不顯示" id="dropdown-list" />
										<form:option value="富裕" id="dropdown-list" />
										<form:option value="小康" id="dropdown-list" />
										<form:option value="普通" id="dropdown-list" />
										<form:option value="清寒" id="dropdown-list" />
									</form:select></td>
								</tr>
								<tr>
									<td><form:label path = "picture">頭像</form:label></td>
						<%-- 			<form:input path = "picture" type = ""/> --%>
								</tr>
								<tr>
									<td><form:label path = "signature">簽名</form:label></td>
									<td><form:textarea path = "signature" type = "textarea" rows = "3" cols="30" style="resize: none;"/></td>
									
								</tr>
								<tr>
									<td><form:label path = "introduction">自我介紹</form:label></td>
									<td><form:textarea  path = "introduction" type = "textarea" rows = "8" cols="30"  style="resize: none;"/></td>
								</tr>
							</table>	
							<table class="tablebtn">
								<tr>
									<td><form:button type = "submit">更改</form:button></td>
									<td><form:button type = "reset">還原</form:button></td>
								</tr>
							</table>
						</form:form>	
		      </div>
		      <div class="modal-footer1">
		      </div>
		    </div>
		  </div>
		</div>
		
		
	</div>


	<script src="http://ajax.googleapis.com/ajax/libs/jquery/1.11.0/jquery.min.js"></script>
	<script>
	$(document)	.ready(	function() {
		var str = "";
		$('#memberInfo-btn')	.on('click',	function() {
			str = '<span>姓名</span><br>${member.fullName}<br><br>'
					+ '<span>性別</span><br>${member.gender}<br><br>'
					+ '<span>電話</span><br>${member.phone}<br><br>'
					+ '<span>出生日期</span><br>${member.birthYear}年${member.birthMonth}<br><br>'
					+ '<span>星座</span><br>${member.starSign}<br><br>'
				+ '<span>血型</span><br>${member.bloodType}<br><br>'
				+ '<span>居住地址</span><br>${member.address}<br><br>'
	 			+'<span>興趣</span><br>${member.hobby}<br><br>'
				+ '<span>學歷</span><br>${member.education}<br><br>'
				+ '<span>學校</span><br>${member.school}<br><br>'
				+ '<span>公司</span><br>${member.company}<br><br>'
				+ '<span>職業</span><br>${member.job}<br><br>'
				+ '<span>收入情況</span><br>${member.income}<br><br>';

			$("#showArea").css("border", "0").addClass("animated").html(str);
		})

		$('#roleInfo-btn').on('click', function() {
			str = '<span>等級</span><br>${role.level}<br><br>'
					+ '<span>經驗</span><br>${role.emp}<br><br>'
					+ '<span>登入次數</span><br>${role.signTrip}<br><br>'
					+ '<span>發文次數</span><br>${role.postTrip}<br><br>'
					+ '<span>出行次數</span><br>${role.finishTrip}<br><br>'
					+ '<span>簽名</span><br>${member.signature}<br><br>'
					+ '<span>自我介紹</span><br>${member.introduction}<br><br>';

			$("#showArea").css("border", "0").addClass("animated").html(str);
		})

		$('#trip-btn').on('click', function() {
			str = '旅遊連結';
			
			$.ajax({
				  url:"ajax_getFollowed",
				  type: "GET",
				  dataType: "html", //server送回
				  contentType: 'application/json; charset=utf-8',
				  data: {}, 
				  success:function(data){
					  $("#showAreaTop").css("border", "0").addClass("animated").html(str);
					  $(".showAreaTop").append(data);
					}
			})
		})

		$('#showArea').on("animationend webkitAnimationEnd oAnimationEnd MSAnimationEnd",function() {
			$(this).removeClass("animated");
		});
		
		$("#memberInfo-btn").on("click", function(){
			$("superBtn").css("color", "#0e0e0e");
			$("#memberInfo-btn").css("color", ":#2af1fc");
		})
		
		$("#update-btn").on("click",function(){
			 $('#updateForm').modal('show');
		})
		
//			checkpwd
		$("#seePwd").on("click",function(){
			if($("#pwd").attr("type")=="password"){
				$("#pwd").attr("type","text");
				$("#seePwd").text("隱藏密碼");
			}else{
				$("#pwd").attr("type","password");				
				$("#seePwd").text("顯示密碼");
			}
		})
		
// 		表單
		$('#drop-select').click(function () {
	        $('#dropdown-list').toggleClass('animate');
	    });
	    $('#dropdown-list li').click(function () {
	        $('#dropdown-list').removeClass('animate');
	        $('#drop-select').val(('#dropdown-list li').val());
	    });
		
	})
	

	</script>
</body>
</html>