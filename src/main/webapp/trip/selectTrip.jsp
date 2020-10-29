<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8" import="java.util.*,com.web.activity.model.ActivityBean"%>
	<!DOCTYPE html>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<html>
<head>
<meta charset="UTF-8">
<title>員工資料</title>
<link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.1.3/css/bootstrap.min.css" 
	integrity="sha384-MCw98/SFnGE8fJT3GXwEOngsV7Zt27NXFoaoApmYm81iuXoPkFOJwJ8ERdknLPMO" 
	crossorigin="anonymous">
<script src="https://code.jquery.com/jquery-3.5.1.js"
	integrity="sha256-QWo7LDvxbWT2tbbQ97B53yJnYU3WhH/C8ycbRAkjPDc="
	crossorigin="anonymous"></script>


</head>
<body style="background-color: lightblue">

	<div align="center">
		<h2>活 動 清 單</h2>
		<form id="form1" method="get" action=''>
			<table border="1" id="myTable" class="table-striped">
				<tr>
					<th scope="col">活動編號
					<th scope="col">類別
					<th scope="col">性質
					<th scope="col">名稱
					<th scope="col">縣市
					<th scope="col">日期
					<th scope="col">修改
					<th scope="col">刪除
				</th>
				<c:forEach var="all" items="${trips}">
					<tr>
						<td><c:out value="${all.getTripNo()}" />
						<td><c:out value="${all.getTripClass()}" />
						<td><c:out value="${all.getTripType()}" />
						<td><c:out value="${all.getTripName()}" />
						<td><c:out value="${all.getTripProv()}" />
						<td><c:out value="${all.getTripDate()}" />
						<td><button type="button" class="btn btn-info btn-sm subbtn">
   							 修改</button>
					<!--	<td><input type="button" value="修改" class="subbtn"> !-->
					<!--	<td><input type="button" value="刪除" class="delbtn"> !-->
						<td><button type="button" class="btn btn-info btn-sm del-btn" data-toggle="modal" data-target="#myModal">
   							 刪除</button>
					</tr>
				</c:forEach>
			</table>
			<div>
				<input type="button" value="回首頁" 
				onclick="javascript:location.href='${pageContext.request.contextPath}/trip/homePage.jsp'">
			</div>
		</form> 
	</div>

	<div class="modal fade" id="myModal" tabindex="-1" role="dialog" aria-labelledby="myModalLabel">
	    <div class="modal-dialog" role="document">
	        <div class="modal-content">
	            <div class="modal-header">
	                <button type="button" class="close" data-dismiss="modal" aria-label="Close">
	              <!-- 	<span class="modal-title" id="myModalLabel">Modal title</span> !-->
	                    <span aria-hidden="true">×</span>
	                </button>
	                
	            </div>
	            <div class="modal-body" >
	                <p id="alertText">123456</p>
	            </div>
	            <input type="hidden" id="del_no">
	            <div class="modal-footer">
	                <button type="button" class="btn btn-default" data-dismiss="modal">取消</button>
	                <button type="button" class="btn btn-primary confirm-btn">刪除</button>
	            </div>
	        </div>
	    </div>
	</div>
<!--  		<h3>總共筆員工資料</h3>    -->
<script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.14.3/umd/popper.min.js" integrity="sha384-ZMP7rVo3mIykV+2+9J3UJ46jBk0WLaUAdn689aCwoqbBJiSnjAK/l8WvCWPIPm49" crossorigin="anonymous"></script>
<script src="https://stackpath.bootstrapcdn.com/bootstrap/4.1.3/js/bootstrap.min.js" integrity="sha384-ChfqqxuZUCnJSK3+MXmPNIyE6ZbWh2IMqE241rYiqJxyMiZ6OW/JmZQ5stwEULTy" crossorigin="anonymous"></script>
<script>
	$(".subbtn").on("click",function(){
		let theNo = $(this).parents("tr").children("td").eq(0).text();
		window.location.href = 
			"${pageContext.request.contextPath}/trip/SelectOneController?tripNo="+theNo;
	})
	$(".del-btn").on("click",function(){
		let theNo = $(this).parents("tr").children("td").eq(0).text();
		let meg = "確定刪除 編號:" + String(theNo).substring(0,2) +" 資料?"
		$("#alertText").text(meg);
		$("#del_no").val(theNo);
	})
	$(".confirm-btn").on("click",function(){
		let theNo = $("#del_no").val();
		window.location.href = 
				"${pageContext.request.contextPath}/trip/DeleteController?tripNo="+theNo;
	})
	//$('#myModal').on('show.bs.modal', function (e) {
	//	let theNo = $(this).parents("tr").children("td").eq(0).text();
	//	let meg = "確定刪除 編號:" + String(theNo) +" 資料?"
	//	$("#alertText").text(meg);
	//})	

	$('#myModal').modal({
		show :false,
		backdrop : false,
		keyboard : false,
		remote : 'index.html',
		}); 


</script>
</body>
</html>