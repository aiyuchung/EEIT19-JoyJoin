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
import javax.persistence.Transient;

import org.springframework.web.multipart.MultipartFile;


@Entity
@Table(name="ActivityPic")
public class ActivityPicBean implements java.io.Serializable {
	private static final long serialVersionUID = 1L;
	
	
	@Id
	@GeneratedValue(strategy=GenerationType.IDENTITY)	
	private int picNo;
	private String fileName;
	private Blob activityPic;
	
	@ManyToOne(cascade=CascadeType.ALL)
	@JoinColumn(name="activityNo") 	
    private ActivityBean activityBean;
	
	
	@Transient
	private MultipartFile updateImg;
	
	public int getPicNo() {
		return picNo;
	}
	public void setPicNo(int picNo) {
		this.picNo = picNo;
	}
	public String getFileName() {
		return fileName;
	}
	public void setFileName(String fileName) {
		this.fileName = fileName;
	}
	public Blob getActivityPic() {
		return activityPic;
	}
	public void setActivityPic(Blob activityPic) {
		this.activityPic = activityPic;
	}
	
	public MultipartFile getUpdateImg() {
		return updateImg;
	}
	public void setUpdateImg(MultipartFile updateImg) {
		this.updateImg = updateImg;
	}

	public ActivityBean getActivityBean() {
		return activityBean;
	}

	public void setActivityBean(ActivityBean activityBean) {
		this.activityBean = activityBean;
	}

	


	
	
}
