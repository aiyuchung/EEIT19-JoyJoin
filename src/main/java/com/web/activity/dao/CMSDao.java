package com.web.activity.dao;

import java.util.List;
import java.util.Map;

import com.web.activity.model.ActivityBean;
import com.web.activity.model.MemberBean;
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

	// <活動部分>
	List<ActivityBean> selectAllActivities();

	List<ActivityBean> selectAllActivitiesAtive();

	List<ActivityBean> selectAllActivitiesInAtive();

	// <會員部分>
	List<MemberBean> selectAllMembers();
	List<RoleBean> selectAllRoles();
	

}
