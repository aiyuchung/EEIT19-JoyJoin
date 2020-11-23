package com.web.activity.dao.impl;

import java.util.ArrayList;
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
import com.web.activity.model.OrderBean;
//import com.web.activity.model.RoleBean;
import com.web.activity.model.RoleBean;
import com.web.activity.model.RoleCheckBean;
import com.web.activity.model.RoleSaveBean;
import com.web.activity.model.SystemLog;

@Repository
@SuppressWarnings("unchecked")
public class CMSDaoImpl implements CMSDao {
	@Autowired
	SessionFactory factory;

//==========================================圖表	
	// 星座次數
		@Override

		public Map<String, Long> getstarSignCounts() {
			Session session = factory.getCurrentSession();
			Map<String, Long> map = new HashMap<>();
			String[] arrayGender = { "白羊座", "金牛座", "雙子座", "巨蟹座", "獅子座", "處女座", "天秤座", "天蠍座", "射手座", "摩羯座", "水瓶座", "雙魚座" };
			for (String starSign : arrayGender) {
				String hqls = "select count(*) FROM MemberBean Where starSign=:starSign";
				Long star = (Long) session.createQuery(hqls).setParameter("starSign", starSign).uniqueResult();
				map.put(starSign, star);// KEY:VALUE
				System.out.println("map =>>>>>>>>>>>>>>>" + map);
				System.out.println("您好");
			}

			return map;

		}
	
	
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
	
//==========================================圖表	

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
	//權限設定
	@Override
	public List<Menubean> rights() {
		Session session = factory.getCurrentSession();
		String hql = "FROM Menubean  ";
		List<Menubean> cms = session.createQuery(hql).getResultList();
		return cms;
	}
	//下拉式選單管理員選擇
	@Override
	public List<RoleCheckBean> checkRole() {
		Session session = factory.getCurrentSession();
		String hql ="FROM RoleCheckBean ";
//		List<RoleCheckBean> list=session.createQuery(hql).getResultList();
		return session.createQuery(hql).getResultList();
	}
	//下拉式選單取管理員的值
	@Override
	public List<RoleSaveBean> selectRole() {
		Session session = factory.getCurrentSession();
		String hql ="FROM RoleSaveBean";
		return session.createQuery(hql).getResultList();
	}
	
	//存節點和人員	
	@Override
	public void saveRsb(String roleId, String ztreeSave) {
		Session session = factory.getCurrentSession();
		RoleSaveBean rsb =new RoleSaveBean();
		rsb.setRoleId(Integer.parseInt(roleId));
		rsb.setMenuId(Integer.parseInt(ztreeSave));
		session.save(rsb);
		
		
	}
	@Override
	public List<RoleSaveBean> saveRsb() {
	
		return null;
	}
	
	public List<Integer> forRoleRight(int rsbList) {
		Session session = factory.getCurrentSession();
		String hql = "FROM RoleSaveBean WHERE roleId = :id";
		List <RoleSaveBean> rights = session.createQuery(hql).setParameter("id",rsbList).getResultList();		 
		List<Integer> checked =  new ArrayList<>();
		for (RoleSaveBean rsb:rights) {
			checked.add(rsb.getMenuId());
		}
		return checked;
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
	
	//更新虛擬角色
		@Override
		public void updateRole(RoleBean RoleB) {
			System.out.println(RoleB.getRoleNo());
			System.out.println(RoleB.getLevel());
			
			Session session = factory.getCurrentSession();
			String hqlr = "UPDATE RoleBean SET level = :level, "
					+ "Emp = :Emp, "
					+ "accountType = :accountType, "
					+ "noticeType = :noticeType "
					+ "WHERE roleNo = :roleNo ";
			int num =  session.createQuery(hqlr).setParameter("level", RoleB.getLevel())
									 .setParameter("Emp", RoleB.getEmp())
									 .setParameter("accountType", RoleB.getAccountType())
									 .setParameter("noticeType", RoleB.getNoticeType())
									 .setParameter("roleNo", RoleB.getRoleNo())
									 .executeUpdate();
			System.out.println(num);
			System.out.println("hello BABY");
		}
		
		
		
		
		
		
		//搜尋單筆虛擬角色
		@Override
		public RoleBean getRole(Integer roleNo) {
			Session session = factory.getCurrentSession();
			RoleBean ro = session.get(RoleBean.class,roleNo);
			return ro;
		}
		
		
		//關鍵字虛擬角色
		@Override
		public List<RoleBean> selectRoles(String keyWord) {
			Session session = factory.getCurrentSession();
			String hql = "FROM RoleBean WHERE account like '%"+keyWord+"%'  ";
			String[] keyWords =keyWord.split(" ");
			String key ="";
			for (int i = 0; i< keyWords.length; i++) {
				key += "OR account LIKE '%"+ keyWords[i] +"%'";
				key += "OR level LIKE '%"+ keyWords[i] +"%'";
				key += "OR accountType LIKE '%"+ keyWords[i] +"%'";
				
			}
			hql += key;
			List<RoleBean> ro = session.createQuery(hql).getResultList();
			return ro;
		}
		
		
		//搜尋日誌內容
		@Override
		public List<SystemLog> selectSystemLog(){
			Session session = factory.getCurrentSession();
			String hql = "FROM SystemLog";
			List<SystemLog> sl = session.createQuery(hql).getResultList();

			return sl;
		}
		
//		<<<<<<<<<<<<<<<針對訂單部分>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>
		//搜尋訂單
		@Override
		public List<OrderBean> selectAllOrder() {
			Session session = factory.getCurrentSession();
			String hql = "FROM OrderBean";
			List<OrderBean> ob = session.createQuery(hql).getResultList();
//			System.out.println(mb);
			return ob;
		}
		
		

}
