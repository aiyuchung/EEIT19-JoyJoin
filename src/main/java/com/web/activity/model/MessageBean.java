package com.web.activity.model;

import java.io.Serializable;

import javax.persistence.CascadeType;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.ManyToOne;
import javax.persistence.Table;

@Entity
@Table(name="message")
public class MessageBean implements Serializable {
	private static final long serialVersionUID = 1L;

	@Id
	@GeneratedValue(strategy=GenerationType.IDENTITY)
	private int msgNo;				//訊息編號 PK
	private String account;			//收件人Account,關聯MemberBean
	private String fromAccount;				//寄件人
	private String subject;			//主旨
	private String time;				//發送時間
	private String msg;				//訊息內容
	private int readStatus;			//閱讀狀態
	
	@ManyToOne(cascade=CascadeType.ALL)	
	private MemberBean memberBean;
	
	public MessageBean() {}
	
	public MessageBean(int msgNo, String account, String fromAccount, String subject, String time, String msg, int readStatus) {
		this.msgNo = msgNo;
		this.account = account;
		this.fromAccount = fromAccount;
		this.subject = subject;
		this.time = time;
		this.msg = msg;
		this.readStatus = readStatus;
	}

	public int getMsgNo() {
		return msgNo;
	}

	public void setMsgNo(int msgNo) {
		this.msgNo = msgNo;
	}

	public String getAccount() {
		return account;
	}

	public void setAccount(String account) {
		this.account = account;
	}

	public String getfromAccount() {
		return fromAccount;
	}

	public void setfromAccount(String fromAccount) {
		this.fromAccount = fromAccount;
	}

	public String getSubject() {
		return subject;
	}

	public void setSubject(String subject) {
		this.subject = subject;
	}

	public String getTime() {
		return time;
	}

	public void setTime(String time) {
		this.time = time;
	}

	public String getMsg() {
		return msg;
	}

	public void setMsg(String msg) {
		this.msg = msg;
	}

	public int getReadStatus() {
		return readStatus;
	}

	public void setReadStatus(int readStatus) {
		this.readStatus = readStatus;
	}
	
	
	
}
