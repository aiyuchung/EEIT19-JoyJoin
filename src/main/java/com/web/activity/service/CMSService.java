package com.web.activity.service;

import java.util.List;

import com.web.activity.model.ActivityBean;

public interface CMSService {
	
	long getGenderCounts();
	
	
	List<ActivityBean> getActiveLocation();
		
}
