package com.web.activity.model;

import java.sql.Blob;
import java.util.LinkedHashSet;
import java.util.Set;

import javax.persistence.CascadeType;
//import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.OneToMany;
import javax.persistence.Table;

//import org.hibernate.annotations.GenericGenerator;

//import com.web.activity.model.TripBean;

@Entity
@Table(name="Customer")
public class CustomerBean implements java.io.Serializable{

	private static final long serialVersionUID = 1L;
	@Id
//	@GeneratedValue(generator = "UUID")
//	@GenericGenerator(name = "UUID",strategy = "org.hibernate.id.UUIDGenerator")
//	@Column(name = "id", updatable = false, nullable = false)
//	private String id;
	
	@GeneratedValue(strategy=GenerationType.IDENTITY)
	private int id;
	private String loginId;
	private String password;
	private String userName;
	private String nickname;
	private String gender;
	private String email;
	private String tel;
	private int birthYear;
	private int birthMon;
	private String interest;
	private int level;
	private String authority;
	private String status;
	private Blob memberPic;
	
	@OneToMany(mappedBy="customerBean", cascade= {CascadeType.ALL})
	private Set<ActivityBean> activities = new LinkedHashSet<>();


	public int getId() {
		return id;
	}
	public void setId(int id) {
		this.id = id;
	}
	public String getLoginId() {
		return loginId;
	}
	public void setLoginId(String loginId) {
		this.loginId = loginId;
	}
	public String getUserName() {
		return userName;
	}
	public void setUserName(String userName) {
		this.userName = userName;
	}
	public String getPassword() {
		return password;
	}
	public void setPassword(String password) {
		this.password = password;
	}
	public String getNickname() {
		return nickname;
	}
	public void setNickname(String nickname) {
		this.nickname = nickname;
	}
	public String getStatus() {
		return status;
	}
	public void setStatus(String status) {
		this.status = status;
	}
	public String getGender() {
		return gender;
	}
	public void setGender(String gender) {
		this.gender = gender;
	}
	public String getEmail() {
		return email;
	}
	public void setEmail(String email) {
		this.email = email;
	}
	public String getTel() {
		return tel;
	}
	public void setTel(String tel) {
		this.tel = tel;
	}
	public int getBirthYear() {
		return birthYear;
	}
	public void setBirthYear(int birthYear) {
		this.birthYear = birthYear;
	}
	public int getBirthMon() {
		return birthMon;
	}
	public void setBirthMon(int birthMon) {
		this.birthMon = birthMon;
	}
	public String getInterest() {
		return interest;
	}
	public void setInterest(String interest) {
		this.interest = interest;
	}
	public int getLevel() {
		return level;
	}
	public void setLevel(int level) {
		this.level = level;
	}
	public String getAuthority() {
		return authority;
	}
	public void setAuthority(String authority) {
		this.authority = authority;
	}
	public Blob getMemberPic() {
		return memberPic;
	}
	public void setMemberPic(Blob memberPic) {
		this.memberPic = memberPic;
	}
	

	
	
	
	
}
