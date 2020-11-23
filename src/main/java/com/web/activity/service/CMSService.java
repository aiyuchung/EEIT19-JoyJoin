package com.web.activity.service;

import java.util.List;
import java.util.Map;

import com.web.activity.model.ActivityBean;
import com.web.activity.model.MemberBean;
import com.web.activity.model.Menubean;
import com.web.activity.model.OrderBean;
import com.web.activity.model.RoleBean;
import com.web.activity.model.RoleCheckBean;
import com.web.activity.model.RoleSaveBean;
import com.web.activity.model.SystemLog;

//import java.util.List;
//
//import com.web.activity.model.ActivityBean;

public interface CMSService {

	//下拉式選單取管理員的值
		List<RoleSaveBean> selectRole();
		//	<活動清單搜尋>
		List<ActivityBean> selectActivities(String keyWord);//關鍵字搜尋
		
		//單獨更新activityStatus
		int updateActivityStatus(String activityStatus,String activityNo);

		List<ActivityBean> selectAllActivities();
		
		//左邊標頭
		List<Menubean>  getMenuName(String classId); 
		//權限設定
		List<Menubean> rights();
		//下拉式選單管理員選擇	
		List<RoleCheckBean> checkRole();
		//存節點和人員
		void saveRsb(String roleId, String ztreeSave);
		
		List<ActivityBean> selectAllActivitiesAtive();

		List<ActivityBean> selectAllActivitiesInAtive();

	
		List<Integer> forRoleRight(int rsbList);
	
	
	
	
//	===================================================================
	//	<圖表製作>
	Map<String, Long> getGenderCounts();

	Map<String, Long> getActiveLocation();

	Map<String, Long> getActivityProv();
	
	public Map<String, Long> getstarSignCounts();
	
	//	<會員部分>	
	List<MemberBean> selectAllMembers();
	List<RoleBean> selectAllRoles();
	
	//角色關鍵字搜尋
		List<RoleBean> selectRoles(String keyWord);//關鍵字搜尋
	//會員關鍵字搜尋
		List<MemberBean> selectMemb(String keyword);
	
	public void updateRole(RoleBean RoleB);
	//搜尋單筆角色
	public RoleBean getRole(Integer roleNo);
	
	//搜尋日誌內容
	List<SystemLog> selectSystemLog();
	
	
//	=============訂單======================================================
	List<OrderBean> selectAllOrder();
	
	
}
