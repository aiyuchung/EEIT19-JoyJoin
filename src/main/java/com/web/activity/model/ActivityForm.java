package com.web.activity.model;

import java.util.List;

import javax.persistence.FetchType;
import javax.persistence.JoinColumn;
import javax.persistence.JoinTable;
import javax.persistence.ManyToMany;

public class ActivityForm  implements java.io.Serializable {
	private static final long serialVersionUID = 1L;

	private String price;
	private String location;
	private String minLimit;
	private String Bigtype;
	
//	@ManyToMany(fetch = FetchType.LAZY)
//	@JoinTable(name = "ActivityClass",
//	joinColumns = { @JoinColumn(name = "activityClassNo") },
//	inverseJoinColumns = { @JoinColumn (name = "activityTypeBean.activityType") })
//	private List<ActivityTypeBean> Smalltype;
	
	
	private String Smalltype;

	public String getPrice() {
		return price;
	}

	public void setPrice(String price) {
		this.price = price;
	}

	public String getLocation() {
		return location;
	}

	public void setLocation(String location) {
		this.location = location;
	}

	public String getMinLimit() {
		return minLimit;
	}

	public void setMinLimit(String minLimit) {
		this.minLimit = minLimit;
	}

	public String getBigtype() {
		return Bigtype;
	}

	public void setBigtype(String bigtype) {
		Bigtype = bigtype;
	}

	public String getSmalltype() {
		return Smalltype;
	}

	public void setSmalltype(String smalltype) {
		Smalltype = smalltype;
	}
	

//
//	public List<ActivityTypeBean> getActivityType() {
//		return Smalltype;
//	}
//
//	public void setActivityType(List<ActivityTypeBean> Smalltype) {
//		this.Smalltype = Smalltype;
//	}
}
