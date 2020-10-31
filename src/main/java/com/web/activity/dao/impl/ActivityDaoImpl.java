package com.web.activity.dao.impl;

import java.time.YearMonth;
import java.util.ArrayList;
import java.util.Date;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.web.activity.dao.ActivityDao;
import com.web.activity.model.ActivityBean;
import com.web.activity.model.ActivityClassBean;
import com.web.activity.model.ActivityTypeBean;

@Repository
@SuppressWarnings("unchecked")
public class ActivityDaoImpl implements ActivityDao {
	
	@Autowired
	SessionFactory factory;
	
	
	@Override
	public List<ActivityBean> selectAllActivities() {
		Session session = factory.getCurrentSession();
		String hql = "FROM ActivityBean WHERE activityStatus = 'active' ";
		List<ActivityBean> activities = session.createQuery(hql).getResultList();
		return activities;
	}
	
	@Override
	public List<ActivityBean> selectLatest() {
		Session session = factory.getCurrentSession();
		String hql = "FROM ActivityBean  WHERE activityStatus = 'active' ORDER BY createdDate DESC";
		List<ActivityBean> latestOnes = session.createQuery(hql).setFirstResult(0).setMaxResults(5).getResultList();
		return latestOnes;
	}
	
	@Override
	public List<ActivityTypeBean> showAllTypes() {
		Session session = factory.getCurrentSession();
		String hql = "FROM ActivityTypeBean  WHERE activityStatus = 'active'";
		List<ActivityTypeBean> allTypes = session.createQuery(hql).getResultList();
		return allTypes;
	}

	@Override
	public List<ActivityClassBean> showAllClasses(String activityType) {
		Session session = factory.getCurrentSession();
		String hql = "FROM ActivityClassBean WHERE =:type";
		List<ActivityClassBean> allClasses = session.createQuery(hql).setParameter("type",activityType).getResultList();
		return allClasses;
	}

	@Override
	public List<ActivityBean> selectFinal() {
		Session session = factory.getCurrentSession();
		String hql = "FROM ActivityBean  WHERE activityStatus = 'active' ORDER BY finalDate DESC";
		List<ActivityBean> FinalOnes = session.createQuery(hql).getResultList();
		return FinalOnes;
	}
	
	@Override
	public List<ActivityBean> selectRecentMonths() {
		Session session = factory.getCurrentSession();
		String hql = "FROM ActivityBean WHERE activityStatus = 'active' AND  activityDate >= :now";
		Date today = new Date();
		List<ActivityBean> actives = session.createQuery(hql).setParameter("now",today).getResultList();
		return actives;
	}
	
	@Override
	public List<ActivityClassBean> findCategories(String activityType) {
		Session session = factory.getCurrentSession();
		String hql = "FROM ActivityClassBean WHERE activityType = :activityType";
		List<ActivityClassBean> classes = session.createQuery(hql).setParameter("activityType",activityType).getResultList();
		return classes;
	}

	@Override
	public List<ActivityClassBean> selectAllClasses() {
		Session session = factory.getCurrentSession();
		String hql = "FROM ActivityClassBean";
		List<ActivityClassBean> allClasses = session.createQuery(hql).getResultList();
		return allClasses;
	}

	@Override
	public List<ActivityBean> checkedClasses(List<String> activityClass) {
		Session session = factory.getCurrentSession();
		List<ActivityBean> list = new ArrayList<ActivityBean>();
		String hql = "FROM ActivityBean WHERE " ;
		String classes ="";
			classes += "activityStatus = 'active'";
			System.out.println("if (activityClass == null for string =============================> "+classes);
			for (int i = 0; i < activityClass.size(); i++) {
				if (i == 0) {
					classes += "activityClass = '"+ activityClass.get(0) +"'";
//					System.out.println("first for string : "+classes);
				}else {
					classes += " OR activityClass = '"+ activityClass.get(i) +"'";
				}
			}
		hql += classes;
		System.out.println("final for string =============================> "+classes);
		list = session.createQuery(hql).getResultList();	
		return list;
	}

	@Override
	public List<ActivityBean> startFromLatest() {
		Session session = factory.getCurrentSession();
		String hql = "FROM ActivityBean WHERE activityStatus = 'active' ORDER BY activityDate DESC";
		List<ActivityBean> activities = session.createQuery(hql).getResultList();
		return activities;
	}

	@Override
	public List<ActivityBean> startFromEarlest() {
		Session session = factory.getCurrentSession();
		String hql = "FROM ActivityBean WHERE activityStatus = 'active' ORDER BY activityDate ASC";
		List<ActivityBean> activities = session.createQuery(hql).getResultList();
		return activities;
	}

	@Override
	public List<ActivityBean> endFromLatest() {
		Session session = factory.getCurrentSession();
		String hql = "FROM ActivityBean WHERE activityStatus = 'active' ORDER BY finalDate DESC";
		List<ActivityBean> activities = session.createQuery(hql).getResultList();
		return activities;
	}

	@Override
	public List<ActivityBean> endFromEarlest() {
		Session session = factory.getCurrentSession();
		String hql = "FROM ActivityBean WHERE activityStatus = 'active' ORDER BY finalDate ASC";
		List<ActivityBean> activities = session.createQuery(hql).getResultList();
		return activities;
	}

	@Override
	public List<ActivityBean> peopleFromFew() {
		Session session = factory.getCurrentSession();
		String hql = "FROM ActivityBean WHERE activityStatus = 'active' AND ";
		List<ActivityBean> activities = session.createQuery(hql).getResultList();
		return activities;
	}

	@Override
	public List<ActivityBean> peopleFromMany() {
		Session session = factory.getCurrentSession();
		String hql = "FROM ActivityBean WHERE activityStatus = 'active' ORDER BY minLimit ACSC";
		List<ActivityBean> activities = session.createQuery(hql).getResultList();
		return activities;
	}

	@Override
	public List<ActivityBean> placeOfNorth() {
		Session session = factory.getCurrentSession();
		String hql = "FROM ActivityBean WHERE activityStatus = 'active' ORDER BY minLimit ACSC";
		List<ActivityBean> activities = session.createQuery(hql).getResultList();
		return activities;
	}

	@Override
	public List<ActivityBean> placeOfWest() {
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	public List<ActivityBean> placeOfEast() {
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	public List<ActivityBean> placeOfSouth() {
		// TODO Auto-generated method stub
		return null;
	}


	

	

}
