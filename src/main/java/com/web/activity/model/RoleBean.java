package com.web.activity.model;

import java.io.Serializable;

import javax.persistence.CascadeType;
import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.OneToOne;
import javax.persistence.Table;
import javax.persistence.Transient;

@Entity
@Table(name="Role")
public class RoleBean implements Serializable {
	private static final long serialVersionUID = 1L;
		@Id
		@GeneratedValue(strategy = GenerationType.IDENTITY)
		private Integer roleNo;			//角色編號,PK自增,不顯示
//		@Column(nullable = false, updatable = false)
//		private String account;				//帳號,用以關聯角色
		private Integer level;				//等級,初始為1,管理員設為4
		private Integer emp;				//點數,初始為0,預設100後將level從1=>2;200從2=>3
		private Integer signTrip;			//登入次數,以當天日期判斷==>Date與lastTime不同則+1
		private String lastTime;			//上次登入時間,登入時抓取Date並改寫 
		private Integer postTrip;			//發文次數,活動貼文的同時判斷並+1
		private Integer finishTrip;		//成行次數,活動成行的同時判斷並+1
		@Transient
		private Integer trip; 				//活動次數,ajax顯示現在有的
		private Integer accountType;	//帳號狀態,預設1為正常,0為異常,未認證前為0,管理員level4可以更改
		private String code;					//啟用碼,亂數生成,帳號申請成功產生
		@Transient
		private Integer signType;			//登入狀態,於前端顯示預設1為線上,0為離線
		private Integer noticeType;		//注意狀態,預設1為正常,0為注意,管理員level4可以更改
		
		@OneToOne(cascade=CascadeType.ALL, mappedBy = "rolebean")
		MemberBean memberBean;
		
		public RoleBean () {}
		
		public RoleBean(
				Integer roleNo,
				String account,
				Integer level,
				Integer emp,
				Integer signTrip,
				String lastTime,
				Integer postTrip,
				Integer finishTrip,
				Integer accountType,
				String code,
				Integer signType,
				Integer noticeType
				) {
			this.roleNo = roleNo;
//			this.account = account;
			this.level = level;
			this.emp = emp;
			this.signTrip = signTrip;
			this.lastTime = lastTime;
			this.postTrip = postTrip;
			this.finishTrip = finishTrip;
			this.accountType = accountType;
			this.code = code;
			this.signType = signType;
			this.noticeType = noticeType;
		}
		
		public Integer getRoleNo() {
			return roleNo;
		}

		public void setRoleNo(Integer roleNo) {
			this.roleNo = roleNo;
		}
//
//		public String getAccount() {
//			return account;
//		}
//
//		public void setAccount(String account) {
//			this.account = account;
//		}

		public Integer getLevel() {
			return level;
		}

		public void setLevel(Integer level) {
			this.level = level;
		}

		public Integer getEmp() {
			return emp;
		}

		public void setEmp(Integer emp) {
			this.emp = emp;
		}

		public Integer getSignTrip() {
			return signTrip;
		}

		public void setSignTrip(Integer signTrip) {
			this.signTrip = signTrip;
		}

		public String getLastTime() {
			return lastTime;
		}

		public void setLastTime(String lastTime) {
			this.lastTime = lastTime;
		}

		public Integer getPostTrip() {
			return postTrip;
		}

		public void setPostTrip(Integer postTrip) {
			this.postTrip = postTrip;
		}

		public Integer getFinishTrip() {
			return finishTrip;
		}

		public void setFinishTrip(Integer finishTrip) {
			this.finishTrip = finishTrip;
		}

		public Integer getTrip() {
			return trip;
		}

		public void setTrip(Integer trip) {
			this.trip = trip;
		}

		public Integer getAccountType() {
			return accountType;
		}

		public void setAccountType(Integer accountType) {
			this.accountType = accountType;
		}

		public String getCode() {
			return code;
		}

		public void setCode(String code) {
			this.code = code;
		}

		public Integer getSignType() {
			return signType;
		}

		public void setSignType(Integer signType) {
			this.signType = signType;
		}

		public Integer getNoticeType() {
			return noticeType;
		}

		public void setNoticeType(Integer noticeType) {
			this.noticeType = noticeType;
		}

		public MemberBean getMemberBean() {
			return memberBean;
		}

		public void setMemberBean(MemberBean memberBean) {
			this.memberBean = memberBean;
		}
		
}
