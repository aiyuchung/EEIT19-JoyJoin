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
@Table(name="ActivityClass")
public class ActivityClassBean implements java.io.Serializable {
	private static final long serialVersionUID = 1L;
	
	
	@Id
	private String activityClassNo;
	private String activityClass;
	
	@ManyToOne(cascade=CascadeType.ALL)
	@JoinColumn(name="activityType") 	
    private ActivityTypeBean activityTypeBean;
	
	@OneToMany(mappedBy="activityClassBean", cascade= {CascadeType.ALL})
	private Set<ActivityBean> activityBean = new LinkedHashSet<>();

	public String getActivityClassNo() {
		return activityClassNo;
	}

	public void setActivityClassNo(String activityClassNo) {
		this.activityClassNo = activityClassNo;
	}

	public String getActivityClass() {
		return activityClass;
	}

	public void setActivityClass(String activityClass) {
		this.activityClass = activityClass;
	}

	public ActivityTypeBean getActivityTypeBean() {
		return activityTypeBean;
	}

	public void setActivityTypeBean(ActivityTypeBean activityTypeBean) {
		this.activityTypeBean = activityTypeBean;
	}
	
	
	
}
