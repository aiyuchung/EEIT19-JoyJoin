package com.web.activity.model;

import java.io.Serializable;

import javax.persistence.CascadeType;
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
		@GeneratedValue(strategy = GenerationType.AUTO)
		private String account;
		private Integer level;
		private Integer emp;
		private Integer signTrip;
		private Integer postTrip;
		private Integer finishTrip;
		@Transient
		private Integer trip; 
		private Integer accountType;
		private Integer signType;
		private Integer noticeType;
		
		@OneToOne(cascade=CascadeType.ALL, mappedBy = "rolebean")
		MemberBean memberBean;
		
		public RoleBean () {}
		
		public RoleBean(
				String account,
				Integer level,
				Integer emp,
				Integer signTrip,
				Integer postTrip,
				Integer finishTrip,
				Integer accountType,
				Integer signType,
				Integer noticeType
				) {
			this.account = account;
			this.level = level;
			this.emp = emp;
			this.signTrip = signTrip;
			this.postTrip = postTrip;
			this.finishTrip = finishTrip;
			this.accountType = accountType;
			this.signType = signType;
			this.noticeType = noticeType;
		}

		public String getAccount() {
			return account;
		}

		public void setAccount(String account) {
			this.account = account;
		}

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
