<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script>
	window.onload = function() {
		const ws_host_port = "ws://localhost:8080/";
		const contextPath = "JoyJoin/";
		const endpoint = "wsendpoing";		                  
		const connString = ws_host_port + contextPath + endpoint;
		const status = document.getElementById('status');
		var btnConn = document.getElementById('btnConn');
		var btnSend = document.getElementById('btnSend');
		var btnClose = document.getElementById('btnClose');
		var message = document.getElementById('message');
		var serverResponseArea = document.getElementById('serverResponseArea');
		var socket = null;
		btnClose.disabled = true;
		btnSend.disabled = true;

		btnSend.onclick = function() {
			if (socket == null) {
				status.innerHTML = "必須先連到主機才能送訊息";
				return;
			}

			if (message.value.length == 0) {
				status.innerHTML = "尚未輸入資料，無法送出";
				return;
			}
			socket.send(message.value);

		}
		btnSend.onclick = function() {
			if (socket == null) {
				status.innerHTML = "必須先連到主機才能送訊息";
				return;
			}

			if (message.value.length == 0) {
				status.innerHTML = "尚未輸入資料，無法送出";
				return;
			}
			socket.send(message.value);

		}
		btnConn.onclick = function() {
			socket = new WebSocket(connString);

			socket.onopen = function(e) {
				status.innerHTML = "已連線";
			};

			socket.onmessage = function(event) {
				appendMsg("Server: " + event.data);
			};
			btnClose.disabled = false;
			btnSend.disabled = false;
			socket.onclose = function(event) {
				if (event.wasClean) {
					status.innerHTML = "[close] 連線正常關閉, code=" + event.code
							+ ", reason= " + event.reason;
				} else {
					status.innerHTML = "[close] 連線不正常結束";
				}
				btnClose.disabled = true;
				btnSend.disabled = true;
				
			};

			socket.onerror = function(error) {
				alert("[error] 連線發生錯誤，原因：" + error.message);
			};
		}
		btnClose.onclick = function() {
			if (socket == null) {
				status.innerHTML = "必須先連到主機才能關閉連線";
				return;
			}
			if (socket.readyState === WebSocket.OPEN) {
				socket.onclose = function() {}; // disable onclose handler first
				socket.close();
				status.innerHTML = "已離線";
			}

			btnClose.disabled = true;
			btnSend.disabled = true;
		}
	}
	function appendMsg(message) {
		serverResponseArea.value = serverResponseArea.value + message + "\n";
	}
</script>
</head>
<body>
	<button id='btnConn'>連結WebSocket主機</button>
	&nbsp;
	<span id='status'></span>
	<br>
	<button id='btnClose'>關閉與主機的連線</button>
	<hr>
	訊息：
	<input type='text' id='message'>&nbsp;
	<button id='btnSend'>送出訊息</button>
	<hr>
	<textarea cols='60' rows='20' id='serverResponseArea'>
</textarea>
</body>
</html>