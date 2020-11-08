package com.web.activity.model;

import java.sql.Blob;
import java.util.LinkedHashSet;
import java.util.Set;

import javax.persistence.CascadeType;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.JoinColumn;
import javax.persistence.ManyToOne;
import javax.persistence.OneToMany;
import javax.persistence.Table;


@Entity
@Table(name="ActivityType")
public class ActivityJoinedBean implements java.io.Serializable {
	private static final long serialVersionUID = 1L;
	
	
	@Id
	private String activityType;
	private String activityTypeName;

	@OneToMany(mappedBy="activityTypeBean", cascade= {CascadeType.ALL})
	private Set<ActivityBean> activityBean = new LinkedHashSet<>();
	
	@OneToMany(mappedBy="activityTypeBean", cascade= {CascadeType.ALL})
	private Set<ActivityClassBean> activityClassBean = new LinkedHashSet<>();
	
	
	
	public String getActivityType() {
		return activityType;
	}

	public void setActivityType(String activityType) {
		this.activityType = activityType;
	}

	public String getActivityTypeName() {
		return activityTypeName;
	}

	public void setActivityTypeName(String activityTypeName) {
		this.activityTypeName = activityTypeName;
	}



	
	
}
