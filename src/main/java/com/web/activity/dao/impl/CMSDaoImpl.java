package com.web.activity.dao.impl;

import java.util.List;

import org.hibernate.Session;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import org.hibernate.SessionFactory;
import com.web.activity.dao.CMSDao;
import com.web.activity.model.ActivityBean;

@Repository
public class CMSDaoImpl implements CMSDao {
	@Autowired
	SessionFactory factory;
	
	
	@Override
	public long getGenderCounts() {
		long count = 0; // 必須使用 long 型態
		String hql = "SELECT gender count(*) FROM MemberBean";
		Session session = factory.getCurrentSession();
		count = (Long)session.createQuery(hql).getSingleResult();
		return count;
	}
	
	@SuppressWarnings("unchecked")
	@Override
	public List<ActivityBean> getActiveLocation() {
		Session session = factory.getCurrentSession();
		String hql = "SELECT FROM ActivityBean WHERE location";
		List<ActivityBean> loc = session.createQuery(hql).getResultList();
		return loc;
	}
	
//	@Override
	
	
	
	

}
