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

	<div>
		<h2 class="sub-header">角色一覽</h2>
		<form id="searchform" method="get" action="#">
			<h6>&nbsp;&nbsp;搜尋</h6>
			<div>
				&nbsp;&nbsp;&nbsp;&nbsp;<input type="text" name="role" id="role"
					size="20" value="" placeholder="請輸入關鍵字尋找會員" />
				<button type="button" class="btn btn-outline-light btn-sm">確認</button>
			</div>
		</form>

		<div class="post newajaxlist">
			<div class="table-responsive">
			<table class="table table-striped">
				<thead>
					<tr>
						<th>帳號</th>
						<th>會員等級</th>
						<th>帳號狀態</th>
					</tr>
				</thead>
				<c:forEach var="CMS" items="${Roles}">
					<tbody>
						<tr>
							<input type="hidden" id="roleNo${CMS.roleNo}"
								value="${CMS.roleNo}" />
						<tr>
							<td>${CMS.account}</td>

							<td><select name="updateRole" id="level_op${CMS.roleNo}"
								onchange="update1(this)">
									<option value="" selected="selected" style="display: none;">最高管理者</option>
									<option value="1" ${CMS.level == "1"  ? 'selected' : ''}>1</option>
									<option value="2" ${CMS.level == "2"  ? 'selected' : ''}>2</option>
									<option value="3" ${CMS.level == "3"  ? 'selected' : ''}>3</option>
									<option value="4" ${CMS.level == "4"  ? 'selected' : ''}>4</option>
									<option value="5" ${CMS.level == "5"  ? 'selected' : ''}>5</option>
							</select></td>
							
							<td><select name="updateRole"
								id="accountType_op${CMS.roleNo}" onchange="update2(this)">
									<option value="" selected="selected" style="display: none;">帳號狀態</option>
									<option value="1" ${CMS.accountType == "1"  ? 'selected' : ''}>1</option>
									<option value="2" ${CMS.accountType == "2"  ? 'selected' : ''}>2</option>

							</select></td>


						</tr>
					</tbody>
				</c:forEach>
				</table>
			</div>
			</div>

		</div>
		<script>
			$(".btn-sm").click(function() { //關鍵字篩選

				var keywords = $("#role").val();
				$.ajax({
					url : "ajax_role_keyWords",
					type : "get",
					dataType : "html",
					contentType : 'application/json; charset=utf-8',
					data : {
						keyword : keywords
					},
					// 				  JSON.stringify(keywords),
					success : function(data) {

						console.log(data);
						$(".post").empty();
						$(".newajaxlist").empty();
						$(".newajaxlist").append(data);
					},
				})
			})

			// 	==================================

			function update1(id) {
				console.log(id.id.substring(8)); //把DIV  定義的ID 給他去掉字串 去蕪存菁
				console.log(id.value); //那個ID的值
				var queryid = id.id.substring(8); //搜尋的ID是哪一個
				var level = id.value; //宣告一個特定ID找到的內容
				// 			宣告LEVEL 並裝到roleB物件
				var roleB = {
					level : level,
				};

				$.ajax({
					url : "<c:url value='/ajax_updateRole?id=" + queryid
							+ "'/>",//搜尋ID  在之前宣告的已經確認是哪個ID
					data : JSON.stringify(roleB),
					type : "POST",
					contentType : 'application/json; charset=utf-8',
					// 			        <====================================================>
					success : function(data) {
						console.log(">>>" + data);
						// 					alert(data);
						if (data) {
							alert('更新成功'); //testing purposes
						} else {
							alert('更新失敗'); //testing purposes
						}
					},
				});
			}
		</script>

		<!-- 			<=============================================> -->
		<script>
			function update2(id) {
				console.log(id.id.substring(14)); //把DIV  定義的ID 給他去掉字串 去蕪存菁
				console.log(id.value); //那個ID的值
				var queryid = id.id.substring(14); //搜尋的ID是哪一個
				var accountType = id.value; //宣告一個特定ID找到的內容
				// 			宣告LEVEL 並裝到roleB物件
				var roleB = {
					accountType : accountType,
				};
				$.ajax({
					url : "<c:url value='/ajax_updateRole1?id=" + queryid
							+ "'/>",//搜尋ID  在之前宣告的已經確認是哪個ID
					data : JSON.stringify(roleB),
					type : "POST",
					contentType : 'application/json; charset=utf-8',
					// 			        <====================================================>
					success : function(data) {
						console.log(">>>" + data);
						// 					alert(data);
						if (data) {
							alert('更新成功'); //testing purposes
						} else {
							alert('更新失敗'); //testing purposes
						}
					},
				});
			}
		</script>

		<!-- 			<=============================================> -->
</body>
</html>