package com.web.activity.controller;

import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestParam;

import com.web.activity.model.ActivityBean;
import com.web.activity.model.ActivityClassBean;
import com.web.activity.model.ActivityForm;
import com.web.activity.model.ActivityTypeBean;
import com.web.activity.service.ActivityService;

@Controller
public class ActivitiesController {

	@Autowired
	ActivityService service;
	
	@GetMapping("/oneActivity/{id}")
	public String one(@PathVariable("id") int no, Model model) {
		return "OneActivity";
	}
	
	@GetMapping("/activities")
	public String list(Model model, @ModelAttribute("form") ActivityForm form) {
		Map <String, Integer> changedStatus = service.checkFinalDate();
		List<ActivityBean> list = service.selectAllActivities();
		int elementsNum = list.size();
		List<ActivityBean> latest = service.selectLatest();
		List<ActivityTypeBean> types = service.showAllTypes();
		List<ActivityBean> finalOnes = service.selectFinal();
		int finalNum = finalOnes.size();
		Map<String, Integer> recentOnes = service.selectRecentMonths();
		List<ActivityClassBean> categoryList = service.selectAllClasses();
		model.addAttribute("changedStatusNum",changedStatus);
		model.addAttribute("activities",list);
		model.addAttribute("activitiesNum",elementsNum);
		model.addAttribute("finalNum",finalNum);
		model.addAttribute("latestOnes",latest);
		model.addAttribute("allTypes",types);
		model.addAttribute("finalOnes",finalOnes);
		model.addAttribute("recentOnes",recentOnes);
		model.addAttribute("categoryList",categoryList);
		return "ShowActivities";
	}
	
	@PostMapping("/form")
	public String form(Model model, @ModelAttribute("form") ActivityForm form) {
//		try {
//			request.setCharacterEncoding("UTF-8");
//		} catch (UnsupportedEncodingException e) {
//			e.printStackTrace();
//		}
		String price = form.getPrice();
//		String big = form.getBigtype();
		String location = form.getLocation();
		String limit = form.getMinLimit();
		String small = form.getSmalltype();
		System.out.println(price);
//		System.out.println(big);
		System.out.println(location);
		System.out.println(limit);
		System.out.println(small);
		
		
		
//		List<ActivityBean> list = service.selectAllActivities();
		
		List<ActivityBean> list = service.selectByFrom(price, location, limit, small);
		List<ActivityBean> latest = service.selectLatest();
		List<ActivityTypeBean> types = service.showAllTypes();
		List<ActivityBean> finalOnes = service.selectFinal();
		System.out.println("finalOnes list========================" +finalOnes);
		int finalNum = finalOnes.size();
		System.out.println("finalOnes size----------------------->" +finalOnes);
		
		Map<String, Integer> recentOnes = service.selectRecentMonths();
		List<ActivityClassBean> categoryList = service.selectAllClasses();
		model.addAttribute("activities",list);
		model.addAttribute("latestOnes",latest);
		model.addAttribute("allTypes",types);
		model.addAttribute("finalOnes",finalOnes);
		model.addAttribute("activitiesNum",finalNum);
		model.addAttribute("recentOnes",recentOnes);
		model.addAttribute("categoryList",categoryList);
		return "ShowActivities";
	}
	
	@PostMapping("/ajax_checkedClass")
	public String checkedClasses(Model model,
			@RequestBody List<String> activityClass) {
		List<ActivityBean> checkedActivities = service.checkedClasses(activityClass);
		int elementsNum = checkedActivities.size();
		model.addAttribute("activitiesNum",elementsNum);
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
	
	@GetMapping("/ajax_selectAll")
	public String selectAll(Model model) {
		List<ActivityBean> beans = service.selectAllActivities();
		int elementsNum = beans.size();
		model.addAttribute("activitiesNum",elementsNum);
		model.addAttribute("activities",beans);
		return "ajax/activity lists";

	}

	
	@GetMapping("/ajax_recentOnes")
	public String selectRecentMon(Model model,
			@RequestParam int thismon) {
		List<ActivityBean> beans = service.selectRecentMon(thismon);
		int elementsNum = beans.size();
		model.addAttribute("activitiesNum",elementsNum);
		model.addAttribute("activities",beans);
		System.out.println("activity lists========="+beans);
		return "ajax/activity lists";

	}
	
	@GetMapping("/ajax_keyWords")
	public String searchByKey(Model model,
			@RequestParam String keyword) {
		System.out.println("controller recept--------------------->" +keyword);
		List<ActivityBean> beans = service.searchByKey(keyword);
//		int elementsNum = beans.size();
//		model.addAttribute("activitiesNum",elementsNum);
		int elementsNum = beans.size();
		model.addAttribute("activitiesNum",elementsNum);
		model.addAttribute("activities",beans);
		return "ajax/activity lists";

	}

	
}
