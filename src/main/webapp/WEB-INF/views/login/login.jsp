<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@taglib uri="http://www.springframework.org/tags/form" prefix="form"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Login Page</title>
<!-- <link rel="stylesheet" -->
<!-- 	href="https://stackpath.bootstrapcdn.com/bootstrap/4.1.3/css/bootstrap.min.css" -->
<!-- 	integrity="sha384-MCw98/SFnGE8fJT3GXwEOngsV7Zt27NXFoaoApmYm81iuXoPkFOJwJ8ERdknLPMO" -->
<!-- 	crossorigin="anonymous"> -->
<script src="https://code.jquery.com/jquery-3.5.1.js"
	integrity="sha256-QWo7LDvxbWT2tbbQ97B53yJnYU3WhH/C8ycbRAkjPDc="
	crossorigin="anonymous"></script>
<link rel="stylesheet"
	href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.14.0/css/all.min.css"
	integrity="sha512-1PKOgIY59xJ8Co8+NE6FZ+LOAZKjy+KY8iq0G4B3CyeY6wYHN3yt9PW0XpSriVlkMXe40PTKnXrLnZ9+fkDaog=="
	crossorigin="anonymous" />

<link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.2.1/css/bootstrap.min.css" integrity="sha384-GJzZqFGwb1QTTN6wy59ffF1BuGJpLSa9DkKMp0DgiMDm4iYMj70gZWKYbI706tWS" crossorigin="anonymous">
<!-- <link href="http://cdn.bootcss.com/bootstrap/3.3.7/css/bootstrap.min.css" rel="stylesheet"> -->
<!-- <link href="http://cdn.bootcss.com/font-awesome/4.6.3/css/font-awesome.min.css" rel="stylesheet"> -->

<script src="https://code.jquery.com/jquery-3.3.1.slim.min.js" integrity="sha384-q8i/X+965DzO0rT7abK41JStQIAqVgRVzpbzo5smXKp4YfRvH+8abtTE1Pi6jizo" crossorigin="anonymous"></script>
<script src="https://stackpath.bootstrapcdn.com/bootstrap/4.2.1/js/bootstrap.min.js" integrity="sha384-B0UglyR+jN6CkvvICOB2joaf5I4l3gm9GU6Hc1og6Ls7i6U/mkkaduKaBhlAXv9k" crossorigin="anonymous"></script>

<link rel="stylesheet" href="<c:url value = 'css/signIn.css'/>" />

<style>
	
</style>
</head>

<body>

	<div class="modal fade" id="resultModal" tabindex="-1" aria-labelledby="resultModalLabel" aria-hidden="true" style="top:100px">
	  <div class="modal-dialog">
	    <div class="modal-content" style="border-radius:99em;height:380px;width:380px;left:55px;background-color:	#F0F0F0"">
	      <div class="modal-header1">
	        <button type="button" class="close" data-dismiss="modal" aria-label="Close">
<!-- 	          <span aria-hidden="true">&times;</span> -->
	        </button>
	      </div>
	      <div class="modal-body" id="resultArea" style="height:380px;width:380px">
				<h2 id='msg'>${errMsg}</h2><span id='msg2'>點選空白處返回</span>
	      </div>
	      <div class="modal-footer1">
	      </div>
	    </div>
	  </div>
	</div>
	
		<div class="modal fade" id="signupArea" tabindex="-1" aria-labelledby="signupLabel" aria-hidden="true" style="top:100px">
	  <div class="modal-dialog">
	    <div class="modal-content" style="border-radius:99em;height:380px;width:380px;left:55px;background-color:	#F0F0F0">
	      <div class="modal-header1">
	        <button type="button" class="close" data-dismiss="modal" aria-label="Close">
<!-- 	          <span aria-hidden="true">&times;</span> -->
	        </button>
	      </div>
	      <div class="modal-body" id="resultArea" style="height:380px;width:380px">
				<div align="center" style="position: absolute;top:80px;left:40px;width:77%">
				<span class="heading"></span>
				<form:form method="POST"  modelAttribute="formBean">
					<div class="form-group">
                        <form:input type="text" class="form-control" id="inputAccount" placeholder="帳號 ( 必填 )" path="account" required="required"/>
                    </div>
                    <div class="form-group">
                        <form:input type="password" class="form-control" id="inputPassword" placeholder="密碼 ( 必填 )" path="password" required="required"/>
                    </div>
                    <div class="form-group">
                        <form:input type="email" class="form-control" id="inputEmail" placeholder="信箱 ( 必填 )" path="mail" required="required"/>
                    </div>
                    <div class="form-group">
                        <form:input type="text" class="form-control" id="inputNickname" placeholder="暱稱 ( 必填 )" path="nickname" required="required"/>
                    </div>
					<input type="submit" class="btn btn-default" value="快速註冊" id="signUpnow-btn" style="color:black;box-shadow:none;background-color:	#7B7B7B"/>
				</form:form>
				</div>
	      </div>
	      <div class="modal-footer1">
	      </div>
	    </div>
	  </div>
	</div>
		
	
	
	<form:form class="login-form" method="POST"  modelAttribute="formBean">
		<p class="login-text">
			<span class="fa-stack fa-lg"> 
				<i class="fa fa-circle fa-stack-2x"></i>
				<i class="fa fa-lock fa-stack-1x"></i>
			</span>
		</p>
		<form:input type="text" class="login-username" autofocus="true" placeholder="Account"  id="account" path="account"/> 
		<form:input type="password"	class="login-password" placeholder="Password" path="password"/> 
		<table align='center'>
			<tr>
				<td><input type="submit" value="登入" name="Login" class="login-submit" id="login-btn" style="margin-right:10px"/></td>
				<td><input type="button" value="返回" class="login-submit" id="back-btn" style="margin-left:10px"/></td>
			</tr>
			<tr>
				<td>
<!-- 					<div class="fb-login-button" data-size="small" data-button-type="login_with" data-layout="rounded" data-auto-logout-link="false" data-use-continue-as="false" data-width="" onclick="FBLogin();"></div> -->
					<input type="button" value="登入" onclick="FBLogin();" />
<!-- 				<fb:login-button scope="public_profile" onlogin="checkLoginState();"></fb:login-button> -->
				</td>
			</tr>
		</table>
		<span class="login-forgot-pass" style="bottom:35px" id="signup-btn">現在註冊</span><br>
		<span class="login-forgot-pass" style="bottom:15px" id="missPwd-btn">忘記密碼</span>
<!-- 		<input type="button" class="btn btn-primary" data-toggle="modal" data-target="#exampleModal" value="GO" /> -->

	</form:form>
	
<!-- 	忘記密碼 -->
	<div class="modal fade" id="missPwd" tabindex="-1" aria-labelledby="resultModalLabel" aria-hidden="true" style="top:100px">
	  <div class="modal-dialog">
	    <div class="modal-content" style="border-radius:99em;height:380px;width:380px;left:55px;background-color:	#F0F0F0"">
	      <div class="modal-header1">
	        <button type="button" class="close" data-dismiss="modal" aria-label="Close">
<!-- 	          <span aria-hidden="true">&times;</span> -->
	        </button>
	      </div>
	      <div class="modal-body" id="resultArea" style="height:380px;width:380px">
				<form:form modelAttribute="formBean" style="position: absolute;top:80px;left:40px;margin:0 auto;">
					<form:input type="text" class="form-control" id="missAccount" placeholder="請輸入帳號" path="account" required="required"/>
					請輸入驗證碼<input type="text" size="4" maxlength="4" name="checkNo" id="checkNo"><input type="text" disabled="disabled" id="number" size="4" maxlength="4"/><br>
					
					<input type=button id="getPwd-btn" value="送出"/>
				</form:form>
	      </div>
	      <div class="modal-footer1">
	      </div>
	    </div>
	  </div>
	</div>
	
	
	

	<div id="content" style="background-color:white"></div>
	<div class="underlay-photo"></div>
	<div class="underlay-black"></div>
	<div id="fb-root"></div>
	<script>
	if( "${errMsg}" != "" ){
		$(window).on('load',function(){
	        $('#resultModal').modal('show');
	    });
	}

	$("#back-btn").on("click",function(){
		location.href = "<c:url value = '/' />"
	})
	
	$("#signup-btn").on("click",function(){
		$("#signUpnow-btn").attr("type","button")
		$('#signupArea').modal('show');
	})
	
	var idUp = "";
	var pwdUp = "";
	var emailUp = "";
	var nameUp = "";
	$("#inputAccount").on("blur",function(){
			idUp = $("#inputAccount").val();
			 gogo(idUp,pwdUp,emailUp,nameUp);
	})
	$("#inputPassword").on("blur",function(){
		if($("#inputPassword").val().length<8){
			pwdUp = "";
			alert("密碼至少8位數")
		}else{
			pwdUp = $("#inputPassword").val();
			gogo(idUp,pwdUp,emailUp,nameUp);			
		}
	})
	$("#inputNickname").on("blur",function(){
		nameUp = $("#inputNickname").val();
		 gogo(idUp,pwdUp,emailUp,nameUp);
	})
	$("#inputEmail").on("blur",function(){
		 emailUp = $("#inputEmail").val();
		 gogo(idUp,pwdUp,emailUp,nameUp);
	})

	function  gogo(idUp,pwdUp,emailUp,nameUp){
		if ( idUp !="" && pwdUp !=""&& emailUp !=""&& nameUp !="" ){
			$("#signUpnow-btn").attr("type","submit").css("color","#33FFFF").css("box-shadow","#33FFFF 0px 0px 15px")
		} else {
			$("#signUpnow-btn").attr("type","button").css("color","black").css("box-shadow","none")
		}
	}
	
	$("#missPwd-btn").on("click",function(){
		$('#missPwd').modal('show');
		var i = Math.random()*10000;
		var passcode = "";
		if(i<1000){
			passcode = i*10;
		}else{
			passcode = i;
		}
		$("#number").attr("value",parseInt(passcode));
	})

	
	
	$("#checkNo").on("blur",function(){
		if($("#missAccount").val()!=""&&$("number").val()==$("checkNo").val()){
			$("#getPwd-btn").attr("type","submit");
			$("#getPwd-btn").on("click",function(){
				alert("信件已送往註冊信箱")
			})
		}else if($("#missAccount").val()==""){
			$("#getPwd-btn").attr("type","button");
			alert("請輸入帳號");
		}else{
			$("#getPwd-btn").attr("type","button");
			alert("請輸入驗證碼");
		}
	})
	
// ----------------------------------FB驗證-----------------------------------------------------------

//應用程式編號，進入 https://developers.facebook.com/apps/ 即可看到
        let FB_appID = "389574248905554";

        // Load the Facebook Javascript SDK asynchronously
        (function (d, s, id) {
            var js, fjs = d.getElementsByTagName(s)[0];
            if (d.getElementById(id)) return;
            js = d.createElement(s); js.id = id;
            js.src = "https://connect.facebook.net/en_US/sdk.js";
            fjs.parentNode.insertBefore(js, fjs);
        }(document, 'script', 'facebook-jssdk'));

        window.fbAsyncInit = function () {
            FB.init({
                appId: FB_appID,//FB appID
                cookie: true,  // enable cookies to allow the server to access the session
                xfbml: true,  // parse social plugins on this page
                version: 'v8.0' // use graph api version
            });
            FB.AppEvents.logPageView();

        };

        //使用自己客製化的按鈕來登入
        function FBLogin() {
            FB.getLoginStatus(function (res) {
                console.log(`status:${res.status}`);//Debug

                if (res.status === "connected") { 
                    let userID = res["authResponse"]["userID"];
                    console.log("用戶已授權您的App，用戶須先revoke撤除App後才能再重新授權你的App");
                    console.log(`已授權App登入FB 的 userID:${userID}`);
                    GetProfile();
                } else if (res.status === 'not_authorized' || res.status === "unknown") {
                    //App未授權或用戶登出FB網站才讓用戶執行登入動作
                    FB.login(function (response) {

                        //console.log(response);
                        if (response.status === 'connected') {
                            //user已登入FB
                            //抓userID
                            let userID = response["authResponse"]["userID"];
                            console.log(`已授權App登入FB 的 userID:${userID}`);
                            GetProfile();
// 							location.href ="../index"
							

                        } else {
                            // user FB取消授權
                            alert("Facebook帳號無法登入");
                        }
                        //"public_profile"可省略，仍然可以取得name、userID
                    }, { scope: 'email' }); 
                }
            });
        }

		//取得用戶姓名、email
        function GetProfile() {
            document.getElementById('content').innerHTML = "";//先清空顯示結果

            //FB.api()使用說明：https://developers.facebook.com/docs/javascript/reference/FB.api
            //取得用戶個資
            FB.api("/me", "GET", { fields: 'name,email' }, function (user) {
                //user物件的欄位：https://developers.facebook.com/docs/graph-api/reference/user
                if (user.error) {
                    console.log(response);
                } else {
                    
//                     document.getElementById('content').innerHTML = JSON.stringify(user);
//                     document.getElementById('content').innerHTML += user['name'];
//                     document.getElementById('content').innerHTML += user['email'];
				
						$("#inputAccount").attr("value",user['email']);
						$("#inputPassword").attr("value","12345678");
						$("#inputEmail").attr("value",user['email']);
						$("#inputNickname").attr("value",user['name']);
						$("#fb-in").attr("value",user['name']);

							$("#signUpnow-btn").submit();
	

                }
            });
        }
  //------------------------

//   {
//       status: 'connected',
//       authResponse: {
//           accessToken: '...',
//           expiresIn:'...',
//           signedRequest:'...',
//           userID:'...'
//       }
//   }
  


  
  
//----------------------------------FB驗證-----------------------------------------------------------

</script>
<script async defer crossorigin="anonymous" src="https://connect.facebook.net/zh_TW/sdk.js#xfbml=1&autoLogAppEvents=1&version=v9.0&appId=389574248905554" nonce="Ygm7YWIX"></script>
</body>
</html>