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
<form method="POST" action="shopping">
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
			<span>(新台幣 300 元)</span>
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
			<input type="radio" name="orderItem" id="2300p" class="buy" value="2500點">
			<input type="text" name="orderPrice" value="1000" hidden="true">
			<label for="100p">2500點</label>
			<span>(新台幣 1000 元)</span>
			<input type="text" name="orderNum" value="1" hidden="true" style="width:45px">
		</li>
		<li>
			<input type="submit" value="信用卡購買">
		</li>
	</ul>
</form>
</div>
<div>
	
</div>
<script type="text/javascript">
	$("input[name=orderItem]").click(function(){
		$(this).siblings("input[name=orderNum]").attr("hidden",false);
		$(this).parent().find("input[name=orderNum]").attr("hidden",true);
	})
	
</script>
</body>
</html>