package com.web.activity.service;

import java.util.List;

import com.web.activity.model.ActivityBean;

//import java.util.List;
//
//import com.web.activity.model.ActivityBean;

public interface CMSService {
	
	List<ActivityBean> selectAllActivities();

	
	long getGenderCounts();
	
	
	long getActiveLocation();
		
}
