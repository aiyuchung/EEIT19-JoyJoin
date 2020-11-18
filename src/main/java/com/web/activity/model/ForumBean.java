package com.web.activity.model;


import java.math.BigDecimal;
import java.sql.Blob;
import java.time.LocalDateTime;
import java.util.Date;
import java.util.List;

import javax.persistence.Column;
//import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.EnumType;
import javax.persistence.Enumerated;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
//import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.Table;
import javax.persistence.Transient;

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
	private Integer forumSeq;
	//活動編碼
	@NotNull
	private String activityCode;
	//討論區 類型
	@NotNull
	private String type;
	//討論區 標題
	@NotNull
	private String title;
	//討論區 評分
	@NotNull
	private BigDecimal score;
	//討論區 發文者
	@NotNull
	private String author;
	//討論區 發文時間
	@NotNull
	private Date time;
	//討論區 地區
	@NotNull
	private String location;
	//討論區 點閱率
	@NotNull
	private int popularity;
	
	//討論發文 照片
	private Blob photo;
	//討論發文 文章
	@Column(length=2048)
	private String article;
	
	//討論區文章的型態
	@Enumerated(EnumType.STRING)
	@NotNull
	private ForumType forumType;
	
	//討論主題編碼
	private String code;
	
	//保單狀態
	@Enumerated(EnumType.STRING)
	@NotNull
	private Status status;
	
	//評分標籤---以[,]分隔
	private String evaTag;
	
	//=========================以下為TRANSIENT=========================//
	
	@Transient
	private String keyWord;
	

	public Integer getForumSeq() {
		return forumSeq;
	}
	public void setForumSeq(Integer forumSeq) {
		this.forumSeq = forumSeq;
	}
	public String getActivityCode() {
		return activityCode;
	}
	public void setActivityCode(String activityCode) {
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
	public BigDecimal getScore() {
		return score;
	}
	public void setScore(BigDecimal score) {
		this.score = score;
	}
	public String getAuthor() {
		return author;
	}
	public void setAuthor(String author) {
		this.author = author;
	}
	public Date getTime() {
		return time;
	}
	public void setTime(Date time) {
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
	public String getKeyWord() {
		return keyWord;
	}
	public void setKeyWord(String keyWord) {
		this.keyWord = keyWord;
	}
	public String getEvaTag() {
		return evaTag;
	}
	public void setEvaTag(String evaTag) {
		this.evaTag = evaTag;
	}
}