package com.web.activity.model;


import java.sql.Blob;
import java.sql.Date;
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
@Table(name="Activities")
public class ActivityBean implements java.io.Serializable {
	private static final long serialVersionUID = 1L;
	
	@Id
//	@GeneratedValue(generator = "UUID")
//	@GenericGenerator(name = "UUID",strategy = "org.hibernate.id.UUIDGenerator")
//	@Column(name = "id", updatable = false, nullable = false)
//	private String id;

	@GeneratedValue(strategy=GenerationType.IDENTITY)	
	private int activityNo;
	
	@ManyToOne(cascade=CascadeType.ALL)
	@JoinColumn(name="activityType") 
	private ActivityTypeBean activityTypeBean;
	
//	private String activityType;
	private String activityTypeName;
	
	@ManyToOne(cascade=CascadeType.ALL)
	@JoinColumn(name="activityClassNo") 
	private ActivityClassBean activityClassBean;
	
	private String activityClass;
	private String location;
	private String prov;
	private Date createdDate;
	private String name;
	private Date activityDate;
	private String meetTime;
	private String meetPoint;
	private Date finalDate;
	private String maxLimit;
	private Integer minLimit;
	private Integer price;
	private String introduction;
	private Blob activityPic;
	private String activityStatus;
	private Integer leftDays;
	private Integer joinedNum;
	private Integer hitCount;
	private Integer levelLimit;
//	@Transient
//	private multiPartFiles updateImg;
	
	
	public Integer getHitCount() {
		return hitCount;
	}
	public void setHitCount(Integer hitCount) {
		this.hitCount = hitCount;
	}
	@ManyToOne(cascade=CascadeType.ALL)
	@JoinColumn(name="memberNo") 	
    private MemberBean memberBean;
	
	@ManyToOne(cascade=CascadeType.ALL)
	@JoinColumn(name="provId") 	
	private ProvinceBean provinceBean;
	
	@OneToMany(mappedBy="activityBean", cascade= {CascadeType.ALL})
	private Set<ActivityMsgBean> activityMsgbean = new LinkedHashSet<>();
	
//	@ManyToMany(cascade=CascadeType.ALL)
//	@JoinTable(name="ActivityJoin",
//			joinColumns= {
//					@JoinColumn (name = "FK_activityNo", referencedColumnName="activityNo")
//			},
//			inverseJoinColumns= {
//					@JoinColumn (name= "FK_memberNo", referencedColumnName="memberNo")
//			}
//	)
//	private Set<MemberBean> joinedMembers = new LinkedHashSet<>(0) ;
//	
	
	
//	
//	public Set<MemberBean> getJoinedMembers() {
//		return joinedMembers;
//	}
//	public void setJoinedMembers(Set<MemberBean> joinedMembers) {
//		this.joinedMembers = joinedMembers;
//	}
	public ProvinceBean getProvinceBean() {
		return provinceBean;
	}
	public void setProvinceBean(ProvinceBean provinceBean) {
		this.provinceBean = provinceBean;
	}
	public ActivityTypeBean getActivityTypeBean() {
		return activityTypeBean;
	}
	public void setActivityTypeBean(ActivityTypeBean activityTypeBean) {
		this.activityTypeBean = activityTypeBean;
	}

	public ActivityClassBean getActivityClassBean() {
		return activityClassBean;
	}
	public void setActivityClassBean(ActivityClassBean activityClassBean) {
		this.activityClassBean = activityClassBean;
	}
	
	
	

	
	public Integer getLevelLimit() {
		return levelLimit;
	}
	public void setLevelLimit(Integer levelLimit) {
		this.levelLimit = levelLimit;
	}
	public MemberBean getMemberBean() {
		return memberBean;
	}
	public void setMemberBean(MemberBean memberBean) {
		this.memberBean = memberBean;
	}

	public int getActivityNo() {
		return activityNo;
	}
	public void setActivityNo(int activityNo) {
		this.activityNo = activityNo;
	}
//	public String getActivityType() {
//		return activityType;
//	}
//	public void setActivityType(String activityType) {
//		this.activityType = activityType;
//	}
	public String getActivityTypeName() {
		return activityTypeName;
	}
	public void setActivityTypeName(String activityTypeName) {
		this.activityTypeName = activityTypeName;
	}
//	public String getActivityClassNo() {
//		return activityClassNo;
//	}
//	public void setActivityClassNo(String activityClassNo) {
//		this.activityClassNo = activityClassNo;
//	}
	public String getActivityClass() {
		return activityClass;
	}
	public void setActivityClass(String activityClass) {
		this.activityClass = activityClass;
	}
	public String getLocation() {
		return location;
	}
	public void setLocation(String location) {
		this.location = location;
	}
	public String getProv() {
		return prov;
	}
	public void setProv(String prov) {
		this.prov = prov;
	}
	public Date getCreatedDate() {
		return createdDate;
	}
	public void setCreatedDate(Date createdDate) {
		this.createdDate = createdDate;
	}
	public String getName() {
		return name;
	}
	public void setName(String name) {
		this.name = name;
	}
	public Date getActivityDate() {
		return activityDate;
	}
	public void setActivityDate(Date activityDate) {
		this.activityDate = activityDate;
	}
	public String getMeetTime() {
		return meetTime;
	}
	public void setMeetTime(String meetTime) {
		this.meetTime = meetTime;
	}
	public String getMeetPoint() {
		return meetPoint;
	}
	public void setMeetPoint(String meetPoint) {
		this.meetPoint = meetPoint;
	}
	public Date getFinalDate() {
		return finalDate;
	}
	public void setFinalDate(Date finalDate) {
		this.finalDate = finalDate;
	}
	public String getMaxLimit() {
		return maxLimit;
	}
	public void setMaxLimit(String maxLimit) {
		this.maxLimit = maxLimit;
	}
	public Integer getMinLimit() {
		return minLimit;
	}
	public void setMinLimit(Integer minLimit) {
		this.minLimit = minLimit;
	}
	public Integer getPrice() {
		return price;
	}
	public void setPrice(Integer price) {
		this.price = price;
	}
	public String getIntroduction() {
		return introduction;
	}
	public void setIntroduction(String introduction) {
		this.introduction = introduction;
	}
	public Blob getActivityPic() {
		return activityPic;
	}
	public void setActivityPic(Blob activityPic) {
		this.activityPic = activityPic;
	}
	public String getActivityStatus() {
		return activityStatus;
	}
	public void setActivityStatus(String activityStatus) {
		this.activityStatus = activityStatus;
	}
	public Integer getLeftDays() {
		return leftDays;
	}
	public void setLeftDays(Integer leftDays) {
		this.leftDays = leftDays;
	}
	public Integer getJoinedNum() {
		return joinedNum;
	}
	public void setJoinedNum(Integer joinedNum) {
		this.joinedNum = joinedNum;
	}
}
	//	public String getId() {
//		return id;
//	}
//	public void setId(String id) {
//		this.id = id;
//	}
	