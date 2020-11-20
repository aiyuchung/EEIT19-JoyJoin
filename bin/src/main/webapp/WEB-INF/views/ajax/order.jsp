<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ page import="java.util.*,com.web.activity.model.ActivityBean"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>
<!DOCTYPE html>
<html>
<head>
<style>
	#showAreaTop div{
		color:white;
	}
	
	#showAreaTop li{
		list-style-type:none;
		text-align:left;
	}
	
</style>
</head>
<body>

<div>

	<ul>
		<li>
			<input type="radio" name="orderItem" id="200p" class="buy" value="200點">
			<label for="200p">200點</label>
			<input type="text" name="orderPrice" value="100" hidden="true">
			<span>(新台幣 100 元)</span>
			<input type="text" name="orderNum" value="1" hidden="true" style="width:45px">
		</li>
		<li>
			<input type="radio" name="orderItem" id="700p" class="buy" value="700點">
			<input type="text" name="orderPrice" value="300" hidden="true">
			<label for="700p">700點</label>
			<span>(新台幣 300 元) &nbsp;&nbsp;</span>
			<input type="text" name="orderNum" value="1" hidden="true" style="width:45px">
		</li>
		<li>
			<input type="radio" name="orderItem" id="1200p" class="buy" value="1200點">
			<input type="text" name="orderPrice" value="500" hidden="true">
			<label for="1200p">1200點</label>
			<span>(新台幣 500 元)</span>
			<input type="text" name="orderNum" value="1" hidden="true" style="width:45px">
		</li>
		<li>
			<input type="radio" name="orderItem" id="2500p" class="buy" value="2500點">
			<input type="text" name="orderPrice" value="1000" hidden="true">
			<label for="2500p">2500點</label>
			<span>(新台幣 1000 元)</span>
			<input type="text" name="orderNum" value="1" hidden="true" style="width:45px">
<!-- 			<input id="ooo" style="display:none" value=""> -->
<!-- 			<input id="oAA" style="display:none" value=""> -->
<!-- 			<input id="oSS" style="display:none" value=""> -->
		</li>
		<li>
			<button id="submit">信用卡購買</button>
		</li>
	</ul>

</div>
<div id="ecpay" ></div>
<div>
	
</div>
<script src="http://ajax.googleapis.com/ajax/libs/jquery/1.11.0/jquery.min.js"></script>
	
<script type="text/javascript">
	

	$("input[name=orderItem]").click(function(){
		
// 		console.log($(this).val());
// 		var abs = $(this).val()
// 		console.log(abs)
// 		$("#ooo").val(abs);
// 		var SCB = $("#ooo").val(abs);
// 		console.log(SCB)
// 		$("#oAA").val($(this).siblings("input[name=orderPrice]").val());
// 		$("#oSS").val($(this).siblings("input[name=orderNum]").val());
		
// 		console.log($("#ooo").val(abs))
// 		console.log($("#oAA").val($(this).siblings("input[name=orderPrice]").val()))
		
		
// 		console.log($(this).siblings("input[name=orderPrice]").val());
// 		console.log($(this).siblings("input[name=orderNum]").val());
		$(this).parents("ul").find("input[name=orderNum]").attr("hidden",true);
		if ($(this).parent().find("input[name=orderItem]").is(":checked")){
			$(this).siblings("input[name=orderNum]").attr("hidden",false);
			
		}
	})
	
	$("#submit").click(function(){
		var param = {};
		var num ;
		var item ;
		var price;
		$("input[name=orderItem]").each(function(){
			if ($(this).is(":checked")){
				num = $(this).siblings("input[name=orderNum]").val();
				item = $(this).val();
				price= $(this).siblings("input[name=orderPrice]").val();
			}
		})
		param.num = num;
				param.item = item;
				param.price = price;
	
// 		var param = {};
// 		var num = $(this).siblings("input[name=orderNum]").val();
// 		var item = $(this).val();
// 		var price= $(this).siblings("input[name=orderPrice]").val();
		
// 		param.num = num;
// 		param.item = item;
// 		param.price = price;
		console.log("outside"+param);
		var xhr = new XMLHttpRequest();
		xhr.open("POST","<c:url value='/shopping'/>",true);
		xhr.setRequestHeader('Content-type','application/json;charset=utf-8');
		xhr.send(JSON.stringify(param))
		
		xhr.onreadystatechange = function(){
			if(xhr.readyState == 4 && xhr.status == 200){
				console.log(xhr.responseText)
				
				var obj = JSON.parse(xhr.responseText);
				$("#ecpay").append(obj.pay);
			}
		}
		
		
		
		
		
		
// 		 $.ajax({
//              url:"shopping",
//              type: "POST",
//              dataType: "JSON", //server送回
// //              contentType: 'application/json; charset=utf-8',
				
//              data: {
// 					num: parseInt(num),
// 					item: item,
// 					price: parseInt(price),
// 				},
// //             	 JSON.stringify(thisorder),
//              success:function(data){
//                  $("#gotogreen").append(data.pay);
//                }
      
		
		
	})
</script>
</body>
</html>