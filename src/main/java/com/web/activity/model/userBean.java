package com.web.activity.model;

import java.io.Serializable;
import java.sql.Blob;

import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.Table;

@Entity
@Table(name="")
public class userBean implements Serializable {
	private static final long serialVersionUID = 1L;
	@Id
	@GeneratedValue(strategy = GenerationType.IDENTITY)
	private Integer no;
	private String account;
	private String nickname;
	private Integer level;
	private Integer emp;
	Blob pic;
	
	public userBean() {}
	
	public userBean(Integer no, String account, String nickname, Integer level, Integer emp, Blob pic) {
		this.no = no;
		this.account = account;
		this.nickname = nickname;
		this.level = level;
		this.emp = emp;
		this.pic = pic;
	}

	public Integer getNo() {
		return no;
	}

	public void setNo(Integer no) {
		this.no = no;
	}

	public String getAccount() {
		return account;
	}

	public void setAccount(String account) {
		this.account = account;
	}

	public String getNickname() {
		return nickname;
	}

	public void setNickname(String nickname) {
		this.nickname = nickname;
	}

	public Integer getLevel() {
		return level;
	}

	public void setLevel(Integer level) {
		this.level = level;
	}

	public Integer getEmp() {
		return emp;
	}

	public void setEmp(Integer emp) {
		this.emp = emp;
	}

	public Blob getPic() {
		return pic;
	}

	public void setPic(Blob pic) {
		this.pic = pic;
	}
	
	
}
