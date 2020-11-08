package com.web.activity.dao;

import java.util.List;

import com.web.activity.model.ActivityBean;
import com.web.activity.model.ActivityClassBean;
import com.web.activity.model.ActivityTypeBean;

//import java.util.List;
//
//import com.web.activity.model.ActivityBean;

public interface CMSDao {

	long getGenderCounts();
	
	
	long getActiveLocation();
	
	List<ActivityBean> selectAllActivities();
	


}
