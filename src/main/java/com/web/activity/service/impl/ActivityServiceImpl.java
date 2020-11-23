package com.web.activity.service.impl;


import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Calendar;
import java.util.Date;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.web.activity.dao.ActivityDao;
import com.web.activity.model.ActivityBean;
import com.web.activity.model.ActivityClassBean;
import com.web.activity.model.ActivityFollowedBean;
import com.web.activity.model.ActivityJoinedBean;
import com.web.activity.model.ActivityMsgBean;
import com.web.activity.model.ActivityPicBean;
import com.web.activity.model.ActivityTypeBean;
import com.web.activity.model.ForumBean;
import com.web.activity.model.ProvinceBean;
import com.web.activity.service.ActivityService;

@Transactional
@Service
public class ActivityServiceImpl implements ActivityService {
	
	@Autowired
	ActivityDao dao;
	
	@Override
	public void updateLeftDays() {
		dao.updateLeftDays();
	}
	
	@Override
	public Map<String, Integer>  checkFinalDate() {
		return dao.checkFinalDate();
	}

	@Override
	public Map<String, Integer> updateHitCount(int activityNo) {
		Integer hit =  dao.updateHitCount(activityNo);
		Map<String, Integer> hitCount = new HashMap<>();
		hitCount.put("hitCount",hit);
		return hitCount;
	}

	@Override
	public List<ActivityBean> selectAllActivities() {
		return dao.selectAllActivities();
	}
	
	@Override
	public List<ActivityBean> selectLatest() {
		return dao.selectLatest();
	}

	@Override
	public List<ActivityTypeBean> showAllTypes() {
		return dao.showAllTypes();
	}

	@Override
	public List<ActivityClassBean> showAllClasses(String activityType) {
		return dao.showAllClasses(activityType);
	}

	@Override
	public List<ActivityBean> selectFinal() {
		List<ActivityBean> list = dao.selectFinal();
		Date today = new Date();
	    List<ActivityBean> finalOnes = new ArrayList<ActivityBean>();
//	    System.out.println("today = " + today);
	    try {
	    	for (ActivityBean bean : list) {
	    		Date expiredDay;
//	    		System.out.println("bean.getFinalDate() = " + bean.getFinalDate());
//	    		SimpleDateFormat sdf = new SimpleDateFormat ("yyyy/MM/dd"); 
				expiredDay = bean.getFinalDate();
//				System.out.println("expiredDay-->"+ expiredDay);
//				System.out.println("today-->"+ today);
//				Date expiredDay = sdf.parse(bean.getFinalDate());
//				System.out.println(expiredDay);
				Calendar cal = Calendar.getInstance();
				cal.setTime(expiredDay);
				cal.add(Calendar.DAY_OF_MONTH, +1);
				Date realexpiredDay = cal.getTime();
				
				long diff = realexpiredDay.getTime() - today.getTime() ; //截止日跟今天差幾毫秒
//				System.out.println("diff:"+ diff);
				long diffDays = diff / (24 * 60 * 60 * 1000); //截止日跟今天差幾天
//				System.out.println(diffDays);
				if (diffDays  < 4 && diffDays >= 0) { //如果差0~3天就存入list
					
					bean.setLeftDays((int)diffDays);
					finalOnes.add(bean);
				}
	    	}
	    }catch (Exception e) {
	    	e.printStackTrace();
	    }
	    return finalOnes;
	}

	@Override
	public Map<String, Integer> selectRecentMonths() {
		List<ActivityBean> list = dao.selectRecentMonths();
		Calendar today = Calendar.getInstance();
		int currentMon = today.get(Calendar.MONTH)+1; //月份為0~11 //10月-->9
//	    SimpleDateFormat sdf;    
		int thismon = currentMon;
//		String thismon = Integer.toString(currentMon) + "月"	;
		
//		System.out.println(thismon.getClass().getSimpleName());
		today.add(Calendar.MONTH,1);
		
		int nextmon = today.get(Calendar.MONTH)+1;
		today.add(Calendar.MONTH,1);
		int next2mon = today.get(Calendar.MONTH)+1;
		today.add(Calendar.MONTH,1);
		int next3mon = today.get(Calendar.MONTH)+1;
		
//		String nextmon = Integer.toString(today.get(Calendar.MONTH)+1) + "月";
//		today.add(Calendar.MONTH,1);
//		String next2mon = Integer.toString(today.get(Calendar.MONTH)+1) + "月";
//		today.add(Calendar.MONTH,1);
//		String next3mon = Integer.toString(today.get(Calendar.MONTH)+1) + "月";
	    Map<String, Integer> recentOnes = new HashMap<>();
	    try {
	    	int thissum = 0, nextsum=0, next2sum=0, next3sum=0;
	    	for (ActivityBean bean : list) {
	    		Date activityDate;
//	    		SimpleDateFormat sdf = new SimpleDateFormat ("yyyy/MM/dd"); 
				activityDate =bean.getActivityDate();
				Calendar calendar = Calendar.getInstance();
				calendar.setTime(activityDate);  //activityDate從date轉乘calendar
//				 LocalDate dt = LocalDate.parse("2018-11-27");
				
				if (currentMon -1== calendar.get(Calendar.MONTH)) {
					thissum +=1;
				}else if (currentMon  == calendar.get(Calendar.MONTH)) {
					nextsum +=1;
				}else if (currentMon +1 == calendar.get(Calendar.MONTH)) {
					next2sum +=1;
				}else if (currentMon +2 == calendar.get(Calendar.MONTH)) {
					next3sum +=1;
				}
				
	    	}
	    	recentOnes.put("thismon", thismon);
	    	recentOnes.put("thissum", thissum);
	    	recentOnes.put("nextmon", nextmon);
	    	recentOnes.put("nextsum", nextsum);
	    	recentOnes.put("next2mon", next2mon);
	    	recentOnes.put("next2sum", next2sum);
	    	recentOnes.put("next3mon", next3mon);
	    	recentOnes.put("next3sum", next3sum);
//			recentOnes.add(nextmon+"  (" + nextsum+ ")");
//			recentOnes.add(next2mon+"  (" +next2sum+ ")");
//			recentOnes.add(next3mon+"  (" +next3sum+ ")");
	    }catch (Exception e) {
	    	e.printStackTrace();
	    }
		return recentOnes;
	}

	@Override
	public List<ActivityClassBean> selectAllClasses() {
		List<ActivityClassBean> list = dao.selectAllClasses();
//		Map<String, String> eachClass = new HashMap<>();
//		for (ActivityClassBean bean: list) {
//			eachClass.put(bean.getActivityClass(),bean.getActivityTypeBean().getActivityType());
//		}
		return list;
	}
	

	@Override
	public List<ActivityClassBean> findCategories(String activityType) {
		return dao.findCategories(activityType);
	}

	@Override
	public List<ActivityBean> checkedClasses(List<String> activityClass) {
		return dao.checkedClasses(activityClass);
	}

	@Override
	public List<ActivityBean> startFromLatest() {
		return dao.startFromLatest();
	}

	@Override
	public List<ActivityBean> startFromEarlest() {
		return dao.startFromEarlest();
	}

	@Override
	public List<ActivityBean> endFromLatest() {
		return dao.endFromLatest();
	}

	@Override
	public List<ActivityBean> endFromEarlest() {
		return dao.endFromEarlest();
	}

	@Override
	public List<ActivityBean> peopleFromFew() {
		return dao.peopleFromFew();
	}

	@Override
	public List<ActivityBean> peopleFromMany() {
		return dao.peopleFromMany();
	}

	@Override
	public List<ActivityBean> placeFromNorth() {
		return dao.placeFromNorth();
	}

	@Override
	public List<ActivityBean> placeFromSouth() {
		return dao.placeFromSouth();
	}

	@Override
	public List<ActivityBean> selectRecentMon(int thismon) {
		Calendar today = Calendar.getInstance();
		int currentMon = today.get(Calendar.MONTH)+1; //月份為0~11 //10月-->9
		int currentYear = today.get(Calendar.YEAR); 
		int thisyear = currentYear;
		if (thismon < currentMon) {
			thisyear = currentYear + 1;
		}
		
		String thismon1 = thisyear +"-"+ thismon +"-01"; //2020-10-01
		SimpleDateFormat dateFormat = new SimpleDateFormat("yyyy-MM-dd");
		Date Datethismon1 =null;
		Date Datethismon31 =null;
		try {
			Datethismon1 = dateFormat.parse(thismon1);//轉換型態  String-->Date
			Calendar calendar = Calendar.getInstance();
			calendar.setTime(Datethismon1); //將日期轉為calendar型態
			int lastday = calendar.getActualMaximum(Calendar.DAY_OF_MONTH);//取該月最後一日(總共天數)
			
			String thismon31 = thisyear +"-"+ thismon +"-" + lastday; //2020-10-31
			Datethismon31 = dateFormat.parse(thismon31);//轉換型態  String-->Date
			return dao.selectRecentMon(Datethismon1,Datethismon31);
		} catch (ParseException e) {
			e.printStackTrace();
		}
		return dao.selectRecentMon(Datethismon1,Datethismon31);
	}

	@Override
	public List<ActivityBean> selectByFrom(String price, String location, String limit, String small) {
		return dao.selectByFrom(price, location, limit, small);
	}

	@Override
	public List<ActivityBean> searchByKey(String keyWord) {
		return dao.searchByKey(keyWord);
	}

	@Override
	public ActivityBean selectOneActivity(int activityNo) {
		return dao.selectOneActivity(activityNo);
	}

	@Override
	public List<ActivityMsgBean> saveMsg(String msg, Integer activityNo, Integer memberNo) {
		return dao.saveMsg(msg, activityNo, memberNo);
	}

	@Override
	public List<ActivityMsgBean> showMsg(int activityNo) {
		return dao.showMsg(activityNo);
	}
	
	@Override
	public void deleteMsg(int msgNo) {
		dao.deleteMsg(msgNo);
	}

	@Override
	public void updateMsg(String msg, Integer msgNo) {
		dao.updateMsg(msg,msgNo);
	}
	@Override
	public List<ProvinceBean> selectAllProvs() {
		return dao.selectAllProvs();
	}

	@Override
	public List<ActivityClassBean> classForCheckedType(String type) {
		return dao.classForCheckedType(type);
	}

	@Override
	public void joinedOne(Integer memberNo, int activityNo) {
		dao.joinedOne(memberNo, activityNo);
	}

	@Override
	public void cancelOne(Integer memberNo, int activityNo) {
		dao.cancelOne(memberNo, activityNo);
	}

	@Override
	public List<ActivityJoinedBean> joinedMember(int activityNo) {
		return dao.joinedMember(activityNo);
		
	}

	@Override
	public void createActivity(Integer memberNo, ActivityBean newform) {
		dao.createActivity(memberNo,newform);
	}

	@Override
	public void followActivity(Integer memberNo, ActivityFollowedBean follow,int activityNo) {
		dao.followActivity(memberNo, follow,activityNo);
	}

	@Override
	public void unfollowActivity(Integer memberNo, String activityUrl) {
		dao.unfollowActivity(memberNo, activityUrl);
	}

	@Override
	public void inactiveActivity(int activityNo) {
		dao.inactiveActivity(activityNo);
		
	}

	@Override
	public void updateActivity(ActivityBean newform) {
		dao.updateActivity(newform);
		
	}

	@Override
	public List<ForumBean> issuedForums(Integer memberNo) {
		return dao.issuedForums(memberNo);
	}

	@Override
	public List<String> selectAllForums() {
		List<ForumBean> list = dao.selectAllForums();
		List<String> numbers = new ArrayList<>();
		for(ForumBean fb:list) {
			numbers.add(fb.getActivityCode());
		}
		return numbers;
	}
	

	
}
