package com.web.activity.dao;

import java.util.List;
import java.util.Map;

import com.web.activity.model.ActivityBean;
import com.web.activity.model.MemberBean;
import com.web.activity.model.Menubean;
import com.web.activity.model.OrderBean;
//import com.web.activity.model.RoleBean;
import com.web.activity.model.RoleBean;
import com.web.activity.model.RoleCheckBean;
import com.web.activity.model.RoleSaveBean;
import com.web.activity.model.SystemLog;

//import java.util.List;
//
//import com.web.activity.model.ActivityBean;

public interface CMSDao {

	//=========================================================right部分
	//權限設定
		List<Menubean> rights ();
		//下拉式選單管理員選擇
		List<RoleCheckBean> checkRole();	
		//下拉式選單取管理員的值
		List<RoleSaveBean> selectRole();
		//存節點和人員
		void saveRsb(String roleId, String ztreeSave);	
	
		List<Integer> forRoleRight(int rsbList);
	
	

	//=========================================================right部分end
	
	
	// 圖表統計
	Map<String, Long> getGenderCounts();

	Map<String, Long> getActiveLocation();

	Map<String, Long> getActivityProv();

	Map<String, Long> getstarSignCounts();

	
	
	
	// <活動部分>
	List<ActivityBean> selectActivities(String keyWord);//關鍵字搜尋
	
	//	左邊標頭	
	List<Menubean> getMenuName(String classId);

	// 單獨更新activityStatus
	int updateActivityStatus(String activityStatus, String activityNo);
	
	
	
	

	List<ActivityBean> selectAllActivities();

	List<ActivityBean> selectAllActivitiesAtive();

	List<ActivityBean> selectAllActivitiesInAtive();

	//搜尋訂單
		List<OrderBean> selectAllOrder();
	
	// <會員部分>
	List<MemberBean> selectAllMembers();

	List<RoleBean> selectAllRoles();
	
	
	//搜尋關鍵字角色

		List<RoleBean> selectRoles(String keyWord);//關鍵字搜尋
	
	//
	List<RoleSaveBean> saveRsb();
	

	// 更新虛擬角色
	void updateRole(RoleBean RoleB);

	// 搜尋單筆資料
	RoleBean getRole(Integer roleNo);
	
	//搜尋日誌內容
	List<SystemLog> selectSystemLog();

}
