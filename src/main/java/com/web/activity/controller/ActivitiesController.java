package com.web.activity.controller;

import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.bind.annotation.SessionAttributes;

import com.web.activity.model.ActivityBean;
import com.web.activity.model.ActivityClassBean;
import com.web.activity.model.ActivityForm;
import com.web.activity.model.ActivityMsgBean;
import com.web.activity.model.ActivityTypeBean;
import com.web.activity.model.MemberBean;
import com.web.activity.model.ProvinceBean;
import com.web.activity.service.ActivityService;
import com.web.activity.service.MemberService;

@Controller
@SessionAttributes({"level", "id"})
public class ActivitiesController {

	@Autowired
	ActivityService service;
	
	@Autowired
	MemberService memberService;
	
//-----------------------------------------跳轉單個頁面↓-----------------------------------------	
	@GetMapping("/oneActivity/{id}")
	public String one(@PathVariable("id") int activityNo, Model model) {
		
		ActivityBean activity = service.selectOneActivity(activityNo);
		Map<String, Integer> hitCount = service.updateHitCount(activityNo);
		model.addAttribute("one",activity);
		model.addAttribute("hitCount",hitCount);
		return "OneActivity";
	}
//-----------------------------------------跳轉活動總覽頁面↓-----------------------------------------		
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
//-----------------------------------------單個活動的留言板↓-----------------------------------------	
	@PostMapping("/ajax_msgSend")
	public String saveMsg(Model model,
			@RequestParam String msg,
			@RequestParam int userId,
			@RequestParam int activityNo) {
		ActivityMsgBean newMsg = new ActivityMsgBean();
		newMsg.setMsgContent(msg);
		
		ActivityBean ab = new ActivityBean();
		ab.setActivityNo(activityNo);
		newMsg.setActivityBean(ab);
		
		MemberBean mb = new MemberBean();
		mb.setMemberNo(userId);
		newMsg.setMemberBean(mb);
		System.out.println("controller newMsg--------------------------"+newMsg);		
		List<ActivityMsgBean> msgBox = service.saveMsg(newMsg);
		
		model.addAttribute("msgBox",msgBox);
		return "ajax/msgBox";
	}
	
	
//-----------------------------------------條件查詢form表單↓-----------------------------------------		
	@PostMapping("/form")
	public String form(Model model, @ModelAttribute("form") ActivityForm form) {
		String price = form.getPrice();
		String location = form.getLocation();
		String limit = form.getMinLimit();
		String small = form.getSmalltype();
		
		List<ActivityBean> list = service.selectByFrom(price, location, limit, small);
		List<ActivityBean> latest = service.selectLatest();
		List<ActivityTypeBean> types = service.showAllTypes();
		List<ActivityBean> finalOnes = service.selectFinal();
		System.out.println("finalOnes list========================" +finalOnes);
		int finalNum = finalOnes.size();
		System.out.println("finalOnes size----------------------->" +finalOnes);
		//*****location沒辦法加入條件!!!
		
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
//-----------------------------------------新增活動空的form表單↓-----------------------------------------		
	@GetMapping("/newActivities")
	
	public String newAcitivity(HttpServletRequest request, Model model, 
//			@ModelAttribute("level") int level, 
			@ModelAttribute("newform") ActivityBean newform) {
		List<ActivityBean> list = service.selectAllActivities();
		List<ActivityTypeBean> types = service.showAllTypes();
		List<ActivityClassBean> categoryList = service.selectAllClasses();
		List<ProvinceBean> provs = service.selectAllProvs();
		
		HttpSession session = request.getSession();
		
		String id = (String) session.getAttribute("id");
		String level = (String) session.getAttribute("level");
		model.addAttribute("id",id);
		model.addAttribute("level",level);
		model.addAttribute("activities",list);
		model.addAttribute("allTypes",types);
		model.addAttribute("categoryList",categoryList);
		model.addAttribute("provs",provs);
	      return "CreateNewActivity";
	   }
	
//-----------------------------------------AJAX快篩↓-----------------------------------------		
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
		return "ajax/activity lists";

	}
	
	
	@GetMapping("/ajax_checktype")
	@ResponseBody
	public List<ActivityClassBean> classForCheckedType(@RequestParam String type) {
		List<ActivityClassBean> classes = service.classForCheckedType(type);
		int elementsNum = classes.size();
//		model.addAttribute("classes",classes);
		return classes;

	}
	
//-----------------------------------------模糊搜尋↓-----------------------------------------	
	@GetMapping("/ajax_keyWords")
	public String searchByKey(Model model,
			@RequestParam String keyword) {
		List<ActivityBean> beans = service.searchByKey(keyword);
//		int elementsNum = beans.size();
//		model.addAttribute("activitiesNum",elementsNum);
		int elementsNum = beans.size();
		model.addAttribute("activitiesNum",elementsNum);
		model.addAttribute("activities",beans);
		return "ajax/activity lists";

	}

	
}
