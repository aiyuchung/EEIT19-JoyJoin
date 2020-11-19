package com.web.activity.service;

import java.util.List;
import java.util.Map;

import com.web.activity.model.ActivityBean;
import com.web.activity.model.MemberBean;
import com.web.activity.model.Menubean;
import com.web.activity.model.RoleBean;

//import java.util.List;
//
//import com.web.activity.model.ActivityBean;

public interface CMSService {

	//	<活動清單搜尋>
	List<ActivityBean> selectActivities(String keyWord);//關鍵字搜尋
	
	//單獨更新activityStatus
	int updateActivityStatus(String activityStatus,String activityNo);

	List<ActivityBean> selectAllActivities();
	
	//左邊標頭
	List<Menubean>  getMenuName(String classId); 
	
	List<ActivityBean> selectAllActivitiesAtive();

	List<ActivityBean> selectAllActivitiesInAtive();

	//	<圖表製作>
	Map<String, Long> getGenderCounts();

	Map<String, Long> getActiveLocation();

	Map<String, Long> getActivityProv();
	
	public Map<String, Long> getstarSignCounts();
	
	//	<會員部分>	
	List<MemberBean> selectAllMembers();
	List<RoleBean> selectAllRoles();
	
	public void updateRole(RoleBean RoleB);
	//搜尋單筆角色
	public RoleBean getRole(Integer roleNo);
}
