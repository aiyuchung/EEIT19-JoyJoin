package com.web.activity.controller;

import java.util.HashMap;
import java.util.LinkedHashMap;
import java.util.List;
//import java.util.Map;
import java.util.Map;

//import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.bind.annotation.SessionAttributes;

import com.web.activity.model.ActivityBean;
import com.web.activity.model.MemberBean;
import com.web.activity.model.Menubean;
import com.web.activity.model.RoleBean;
import com.web.activity.service.CMSService;
import com.web.activity.service.MemberService;

@Controller
@SessionAttributes(value = { "member", "role", "level", "account" })
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

//		System.out.println("hello world"); // 測試有沒有通過

		return loc; // 全部放到LOC 也是回傳 JSP的意思

	}

	// 計算性別出現次數
	@GetMapping(value = "/ajax_gender", produces = { "application/json" }) // @ResponseBody生產JSON檔
	public @ResponseBody Map<String, Long> gender() { // 設定@ResponseBody 伺服器回應JSON檔案
		Map<String, Long> gen = new HashMap<>(); // 宣告一個map物件gen
		gen = service.getGenderCounts(); // gen使用getActiveLocation

//		System.out.println("hello world"); // 測試有沒有通過

		return gen; // 全部放到gen 也是回傳 JSP的意思

	}

	// 計算縣市出現次數
	@GetMapping(value = "/ajax_prov", produces = { "application/json" }) // @ResponseBody生產JSON檔
	public @ResponseBody Map<String, Long> prov() { // 設定@ResponseBody 伺服器回應JSON檔案
		Map<String, Long> pro = new HashMap<>(); // 宣告一個map物件gen
		pro = service.getActivityProv(); // gen使用getActiveLocation
//		System.out.println(pro); // 測試有沒有通過
		return pro; // 全部放到gen 也是回傳 JSP的意思
	}

	// 計算星座
	@GetMapping(value = "/ajax_starSign", produces = { "application/json" }) // @ResponseBody生產JSON檔
	public @ResponseBody Map<String, Long> starSign() { // 設定@ResponseBody 伺服器回應JSON檔案
		Map<String, Long> star = new HashMap<>(); // 宣告一個map物件loc
		star = service.getstarSignCounts(); // star使用getstarSignCounts

		System.out.println(star); // 測試有沒有通過
		System.out.println("hello world"); // 測試有沒有通過

		return star; // 全部放到LOC 也是回傳 JSP的意思

	}

//	<=========================================================================================>
	// 跟活動新刪改查有關
	// 用在CMS頁面出現的活動資料
	@GetMapping("/allactive") // 請求路徑
	public String list(Model model) {
		List<ActivityBean> list = service.selectAllActivities(); // 宣告list物件 "list" 用selectAllActivies 方法
		List<Menubean> Menubean = service.getMenuName("1");// 外層迴圈
		List<Menubean> Menubean2 = service.getMenuName("2");// 內層迴圈
		model.addAttribute("allactive", Menubean);// 外層迴圈
		model.addAttribute("allactive2", Menubean2);// 內層迴圈
		model.addAttribute("activities", list); // model 裝進去東西 識別字串 activities
//		System.out.println("hello world");
		return "CMS"; // 分配jsp
	}

	// 權限管理
	@GetMapping("/ajax_rights")
	public String rights(Model model) {
		return "ajax/rights";
	}

	// 關鍵字查詢
	@GetMapping("/ajax_CM_keyWords")
	public String selectactive(Model model, @RequestParam String keyword) {
		List<ActivityBean> beans = service.selectActivities(keyword);
		int elementsNum = beans.size();
		model.addAttribute("activitiesNum", elementsNum);
		model.addAttribute("activities", beans);
		return "ajax/CMSActives"; // 分配到ajax jsp
	}

	// 活動部分 一開始先不搜尋
	@GetMapping("/ajax_selallactive")
	public String selectallactive(Model model) {
//		List<ActivityBean> beans = service.selectAllActivities();
//		model.addAttribute("activities", beans);
//		System.out.println("hello world");
		return "ajax/CMSActives"; // 分配到ajax jsp
	}

	// 單獨更新 activityStatus
	@GetMapping("/ajax_update_keyWords")
	public String updateActivityStatus(Model model, @RequestParam String activityNo, @RequestParam String activityStatus
	// @RequestParam String keyword
	) {
		int beans = service.updateActivityStatus(activityStatus, activityNo);
		List<ActivityBean> beanList = service.selectAllActivities();
		model.addAttribute("activities", beanList);
		// model.addAttribute("activities", beans);

		return "ajax/CMSActives";
	}

//	<=========================================================================================>

	// 會員部分controller
//		 搜尋全部角色
	@GetMapping("/ajax_selectAllRoles")
	public String selectAllRoles(Model model) {
		List<RoleBean> ro = service.selectAllRoles();
		model.addAttribute("Roles", ro);
		System.out.println(ro);
		return "ajax/CMSRole"; // 分配到ajax jsp
	}

	// 搜尋全部成員
	@GetMapping("/ajax_selectAllMembers")
	public String selectAllMembers(Model model) {
		List<MemberBean> mb = service.selectAllMembers();
		model.addAttribute("Members", mb);
		System.out.println(mb);
		return "ajax/CMSMembers"; // 分配到ajax jsp
	}

//	 修改角色資料@ModelAttribute(value="RoleB") RoleBean RoleB,Model model
	@PostMapping(value = "/ajax_updateRole", produces = { "application/json" }, consumes = { "application/json" }) // 接收都是JSON檔案
	public @ResponseBody Map<String, String> updateRole(@RequestBody RoleBean roleB, @RequestParam Integer id,
			Model model) { // 裝到BEAN裡面

		Map<String, String> map = new LinkedHashMap<String, String>();
		// 抓BEAN裡面存取前端的資料
		// 搜尋舊有資料
		RoleBean roleB1 = service.getRole(id); // 資料庫回傳的內容 搜尋舊有資料
		roleB1.setLevel(roleB.getLevel()); // update 原本資料庫的欄位 把之前的資料注入進去
//		
		System.out.println("roleB1.setLevel(roleB.getLevel())=" + roleB.getLevel());
//		
		service.updateRole(roleB1);// 更新完成
//		
		System.out.println("hello SkyWalker");
		return map; // 分配到ajax jsp 回傳MAP JSON
	}

//	 修改角色資料@ModelAttribute(value="RoleB") RoleBean RoleB,Model model
	@PostMapping(value = "/ajax_updateRole1", produces = { "application/json" }, consumes = { "application/json" }) // 接收都是JSON檔案
	public @ResponseBody Map<String, String> updateRole1(@RequestBody RoleBean roleB, @RequestParam Integer id,
			Model model) { // 裝到BEAN裡面

		Map<String, String> map = new LinkedHashMap<String, String>();
		// 抓BEAN裡面存取前端的資料
		// 搜尋舊有資料
		RoleBean roleB1 = service.getRole(id); // 資料庫回傳的內容 搜尋舊有資料

		roleB1.setAccountType(roleB.getAccountType()); // update 原本資料庫的欄位 把之前的資料注入進去

		System.out.println("roleB1.setLevel(roleB.getLevel())=" + roleB.getLevel());

		service.updateRole(roleB1);// 更新完成

		System.out.println("hello SkyWalker");
		return map; // 分配到ajax jsp 回傳MAP JSON
	}

//	 修改角色資料@ModelAttribute(value="RoleB") RoleBean RoleB,Model model
	@PostMapping(value = "/ajax_updateRole2", produces = { "application/json" }, consumes = { "application/json" }) // 接收都是JSON檔案
	public @ResponseBody Map<String, String> updateRole2(@RequestBody RoleBean roleB, @RequestParam Integer id,
			Model model) { // 裝到BEAN裡面

		Map<String, String> map = new LinkedHashMap<String, String>();
		// 抓BEAN裡面存取前端的資料
		// 搜尋舊有資料
		RoleBean roleB1 = service.getRole(id); // 資料庫回傳的內容 搜尋舊有資料

		System.out.println("roleB1.setNoticeType(roleB.getNoticeType())=" + roleB.getNoticeType());

		service.updateRole(roleB1);// 更新完成

		System.out.println("hello SkyWalker");
		return map; // 分配到ajax jsp 回傳MAP JSON
	}

}
