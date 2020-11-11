package com.web.activity.dao;

import java.util.Date;
import java.util.List;
import java.util.Map;

import com.web.activity.model.ActivityBean;
import com.web.activity.model.ActivityClassBean;
import com.web.activity.model.ActivityMsgBean;
import com.web.activity.model.ActivityTypeBean;
import com.web.activity.model.ProvinceBean;

public interface ActivityDao {	
	
	Map<String, Integer> checkFinalDate();
	
	//更新點擊量
	Integer updateHitCount(int activityNo);
	
	List<ActivityBean> selectAllActivities();
	
	List<ActivityBean> selectLatest();
	
	List<ActivityTypeBean> showAllTypes();

	List<ProvinceBean> selectAllProvs();
	
	List<ActivityClassBean> showAllClasses(String activityType);
	
	List<ActivityBean> selectFinal();
	
	List<ActivityBean> selectRecentMonths();
	
	List<ActivityClassBean> findCategories(String activityType);
	
	List<ActivityClassBean> selectAllClasses();
	
	//ajax 選擇類別
	List<ActivityBean> checkedClasses(List<String> activityClass);

	//ajax 新增活動選擇類別後顯示class
	List<ActivityClassBean> classForCheckedType(String type);
	
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
	
	List<ActivityBean> selectRecentMon(Date Datethismon1, Date Datethismon31);
	
	//form
	List<ActivityBean> selectByFrom(String price, String location, String limit, String small);

	//關鍵字搜尋
	List<ActivityBean> searchByKey(String keyWord);
	
	//搜尋單個活動
	ActivityBean selectOneActivity(int activityNo);
	
	//存留言板
	List<ActivityMsgBean> saveMsg(String msg, Integer activityNo, Integer memberNo);

	//查留言板
	List<ActivityMsgBean> showMsg(int activityNo);
	
	//參加活動
	Integer joinedOne(int activityNo);
	
	void joinedMember(Integer memeberNo, int activityNo);
}
