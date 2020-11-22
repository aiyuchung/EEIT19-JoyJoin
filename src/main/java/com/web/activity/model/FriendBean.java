package com.web.activity.model;

import java.io.Serializable;

import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.Table;

@Entity
@Table(name="friend")
public class FriendBean implements Serializable {
	private static final long serialVersionUID = 1L;
	
	@Id
	@GeneratedValue(strategy=GenerationType.IDENTITY)
	private Integer friendNo;
	private String accountOne;
	private String accountTwo;
	private Integer oneType;
	private Integer twoType;
	private Integer status;
	
	public FriendBean() {}
	
	public FriendBean(Integer friendNo, String accountOne, String accountTwo, Integer oneType, Integer twoType, Integer status) {
		this.friendNo = friendNo;
		this.accountOne = accountOne;
		this.accountTwo = accountTwo;
		this.oneType = oneType;
		this.twoType = twoType;
		this.status = status;
	}

	public Integer getFriendNo() {
		return friendNo;
	}

	public void setFriendNo(Integer friendNo) {
		this.friendNo = friendNo;
	}

	public String getAccountOne() {
		return accountOne;
	}

	public void setAccountOne(String accountOne) {
		this.accountOne = accountOne;
	}

	public String getAccountTwo() {
		return accountTwo;
	}

	public void setAccountTwo(String accountTwo) {
		this.accountTwo = accountTwo;
	}

	public Integer getOneType() {
		return oneType;
	}

	public void setOneType(Integer oneType) {
		this.oneType = oneType;
	}

	public Integer getTwoType() {
		return twoType;
	}

	public void setTwoType(Integer twoType) {
		this.twoType = twoType;
	}

	public Integer getStatus() {
		return status;
	}

	public void setStatus(Integer status) {
		this.status = status;
	}
	
}
