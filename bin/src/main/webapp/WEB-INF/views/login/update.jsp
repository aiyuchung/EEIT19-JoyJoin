<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib uri="http://www.springframework.org/tags/form" prefix="form" %>    
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>UPDATE FORM PAGE</title>
	<script src="https://code.jquery.com/jquery-3.5.1.js"></script>
</head>
<body>
	<form:form modelAttribute = "memberBean" method = "POST">
		<div id = "update-header">
			<h3>修改${account}的個人資料</h3><hr>
			<form:input path = "account" type = "hidden" placeholder = "${account}"/>
		</div>
		<div>
			<form:label path = "password">密碼</form:label>
			<form:input path = "password" type = "text"/>
		</div>
		<div>
			<form:label path = "fullName">姓名</form:label>
			<form:input path = "fullName" type = "text" placeholder = "${member.fullName}"/>
		</div>
		<div>
			<form:label path = "nickname">暱稱</form:label>
			<form:input path = "nickname" type = "text" placeholder = "${member.nickname}"/>
		</div>
		<div>
			<form:label path = "gender">性別</form:label>
			<form:radiobutton path="gender" value="M" label="男生" /> 
			<form:radiobutton path="gender" value="F" label="女生" /> 
			<form:radiobutton path="gender" value="N" label="不顯示" />
		</div>
		<div>
			<form:label path = "phone">電話</form:label>
			<form:input path = "phone" type = "text" placeholder = "${member.phone}"/>
		</div>
		<div>
			<form:label path = "birthYear">出生年份</form:label>
			<form:input path = "birthYear" type = "text" placeholder = "${member.birthYear}"/>
		</div>
		<div>
			<form:label path = "birthMonth">出生月份</form:label>
			<form:select path = "birthMonth">
				<form:option value = "1"/>
				<form:option value = "2"/>
				<form:option path = "birthMonth" value = "3"/>
				<form:option path = "birthMonth" value = "4"/>
				<form:option path = "birthMonth" value = "5"/>
				<form:option path = "birthMonth" value = "6"/>
				<form:option path = "birthMonth" value = "7"/>
				<form:option path = "birthMonth" value = "8"/>
				<form:option path = "birthMonth" value = "9"/>
				<form:option path = "birthMonth" value = "10"/>
				<form:option path = "birthMonth" value = "11"/>
				<form:option path = "birthMonth" value = "12"/>
			</form:select>
		</div>
		<div>
			<form:label path = "starSign">星座</form:label>
			<form:input path = "starSign" type = "text" placeholder = "${member.starSign }"/>
		</div>
		<div>
			<form:label path = "bloodType">血型</form:label>
			<form:radiobutton path="bloodType" value="A" label="A" />
			<form:radiobutton path="bloodType" value="B" label="B" /> 
			<form:radiobutton path="bloodType" value="O" label="O" /> 
			<form:radiobutton path="bloodType" value="AB" label="AB" />
		</div>
		<div>
			<form:label path = "address">居住地址</form:label>
			<form:input path = "address" type = "text"/>
		</div>
		<div>
			<form:label path = "hobby">興趣</form:label>
			<form:input path = "hobby" type = "text"/>
		</div>
		<div>
			<form:label path = "education">學歷</form:label>
			<form:select path = "education">
				<form:option path="education" value="N" label="不顯示" />
				<form:option path="education" value="國中" label="國中" />
				<form:option path="education" value="高中職" label="高中職" />
				<form:option path="education" value="大學" label="大學" />
				<form:option path="education" value="研究所" label="研究所" />
				<form:option path="education" value="博士" label="博士" />
			</form:select>
		</div>
		<div>
			<form:label path = "school">學校</form:label>
			<form:input path = "school" type = "text"/>
		</div>
		<div>
			<form:label path = "company">公司</form:label>
			<form:input path = "company" type = "text"/>
		</div>
		<div>
			<form:label path = "job">職業</form:label>
			<form:input path = "job" type = "text"/>
		</div>
		<div>
			<form:label path = "income">收入情形</form:label>
			<form:select path = "income">
				<form:option value="不顯示" label="不顯示" />
				<form:option value="富裕" label="富裕" />
				<form:option value="小康" label="小康" />
				<form:option value="普通" label="普通" />
				<form:option value="清寒" label="清寒" />
			</form:select>
		</div>
		<div>
			<form:label path = "picture">頭像</form:label>
<%-- 			<form:input path = "picture" type = ""/> --%>
		</div>
		<div>
			<form:label path = "signature">簽名</form:label>
			<form:input path = "signature" type = "textarea" rows = "3" resize = "none"/>
			
		</div>
		<div>
			<form:label path = "introduction">自我介紹</form:label>
			<form:input path = "introduction" type = "textarea" rows = "8" resize = "none"/>
		</div>
		<div>
			<form:button type = "submit" value = "">送出更改</form:button>
		</div>
	</form:form>
</body>
</html>