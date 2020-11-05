package com.web.activity.dao.impl;
//rolebean的lasttime還沒寫
import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.web.activity.dao.MemberDao;
import com.web.activity.model.MemberBean;
import com.web.activity.model.RoleBean;

@Repository
public class MemberDaoImpl implements MemberDao {

	@Autowired
	SessionFactory factory;

	@Override
	public void signUp(MemberBean mb) {
			Session session = factory.getCurrentSession();
			createRole(mb.getAccount());
			session.save(mb);
	}

	@Override
	public void createRole(String account) {
			RoleBean rb = new RoleBean();
//			rb.setAccount(account);
			rb.setLevel(1);
			rb.setEmp(0);
			rb.setSignTrip(1);
			rb.setPostTrip(0);
			rb.setFinishTrip(0);
			rb.setAccountType(0);
			rb.setSignType(1);
			rb.setNoticeType(1);
			Session session = factory.getCurrentSession();
			session.save(rb);
			}

	@Override
	public void sentMail(String email) {
		
	}
	
	@Override
	public boolean checkID(String account, String password) {
		String hql = "SELECT password FROM MemberBean WHERE account = :id";
		Session session = factory.getCurrentSession();
		String pwd = null;
		try {
			pwd = (String) session.createQuery(hql).setParameter("id", account)
																		 .getSingleResult();
		}catch(Exception e){
			return false;
		}
		
		if( pwd.equals(password)) {
			if( checkType(account) ) {
				return true;
			}else {
				return false;
			}			
		}else {
			return false;
		}
	}

	@Override
	public boolean checkType(String account) {
		String hql = "SELECT accountType FROM RoleBean WHERE account = :id";
		Session session = factory.getCurrentSession();
		Integer flag = null;
		try {
			flag = (Integer) session.createQuery(hql)
												.setParameter("id", account)
												.getSingleResult();
		}catch(Exception e) {
			return false;
		}
		if ( flag == 1 ) {
			return true;
		}else
			return false;
	}

	public boolean checkManager(String account) {
		String hql = "SELECT level FROM RoleBean WHERE account = :id";
		Session session = factory.getCurrentSession();
		Integer flag = null;
		try {
			flag = (Integer) session.createQuery(hql)
												.setParameter("id", account)
												.getSingleResult();
		}catch(Exception e) {
			;
		}
		if( flag == 4 ) {
			return true;
		}else {
			return false;
		}
	}
	
	@Override
	public void updateInfo(MemberBean mb) {
		Session session = factory.getCurrentSession();
		String hql = "UPDATE MemberBean SET password = :password, gender = :gender, picture = :picture"
				+ ", nickname = :nickname, birthYear = :year, birthMonth = :month, starSign = :star, bloodType = :blood"
				+ ", country = :country, address = :address, hobby = :hobby, education = :education, school = :school"
				+ ", company = :company, job = :job, income = :income, signature = :signature, introduction = :introduction"
				+ " WHERE account = :id";
		session.createQuery(hql).setParameter("id", mb.getAccount())
											  .setParameter("password", mb.getPassword())
											  .setParameter("gender", mb.getGender())
											  .setParameter("picture", mb.getPicture())
											  .setParameter("nickname", mb.getNickname())
											  .setParameter("year", mb.getBirthYear())
											  .setParameter("month", mb.getBirthMonth())
											  .setParameter("star", mb.getStarSign())
											  .setParameter("blood", mb.getBloodType())
											  .setParameter("country", mb.getCountry())
											  .setParameter("address", mb.getAddress())
											  .setParameter("hobby", mb.getHobby())
											  .setParameter("education", mb.getEducation())
											  .setParameter("school", mb.getSchool())
											  .setParameter("company", mb.getCompany())
											  .setParameter("job", mb.getJob())
											  .setParameter("income", mb.getIncome())
											  .setParameter("signature", mb.getSignature())
											  .setParameter("introduction", mb.getIntroduction())
											 .executeUpdate();		
		}

	@Override
	public void openType(String account) {
		String hql = "UPDATE RoleBean SET accountType = :type WHERE account = :id";
		Session session = factory.getCurrentSession();
		session.createQuery(hql).setParameter("type", 1)
											  .setParameter("id", account).executeUpdate();
	};
	
	@Override
	public void updateSign(String account) {
		String hql1 = "SELECT signType FROM RoleBean WHERE account = :id";
		String hql2 = "UPDATE RoleBean SET signType = :st WHERE account = :id";
		Session session = factory.getCurrentSession();
		Integer time = null;
		try{
			time = (Integer) session.createQuery(hql1).setParameter("id", account).getSingleResult();
		}catch(Exception e) {
			;
		}
		session.createQuery(hql2).setParameter("st", time)
												.setParameter("id", account)
												.executeUpdate();
	}

	
	@Override
	public void updatePost(String account) {
		String hql1 = "SELECT postType FROM RoleBean WHERE account = :id";
		String hql2 = "UPDATE RoleBean SET postType = :pt WHERE account = :id";
		Session session = factory.getCurrentSession();
		Integer time = null;
		try{
			time = (Integer) session.createQuery(hql1).setParameter("id", account).getSingleResult();
		}catch(Exception e) {
			;
		}
		session.createQuery(hql2).setParameter("pt", time)
												.setParameter("id", account)
												.executeUpdate();
	}

	
	@Override
	public void updateFinish(String account) {
		String hql1 = "SELECT finishType FROM RoleBean WHERE account = :id";
		String hql2 = "UPDATE RoleBean SET finishType = :ft WHERE account = :id";
		Session session = factory.getCurrentSession();
		Integer time = null;
		try{
			time = (Integer) session.createQuery(hql1).setParameter("id", account).getSingleResult();
		}catch(Exception e) {
			;
		}
		session.createQuery(hql2).setParameter("ft", time)
												.setParameter("id", account)
												.executeUpdate();

	}

}