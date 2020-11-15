package com.web.activity.model;

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
@Table(name="ActivityFollowed")
public class ActivityFollowedBean implements java.io.Serializable {
	private static final long serialVersionUID = 1L;
	
	
	@Id
	@GeneratedValue(strategy=GenerationType.IDENTITY)	
	private int urlNo;
	private String activityUrl;
	private String condition;
	
	@ManyToOne(cascade=CascadeType.ALL)
	@JoinColumn(name="memberNo") 	
    private MemberBean memberBean;
	
	@ManyToOne(cascade=CascadeType.ALL)
	@JoinColumn(name="activityNo") 	
    private ActivityBean activityBean;

	public String getCondition() {
		return condition;
	}

	public void setCondition(String condition) {
		this.condition = condition;
	}

	public int getUrlNo() {
		return urlNo;
	}

	public void setUrlNo(int urlNo) {
		this.urlNo = urlNo;
	}

	public String getActivityUrl() {
		return activityUrl;
	}

	public void setActivityUrl(String activityUrl) {
		this.activityUrl = activityUrl;
	}

	public MemberBean getMemberBean() {
		return memberBean;
	}

	public void setMemberBean(MemberBean memberBean) {
		this.memberBean = memberBean;
	}

	public ActivityBean getActivityBean() {
		return activityBean;
	}

	public void setActivityBean(ActivityBean activityBean) {
		this.activityBean = activityBean;
	}

	


	
	
}
