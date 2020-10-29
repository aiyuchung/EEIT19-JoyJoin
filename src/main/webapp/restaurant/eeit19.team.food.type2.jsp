<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"
	import="java.util.*,com.web.activity.model.FoodBean"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>Choose a favorite itinerary</title>
<link rel="stylesheet"	href="${pageContext.request.contextPath}/css/mainpage.css">
<script src="https://code.jquery.com/jquery-3.5.0.js"></script>
<style>
</style>
</head>
<body>
	<div class="back" style="background-image:url('${pageContext.request.contextPath}/restaurant/img/Date.jpg')"></div>
	<div class="view">
		<a href="${pageContext.request.contextPath}/restaurant/eeit19.team.food.insert.jsp" style="float:right">建立活動</a><br>
		<br><span id="back4" style="float:right">全部</span>
		<div class="list">
			<c:forEach var="food" items="${rest}">
				<div style="top: 5px; left: 8px; float: left; width: 48%;">
					<form style="width: 100%;">
						<table>
							<tr>
								<th colspan="2" class="catchOne">
								<c:out value="${food.getItineraryNo()}" /></th>
								<th><input type="button" value="修改" class="upd"></th>
								<th><input type="button" value="刪除" class="del"></th>
							</tr>
							<tr>
								<td rowspan="5" style="width: 120px"><img src='img/nopic.jpg'/></td>
								<td colspan="3" style="font-size: 25px" class="catchOne">
								<c:out value="${food.getRestaurantName()}" /></td>
							</tr>
							<tr>
								<td style="width: 170px"><c:out
										value="${food.getItineraryType()}" /></td>
							</tr>
							<tr>
								<td><c:out value="${food.getRestaurantType()}" /></td>
							</tr>
							<tr>
								<td></td>
								<td colspan="2" style="text-align: right;"><c:out
										value="${food.getAveragePrice()}" /></td>
							</tr>
						</table>
					</form>
				</div>
			</c:forEach>
		</div>
		<form class="fselect">
			<fieldset id="L1">
				<legend>行程類型</legend>
				<p id="back1">親友聚餐</p>
				<p id="back2" style="background-color:red;color:white">情侶約會</p>
				<p id="back3">高檔餐廳</p>
			</fieldset>
		</form>

		<form class="fselect">
			<fieldset id="L2">
				<legend>餐廳種類</legend>
				<p>中式料理</p>
				<p>日式料理</p>
				<p>美式料理</p>
				<p>法式料理</p>
				<p>義式料理</p>
				<p>南洋料理</p>
				<p>熱炒小吃</p>
			</fieldset>
		</form>

		<form class="fselect">
			<fieldset id="L3">
				<legend>平均價位</legend>
				<p>$~300</p>
				<p>$300~$1000</p>
				<p>$1000~$2000</p>
				<p>$2000~</p>
			</fieldset>
		</form>
	</div>
	
	<script>
		$(".catchOne").on("click",function(){
			let NO=$(this).parents("table").find("th").eq(0).text();
			window.location.href="${pageContext.request.contextPath}/Food_SelectOne?itineraryNo="+NO;

		})
		
		$(".del").on("click",function(){
			let NO=$(this).parents("table").find("th").eq(0).text();
			if(confirm("確定刪除?")){
				window.location.href="${pageContext.request.contextPath}/Food_Delete?itineraryNo="+NO;
			}
		})
		
		$(".upd").on("click",function(){
			let NO=$(this).parents("table").find("th").eq(0).text();
			window.location.href="${pageContext.request.contextPath}/Food_keyin?itineraryNo="+NO;
		})
		

		if (!$("p").hasClass("red")) {
            $("p").mouseenter(function () { $("p").removeClass("green"); $(this).addClass("green") })
                .mouseout(function () { $("p").removeClass("green") })
        }

        $("#L1>p").on("click", function () { $("#L1>p").removeClass("red"); $(this).addClass("red"); })
        $("#L2>p").on("click", function () { $("#L2>p").removeClass("red"); $(this).addClass("red"); })
        $("#L3>p").on("click", function () { $("#L3>p").removeClass("red"); $(this).addClass("red"); })

        $("#back1").on("click", function(){window.location.href = "${pageContext.request.contextPath}/TypeSelect_1"})
        $("#back3").on("click", function(){window.location.href = "${pageContext.request.contextPath}/TypeSelect_3"})
        $("#back4").on("click", function(){window.location.href = "${pageContext.request.contextPath}/Food_SelectAll"})

	</script>
</body>
</html>