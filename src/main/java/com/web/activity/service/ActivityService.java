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
	
	Map<String, Integer> selectRecentMonths();
	
	List<ActivityClassBean> findCategories(String activityType);
	
	List<ActivityClassBean> selectAllClasses();
	//ajax 選擇類別
	List<ActivityBean> checkedClasses(List<String> activityClass);
	
	//ajax排序方法
	
	List<ActivityBean> startFromLatest();
	
	List<ActivityBean> startFromEarlest();
	
	List<ActivityBean> endFromLatest();
	
	List<ActivityBean> endFromEarlest();
	
	List<ActivityBean> peopleFromFew();

	List<ActivityBean> peopleFromMany();
	
	List<ActivityBean> placeFromNorth();
	
	List<ActivityBean> placeFromSouth();
	
	//ajax最近活動(指定月分)
	
	List<ActivityBean> selectRecentMon(int thismon);

}
