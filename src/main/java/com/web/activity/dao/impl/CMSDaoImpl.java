package com.web.activity.dao.impl;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

//import java.util.List;

import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.web.activity.dao.CMSDao;
import com.web.activity.model.ActivityBean;
import com.web.activity.model.MemberBean;
import com.web.activity.model.Menubean;
//import com.web.activity.model.RoleBean;
import com.web.activity.model.RoleBean;

@Repository
@SuppressWarnings("unchecked")
public class CMSDaoImpl implements CMSDao {
	@Autowired
	SessionFactory factory;

	@Override
	public Map<String, Long> getGenderCounts() {
		Session session = factory.getCurrentSession();
		Map<String, Long> map = new HashMap<>();
		String[] arrayGender = { "男", "女", "無" };
		for (String gender : arrayGender) {
			String hqlg = "select count(*) FROM MemberBean Where gender=:gender";
			Long gen = (Long) session.createQuery(hqlg).setParameter("gender", gender).uniqueResult();
			map.put(gender, gen);// KEY:VALUE
//			System.out.println("map =>>>>>>>>>>>>>>>" + map);
		}

		return map;

	}

//		String hql1 = "SELECT ab.location,COUNT(ab.activityNo) FROM ActivityBean ab WHERE  =:南";
//		String hql2 = "SELECT ab.location,COUNT(ab.activityNo) FROM ActivityBean ab GROUP BY ab.location";
//		String hql3 = "SELECT ab.location,COUNT(ab.activityNo) FROM ActivityBean ab GROUP BY ab.location";
//		String hql4 = "SELECT ab.location,COUNT(ab.activityNo) FROM ActivityBean ab GROUP BY ab.location";
	@Override
	public Map<String, Long> getActiveLocation() { // 回傳MAP型態
//		long count = 0; // 必須使用 long 型態 location
		Session session = factory.getCurrentSession();
		Map<String, Long> map = new HashMap<String, Long>();
		String[] arrayLocation = { "north", "west", "south", "east" };
		for (String location : arrayLocation) {
			String hql = "select count(*) FROM ActivityBean where location =:location";
			Long loc = (Long) session.createQuery(hql).setParameter("location", location).uniqueResult();
			map.put(location, loc);// KEY VALUE
		}

		return map;
	}

	@Override
	public Map<String, Long> getActivityProv() {
		Session session = factory.getCurrentSession();
		Map<String, Long> map = new HashMap<String, Long>();
		String[] arrayLocation = { "基隆市", "台北市", "新北市", "桃園市", "新竹市", "新竹縣", "宜蘭縣", "苗栗縣", "台中市", "彰化縣", "南投縣", "雲林縣",
				"嘉義市", "嘉義縣", "台南市", "高雄市", "屏東縣", "台東縣", "花蓮縣", "澎湖縣", "金門縣", "連江縣" };
		for (String prov : arrayLocation) {
			String hqlp = "select count(*) FROM ActivityBean where prov =:prov";
			Long pro = (Long) session.createQuery(hqlp).setParameter("prov", prov).uniqueResult();
			map.put(prov, pro);// KEY VALUEpro
//			System.out.println("map =>>>>>>>>>>>>>>>" + map);
		}
		return map;

	}

//	<<<<<<<<<<<<<<<針對活動部分>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>
//	 WHERE activityStatus = 'active'
	@Override
	public List<ActivityBean> selectAllActivities() {
		Session session = factory.getCurrentSession();
		String hql = "FROM ActivityBean";
		List<ActivityBean> cms = session.createQuery(hql).getResultList();
		return cms;
	}
//	左邊標頭
	@Override
	public List<Menubean> getMenuName(String classId) {
		Session session = factory.getCurrentSession();
		String hql ="FROM Menubean WHERE classId = '"+classId+"'  ";
		List<Menubean> cms = session.createQuery(hql).getResultList();
		return cms;
	}
	//關鍵字搜尋
	@Override
	public List<ActivityBean> selectActivities(String keyWord) {
		Session session = factory.getCurrentSession();
		String hql = "FROM ActivityBean WHERE activityClass like '%"+keyWord+"%'  ";
		String[] keyWords =keyWord.split(" ");
		String key ="";
		for (int i = 0; i< keyWords.length; i++) {
			key += "OR name LIKE '%"+ keyWords[i] +"%'";
			key += "OR prov LIKE '%"+ keyWords[i] +"%'";
			key += "OR finalDate LIKE '%"+ keyWords[i] +"%'";
			key += "OR activityStatus LIKE '%"+ keyWords[i] +"%'";
			key += "OR activityClass LIKE '%"+ keyWords[i] +"%'";
		}
		hql += key;
		List<ActivityBean> cms = session.createQuery(hql).getResultList();
		return cms;
	}


	//單獨更新activityStatus
	@Override
	public int updateActivityStatus(String activityStatus,String activityNo) {
		Session session = factory.getCurrentSession();
		String hql = "UPDATE ActivityBean SET activityStatus= :activityStatus WHERE activityNO = :id ";
		return session.createQuery(hql).setParameter("activityStatus",activityStatus).setParameter("id",Integer.parseInt(activityNo)).executeUpdate();		 
	}
	
	@Override
	public List<ActivityBean> selectAllActivitiesAtive() {
		Session session = factory.getCurrentSession();
		String hql = "FROM ActivityBean WHERE activityStatus = 'active' ";
		List<ActivityBean> activities = session.createQuery(hql).getResultList();
		return activities;
	}

	@Override
	public List<ActivityBean> selectAllActivitiesInAtive() {
		Session session = factory.getCurrentSession();
		String hql = "FROM ActivityBean WHERE activityStatus = 'inactive' ";
		List<ActivityBean> activities = session.createQuery(hql).getResultList();
		return activities;
	}

//	<<<<<<<<<<<<<<<針對會員部分>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>
	@Override
	public List<MemberBean> selectAllMembers() {
		Session session = factory.getCurrentSession();
		String hql = "FROM MemberBean";
		List<MemberBean> mb = session.createQuery(hql).getResultList();
//		System.out.println(mb);
		return mb;

	}
	@Override
	public List<RoleBean> selectAllRoles() {
		Session session = factory.getCurrentSession();
		String hql = "FROM RoleBean";
		List<RoleBean> mb = session.createQuery(hql).getResultList();
//		System.out.println(mb);
		return mb;
		
	}


}
