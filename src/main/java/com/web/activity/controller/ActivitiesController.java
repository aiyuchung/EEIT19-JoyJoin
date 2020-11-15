package com.web.activity.controller;

import java.io.IOException;
import java.sql.Blob;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpSession;
import javax.sql.rowset.serial.SerialBlob;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.SessionAttributes;
import org.springframework.web.multipart.MultipartFile;

import com.web.activity.model.ActivityBean;
import com.web.activity.model.ActivityClassBean;
import com.web.activity.model.ActivityFollowedBean;
import com.web.activity.model.ActivityForm;
import com.web.activity.model.ActivityJoinedBean;
import com.web.activity.model.ActivityMsgBean;
import com.web.activity.model.ActivityPicBean;
import com.web.activity.model.ActivityTypeBean;
import com.web.activity.model.MemberBean;
import com.web.activity.model.ProvinceBean;
import com.web.activity.service.ActivityService;
import com.web.activity.service.MemberService;

@Controller
@SessionAttributes({"level", "id","member","account"})
public class ActivitiesController {

	@Autowired
	ActivityService service;

	@Autowired
	MemberService memberService;

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
	
//-----------------------------------------跳轉單個頁面↓-----------------------------------------	
	@GetMapping("/oneActivity/{id}")
	public String one(@PathVariable("id") int activityNo, Model model, 
			HttpSession session, @ModelAttribute("msg") ActivityMsgBean msg) {
		
		ActivityBean activity = service.selectOneActivity(activityNo); //活動內容
		Map<String, Integer> hitCount = service.updateHitCount(activityNo); //點進來就增加一次點擊率
		List<ActivityMsgBean> msgBox = service.showMsg(activityNo); //留言板內容
		int msgNum = msgBox.size(); //留言板留言數量
		String account = (String) session.getAttribute("account"); //取得目前使用者帳號
		MemberBean member = memberService.getMember(account);
		String nickname = member.getNickname();
		List<ActivityJoinedBean> joined = service.joinedMember(activityNo); //取得本活動參加名單
		boolean isJoined = false;
		for(ActivityJoinedBean ajb:joined) {
			String joinedAccount = ajb.getMemberBean().getAccount();
			if (joinedAccount.equals(account)) {  //如果使用者在參加名單內回傳true
				isJoined = true;
				break;
			}
		}
		model.addAttribute("nickname",nickname);
		model.addAttribute("isJoined",isJoined);
		model.addAttribute("joined",joined);
		model.addAttribute("msgBox",msgBox);
		model.addAttribute("msgNum",msgNum);
		model.addAttribute("one",activity);
		model.addAttribute("hitCount",hitCount);
		return "OneActivity";
	}
//-----------------------------------------加入活動後跳轉單個頁面↓-----------------------------------------	
	@GetMapping("/addActivity/{id}")
	public String add(@PathVariable("id") int activityNo, HttpSession session, Model model) {
		
		ActivityBean activity = service.selectOneActivity(activityNo);
		Map<String, Integer> hitCount = service.updateHitCount(activityNo);
		List<ActivityMsgBean> msgBox = service.showMsg(activityNo);
		
		String account = (String) session.getAttribute("account");
		MemberBean member = memberService.getMember(account);
		Integer memberNo = member.getMemberNo();
		service.joinedOne(memberNo, activityNo);
		List<ActivityJoinedBean> joined = service.joinedMember(activityNo);
		List<String> joinedList = new ArrayList<>();
		for(ActivityJoinedBean ajb:joined) {
			String joinedaccount = ajb.getMemberBean().getAccount();
			joinedList.add(joinedaccount);
		}
		
		int msgNum = msgBox.size();
		model.addAttribute("joinedList",joinedList);
		model.addAttribute("joined",joined);
		model.addAttribute("msgBox",msgBox);
		model.addAttribute("msgNum",msgNum);
		model.addAttribute("one",activity);
		model.addAttribute("hitCount",hitCount);
		return "redirect:/oneActivity/{id}";
	}
	
//-----------------------------------------取消加入活動後跳轉單個頁面↓-----------------------------------------	
	@GetMapping("/cancelActivity/{id}")
	public String cancel(@PathVariable("id") int activityNo, HttpSession session, Model model) {
		
		ActivityBean activity = service.selectOneActivity(activityNo);
		Map<String, Integer> hitCount = service.updateHitCount(activityNo);
		List<ActivityMsgBean> msgBox = service.showMsg(activityNo);
		
		String account = (String) session.getAttribute("account");
		MemberBean member = memberService.getMember(account);
		Integer memberNo = member.getMemberNo();
		service.cancelOne(memberNo, activityNo);
		List<ActivityJoinedBean> joined = service.joinedMember(activityNo);
		List<String> joinedList = new ArrayList<>();
		for(ActivityJoinedBean ajb:joined) {
			String joinedaccount = ajb.getMemberBean().getAccount();
			joinedList.add(joinedaccount);
		}
		
		int msgNum = msgBox.size();
		model.addAttribute("joinedList",joinedList);
		model.addAttribute("joined",joined);
		model.addAttribute("msgBox",msgBox);
		model.addAttribute("msgNum",msgNum);
		model.addAttribute("one",activity);
		model.addAttribute("hitCount",hitCount);
		return "redirect:/oneActivity/{id}";
	}
//-----------------------------------------更新活動跳轉頁面↓-----------------------------------------	
	@GetMapping("/updateActivity/{id}")
	public String update(@PathVariable("id") int activityNo, HttpSession session, Model model
			,ActivityPicBean pic, @ModelAttribute("newform") ActivityBean newform) {
		
//		ActivityBean activity = service.selectOneActivity(activityNo);
//		Map<String, Integer> hitCount = service.updateHitCount(activityNo);
//		List<ActivityMsgBean> msgBox = service.showMsg(activityNo);
//		
//		MemberBean member= (MemberBean) session.getAttribute("member");
//		Integer memberNo = member.getMemberNo();
//		service.joinedOne(memberNo, activityNo);
//		List<ActivityJoinedBean> joined = service.joinedMember(activityNo);
//		List<String> joinedList = new ArrayList<>();
//		for(ActivityJoinedBean ajb:joined) {
//			String account = ajb.getMemberBean().getAccount();
//			joinedList.add(account);
//		}
//		
//		int msgNum = msgBox.size();
//		model.addAttribute("joinedList",joinedList);
//		model.addAttribute("joined",joined);
//		model.addAttribute("msgBox",msgBox);
//		model.addAttribute("msgNum",msgNum);
//		model.addAttribute("one",activity);
//		model.addAttribute("hitCount",hitCount);
		return "CreateNewActivity";
	}
//-----------------------------------------新增活動空的form表單↓-----------------------------------------		
	@GetMapping("/newActivities")
	
	public String newAcitivity(Model model,@ModelAttribute("newform") ActivityBean newform
			) {
//			ActivityPicBean pic = new ActivityPicBean();
		List<ActivityBean> list = service.selectAllActivities();
		List<ActivityTypeBean> types = service.showAllTypes();
		List<ActivityClassBean> categoryList = service.selectAllClasses();
		List<ProvinceBean> provs = service.selectAllProvs();
		model.addAttribute("activities",list);
		model.addAttribute("allTypes",types);
		model.addAttribute("categoryList",categoryList);
		model.addAttribute("provs",provs);
	    return "CreateNewActivity";
	   }
//-----------------------------------------新增活動↓-----------------------------------------
	@PostMapping("/newActivities")
	public String createNewAcitivity(HttpSession session, Model model, 
			ActivityPicBean pic, @ModelAttribute("newform") ActivityBean newform) {
		String account =  (String) session.getAttribute("account");
		MemberBean member= (MemberBean) session.getAttribute("member");
		Integer memberNo = member.getMemberNo();
		String fileName = pic.getFileName();
		MultipartFile mFile = pic.getUpdateImg();
//			//取得檔案型態 令存檔名
//			for (int i : mFile) {
//				String original = mFile[i].getOriginalFilename();
//				UUID uuid = UUID.randomUUID();
//				String fileTyle = original.substring(original.lastIndexOf("."), original.length());
//				albumn.setPicContent("Pet_" + uuid + "_" + service.MaxID() + fileTyle);
//			}
//			
		if (mFile != null && !mFile.isEmpty()) {
			byte[] b;
			try {
				b = mFile.getBytes();
				Blob blob = new SerialBlob(b);
				pic.setActivityPic(blob);
			} catch (IOException | SQLException e) {
				e.printStackTrace();
				throw new RuntimeException("異常:" + e.getMessage());
			}
		}
		String prov= newform.getProv();
		System.out.println("controller prov:"+prov);
		service.createActivity(memberNo, newform, pic);
		memberService.updatePost(account);
		
	    return "redirect:/activities";
	   }
					
//-----------------------------------------條件查詢form表單↓-----------------------------------------		
	@PostMapping("/form")
	public String form(Model model, @ModelAttribute("form") ActivityForm form) {
		String price = form.getPrice();
		String location = form.getLocation();
		String limit = form.getMaxLimit();
		String small = form.getSmalltype();
		
		List<ActivityBean> list = service.selectByFrom(price, location, limit, small);
		int selectedNum = list.size();
		List<ActivityBean> latest = service.selectLatest();
		List<ActivityTypeBean> types = service.showAllTypes();
		List<ActivityBean> finalOnes = service.selectFinal();
		int finalNum = finalOnes.size();
		
		Map<String, Integer> recentOnes = service.selectRecentMonths();
		List<ActivityClassBean> categoryList = service.selectAllClasses();
		model.addAttribute("selectedNum",selectedNum);
		model.addAttribute("activities",list);
		model.addAttribute("latestOnes",latest);
		model.addAttribute("allTypes",types);
		model.addAttribute("finalOnes",finalOnes);
		model.addAttribute("activitiesNum",finalNum);
		model.addAttribute("recentOnes",recentOnes);
		model.addAttribute("categoryList",categoryList);
		return "ShowActivities";
	}
//-----------------------------------------單個活動的留言板-新增訊息↓-----------------------------------------	

	@PostMapping("/msgSend")
	public String saveMsg(Model model, HttpSession session,
			String msg, Integer activityNo
			) {
		String account = (String) session.getAttribute("account");
		MemberBean member = memberService.getMember(account);
		Integer memberNo = member.getMemberNo();
		String nickname = member.getNickname();
		List<ActivityMsgBean> msgBox = service.saveMsg(msg,activityNo,memberNo);
		model.addAttribute("nickname",nickname);
		model.addAttribute("msgBox",msgBox);
		model.addAttribute("activityNo",activityNo);
		return "ajax/msgBox";
	}
//-----------------------------------------單個活動的留言板-修改訊息↓-----------------------------------------	

	@PostMapping("/msgUpdate")
	public String updateMsg(Model model, HttpSession session,Integer activityNo, Integer msgNo, String msg) {
		String account = (String) session.getAttribute("account");
		MemberBean member = memberService.getMember(account);
		String nickname = member.getNickname();
		service.updateMsg(msg, msgNo);
		List<ActivityMsgBean> msgBox = service.showMsg(activityNo); //留言板內容
		int msgNum = msgBox.size(); //留言板留言數量
		model.addAttribute("nickname",nickname);
		model.addAttribute("msgNum",msgNum);
		model.addAttribute("msgBox",msgBox);
		model.addAttribute("activityNo",activityNo);
		return "ajax/msgBox";
	}

		
//-----------------------------------------單個活動的留言板-刪除訊息↓-----------------------------------------	

	@PostMapping("/msgDelete")
	public String deleteMsg(Model model, HttpSession session,Integer activityNo, Integer msgNo) {
		
		System.out.println("controller--------------"+msgNo);
		String account = (String) session.getAttribute("account");
		MemberBean member = memberService.getMember(account);
		String nickname = member.getNickname();
		service.deleteMsg(msgNo);
		List<ActivityMsgBean> msgBox = service.showMsg(activityNo); //留言板內容
		int msgNum = msgBox.size(); //留言板留言數量
		model.addAttribute("nickname",nickname);
		model.addAttribute("msgNum",msgNum);
		model.addAttribute("msgBox",msgBox);
		model.addAttribute("activityNo",activityNo);
		return "ajax/msgBox";
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
		int elementsNum = beans.size();
		model.addAttribute("activitiesNum",elementsNum);
		model.addAttribute("activities",beans);
		return "ajax/activity lists";

	}
	
	@GetMapping("/ajax_ordered2")
	public String startFromEarlest(Model model) {
		List<ActivityBean> beans = service.startFromEarlest();
		int elementsNum = beans.size();
		model.addAttribute("activitiesNum",elementsNum);
		model.addAttribute("activities",beans);
		return "ajax/activity lists";

	}
	
	@GetMapping("/ajax_ordered3")
	public String endFromLatest(Model model) {
		List<ActivityBean> beans = service.endFromLatest();
		int elementsNum = beans.size();
		model.addAttribute("activitiesNum",elementsNum);
		model.addAttribute("activities",beans);
		return "ajax/activity lists";

	}
	
	@GetMapping("/ajax_ordered4")
	public String endFromEarlest(Model model) {
		List<ActivityBean> beans = service.endFromEarlest();
		int elementsNum = beans.size();
		model.addAttribute("activitiesNum",elementsNum);
		model.addAttribute("activities",beans);
		return "ajax/activity lists";

	}
	
	@GetMapping("/ajax_ordered5")
	public String peopleFromFew(Model model) {
		List<ActivityBean> beans = service.peopleFromFew();
		int elementsNum = beans.size();
		model.addAttribute("activitiesNum",elementsNum);
		model.addAttribute("activities",beans);
		return "ajax/activity lists";

	}
	
	@GetMapping("/ajax_ordered6")
	public String peopleFromMany(Model model) {
		List<ActivityBean> beans = service.peopleFromMany();
		int elementsNum = beans.size();
		model.addAttribute("activitiesNum",elementsNum);
		model.addAttribute("activities",beans);
		return "ajax/activity lists";

	}
	
	@GetMapping("/ajax_ordered7")
	public String placeFromNorth(Model model) {
		List<ActivityBean> beans = service.placeFromNorth();
		int elementsNum = beans.size();
		model.addAttribute("activitiesNum",elementsNum);
		model.addAttribute("activities",beans);
		return "ajax/activity lists";

	}
	
	@GetMapping("/ajax_ordered8")
	public String placeFromSouth(Model model) {
		List<ActivityBean> beans = service.placeFromSouth();
		int elementsNum = beans.size();
		model.addAttribute("activitiesNum",elementsNum);
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
	public String classForCheckedType(Model model, @RequestParam String type) {
		List<ActivityClassBean> classes = service.classForCheckedType(type);
//		int elementsNum = classes.size();
		model.addAttribute("categoryList",classes);
		
		return "ajax/classes";

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

//	@ModelAttribute
//	public MemberBean isexist(
//			@RequestParam(value="userId"), required = false Integer id)
	
	
//-----------------------------------------關注活動↓-----------------------------------------	
	@PostMapping("/ajax_follow")
	public void follow(Model model, HttpSession session, String activityUrl) {
		String account = (String) session.getAttribute("account");
		MemberBean member = memberService.getMember(account);
		Integer memberNo = member.getMemberNo();
		
		ActivityFollowedBean follow = new ActivityFollowedBean();
		follow.setActivityUrl(activityUrl);
		service.followActivity(memberNo, follow); 
		
	}
//-----------------------------------------取消關注活動↓-----------------------------------------	
	@PostMapping("/ajax_unfollow")
	public void unfollow(Model model, HttpSession session, String activityUrl) {
		String account = (String) session.getAttribute("account");
		MemberBean member = memberService.getMember(account);
		Integer memberNo = member.getMemberNo();
		service.unfollowActivity(memberNo, activityUrl); 
	}	
	
	
	@GetMapping("/wsendpoing")
	public String chatbot(Model model) {
		return "index00";
	}
}
