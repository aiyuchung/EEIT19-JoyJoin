package com.web.activity.model;

import java.io.Serializable;
import java.sql.Date;

import javax.persistence.CascadeType;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.JoinColumn;
import javax.persistence.ManyToOne;
import javax.persistence.Table;


@Entity
@Table(name="[Order]")
public class OrderBean implements Serializable {
	private static final long serialVersionUID = 1L;
	
	
	@Id
	@GeneratedValue(strategy=GenerationType.IDENTITY)	
	private Integer orderId;
	private String orderNo;
	private Integer orderPrice;
	private String orderItem;
	private Integer orderNum; 
	private Date orderDate;
	
	public Date getOrderDate() {
		return orderDate;
	}



	public void setOrderDate(Date orderDate) {
		this.orderDate = orderDate;
	}



	@ManyToOne(cascade=CascadeType.ALL)
	@JoinColumn(name="memberNo") 	
    private MemberBean memberBean;
	
	public OrderBean() {}
	
	
	
	public OrderBean(Integer orderId, String orderNo, Integer orderPrice, String orderItem, Integer orderNum,
			MemberBean memberBean) {
		super();
		this.orderId = orderId;
		this.orderNo = orderNo;
		this.orderPrice = orderPrice;
		this.orderItem = orderItem;
		this.orderNum = orderNum;
		this.memberBean = memberBean;
	}



	public Integer getOrderId() {
		return orderId;
	}



	public void setOrderId(Integer orderId) {
		this.orderId = orderId;
	}



	public String getOrderNo() {
		return orderNo;
	}



	public void setOrderNo(String orderNo) {
		this.orderNo = orderNo;
	}



	public Integer getOrderPrice() {
		return orderPrice;
	}



	public void setOrderPrice(Integer orderPrice) {
		this.orderPrice = orderPrice;
	}



	public String getOrderItem() {
		return orderItem;
	}



	public void setOrderItem(String orderItem) {
		this.orderItem = orderItem;
	}



	public Integer getOrderNum() {
		return orderNum;
	}



	public void setOrderNum(Integer orderNum) {
		this.orderNum = orderNum;
	}



	public MemberBean getMemberBean() {
		return memberBean;
	}



	public void setMemberBean(MemberBean memberBean) {
		this.memberBean = memberBean;
	}

	

	
}
