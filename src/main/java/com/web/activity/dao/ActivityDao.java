package com.web.activity.dao;

import java.util.Date;
import java.util.List;
import java.util.Map;

import com.web.activity.model.ActivityBean;
import com.web.activity.model.ActivityClassBean;
import com.web.activity.model.ActivityFollowedBean;
import com.web.activity.model.ActivityJoinedBean;
import com.web.activity.model.ActivityMsgBean;
import com.web.activity.model.ActivityPicBean;
import com.web.activity.model.ActivityTypeBean;
import com.web.activity.model.ProvinceBean;

public interface ActivityDao {	
	
	//更新截止天數
	void updateLeftDays();
	
	//確認是否為截止日
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
	
	//刪除留言
	void deleteMsg(int msgNo);
	
	//修改留言
	void updateMsg(String msg, Integer msgNo);
	
	//參加活動
	void joinedOne(Integer memberNo, int activityNo);

	//取消參加活動
	void cancelOne(Integer memberNo, int activityNo);
	
	//取參加活動的人員
	List<ActivityJoinedBean> joinedMember(int activityNo);
	
	//新增活動
	void createActivity(Integer memberNo, ActivityBean newform);
	
	//刪除活動(下架)
	void inactiveActivity(int activityNo);
	
	//關注活動
	void followActivity(Integer memberNo, ActivityFollowedBean follow,int activityNo);

	//取消關注活動
	void unfollowActivity(Integer memberNo, String activityUrl);
	
}
