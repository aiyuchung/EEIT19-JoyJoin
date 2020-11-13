package com.web.activity.service;

import java.util.List;
import java.util.Map;

import com.web.activity.model.ActivityBean;
import com.web.activity.model.MemberBean;
import com.web.activity.model.RoleBean;

//import java.util.List;
//
//import com.web.activity.model.ActivityBean;

public interface CMSService {

	//	<活動清單搜尋>
	List<ActivityBean> selectAllActivities();

	List<ActivityBean> selectAllActivitiesAtive();

	List<ActivityBean> selectAllActivitiesInAtive();

	//	<圖表製作>
	Map<String, Long> getGenderCounts();

	Map<String, Long> getActiveLocation();

	Map<String, Long> getActivityProv();
	
	//	<會員部分>	
	List<MemberBean> selectAllMembers();
	List<RoleBean> selectAllRoles();
}
