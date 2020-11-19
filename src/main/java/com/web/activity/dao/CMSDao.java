package com.web.activity.dao;

import java.util.List;
import java.util.Map;

import com.web.activity.model.ActivityBean;
import com.web.activity.model.MemberBean;
import com.web.activity.model.Menubean;
//import com.web.activity.model.RoleBean;
import com.web.activity.model.RoleBean;

//import java.util.List;
//
//import com.web.activity.model.ActivityBean;

public interface CMSDao {

	// 圖表統計
	Map<String, Long> getGenderCounts();

	Map<String, Long> getActiveLocation();

	Map<String, Long> getActivityProv();

	Map<String, Long> getstarSignCounts();

	// <活動部分>
	List<ActivityBean> selectActivities(String keyWord);// 關鍵字搜尋
//	左邊標頭	

	List<Menubean> getMenuName(String classId);

	// 單獨更新activityStatus
	int updateActivityStatus(String activityStatus, String activityNo);

	List<ActivityBean> selectAllActivities();

	List<ActivityBean> selectAllActivitiesAtive();

	List<ActivityBean> selectAllActivitiesInAtive();

	// <會員部分>
	List<MemberBean> selectAllMembers();

	List<RoleBean> selectAllRoles();

	// 更新虛擬角色
	void updateRole(RoleBean RoleB);

	// 搜尋單筆資料
	RoleBean getRole(Integer roleNo);

}
