package com.web.activity.service.impl;

import java.util.List;
import java.util.Map;

//import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.web.activity.dao.CMSDao;
import com.web.activity.model.ActivityBean;
import com.web.activity.model.MemberBean;
import com.web.activity.model.Menubean;
import com.web.activity.model.RoleBean;
import com.web.activity.service.CMSService;

@Transactional
@Service
public class CMSServiceImpl implements CMSService {

	@Autowired
	CMSDao dao;

	
	//<活動部分>
	@Override
	public List<ActivityBean> selectAllActivities() {
		return dao.selectAllActivities();
	}
	
//左邊標頭
	@Override
	public List<Menubean>  getMenuName(String classId){ 
	return dao.getMenuName(classId);}
	
	//關鍵字查詢
	@Override
	public List<ActivityBean> selectActivities(String keyWord) {
		return dao.selectActivities(keyWord);
	}
	
	//單獨更新activityStatus
		@Override
	public int updateActivityStatus(String activityStatus,String activityNo) {
		return dao.updateActivityStatus(activityStatus,activityNo);
		}

	@Override
	public List<ActivityBean> selectAllActivitiesAtive() {
		return dao.selectAllActivitiesAtive();
	}

	@Override
	public List<ActivityBean> selectAllActivitiesInAtive() {
		return dao.selectAllActivitiesInAtive();
	}

	//圖表製作
	@Override
	public Map<String, Long> getGenderCounts() {
		return dao.getGenderCounts();
	}

	@Override
	public Map<String, Long> getActiveLocation() {
		return dao.getActiveLocation();

	}

	public Map<String, Long> getActivityProv(){
		return dao.getActivityProv();
	}
	
	
	
	//<會員部分>
	public List<MemberBean> selectAllMembers(){
		return dao.selectAllMembers();
	}
	public List<RoleBean> selectAllRoles(){
		return dao.selectAllRoles();
	}
	
	

}
