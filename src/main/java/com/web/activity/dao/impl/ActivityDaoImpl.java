package com.web.activity.dao.impl;

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
import com.web.activity.model.ActivityFollowedBean;
import com.web.activity.model.ActivityJoinedBean;
import com.web.activity.model.ActivityMsgBean;
import com.web.activity.model.ActivityPicBean;
import com.web.activity.model.ActivityTypeBean;
import com.web.activity.model.MemberBean;
import com.web.activity.model.ProvinceBean;

@Repository
@SuppressWarnings("unchecked")
public class ActivityDaoImpl implements ActivityDao {
	
	@Autowired
	SessionFactory factory;
	//----------------------------------------更新截止天數--------------------------------------------
		@Override
		public void updateLeftDays() {
			Session session = factory.getCurrentSession();
			String hql = "FROM ActivityBean";
			List<ActivityBean> lists = session.createQuery(hql).getResultList();
			for (ActivityBean bean:lists) {
				Date today = new Date();
				Date expiredDay = bean.getFinalDate();
				long diff = expiredDay.getTime() - today.getTime() ; //截止日跟今天差幾毫秒
				long diffDays = diff / (24 * 60 * 60 * 1000); //截止日跟今天差幾天
				bean.setLeftDays((int)diffDays);
				session.saveOrUpdate(bean);
			}
		}
	//----------------------------------------確認是否為截止日--------------------------------------------
	@Override
	public Map<String, Integer>  checkFinalDate() {
		Session session = factory.getCurrentSession();
		String hql = "UPDATE ActivityBean SET activityStatus = 'OK' WHERE finalDate = :now AND joinedNum >= minLimit ";
		String hqls = "FROM ActivityBean WHERE activityStatus = 'OK' AND finalDate = :now";

		String hql1 = "UPDATE ActivityBean SET activityStatus = 'inactive' WHERE finalDate = :now AND joinedNum < minLimit ";
		String hql1s = "FROM ActivityBean WHERE activityStatus = 'inactive' AND finalDate = :now";
		Date today = new Date();
		session.createQuery(hql).setParameter("now",today).executeUpdate();
		List<ActivityBean> OKLists = session.createQuery(hqls).setParameter("now",today).getResultList();
		session.createQuery(hql1).setParameter("now",today).executeUpdate();
		List<ActivityBean> inactiveLists = session.createQuery(hql1s).setParameter("now",today).getResultList();
		int todayOK = OKLists.size();
		int todayinactive = inactiveLists.size();
		Map <String, Integer> changedStatus = new HashMap<>();
		changedStatus.put("todayOK",todayOK);
		changedStatus.put("todayinactive",todayinactive);
		return changedStatus;
	}
	//----------------------------------------新增點擊率並回傳--------------------------------------------

	@Override
	public Integer updateHitCount(int activityNo) {
		Session session = factory.getCurrentSession();
		
		String hql = "FROM ActivityBean WHERE activityStatus = 'active' AND activityNo = :id ";
		ActivityBean list = (ActivityBean) session.createQuery(hql).setParameter("id",activityNo).getSingleResult();
		Integer hit = list.getHitCount();
		hit += 1; 
		
		hql = "UPDATE ActivityBean SET hitCount= :hit WHERE activityStatus = 'active' AND activityNo = :id ";
		session.createQuery(hql).setParameter("hit",hit).setParameter("id",activityNo).executeUpdate();
		return hit;
	}
	//----------------------------------------查詢全部的活動--------------------------------------------
	
	@Override
	public List<ActivityBean> selectAllActivities() {
		Session session = factory.getCurrentSession();
		String hql = "FROM ActivityBean WHERE activityStatus = 'active' ";
		List<ActivityBean> activities = session.createQuery(hql).getResultList();
		return activities;
	}
	
	//----------------------------------------查詢最新的活動--------------------------------------------
	@Override
	public List<ActivityBean> selectLatest() {
		Session session = factory.getCurrentSession();
		String hql = "FROM ActivityBean  WHERE activityStatus = 'active' ORDER BY createdDate DESC";
		List<ActivityBean> latestOnes = session.createQuery(hql).setFirstResult(0).setMaxResults(5).getResultList();
		return latestOnes;
	}
	
	//----------------------------------------查詢所有大類--------------------------------------------
	@Override
	public List<ActivityTypeBean> showAllTypes() {
		Session session = factory.getCurrentSession();
		String hql = "FROM ActivityTypeBean";
		List<ActivityTypeBean> allTypes = session.createQuery(hql).getResultList();
		return allTypes;
	}

	//----------------------------------------查詢所有小類--------------------------------------------
	@Override
	public List<ActivityClassBean> showAllClasses(String activityType) {
		Session session = factory.getCurrentSession();
		String hql = "FROM ActivityClassBean WHERE =:type";
		List<ActivityClassBean> allClasses = session.createQuery(hql).setParameter("type",activityType).getResultList();
		return allClasses;
	}

	//----------------------------------------查詢截止日--------------------------------------------
	@Override
	public List<ActivityBean> selectFinal() {
		Session session = factory.getCurrentSession();
		String hql = "FROM ActivityBean  WHERE activityStatus = 'active' ORDER BY finalDate DESC";
		List<ActivityBean> FinalOnes = session.createQuery(hql).getResultList();
		return FinalOnes;
	}
	
	//----------------------------------------查詢今天後舉辦的活動--------------------------------------------
	@Override
	public List<ActivityBean> selectRecentMonths() {
		Session session = factory.getCurrentSession();
		String hql = "FROM ActivityBean WHERE activityStatus = 'active' AND  activityDate >= :now";
		Date today = new Date();
		List<ActivityBean> actives = session.createQuery(hql).setParameter("now",today).getResultList();
		return actives;
	}
	
	//----------------------------------------查詢限定大類下的小類別--------------------------------------------
	@Override
	public List<ActivityClassBean> findCategories(String activityType) {
		Session session = factory.getCurrentSession();
		String hql = "FROM ActivityClassBean WHERE activityType = :activityType";
		List<ActivityClassBean> classes = session.createQuery(hql).setParameter("activityType",activityType).getResultList();
		return classes;
	}
	//----------------------------------------查詢限定大類下的小類別--------------------------------------------
		@Override
		public List<ActivityClassBean> classForCheckedType(String type) {
			Session session = factory.getCurrentSession();
			String hql = "FROM ActivityClassBean where activityType =:type";
			List<ActivityClassBean> list = session.createQuery(hql).setParameter("type",type).getResultList();
			return list;
		}
	//----------------------------------------查詢所有任何狀態的活動--------------------------------------------
	@Override
	public List<ActivityClassBean> selectAllClasses() {
		Session session = factory.getCurrentSession();
		String hql = "FROM ActivityClassBean";
		List<ActivityClassBean> allClasses = session.createQuery(hql).getResultList();
		return allClasses;
	}

	//----------------------------------------快篩查詢--------------------------------------------
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
	//----------------------------------------上架中之最近的活動日期開始--------------------------------------------
	@Override
	public List<ActivityBean> startFromLatest() {
		Session session = factory.getCurrentSession();
		String hql = "FROM ActivityBean WHERE activityStatus = 'active' ORDER BY activityDate ASC";
		List<ActivityBean> activities = session.createQuery(hql).getResultList();
		return activities;
	}

	//----------------------------------------上架中之最早的活動日期開始--------------------------------------------
	@Override
	public List<ActivityBean> startFromEarlest() {
		Session session = factory.getCurrentSession();
		String hql = "FROM ActivityBean WHERE activityStatus = 'active' ORDER BY activityDate DESC";
		List<ActivityBean> activities = session.createQuery(hql).getResultList();
		return activities;
	}

	//----------------------------------------上架中之最近的截止日期開始--------------------------------------------
	@Override
	public List<ActivityBean> endFromLatest() {
		Session session = factory.getCurrentSession();
		String hql = "FROM ActivityBean WHERE activityStatus = 'active' ORDER BY finalDate ASC";
		List<ActivityBean> activities = session.createQuery(hql).getResultList();
		return activities;
	}

	//----------------------------------------上架中之最早的截止日期開始--------------------------------------------
	@Override
	public List<ActivityBean> endFromEarlest() {
		Session session = factory.getCurrentSession();
		String hql = "FROM ActivityBean WHERE activityStatus = 'active' ORDER BY finalDate DESC";
		List<ActivityBean> activities = session.createQuery(hql).getResultList();
		return activities;
	}

	//----------------------------------------上架中之最低參加人數少數開始--------------------------------------------
	@Override
	public List<ActivityBean> peopleFromFew() {
		Session session = factory.getCurrentSession();
		String hql = "FROM ActivityBean WHERE activityStatus = 'active' ORDER BY minLimit ASC";
		List<ActivityBean> activities = session.createQuery(hql).getResultList();
		return activities;
	}

	//----------------------------------------上架中之最低參加人數多數開始--------------------------------------------
	@Override
	public List<ActivityBean> peopleFromMany() {
		Session session = factory.getCurrentSession();
		String hql = "FROM ActivityBean WHERE activityStatus = 'active' ORDER BY minLimit DESC";
		List<ActivityBean> activities = session.createQuery(hql).getResultList();
		return activities;
	}

	//----------------------------------------上架中之從北部活動開始--------------------------------------------
	@Override
	public List<ActivityBean> placeFromNorth() {
		Session session = factory.getCurrentSession();
		String hql = "FROM ActivityBean WHERE activityStatus = 'active' ORDER BY provId ASC";
		List<ActivityBean> activities = session.createQuery(hql).getResultList();
		return activities;
	}

	//----------------------------------------上架中之從南部活動開始--------------------------------------------
	@Override
	public List<ActivityBean> placeFromSouth() {
		Session session = factory.getCurrentSession();
		String hql = "FROM ActivityBean WHERE activityStatus = 'active' ORDER BY provId DESC";
		List<ActivityBean> activities = session.createQuery(hql).getResultList();
		return activities;
	}

	//----------------------------------------上架中之當月活動--------------------------------------------
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
	
	//----------------------------------------表單的條件查詢--------------------------------------------
	@Override
	public List<ActivityBean> selectByFrom(String price, String location, String limit, String small) {
		String[] smalltypes = small.split(",");
		Session session = factory.getCurrentSession();
		String hql = "FROM ActivityBean WHERE activityStatus = 'active' ";
		hql += " AND maxLimit "+	limit;
		hql += " AND location = '"+ location +"'";
		
		String priceshql ="";
		if (price.equals("0")) {
			priceshql = " AND price = '"+ price +"'";
			System.out.println("priceshql =0: "+priceshql);
		}else {
			priceshql += " AND price "+ price;
		}
		hql += priceshql;
		
		String smalltypeshql ="";
		for (int i = 0; i < smalltypes.length; i++) {
			if (i == 0) {
				smalltypeshql += " AND activityClassNo IN ('"+ smalltypes[0] +"'";
			}else {
				smalltypeshql += ", '"+ smalltypes[i] +"'";
			}
		}smalltypeshql += ")";
		hql += smalltypeshql;
		
		List<ActivityBean> list = new ArrayList<ActivityBean>();
		list = session.createQuery(hql).getResultList();	
		return list;

	}

	//----------------------------------------關鍵字查詢--------------------------------------------
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

	//----------------------------------------單一活動查詢--------------------------------------------
	@Override
	public ActivityBean selectOneActivity(int activityNo) {
		Session session = factory.getCurrentSession();
		String hql = "FROM ActivityBean WHERE activityNo = :no ";
		ActivityBean activity = (ActivityBean) session.createQuery(hql).setParameter("no",activityNo).getSingleResult();
		return activity;
	}

	//----------------------------------------留言版的存取--------------------------------------------
	@Override
	public List<ActivityMsgBean> saveMsg(String msg, Integer activityNo, Integer memberNo) {
		Session session = factory.getCurrentSession();
		ActivityMsgBean newmsg = new ActivityMsgBean();
		newmsg.setMemberBean(session.get(MemberBean.class, memberNo));
		newmsg.setActivityBean(session.get(ActivityBean.class, activityNo));
		newmsg.setMsgContent(msg);
		session.save(newmsg);
		
		String hql = "FROM ActivityMsgBean WHERE activityNo=:no";
		List<ActivityMsgBean> list = session.createQuery(hql).setParameter("no",activityNo).getResultList();
		return list;
	}
	
	//----------------------------------------留言版的修改--------------------------------------------
		@Override
		public void updateMsg(String msg, Integer msgNo) {
			Session session = factory.getCurrentSession();
			String hql = "UPDATE ActivityMsgBean SET msgContent=:msg WHERE msgNo=:no";
			session.createQuery(hql).setParameter("msg",msg).setParameter("no",msgNo).executeUpdate();
		}

	//----------------------------------------留言版的查詢----------------------------mjnhy---------------
	@Override
	public List<ActivityMsgBean> showMsg(int activityNo) {
		Session session = factory.getCurrentSession();
		String hql = "FROM ActivityMsgBean WHERE activityNo=:no";
		List<ActivityMsgBean> list = session.createQuery(hql).setParameter("no",activityNo).getResultList();
		return list;
	}
	
	//----------------------------------------留言版的刪除--------------------------------------------
		@Override
		public void deleteMsg(int msgNo) {
			Session session = factory.getCurrentSession();
			String hql = "DELETE FROM ActivityMsgBean WHERE msgNo=:no";
			session.createQuery(hql).setParameter("no",msgNo).executeUpdate();
		}

	//----------------------------------------查詢全部縣市--------------------------------------------
	@Override
	public List<ProvinceBean> selectAllProvs() {
		Session session = factory.getCurrentSession();
		String hql = "FROM ProvinceBean";
		List<ProvinceBean> list = session.createQuery(hql).getResultList();
		return list;
	}

	//----------------------------------------存入參加會員  參加人數的欄位+1--------------------------------------------
	@Override
	public void joinedOne(Integer memberNo, int activityNo) {
		Session session = factory.getCurrentSession();
		ActivityJoinedBean activityJoined = new ActivityJoinedBean(); //存參加名單
		activityJoined.setMemberBean(session.get(MemberBean.class,memberNo));
		activityJoined.setActivityBean(session.get(ActivityBean.class, activityNo));
		session.save(activityJoined);
		
		String url = "http://localhost:8080/JoyJoin/oneActivity/"+ activityNo;
		ActivityFollowedBean follow = new ActivityFollowedBean(); //存連結
		follow.setActivityUrl(url);
		follow.setMemberBean(session.get(MemberBean.class, memberNo));
		follow.setActivityBean(session.get(ActivityBean.class, activityNo));
		follow.setCondition("參加");
		session.save(follow);
		
		String hql = "FROM ActivityBean WHERE activityStatus = 'active' AND activityNo = :id ";
		ActivityBean list = (ActivityBean) session.createQuery(hql).setParameter("id",activityNo).getSingleResult();
		Integer joinedNum = list.getJoinedNum();
		joinedNum += 1;
		hql = "UPDATE ActivityBean SET joinedNum= :joinedNum WHERE activityStatus = 'active' AND activityNo = :id ";
		session.createQuery(hql).setParameter("joinedNum",joinedNum).setParameter("id",activityNo).executeUpdate();
	}
	
	//----------------------------------------取消參加會員  參加人數的欄位-1--------------------------------------------
		@Override
		public void cancelOne(Integer memberNo, int activityNo) {
			Session session = factory.getCurrentSession();
			String hql = "DELETE ActivityJoinedBean WHERE memberNo =: memberNo AND activityNo = :id ";
			session.createQuery(hql).setParameter("memberNo",memberNo)
									.setParameter("id",activityNo).executeUpdate();
			
			String hql1 = "DELETE FROM ActivityFollowedBean WHERE memberNo =: memberNo AND activityNo = :id";
			session.createQuery(hql1).setParameter("memberNo",memberNo)
									.setParameter("id",activityNo).executeUpdate();
			
			hql = "FROM ActivityBean WHERE activityStatus = 'active' AND activityNo = :id ";
			ActivityBean list = (ActivityBean) session.createQuery(hql).setParameter("id",activityNo).getSingleResult();
			Integer joinedNum = list.getJoinedNum();
			joinedNum -= 1;
			hql = "UPDATE ActivityBean SET joinedNum= :joinedNum WHERE activityStatus = 'active' AND activityNo = :id ";
			session.createQuery(hql).setParameter("joinedNum",joinedNum).setParameter("id",activityNo).executeUpdate();
		}

	//----------------------------------------參加活動的會員--------------------------------------------
	@Override
	public List<ActivityJoinedBean> joinedMember(int activityNo) {
		Session session = factory.getCurrentSession();
		String hql = "FROM ActivityJoinedBean WHERE activityNo = :id ";
		List<ActivityJoinedBean> list = session.createQuery(hql).setParameter("id",activityNo).getResultList();
		return list;
	}
	
	//----------------------------------------新增活動--------------------------------------------
		@Override
		public void createActivity(Integer memberNo, ActivityBean newform, ActivityPicBean pic) {
			Session session = factory.getCurrentSession();
			Date today = new Date();
			java.sql.Date sqltoday = new java.sql.Date(today.getTime());
//			SimpleDateFormat sdf = new SimpleDateFormat("yyyy/MM/dd");
//			Date sqltoday = sdf.(today);
//			java.sql.Date sqlDate1 = new java.sql.Date(date1.getTime());
			
			
			String prov = newform.getProv();
			System.out.println("prov="+prov);
			String hql1 = "FROM ProvinceBean WHERE prov = :prov ";
			ProvinceBean provs = (ProvinceBean) session.createQuery(hql1).setParameter("prov",prov).getSingleResult();
			String location = provs.getLocation();
			int provId = provs.getProvId();
			
			String type = newform.getActivityTypeName();
			String hql2 = "FROM ActivityTypeBean WHERE activityTypeName = :type ";
			ActivityTypeBean types = (ActivityTypeBean) session.createQuery(hql2).setParameter("type",type).getSingleResult();
			String activityTypeName = types.getActivityTypeName();
			String typeno = types.getActivityType();
			
			String classname = newform.getActivityClass();
			String hql3 = "FROM ActivityClassBean WHERE activityClass = :classname ";
			ActivityClassBean classes = (ActivityClassBean) session.createQuery(hql3).setParameter("classname",classname).getSingleResult();
			String activityClassNo = classes.getActivityClassNo();
			
			newform.setCreatedDate(sqltoday);
			newform.setActivityStatus("active");
			
			newform.setJoinedNum(0);
			newform.setHitCount(0);
			newform.setLocation(location);
			newform.setActivityTypeName(activityTypeName);
			newform.setMemberBean(session.get(MemberBean.class,memberNo));
			newform.setActivityTypeBean(session.get(ActivityTypeBean.class,typeno));
			newform.setProvinceBean(session.get(ProvinceBean.class,provId));
			newform.setActivityClassBean(session.get(ActivityClassBean.class,activityClassNo));
			session.save(newform);
			
			String hql4 = "SELECT MAX(activityNo) FROM ActivityBean "; //存照片
			Integer no = (Integer) session.createQuery(hql4).getSingleResult();
//			int no = list.getActivityNo();
			pic.setActivityBean(session.get(ActivityBean.class,no));
			session.save(pic);
			
			String url = "http://localhost:8080/JoyJoin/oneActivity/"+ no;
			ActivityFollowedBean follow = new ActivityFollowedBean(); //存連結
			follow.setActivityUrl(url);
			follow.setMemberBean(session.get(MemberBean.class, memberNo));
			follow.setActivityBean(session.get(ActivityBean.class, no));
			follow.setCondition("舉辦");
			session.save(follow);
		}
		
	//----------------------------------------關注活動存連結--------------------------------------------	
		@Override
		public void followActivity(Integer memberNo, ActivityFollowedBean follow,int activityNo) {
			Session session = factory.getCurrentSession();
			follow.setMemberBean(session.get(MemberBean.class, memberNo));
			follow.setActivityBean(session.get(ActivityBean.class, activityNo));
			follow.setCondition("關注");
			session.save(follow);
		}
		
	//----------------------------------------取消關注刪連結--------------------------------------------	
				
		@Override
		public void unfollowActivity(Integer memberNo,String activityUrl) {
			Session session = factory.getCurrentSession();
			String hql = "DELETE FROM ActivityFollowedBean WHERE activityUrl=:activityUrl AND memberNo=:no";
			session.createQuery(hql).setParameter("activityUrl",activityUrl)
									.setParameter("no",memberNo).executeUpdate();
		}


}
