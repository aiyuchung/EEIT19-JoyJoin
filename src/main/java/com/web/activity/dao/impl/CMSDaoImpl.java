package com.web.activity.dao.impl;

import java.util.List;

//import java.util.List;

import org.hibernate.Session;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import org.hibernate.SessionFactory;
import com.web.activity.dao.CMSDao;
import com.web.activity.model.ActivityBean;

@Repository
@SuppressWarnings("unchecked")
public class CMSDaoImpl implements CMSDao {
	@Autowired
	SessionFactory factory;
	
	
	@Override
	public long getGenderCounts() {
		long count = 0; // 必須使用 long 型態 gender
		String hql = "SELECT count(*) FROM MemberBean";
		Session session = factory.getCurrentSession();
		count = (Long)session.createQuery(hql).getSingleResult();
		return count;
	}
	
//	@SuppressWarnings("unchecked")
	@Override
	public long getActiveLocation() {
		long count = 0; // 必須使用 long 型態 location
		String hql = "select count(location) FROM ActivityBean group by";
		Session session = factory.getCurrentSession();	
		count = (Long)session.createQuery(hql).getSingleResult();
		return count;
	}
//	 WHERE activityStatus = 'active'
	@Override
	public List<ActivityBean> selectAllActivities() {
		Session session = factory.getCurrentSession();
		String hql = "FROM ActivityBean";
		List<ActivityBean> cms = session.createQuery(hql).getResultList();
		return cms;
	}

}
