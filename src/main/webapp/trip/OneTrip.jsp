<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>活 動 明 細</title>
<script src="https://code.jquery.com/jquery-3.5.1.js"
	integrity="sha256-QWo7LDvxbWT2tbbQ97B53yJnYU3WhH/C8ycbRAkjPDc="
	crossorigin="anonymous"></script>
</head>
<body>
<div align="center">
<h2>活 動 明 細</h2>
<form id="form2" action="" method="post" >
<table>
	
	<tr><td>活動編號</td>
		<td><input type="text" name="tripNo" readonly value="${trip.tripNo}"></td>
	<tr><td>類別</td>
		<td>
		<label for="today"><input type="radio" id="today" class="tripClass" name="tripClass" value="class_01" ${trip.tripClassNo == 'class_01' ? 'checked' : ''}>當日行程</label>
		<label for="days"><input type="radio" id="days"class="tripClass" name="tripClass" value="class_02" ${trip.tripClassNo == 'class_02' ? 'checked' : ''}>過夜旅遊</label>
		<!-- <input type="text" name="tripClass" value="${trip.tripClass}">  -->
		</td>
	<tr><td>性質</td>
		<td>
			<select name="tripType" id="tripType">
				<option value="">請選擇</option>

			</select>
		<!-- <input type="text" name="tripType" value="${trip.tripType}">-->
		</td>
	<tr><td>名稱</td>
		<td><input type="text" name="tripName" value="${trip.tripName}"></td>
	<tr><td>地區</td>
		<td>
			<select name="tripLocation" id="tripLocation">
				<option class="tripLocation" value="">請選擇</option>
				<option class="tripLocation" value="北" ${trip.tripLocation == '北' ? 'selected' : ''}>北部</option>
				<option class="tripLocation" value="中" ${trip.tripLocation == '中' ? 'selected' : ''}>中部</option>
				<option class="tripLocation" value="南" ${trip.tripLocation == '南' ? 'selected' : ''}>南部</option>
				<option class="tripLocation" value="東" ${trip.tripLocation == '東' ? 'selected' : ''}>東部</option>
				<option class="tripLocation" value="福建省" ${trip.tripLocation == '福建省' ? 'selected' : ''}>福建省</option>
			</select>
		<!--<input type="text" name="tripLocation" value="${trip.tripLocation}">-->
		</td>
	<tr><td>縣市</td>
		<td>
			<select name="tripProv" id="tripProv">
				<option value="">請選擇</option>
			</select>
		<!--<input type="text" name="tripProv" value="${trip.tripProv}">-->
		</td>
	<tr><td>日期</td>
		<td><input type="text" name="tripDate" value="${trip.tripDate}"></td>
	<tr><td>費用</td>
		<td><input type="text" name="tripFee" value="${trip.tripFee}"></td>
	<tr><td><input type="button" value="確認修改" class="subbtn"></td>
		<td><input type="button" value="回首頁" onclick="javascript:location.href='${pageContext.request.contextPath}/trip/homePage.jsp'">	
		</td></tr>
	
</table>
</form>
</div>
<script>
	$(".subbtn").on("click",function(){
		var url = "${pageContext.request.contextPath}/trip/UpdateController";
		$("#form2").attr("action",url);
		$("#form2").submit();
	})
	
	$(document).ready(function() {
		var classNo = $('input[name=tripClass]:checked').val();
		var typeNo = '${trip.tripTypeNo}';
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
                	if (typeNo == item.tripTypeNo) {
                		$("#tripType").append('<option value="' + item.tripTypeNo + '" selected>' + item.tripTypeName + '</option>');
                	} else {
                		$("#tripType").append('<option value="' + item.tripTypeNo + '">' + item.tripTypeName + '</option>');
                	}
				}
            }
        })
        
        let northProv = ["台北市", "新北市", "基隆市", "宜蘭縣", "桃園市", "新竹市", "新竹縣"];
		let westProv = ["台中市", "苗栗縣", "彰化縣", "南投縣", "雲林縣"];
		let southProv =["高雄市", "台南市", "嘉義市", "嘉義縣", "屏東縣", "澎湖縣"];
		let eastProv = ["花蓮縣", "台東縣"];
		let outProv = ["金門縣", "連江縣"];
		
		var city = '${trip.tripProv}';
		$("#tripProv").val(city);
		
		if ($('#tripLocation option:selected').val() == "北"){
			$.each(northProv, function(i,val){
				if (city == val) {
					$("#tripProv").append('<option selected>' +val + '</option>');
				} else {
					$("#tripProv").append('<option >' +val + '</option>');
				}
			})
		}
		else if ($('#tripLocation option:selected').val() == "中"){
			$.each(westProv, function(i,val){
				if (city == val) {
					$("#tripProv").append('<option selected>' +val + '</option>');
				} else {
					$("#tripProv").append('<option >' +val + '</option>');
				}
			})
		}
		else if ($('#tripLocation option:selected').val() == "南"){
			$.each(southProv, function(i,val){
				if (city == val) {
					$("#tripProv").append('<option selected>' +val + '</option>');
				} else {
					$("#tripProv").append('<option >' +val + '</option>');
				}
			})
		} else if ($('#tripLocation option:selected').val() == "東"){
			$.each(eastProv, function(i,val){
				if (city == val) {
					$("#tripProv").append('<option selected>' +val + '</option>');
				} else {
					$("#tripProv").append('<option >' +val + '</option>');
				}
			})
		} else if ($('#tripLocation option:selected').val() == "福建省"){
			$.each(outProv, function(i,val){
				if (city == val) {
					$("#tripProv").append('<option selected>' +val + '</option>');
				} else {
					$("#tripProv").append('<option >' +val + '</option>');
				}
			})
		}
        
	});

</script>

</body>
</html>