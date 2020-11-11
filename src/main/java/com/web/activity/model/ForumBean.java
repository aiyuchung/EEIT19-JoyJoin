package com.web.activity.model;


import java.sql.Blob;
import java.time.LocalDateTime;

//import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
//import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.Table;

import com.sun.istack.NotNull;
import com.web.activity.Enum.ForumType;
import com.web.activity.Enum.Status;

//import org.hibernate.annotations.GenericGenerator;


@Entity
@Table(name="Forum")
public class ForumBean implements java.io.Serializable {
	private static final long serialVersionUID = 1L;
	
	@Id
	@GeneratedValue(strategy=GenerationType.IDENTITY)
	//資料編碼
	private int forumSeq;
	//活動編碼
	@NotNull
	private int activityCode;
	//討論區 類型
	@NotNull
	private String type;
	//討論區 標題
	@NotNull
	private String title;
	//討論區 評分
	@NotNull
	private float score;
	//討論區 發文者
	@NotNull
	private String author;
	//討論區 發文時間
	@NotNull
	private LocalDateTime time;
	//討論區 地區
	@NotNull
	private String location;
	//討論區 點閱率
	@NotNull
	private int popularity;
	
	//討論發文 照片
	private Blob photo;
	//討論發文 文章
	private String article;
	
	//討論區文章的型態
	private ForumType forumType;
	
	//討論主題編碼
	private String code;
	
	private Status status;
	

	public int getForumSeq() {
		return forumSeq;
	}
	public void setForumSeq(int forumSeq) {
		this.forumSeq = forumSeq;
	}
	public int getActivityCode() {
		return activityCode;
	}
	public void setActivityCode(int activityCode) {
		this.activityCode = activityCode;
	}
	public String getType() {
		return type;
	}
	public void setType(String type) {
		this.type = type;
	}
	public String getTitle() {
		return title;
	}
	public void setTitle(String title) {
		this.title = title;
	}
	public float getScore() {
		return score;
	}
	public void setScore(float score) {
		this.score = score;
	}
	public String getAuthor() {
		return author;
	}
	public void setAuthor(String author) {
		this.author = author;
	}
	public LocalDateTime getTime() {
		return time;
	}
	public void setTime(LocalDateTime time) {
		this.time = time;
	}
	public String getLocation() {
		return location;
	}
	public void setLocation(String location) {
		this.location = location;
	}
	public int getPopularity() {
		return popularity;
	}
	public void setPopularity(int popularity) {
		this.popularity = popularity;
	}
	public Blob getPhoto() {
		return photo;
	}
	public void setPhoto(Blob photo) {
		this.photo = photo;
	}
	public String getArticle() {
		return article;
	}
	public void setArticle(String article) {
		this.article = article;
	}
	public ForumType getForumType() {
		return forumType;
	}
	public void setForumType(ForumType forumType) {
		this.forumType = forumType;
	}
	public String getCode() {
		return code;
	}
	public void setCode(String code) {
		this.code = code;
	}
	public Status getStatus() {
		return status;
	}
	public void setStatus(Status status) {
		this.status = status;
	}
	
}