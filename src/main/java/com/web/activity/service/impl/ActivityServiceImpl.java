package com.web.activity.service.impl;


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
import com.web.activity.model.ActivityTypeBean;
import com.web.activity.service.ActivityService;

@Transactional
@Service
public class ActivityServiceImpl implements ActivityService {
	
	@Autowired
	ActivityDao dao;
	
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
//	     sdf;      
	    List<ActivityBean> finalOnes = new ArrayList<ActivityBean>();
	    System.out.println("today = " + today);
	    try {
	    	for (ActivityBean bean : list) {
	    		Date expiredDay;
//	    		System.out.println("bean.getFinalDate() = " + bean.getFinalDate());
//	    		SimpleDateFormat sdf = new SimpleDateFormat ("yyyy/MM/dd"); 
				expiredDay = bean.getFinalDate();
				System.out.println("expiredDay-->"+ expiredDay);
				System.out.println("today-->"+ today);
//				Date expiredDay = sdf.parse(bean.getFinalDate());
//				System.out.println(expiredDay);
				long diff = expiredDay.getTime() - today.getTime() ;
//				System.out.println("diff:"+ diff);
				long diffDays = diff / (24 * 60 * 60 * 1000);
//				System.out.println(diffDays);
				if (diffDays  < 4 && diffDays >= 0) {
					
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
	public List<String> selectRecentMonths() {
		List<ActivityBean> list = dao.selectRecentMonths();
		Calendar today = Calendar.getInstance();
		int currentMon = today.get(Calendar.MONTH)+1; //月份為0~11
//	    SimpleDateFormat sdf;      
		String thismon = Integer.toString(currentMon) + "月"	;
//		System.out.println(thismon.getClass().getSimpleName());
		today.add(Calendar.MONTH,1);
		
		String nextmon = Integer.toString(today.get(Calendar.MONTH)+1) + "月";
		today.add(Calendar.MONTH,1);
		String next2mon = Integer.toString(today.get(Calendar.MONTH)+1) + "月";
		today.add(Calendar.MONTH,1);
		String next3mon = Integer.toString(today.get(Calendar.MONTH)+1) + "月";
	    List<String> recentOnes = new ArrayList<>();
	    try {
	    	int thissum = 0, nextsum=0, next2sum=0, next3sum=0;
	    	for (ActivityBean bean : list) {
	    		Date activityDate;
//	    		SimpleDateFormat sdf = new SimpleDateFormat ("yyyy/MM/dd"); 
				activityDate =bean.getActivityDate();
				Calendar calendar = Calendar.getInstance();
				calendar.setTime(activityDate);  //activityDate從date轉乘calendar
//				 LocalDate dt = LocalDate.parse("2018-11-27");
				
				if (currentMon == calendar.get(Calendar.MONTH)) {
					thissum +=1;
				}else if (currentMon +1 == calendar.get(Calendar.MONTH)) {
					nextsum +=1;
				}else if (currentMon +2 == calendar.get(Calendar.MONTH)) {
					next2sum +=1;
				}else if (currentMon +3 == calendar.get(Calendar.MONTH)) {
					next3sum +=1;
				}
				
	    	}
	    	recentOnes.add(thismon +"  (" + thissum + ")");
			recentOnes.add(nextmon+"  (" + nextsum+ ")");
			recentOnes.add(next2mon+"  (" +next2sum+ ")");
			recentOnes.add(next3mon+"  (" +next3sum+ ")");
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

	
}
