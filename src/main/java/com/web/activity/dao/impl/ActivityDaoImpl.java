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
		String hql = "FROM ActivityTypeBean";
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
		String hql = "FROM ActivityBean WHERE activityStatus = 'active' AND " ;
		String classes ="";
			for (int i = 0; i < activityClass.size(); i++) {
				if (i == 0) {
					classes += "activityClass = '"+ activityClass.get(0) +"'";
//					System.out.println("first for string : "+classes);
				}else {
					classes += " OR activityClass = '"+ activityClass.get(i) +"'";
				}
			}
		hql += classes;
//		System.out.println("final for string =============================> "+classes);
		list = session.createQuery(hql).getResultList();	
		return list;
	}
//ajax排序
	@Override
	public List<ActivityBean> startFromLatest() {
		Session session = factory.getCurrentSession();
		String hql = "FROM ActivityBean WHERE activityStatus = 'active' ORDER BY activityDate ASC";
		List<ActivityBean> activities = session.createQuery(hql).getResultList();
		return activities;
	}

	@Override
	public List<ActivityBean> startFromEarlest() {
		Session session = factory.getCurrentSession();
		String hql = "FROM ActivityBean WHERE activityStatus = 'active' ORDER BY activityDate DESC";
		List<ActivityBean> activities = session.createQuery(hql).getResultList();
		return activities;
	}

	@Override
	public List<ActivityBean> endFromLatest() {
		Session session = factory.getCurrentSession();
		String hql = "FROM ActivityBean WHERE activityStatus = 'active' ORDER BY finalDate ASC";
		List<ActivityBean> activities = session.createQuery(hql).getResultList();
		return activities;
	}

	@Override
	public List<ActivityBean> endFromEarlest() {
		Session session = factory.getCurrentSession();
		String hql = "FROM ActivityBean WHERE activityStatus = 'active' ORDER BY finalDate DESC";
		List<ActivityBean> activities = session.createQuery(hql).getResultList();
		return activities;
	}

	@Override
	public List<ActivityBean> peopleFromFew() {
		Session session = factory.getCurrentSession();
		String hql = "FROM ActivityBean WHERE activityStatus = 'active' ORDER BY minLimit ASC";
		List<ActivityBean> activities = session.createQuery(hql).getResultList();
		return activities;
	}

	@Override
	public List<ActivityBean> peopleFromMany() {
		Session session = factory.getCurrentSession();
		String hql = "FROM ActivityBean WHERE activityStatus = 'active' ORDER BY minLimit DESC";
		List<ActivityBean> activities = session.createQuery(hql).getResultList();
		return activities;
	}
	
	@Override
	public List<ActivityBean> placeFromNorth() {
		Session session = factory.getCurrentSession();
		String hql = "FROM ActivityBean WHERE activityStatus = 'active' ORDER BY provId ASC";
		List<ActivityBean> activities = session.createQuery(hql).getResultList();
		return activities;
	}

	@Override
	public List<ActivityBean> placeFromSouth() {
		Session session = factory.getCurrentSession();
		String hql = "FROM ActivityBean WHERE activityStatus = 'active' ORDER BY provId DESC";
		List<ActivityBean> activities = session.createQuery(hql).getResultList();
		return activities;
	}

	@Override
	public List<ActivityBean> selectRecentMon(Date Datethismon1, Date Datethismon31) {
		Session session = factory.getCurrentSession();
		String hql = "FROM ActivityBean WHERE activityStatus = 'active' AND activityDate BETWEEN :stDate AND :edDate";
		List<ActivityBean> activities = session.createQuery(hql)
				.setParameter("stDate",Datethismon1)
				.setParameter("edDate",Datethismon31)
				.getResultList();
		return activities;
	}
	@Override
	public List<ActivityBean> selectByFrom(String price, String location, String limit, String small) {
		String[] prices = price.split(","); 
		String[] locations = location.split(",");
		String[] limits = limit.split(",");
		String[] smalltypes = small.split(",");
		Session session = factory.getCurrentSession();
		String hql = "FROM ActivityBean WHERE activityStatus = 'active' ";
		String priceshql ="";
		String locationshql ="";
		String limitshql ="";
		String smalltypeshql ="";
		for (int i = 0; i < prices.length; i++) {
			if (i == 0) {
				if (prices[0].equals("0")) {
					priceshql = "AND price = '"+ prices[0] +"'";
					System.out.println("priceshql =0: "+priceshql);
				}else {
				priceshql += "AND price "+ prices[0];
				}
			}else {
				priceshql += " OR price "+ prices[i];
			}
		}
		System.out.println("priceshql : "+priceshql);
		for (int i = 0; i < limits.length; i++) {
			if (i == 0) {
				limitshql += "AND maxLimit "+ limits[0];
			}else {
				limitshql += " OR maxLimit "+ limits[i];
			}
		}
		System.out.println("limitshql : "+limitshql);
		for (int i = 0; i < locations.length; i++) {
			if (i == 0) {
				locationshql += "AND location = '"+ locations[0] +"'";
			}else {
				locationshql += " OR location = '"+ locations[i] +"'";
			}
		}
		System.out.println("locationshql : "+locationshql);
		for (int i = 0; i < smalltypes.length; i++) {
			if (i == 0) {
				smalltypeshql += "AND activityClassNo ='"+ smalltypes[0] +"'";
			}else {
				smalltypeshql += " OR activityClassNo  ='"+ smalltypes[i] +"'";
			}
		}
		System.out.println("smalltypeshql : "+smalltypeshql);
		
		hql = hql + priceshql + limitshql + locationshql + smalltypeshql;
		List<ActivityBean> list = new ArrayList<ActivityBean>();
		list = session.createQuery(hql).getResultList();	
		System.out.println("List<ActivityBean> list : "+list);
		System.out.println("--------------------------------------------------------------- ");
		return list;

	}

	@Override
	public List<ActivityBean> searchByKey(String keyWord) {
		Session session = factory.getCurrentSession();
		String hql = "FROM ActivityBean WHERE activityStatus = 'active' ";
		
		String[] keyWords =keyWord.split(" ");
		String key ="";
		for (int i = 0; i< keyWords.length; i++) {
			key += "AND name LIKE '%"+ keyWords[i] +"%'";
			key += "OR prov LIKE '%"+ keyWords[i] +"%'";
			key += "OR introduction LIKE '%"+ keyWords[i] +"%'";
			key += "OR activityClass LIKE '%"+ keyWords[i] +"%'";
		}
		
		hql += key;
		List<ActivityBean> beans = session.createQuery(hql).getResultList();
		return beans;

    }


}
