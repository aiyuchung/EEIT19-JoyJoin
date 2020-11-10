package com.web.activity.model;

import java.io.Serializable;
import java.sql.Blob;
import java.util.LinkedHashSet;
import java.util.Set;

import javax.persistence.CascadeType;
import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.JoinColumn;
import javax.persistence.ManyToMany;
import javax.persistence.OneToMany;
import javax.persistence.OneToOne;
import javax.persistence.Table;
import javax.persistence.Transient;

@Entity
@Table(name = "member")
public class MemberBean implements Serializable {
	private static final long serialVersionUID = 1L;
	@Id
	@GeneratedValue(strategy = GenerationType.IDENTITY)
	private Integer memberNo;			//會員編號,PK自增,不顯示
	@Column(nullable = false, updatable = false)
	private String account;					//帳號,快速註冊,不得UPDATE
	@Column(nullable = false)
	private String password;				//密碼,快速註冊
	private String gender;					//性別
	@Column(nullable = false, updatable = false)
	private String mail;						//信箱,快速註冊,不得UPDATE
	private Blob picture;						//頭像
	private String fullName;				//姓名	
	@Column(nullable = false)
	private String nickname;				//暱稱,快速註冊
	private String phone;					//電話
	private String birthYear;				//出生年份
	private String birthMonth;			//出生月份
	private String starSign;				//星座
	private String bloodType;				//血型
	private String country;					//居住縣市
	@Transient
	private String addrArea;				//居住區域,由縣市判斷
	private String address;					//居住地址
	private String hobby;					//興趣
	private String education;				//學歷
	private String school;					//學校
	private String company;				//公司
	private String job;						//職業
	private String income;					//收入情形
	private String signature;				//自定義簽名
	private String introduction;			//自我介紹

//	@JsonIgnoreProperties("member")
	@OneToOne(cascade = CascadeType.ALL)
	@JoinColumn(name = "roleNo")		//FK為RoleBean的roleNo
	private RoleBean rolebean;
	
	@OneToMany(mappedBy="memberBean", cascade= {CascadeType.ALL})
	private Set<ActivityBean> activities = new LinkedHashSet<>();

	@OneToMany(mappedBy="memberBean", cascade= {CascadeType.ALL})
	private Set<ActivityMsgBean> activityMsg = new LinkedHashSet<>();

	@ManyToMany(mappedBy="joinedMembers")
	private Set<ActivityBean> joinedActivities = new LinkedHashSet<>(0) ;
	
	public MemberBean() {
	}

	public MemberBean(Integer memberNo, String account, String password, String gender, String mail, Blob picture,
			String fullName, String nickname, String phone, String birthYear, String birthMonth, String starSign, String bloodType,
			String country, String address, String hobby, String education, String school, String company, String job,
			String income, String signature, String introduction) {
		this.memberNo = memberNo;
		this.account = account;
		this.password = password;
		this.gender = gender;
		this.mail = mail;
		this.picture = picture;
		this.fullName = fullName;
		this.nickname = nickname;
		this.phone = phone;
		this.birthYear = birthYear;
		this.birthMonth = birthMonth;
		this.starSign = starSign;
		this.bloodType = bloodType;
		this.country = country;
		this.address = address;
		this.hobby = hobby;
		this.education = education;
		this.school = school;
		this.company = company;
		this.job = job;
		this.income = income;
		this.signature = signature;
		this.introduction = introduction;
	}

	public Integer getMemberNo() {
		return memberNo;
	}

	public void setMemberNo(Integer memberNo) {
		this.memberNo = memberNo;
	}

	public String getAccount() {
		return account;
	}

	public void setAccount(String account) {
		this.account = account;
	}

	public String getPassword() {
		return password;
	}

	public void setPassword(String password) {
		this.password = password;
	}

	public String getGender() {
		return gender;
	}

	public void setGender(String gender) {
		this.gender = gender;
	}

	public String getMail() {
		return mail;
	}

	public void setMail(String mail) {
		this.mail = mail;
	}

	public Blob getPicture() {
		return picture;
	}

	public void setPicture(Blob picture) {
		this.picture = picture;
	}

	public String getFullName() {
		return fullName;
	}

	public void setFullName(String fullName) {
		this.fullName = fullName;
	}

	public String getNickname() {
		return nickname;
	}

	public void setNickname(String nickname) {
		this.nickname = nickname;
	}

	public String getPhone() {
		return phone;
	}

	public void setPhone(String phone) {
		this.phone = phone;
	}

	public String getBirthYear() {
		return birthYear;
	}

	public void setBirthYear(String birthYear) {
		this.birthYear = birthYear;
	}

	public String getBirthMonth() {
		return birthMonth;
	}

	public void setBirthMonth(String birthMonth) {
		this.birthMonth = birthMonth;
	}

	public String getStarSign() {
		return starSign;
	}

	public void setStarSign(String starSign) {
		this.starSign = starSign;
	}

	public String getBloodType() {
		return bloodType;
	}

	public void setBloodType(String bloodType) {
		this.bloodType = bloodType;
	}

	public String getCountry() {
		return country;
	}

	public void setCountry(String country) {
		this.country = country;
	}

	public String getAddrArea() {
		return addrArea;
	}

	public void setAddrArea(String addrArea) {
		this.addrArea = addrArea;
	}

	public String getAddress() {
		return address;
	}

	public void setAddress(String address) {
		this.address = address;
	}

	public String getHobby() {
		return hobby;
	}

	public void setHobby(String hobby) {
		this.hobby = hobby;
	}

	public String getEducation() {
		return education;
	}

	public void setEducation(String education) {
		this.education = education;
	}

	public String getSchool() {
		return school;
	}

	public void setSchool(String school) {
		this.school = school;
	}

	public String getCompany() {
		return company;
	}

	public void setCompany(String company) {
		this.company = company;
	}

	public String getJob() {
		return job;
	}

	public void setJob(String job) {
		this.job = job;
	}

	public String getIncome() {
		return income;
	}

	public void setIncome(String income) {
		this.income = income;
	}

	public String getSignature() {
		return signature;
	}

	public void setSignature(String signature) {
		this.signature = signature;
	}

	public String getIntroduction() {
		return introduction;
	}

	public void setIntroduction(String introduction) {
		this.introduction = introduction;
	}

	public RoleBean getRolebean() {
		return rolebean;
	}

	public void setRolebean(RoleBean rolebean) {
		this.rolebean = rolebean;
	}

}
