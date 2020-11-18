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
		<table>
			<thead>
				<tr>
					<td>購買項目</td>
					<td>價格</td>
					<td>數量</td>
				</tr>
			</thead>
			<tbody>
				<tr>
					<td>${order.orderItem}</td>
					<td>${order.orderPrice}</td>
					<td>${order.orderNum}</td>
				</tr>
				<tr>
					<td></td>
					<td>訂單編號</td>
					<td>${order.orderNo}</td>
				</tr>
				<tr>
					<td></td>
					<td>總價</td>
					<td>${orderTotal}</td>
				</tr>
				<tr>
					
					<td colspan="1.5"><button id="topay">確認支付</button></td>
					<td colspan="1.5"><button id="nottopay">取消訂單</button></td>
				</tr>
				
			</tbody>
		</table>
	</div>
	<div id="gotogreen">
	</div>
	
<script type="text/javascript">
	$("#topay").click(function(){
		$("#gotogreen").append(${creditPay.pay});
	})
	
</script>
</body>
</html>