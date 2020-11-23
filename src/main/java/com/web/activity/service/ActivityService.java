package com.web.activity.service;

import java.util.List;
import java.util.Map;

import com.web.activity.model.ActivityBean;
import com.web.activity.model.ActivityClassBean;
import com.web.activity.model.ActivityFollowedBean;
import com.web.activity.model.ActivityJoinedBean;
import com.web.activity.model.ActivityMsgBean;
import com.web.activity.model.ActivityPicBean;
import com.web.activity.model.ActivityTypeBean;
import com.web.activity.model.ForumBean;
import com.web.activity.model.ProvinceBean;

public interface ActivityService {

	//更新倒數天數
	void updateLeftDays();
	
	//確認活動是否截止
	//回傳下架活動的筆數跟成功舉辦的比數
	Map<String, Integer> checkFinalDate();
	
	//每進入單項活動就更新一次點擊量
	Map<String, Integer> updateHitCount(int activityNo);
	
	//查詢全部上架中活動
	List<ActivityBean> selectAllActivities();
	
	//查詢全部縣市
	List<ProvinceBean> selectAllProvs();

	//查詢最新五筆活動
	List<ActivityBean> selectLatest();

	//查詢全部活動大類
	List<ActivityTypeBean> showAllTypes();

	//依照大類查詢相對應的活動小類
	List<ActivityClassBean> showAllClasses(String activityType);

	//查詢倒數三天截止的上架中活動
	List<ActivityBean> selectFinal();

	//查詢本月份上月份下月份
	Map<String, Integer> selectRecentMonths();

	////依照大類查詢相對應的活動小類(重複寫)
	List<ActivityClassBean> findCategories(String activityType);
	
	//依照所有活動小類
	List<ActivityClassBean> selectAllClasses();
	
	//ajax
	//查詢左邊快篩選的小類別活動
	List<ActivityBean> checkedClasses(List<String> activityClass);
	
	//ajax
	//新增活動-選擇大類後顯示小類別
	List<ActivityClassBean> classForCheckedType(String type);
	
	//ajax
	//以活動日期-從最新開使排序所有上架中活動
	List<ActivityBean> startFromLatest();

	//ajax
	//以活動日期-從最舊開使排序所有上架中活動
	List<ActivityBean> startFromEarlest();

	//ajax
	//以截止日期-從最開使排序所有上架中活動
	List<ActivityBean> endFromLatest();

	//ajax
	//以截止日期-從最舊開使排序所有上架中活動
	List<ActivityBean> endFromEarlest();

	//ajax
	//以最高人數限制-從最少開使排序所有上架中活動
	List<ActivityBean> peopleFromFew();

	//ajax
	//以最高人數限制-從最多開使排序所有上架中活動
	List<ActivityBean> peopleFromMany();

	//ajax
	//以縣市-從最北開使排序所有上架中活動
	List<ActivityBean> placeFromNorth();

	//ajax
	//以縣市-從最南開使排序所有上架中活動
	List<ActivityBean> placeFromSouth();
	
	//ajax
	//查詢近四個月的每月上架中活動
	List<ActivityBean> selectRecentMon(int thismon);
	
	//條件式查詢-form表單
	List<ActivityBean> selectByFrom(String price, String location, String limit, String small);
	
	//關鍵字搜尋
	List<ActivityBean> searchByKey(String keyWord);

	//搜尋單個活動
	ActivityBean selectOneActivity(int activityNo);

	//存留言板
	List<ActivityMsgBean> saveMsg(String msg, Integer activityNo, Integer memberNo);
	
	//ajax
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
	
	//查詢已參加此活動的人員
	List<ActivityJoinedBean> joinedMember(int activityNo);
	
	//新增活動-form表單
	void createActivity(Integer memberNo, ActivityBean newform);

	//修改活動
	void updateActivity(ActivityBean newform);
	
    //刪除活動(下架)
    void inactiveActivity(int activityNo);

	//關注活動
	void followActivity(Integer memberNo, ActivityFollowedBean follow,int activityNo);

	//取消關注活動
	void unfollowActivity(Integer memberNo, String activityUrl);
	
	//舉辦人的id
	List<ForumBean> issuedForums(Integer memberNo);
	
	//全部的討論版
	List<String> selectAllForums();
}
