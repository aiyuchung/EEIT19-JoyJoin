<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" import="java.util.* ,com.web.activity.model.CustomerBean"%>
  <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>客戶資料</title>
<script src="https://code.jquery.com/jquery-3.5.1.js"
        integrity="sha256-QWo7LDvxbWT2tbbQ97B53yJnYU3WhH/C8ycbRAkjPDc=" crossorigin="anonymous"></script>
<script src="js/sel.js"></script>      
<script src="http://static.runoob.com/assets/jquery-validation-1.14.0/lib/jquery.js"></script>
<script src="http://static.runoob.com/assets/jquery-validation-1.14.0/dist/jquery.validate.min.js"></script>
</head>

<body style="background-color:#D0D0D0">
<div align="center">
	<h2>客戶資料</h2>
<jsp:useBean  id="cus" scope="request" class="com.web.activity.model.CustomerBean"/>
	<form id="form1" action="http://localhost:8080/servlet/update" method="post">	
	<table>
		<tr><td>號
  	  	<td><input type="text"  name="entityID" readonly value="${cus.entityID}"> 
		<tr><td>帳號<td><input type="text" name="loginId" maxlength="10" value="${cus.loginId}">
		<tr><td>暱稱<td><input type="text" name="name" maxlength="12" value="${cus.name}">
		<tr><td>密碼<td><input type="password" name="password" maxlength="12" value="${cus.password}">
		<tr><td>信箱<td><input type="text" name="email" value="${cus.email}">
		<tr><td>手機<td><input type="text" name="pho" maxlength="10" value="${cus.pho}">
		<tr><td>出生日期<td><input type="date" name="birth" value="${cus.birthDate}">
		<tr><td>性別<td><input type="radio" name="gender" id="m" value="m"  ${cus.gender == 'm' ? 'checked' : ''}><label>男</label>
					   <input type="radio" name="gender" id="f" value="f"  ${cus.gender == 'f' ? 'checked' : ''}><label>女</label>
		<tr><td>婚姻狀況<td><input type="radio" name="maritalStatus" id="s" value="s" ${cus.maritalStatus == 's' ? 'checked' : ''}><label>未婚</label>
					      <input type="radio" name="maritalStatus" id="m" value="m" ${cus.maritalStatus == 'm' ? 'checked' : ''}><label>已婚</label>						  
		<tr><td>身高<td><input type="text" name="height" value="${cus.height}">
		<tr><td>體重<td><input type="text" name="weight" value="${cus.weight}">
		<tr><td>學歷<td><input type="text" name="education" value="${cus.education}">
		<tr><td>收入<td><input type="text" name="salaried" value="${cus.salaried}">
		<tr><td>照片<td><input type="file" name="file" multiple  value="${cus.file}">
	
		<div>
			<input type="submit" name="updatempno" value="更新" class="update" />
			<p><input type="button" value="回首頁" class="select" ></p>
		</div>
	</table>	
	</form>
	
</div>
	
 <script >
	jQuery.validator.addMethod("byteRangeLength", function(value, element, param) {
	    var length = value.length;
	    for(var i = 0; i < value.length; i++){
	        if(value.charCodeAt(i) > 127){
	            length++;
	        }
	    }
	  return this.optional(element) || ( length >= param[0] && length <= param[1] );   
	}, $.validator.format("至少輸入2個字元"));
	
	jQuery.validator.addMethod("checkPassword", function(value, element, param) {
		let thePwd = value;
        let thePwdLen = thePwd.length; 
        let flag1 = false, flag2 = false, flag3 = false;         
        if (thePwd == "") {
            return false;
        } else if (thePwdLen >= 6) {
            for (let i = 0; i < thePwdLen; i++) {
                let ch = thePwd.charAt(i).toUpperCase();
                if (ch >= "A" && ch <= "Z")
                    flag1 = true;
                else if (ch >= "0" && ch <= "9")
                    flag2 = true;
                if(ch="!"||"@"||"#"||"$"||"%"||"^"||"&"||"*")
                    if (flag1 && flag2) break;
            }
            if (flag1 && flag2)
                return true;
            else
            	return false;
        } else {
        	return false;
        }  
	}, $.validator.format("請至少輸入1~6個字元"));
	
	$("#form1").validate({
	   rules: {
	    	loginId: {
	    		required: true,
	    		rangelength:[2,10]
		    },
		    name: {
		        required: true,
		        minlength: 2
		    },
		    password: {
				required: true,
				//rangelength:[6,10],	
				checkPassword:true,	
		  	},
		    email: {
		        required: true,
		        email: true
		    },
	   },
	   messages: {
		   loginId: {
			    required: "必填",
	    		//rangelength:"2-10字元",
		   },
		   name: {
		        required: "請輸入用戶名",
		        minlength: "最少2個字元"
		   },
		   	password: {
		        required: "輸入密碼",
		   }, 
		  email: {email: "請輸入正確信箱"}
	   }
	});
 
	$(".select").on("click",function(){
			location.href='${pageContext.request.contextPath}/customerjsp/select.jsp';
			
	})
 </script >
</body>
</html>