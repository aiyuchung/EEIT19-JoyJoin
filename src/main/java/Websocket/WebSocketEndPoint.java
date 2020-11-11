package Websocket;

import java.io.IOException;

import javax.websocket.CloseReason;
import javax.websocket.OnClose;
import javax.websocket.OnError;
import javax.websocket.OnMessage;
import javax.websocket.OnOpen;
import javax.websocket.Session;
import javax.websocket.server.ServerEndpoint;

@ServerEndpoint ("/wsendpoing")
public class WebSocketEndPoint {

	@OnOpen
	public void open() {
		System.out.println("open");
	}
	
	@OnClose
	public void close(Session session, CloseReason reason) {
		System.out.println("close");
	}

	@OnMessage
	public String message(Session session, String message) throws IOException {
		session.getBasicRemote().sendText("received!");
		System.out.println("message:" +message);
		return message;
	}

	@OnError
	public void error(Session session,Throwable t) {
		System.out.println("error");
	}


}
