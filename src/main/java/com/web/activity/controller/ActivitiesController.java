package com.web.activity.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.web.activity.model.ActivityBean;
import com.web.activity.model.ActivityClassBean;
import com.web.activity.model.ActivityTypeBean;
import com.web.activity.service.ActivityService;

@Controller
public class ActivitiesController {

	@Autowired
	ActivityService service;
	
	@GetMapping("/activities")
	public String list(Model model) {
		List<ActivityBean> list = service.selectAllActivities();
		List<ActivityBean> latest = service.selectLatest();
		List<ActivityTypeBean> types = service.showAllTypes();
		List<ActivityBean> finalOnes = service.selectFinal();
		List<String> recentOnes = service.selectRecentMonths();
		List<ActivityClassBean> categoryList = service.selectAllClasses();
		model.addAttribute("activities",list);
		model.addAttribute("latestOnes",latest);
		model.addAttribute("allTypes",types);
		model.addAttribute("finalOnes",finalOnes);
		model.addAttribute("recentOnes",recentOnes);
		model.addAttribute("categoryList",categoryList);
		return "ShowActivities";
	}
	
	@GetMapping("/ajax_classes")
	public @ResponseBody List<ActivityClassBean> findCategories(Model model,
			@RequestParam(value="ActivityType") String activityType) {
		List<ActivityClassBean> classes = service.findCategories(activityType);
		return classes;
	}
	
	@PostMapping("/ajax_checkedClass")
	public @ResponseBody List<ActivityBean> checkedClasses(Model model,
			@RequestBody List<String> activityClass) {
//		System.out.println("controller recepted:" + activityClass);
		List<ActivityBean> checkedActivities = service.checkedClasses(activityClass);
//		System.out.println("dao's list =====================================" +checkedActivities);
		return checkedActivities;
	}

	
	
	

	// 查詢所有會員資料
	
	
	
}
