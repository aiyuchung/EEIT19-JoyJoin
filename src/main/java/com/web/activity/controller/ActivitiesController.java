package com.web.activity.controller;

import java.util.List;
import java.util.Map;

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
		Map<String, Integer> recentOnes = service.selectRecentMonths();
		List<ActivityClassBean> categoryList = service.selectAllClasses();
		model.addAttribute("activities",list);
		model.addAttribute("latestOnes",latest);
		model.addAttribute("allTypes",types);
		model.addAttribute("finalOnes",finalOnes);
		model.addAttribute("recentOnes",recentOnes);
		model.addAttribute("categoryList",categoryList);
		return "ShowActivities";
	}
	
//	@PostMapping("/ajax_checkedClass")
//	public @ResponseBody List<ActivityBean> checkedClasses(Model model,
//			@RequestBody List<String> activityClass) {
//		List<ActivityBean> checkedActivities = service.checkedClasses(activityClass);
//		return checkedActivities;
//	}
	
	@PostMapping("/ajax_checkedClass")
	public String checkedClasses(Model model,
			@RequestBody List<String> activityClass) {
		List<ActivityBean> checkedActivities = service.checkedClasses(activityClass);
		model.addAttribute("activities",checkedActivities);
		return "ajax/activity lists";
	}
	
	@GetMapping("/ajax_ordered1")
	public String startFromLatest(Model model) {
		List<ActivityBean> beans = service.startFromLatest();
		model.addAttribute("activities",beans);
		return "ajax/activity lists";

	}
	
	@GetMapping("/ajax_ordered2")
	public String startFromEarlest(Model model) {
		List<ActivityBean> beans = service.startFromEarlest();
		model.addAttribute("activities",beans);
		return "ajax/activity lists";

	}
	
	@GetMapping("/ajax_ordered3")
	public String endFromLatest(Model model) {
		List<ActivityBean> beans = service.endFromLatest();
		model.addAttribute("activities",beans);
		return "ajax/activity lists";

	}
	
	@GetMapping("/ajax_ordered4")
	public String endFromEarlest(Model model) {
		List<ActivityBean> beans = service.endFromEarlest();
		model.addAttribute("activities",beans);
		return "ajax/activity lists";

	}
	
	@GetMapping("/ajax_ordered5")
	public String peopleFromFew(Model model) {
		List<ActivityBean> beans = service.peopleFromFew();
		model.addAttribute("activities",beans);
		return "ajax/activity lists";

	}
	
	@GetMapping("/ajax_ordered6")
	public String peopleFromMany(Model model) {
		List<ActivityBean> beans = service.peopleFromMany();
		model.addAttribute("activities",beans);
		return "ajax/activity lists";

	}
	
	@GetMapping("/ajax_ordered7")
	public String placeFromNorth(Model model) {
		List<ActivityBean> beans = service.placeFromNorth();
		model.addAttribute("activities",beans);
		return "ajax/activity lists";

	}
	
	@GetMapping("/ajax_ordered8")
	public String placeFromSouth(Model model) {
		List<ActivityBean> beans = service.placeFromSouth();
		model.addAttribute("activities",beans);
		return "ajax/activity lists";

	}

	
	@GetMapping("/ajax_recentOnes")
	public String selectRecentMon(Model model,
			@RequestParam int thismon) {
		List<ActivityBean> beans = service.selectRecentMon(thismon);
		model.addAttribute("activities",beans);
		System.out.println("activity lists========="+beans);
		return "ajax/activity lists";

	}

	
}
