package com.web.activity.service;

import java.util.ArrayList;
import java.util.List;
import java.util.Map;

import com.web.activity.model.ActivityBean;
import com.web.activity.model.ActivityClassBean;
import com.web.activity.model.ActivityTypeBean;

public interface ActivityService {
	List<ActivityBean> selectAllActivities();

	List<ActivityBean> selectLatest();
	
	List<ActivityTypeBean> showAllTypes();
	
	List<ActivityClassBean> showAllClasses(String activityType);
	
	List<ActivityBean> selectFinal();
	
	List<String> selectRecentMonths();
	
	List<ActivityClassBean> findCategories(String activityType);
	
	List<ActivityClassBean> selectAllClasses();

	List<ActivityBean> checkedClasses(List<String> activityClass);
	
	
	
}
