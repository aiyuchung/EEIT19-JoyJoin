package com.web.activity.dao;

import java.util.List;
import java.util.Map;

import com.web.activity.model.ActivityBean;
import com.web.activity.model.ActivityClassBean;
import com.web.activity.model.ActivityTypeBean;

public interface ActivityDao {	
	
	List<ActivityBean> selectAllActivities();
	
	List<ActivityBean> selectLatest();
	
	List<ActivityTypeBean> showAllTypes();
	
	List<ActivityClassBean> showAllClasses(String activityType);
	
	List<ActivityBean> selectFinal();
	
	List<ActivityBean> selectRecentMonths();
	
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
	
	List<ActivityBean> placeOfNorth();
	
	List<ActivityBean> placeOfWest();
	
	List<ActivityBean> placeOfEast();
	
	List<ActivityBean> placeOfSouth();
}
