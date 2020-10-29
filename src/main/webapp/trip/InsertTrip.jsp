<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>新 增</title>
<script src="https://code.jquery.com/jquery-3.5.1.js"
	integrity="sha256-QWo7LDvxbWT2tbbQ97B53yJnYU3WhH/C8ycbRAkjPDc="
	crossorigin="anonymous"></script>
</head>
<body>
<form method="post" action="../trip/InsertController">
<div align="center">
<h2>新 增 活 動</h2>

<table>

	<tr><td>類別</td>
		<td>
			<label for="today"><input type="radio" id="today" class="tripClass" name="tripClass" value="class_01">當日行程</label>
			<label for="days"><input type="radio" id="days"class="tripClass" name="tripClass" value="class_02">過夜旅遊</label>
		</td>
	<tr><td>性質</td>
		<td>
			<select name="tripType" id="tripType">
				<option value="">請選擇</option>
			</select>
		</td>
	<tr><td>名稱</td>
		<td><input type="text" name="tripName" ></td>
	<tr><td>地區</td>
		<td>
		<select name="tripLocation" id="tripLocation">
			<option class="tripLocation" value="">請選擇</option>
			<option class="tripLocation" value="北">北部</option>
			<option class="tripLocation" value="中">中部</option>
			<option class="tripLocation" value="南">南部</option>
			<option class="tripLocation" value="東">東部</option>
			<option class="tripLocation" value="福建省">福建省</option>
			</select>
		</td>
	<tr><td>縣市</td>
		<td>
			<select name="tripProv" id="tripProv">
				<option value="">請選擇</option>
			</select>
		</td>
	<tr><td>日期</td>
		<td><input type="text" name="tripDate" ></td>
	<tr><td>費用</td>
		<td><input type="text" name="tripFee" ></td>

</table>
</div>	
<div align="center">
<input type="submit" name="submit" value="確認">
<input type="reset" name="reset" value="取消">
</div>
<div align="center">
<input type="button" value="回首頁" onclick="javascript:location.href='${pageContext.request.contextPath}/trip/homePage.jsp'">
</div>
</form>
<script>

	$('.tripClass').change(function() {
		var classNo = $('input[name=tripClass]:checked').val();
		$.ajax({
            type: "post", //傳送方式
            url: "${pageContext.request.contextPath}/trip/typeList", //傳送目的地
            dataType: "json", //資料格式
            data: { //傳送資料
            	classNo: classNo, //表單欄位 classNo
            },
            success: function(data) {
            	$("#tripType").empty();
            	$("#tripType").append('<option value="">請選擇</option>');
                for (let item of data){
                	$("#tripType").append('<option value="' + item.tripTypeNo + '">' + item.tripTypeName + '</option>');
				}
            }
        })
	});
	
	$('#tripLocation').change(function() {
		let northProv = ["台北市", "新北市", "基隆市", "宜蘭縣", "桃園市", "新竹市", "新竹縣"];
		let westProv = ["台中市", "苗栗縣", "彰化縣", "南投縣", "雲林縣"];
		let southProv =["高雄市", "台南市", "嘉義市", "嘉義縣", "屏東縣", "澎湖縣"];
		let eastProv = ["花蓮縣", "台東縣"];
		let outProv = ["金門縣", "連江縣"];
		if ($('#tripLocation option:selected').val() == "北"){
			$("#tripProv").empty();
			$.each(northProv, function(i,val){
				$("#tripProv").append('<option >' +val + '</option>');
			})
		}
		else if($('#tripLocation option:selected').val() == "中"){
			$("#tripProv").empty();
			$.each(westProv, function(i,val){
				$("#tripProv").append('<option >' +val + '</option>');
			})
		}
		else if($('#tripLocation option:selected').val() == "南"){
			$("#tripProv").empty();
			$.each(southProv, function(i,val){
				$("#tripProv").append('<option >' +val + '</option>');
			})
		}else if($('#tripLocation option:selected').val() == "東"){
			$("#tripProv").empty();
			$.each(eastProv, function(i,val){
				$("#tripProv").append('<option >' +val + '</option>');
			})
		}else if($('#tripLocation option:selected').val() == "福建省"){
			$("#tripProv").empty();
			$.each(outProv, function(i,val){
				$("#tripProv").append('<option >' +val + '</option>');
			})
		}
	});


//$('input[name=radio使用的name的值]:checked').val()
</script>
</body>
</html>