package com.web.activity.controller;

import java.util.HashMap;
import java.util.List;
//import java.util.Map;
import java.util.Map;

//import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.bind.annotation.SessionAttributes;

import com.web.activity.model.ActivityBean;
import com.web.activity.model.MemberBean;
import com.web.activity.model.RoleBean;
import com.web.activity.service.CMSService;
import com.web.activity.service.MemberService;

@Controller
@SessionAttributes( value = {"member", "role","level","account"} )
public class CMSController {
	@Autowired
	CMSService service; // service乘載DAO方法 SERVICE與DAO歸類 model
	@Autowired
	MemberService memberService;

//	<=========================================================================================>
//跟圖表功能有關

//計算地區出現次數
	@GetMapping(value = "/ajax_counts", produces = { "application/json" }) // @ResponseBody生產JSON檔
	public @ResponseBody Map<String, Long> counts() { // 設定@ResponseBody 伺服器回應JSON檔案
		Map<String, Long> loc = new HashMap<>(); // 宣告一個map物件loc
		loc = service.getActiveLocation(); // LOC使用getActiveLocation

		System.out.println("hello world"); // 測試有沒有通過

		return loc; // 全部放到LOC 也是回傳 JSP的意思

	}

	// 計算性別出現次數
	@GetMapping(value = "/ajax_gender", produces = { "application/json" }) // @ResponseBody生產JSON檔
	public @ResponseBody Map<String, Long> gender() { // 設定@ResponseBody 伺服器回應JSON檔案
		Map<String, Long> gen = new HashMap<>(); // 宣告一個map物件gen
		gen = service.getGenderCounts(); // gen使用getActiveLocation

		System.out.println("hello world"); // 測試有沒有通過

		return gen; // 全部放到gen 也是回傳 JSP的意思

	}

	// 計算縣市出現次數
	@GetMapping(value = "/ajax_prov", produces = { "application/json" }) // @ResponseBody生產JSON檔
	public @ResponseBody Map<String, Long> prov() { // 設定@ResponseBody 伺服器回應JSON檔案
		Map<String, Long> pro = new HashMap<>(); // 宣告一個map物件gen
		pro = service.getActivityProv(); // gen使用getActiveLocation
		System.out.println(pro); // 測試有沒有通過
		return pro; // 全部放到gen 也是回傳 JSP的意思
	}

//	<=========================================================================================>
	// 跟活動新刪改查有關
	// 用在CMS頁面出現的活動資料
	@GetMapping("/allactive") // 請求路徑
	public String list(Model model) {
		List<ActivityBean> list = service.selectAllActivities(); // 宣告list物件 "list" 用selectAllActivies 方法
		model.addAttribute("activities", list); // model 裝進去東西 識別字串 activities
//		System.out.println("hello world");
		return "CMS"; // 分配jsp

	}

	@GetMapping("/ajax_CM_keyWords")
	public String selectactive(Model model,@RequestParam String keyword) {
		List<ActivityBean> beans = service.selectActivities(keyword);
		model.addAttribute("activities", beans);
//		System.out.println("hello world");
		return "ajax/CMSActives"; // 分配到ajax jsp
	}
	
	@GetMapping("/ajax_selallactive")
	public String selectallactive(Model model) {
//		List<ActivityBean> beans = service.selectAllActivities();
//		model.addAttribute("activities", beans);
//		System.out.println("hello world");
		return "ajax/CMSActives"; // 分配到ajax jsp
	}

//	<=========================================================================================>

//會員部分controller
//	 搜尋全部會員
	@GetMapping("/ajax_selectAllRoles")
	public String selectAllMembers(Model model) {
		List<RoleBean> ro = service.selectAllRoles();
		model.addAttribute("Roles", ro);
		System.out.println("hello world");
		return "ajax/CMSRole"; // 分配到ajax jsp
	}
//	 修改會員資料
	@PostMapping("/ajax_updateAllMembers")
	public String updateAllMembers(MemberBean mb) {
		memberService.updateInfo(mb);
		System.out.println("hello SkyWalker");
		return "ajax/CMSUpdatemember"; // 分配到ajax jsp
	}

}
