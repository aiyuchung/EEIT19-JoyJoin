package com.web.activity.model;

import java.util.LinkedHashSet;
import java.util.Set;

import javax.persistence.CascadeType;
import javax.persistence.Entity;
import javax.persistence.Id;
import javax.persistence.OneToMany;
import javax.persistence.Table;


@Entity
@Table(name="Province")
public class ProvinceBean implements java.io.Serializable {
	private static final long serialVersionUID = 1L;
	
	
	@Id
	private int provId;
	private String prov;
	private String location;
	

	@OneToMany(mappedBy="provinceBean", cascade= {CascadeType.ALL})
	private Set<ActivityBean> activityBean = new LinkedHashSet<>();
	

	public int getProvId() {
		return provId;
	}

	public void setProvId(int provId) {
		this.provId = provId;
	}

	public String getProv() {
		return prov;
	}

	public void setProv(String prov) {
		this.prov = prov;
	}
	public String getLocation() {
		return location;
	}

	public void setLocation(String location) {
		this.location = location;
	}




	
	
}
