package com.web.activity.dao;

import java.util.List;

import com.web.activity.model.ActivityBean;

public interface CMSDao {

	long getGenderCounts();
	
	
	List<ActivityBean> getActiveLocation();
	
//	long getAge(); 將取出的年 月  日計算出年齡

}
