<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ page import="java.util.*,com.web.activity.model.ActivityBean"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn"%>
<!DOCTYPE html>
<html>
<head>
</head>
<body>
	<script src="https://code.jquery.com/jquery-3.5.1.js"
		integrity="sha256-QWo7LDvxbWT2tbbQ97B53yJnYU3WhH/C8ycbRAkjPDc="
		crossorigin="anonymous"></script>
	<%-- <form:form action="ajax_updateRole" method="post" modelAttribute="RoleBean"> --%>

	<h2 class="sub-header">角色一覽</h2>
	<form>
		<div class="table-responsive">
			<table class="table table-striped">
				<thead>
					<tr>
						<th>account</th>
						<th>level</th>
<!-- 						<th>emp</th> -->
						<th>accountType</th>
						<th>noticeType</th>
					</tr>
				</thead>
				<c:forEach var="CMS" items="${Roles}">
					<tbody>
					<tr><input type="hidden" id="roleNo${CMS.roleNo}"  value="${CMS.roleNo}" />
						<tr>
							<td>${CMS.account}</td>
							<%-- 							<td>${CMS.level}</td> --%>

							<td><select name="updateRole" id="level_op${CMS.roleNo}" onchange="update1(this)">
									<option value="" selected="selected" style="display: none;">會員等級</option>
									<option value="1" ${CMS.level == "1"  ? 'selected' : ''}>1</option>
									<option value="2" ${CMS.level == "2"  ? 'selected' : ''}>2</option>
									<option value="3" ${CMS.level == "3"  ? 'selected' : ''}>3</option>
									<option value="4" ${CMS.level == "4"  ? 'selected' : ''}>4</option>
							</select></td>
<%-- 														<td>${CMS.emp}</td> --%>
<%-- 							<td><input name="updateRole" type="text" id="emp_op${CMS.roleNo}" value="${CMS.emp}"></td> --%>
<%-- 														<td>${CMS.accountType}</td> --%>
							<td><select name="updateRole" id="accountType_op${CMS.roleNo}" onchange="update2(this)">
									<option value="" selected="selected" style="display: none;">帳號狀態</option>
									<option value="0" ${CMS.accountType == "0"  ? 'selected' : ''}>0</option>
									<option value="1" ${CMS.accountType == "1"  ? 'selected' : ''}>1</option>

							</select></td>
							<%-- 							<td>${CMS.noticeType}</td> --%>
							<td><select name="updateRole" id="noticeType_op${CMS.roleNo}" onchange="update3(this)">
									<option value="" selected="selected" style="display: none;">注意狀態</option>
									<option value="0" ${CMS.noticeType == "0"  ? 'selected' : ''}>0</option>
									<option value="1" ${CMS.noticeType == "1"  ? 'selected' : ''}>1</option>

							</select></td>


						</tr>
					</tbody>
				</c:forEach>
			</table>
		</div>
	</form>


	<!-- 	<tr> -->
	<!-- 	<td><a href="Javascript:;" class="updateMembers">修改會員</a></td> -->
	<!-- 	</tr> -->

	<%-- </form:form> --%>

	<script>
		function update1(id) {
			console.log(id.id.substring(8));   //把DIV  定義的ID 給他去掉字串 去蕪存菁
			console.log(id.value);          	//那個ID的值
			var queryid = id.id.substring(8);  //搜尋的ID是哪一個
			var level = id.value;				//宣告一個特定ID找到的內容
// 			宣告LEVEL 並裝到roleB物件
			var roleB={
				level:level,
			};
// 			leveldata["level"] = $("#id").val();
			$.ajax({
				url : "<c:url value='/ajax_updateRole?id="+queryid+"'/>",//搜尋ID  在之前宣告的已經確認是哪個ID
				data : JSON.stringify(roleB),					
				type : "POST",
				contentType: 'application/json; charset=utf-8',
				// 			        <====================================================>
				success : function(data) {
					console.log(">>>"+data);
// 					alert(data);
					if (data) {
						alert('更新成功'); //testing purposes
					} else {
						alert('更新失敗'); //testing purposes
					}
				},
// 						        error:   function(jqXHR, textStatus, errorThrown){ 
// 						            document.getElementById("message").innerHTML=errorThrown; 
// 						        }
			});
		}
	</script>

	<!-- 			<=============================================> -->
	<script>
		function update2(id){
			console.log(id.id.substring(14));   //把DIV  定義的ID 給他去掉字串 去蕪存菁
			console.log(id.value);          	//那個ID的值
			var queryid = id.id.substring(14);  //搜尋的ID是哪一個
			var accountType = id.value;				//宣告一個特定ID找到的內容
// 			宣告LEVEL 並裝到roleB物件
			var roleB={
				accountType:accountType,
			};
			$.ajax({
				url : "<c:url value='/ajax_updateRole1?id="+queryid+"'/>",//搜尋ID  在之前宣告的已經確認是哪個ID
				data : JSON.stringify(roleB),					
				type : "POST",
				contentType: 'application/json; charset=utf-8',
				// 			        <====================================================>
				success : function(data) {
					console.log(">>>"+data);
// 					alert(data);
					if (data) {
						alert('更新成功'); //testing purposes
					} else {
						alert('更新失敗'); //testing purposes
					}
				},
// 						        error:   function(jqXHR, textStatus, errorThrown){ 
// 						            document.getElementById("message").innerHTML=errorThrown; 
// 						        }
			});
		}
	</script>

	<!-- 			<=============================================> -->
	<script>
	function update3(id){
		console.log(id.id.substring(13));   //把DIV  定義的ID 給他去掉字串 去蕪存菁
		console.log(id.value);          	//那個ID的值
		var queryid = id.id.substring(13);  //搜尋的ID是哪一個
		var noticeType = id.value;				//宣告一個特定ID找到的內容
//			宣告LEVEL 並裝到roleB物件
		var roleB={
				noticeType:noticeType,
		};
		$.ajax({
			url : "<c:url value='/ajax_updateRole2?id="+queryid+"'/>",//搜尋ID  在之前宣告的已經確認是哪個ID
			data : JSON.stringify(roleB),					
			type : "POST",
			contentType: 'application/json; charset=utf-8',
			// 			        <====================================================>
			success : function(data) {
				console.log(">>>"+data);
//					alert(data);
				if (data) {
					alert('更新成功'); //testing purposes
				} else {
					alert('更新失敗'); //testing purposes
				}
			},
//						        error:   function(jqXHR, textStatus, errorThrown){ 
//						            document.getElementById("message").innerHTML=errorThrown; 
//						        }
		});
	}
	</script>



	<!-- // 			$(".area1").change(function() { //click event -->

	<!-- // 				$.ajax({ -->
	<!-- // 					url : "ajax_updateAllMembers", -->
	<!-- // 					type : "POST", -->
	<!-- // 					dataType : "html", //server送回 -->
	<!-- // 					contentType : 'application/json; charset=utf-8', -->
	<!-- // 					data : {}, //data空的代表沒任何參數 -->
	<!-- // 					success : function(data) { //成功的話 -->
	<!-- // 						$(".newajaxlist").empty(); -->
	<!-- // 						$(".newajaxlist").append(data); //透過導向的URL到ajax方法 div class裝東西 -->
	<!-- // 					} -->
	<!-- // 				}) -->
	<!-- // 			}) -->


</body>
</html>