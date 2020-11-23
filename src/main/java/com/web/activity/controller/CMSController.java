package com.web.activity.controller;

import java.util.HashMap;
import java.util.LinkedHashMap;
import java.util.List;
//import java.util.Map;
import java.util.Map;

import javax.servlet.http.HttpSession;

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
import com.web.activity.model.OrderBean;
import com.web.activity.model.RoleBean;
import com.web.activity.model.RoleCheckBean;
import com.web.activity.model.RoleSaveBean;
import com.web.activity.model.SystemLog;
import com.web.activity.service.CMSService;
import com.web.activity.service.MemberService;

import net.sf.json.JSONArray;
import net.sf.json.JSONObject;

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

		return loc; // 全部放到LOC 也是回傳 JSP的意思

	}

	// 計算性別出現次數
	@GetMapping(value = "/ajax_gender", produces = { "application/json" }) // @ResponseBody生產JSON檔
	public @ResponseBody Map<String, Long> gender() { // 設定@ResponseBody 伺服器回應JSON檔案
		Map<String, Long> gen = new HashMap<>(); // 宣告一個map物件gen
		gen = service.getGenderCounts(); // gen使用getActiveLocation

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

		return star; // 全部放到LOC 也是回傳 JSP的意思

	}

//	<=========================================================================================>
	// 跟活動新刪改查有關
	// 用在CMS頁面出現的活動資料
	@GetMapping("/allactive") // 請求路徑
	public String list(Model model, HttpSession session) {
		List<ActivityBean> list = service.selectAllActivities(); // 宣告list物件 "list" 用selectAllActivies 方法
		List<Menubean> Menubean = service.getMenuName("1");// 外層迴圈
		List<Menubean> Menubean2 = service.getMenuName("2");// 內層迴圈
		String levelst = (String) session.getAttribute("level");
		int level = Integer.parseInt(levelst);
		int rsbList = 1 ;
		if (level == 4) { rsbList=3;}
		if (level == 5) { rsbList=2;}
		if (level == 6) { rsbList=1;}
		List<Integer> checked = service.forRoleRight(rsbList);
		model.addAttribute("allactive", Menubean);// 外層迴圈
		model.addAttribute("allactive2", Menubean2);// 內層迴圈
		model.addAttribute("activities", list); // model 裝進去東西 識別字串 activities
		model.addAttribute("checked", checked); // model 裝進去東西 識別字串 activities
//		System.out.println("hello world");
		return "CMS"; // 分配jsp
	}

	// 權限管理
	@GetMapping("/ajax_rights")
	public String rights(Model model, HttpSession httpSession) {
		// System.out.println(httpSession.getAttribute("tree"));

		List<Menubean> rightspath = service.rights();
		model.addAttribute("rights", rightspath);
		JSONArray jsonArray = new JSONArray();
		for (Menubean rights : rightspath) {
			JSONObject jsonObject = new JSONObject();
			jsonObject.put("id", rights.getId());
			jsonObject.put("pId", rights.getParentId());
			jsonObject.put("name", rights.getMenuName());
			jsonArray.add(jsonObject);
		}
		model.addAttribute("rights1", jsonArray.toString());

		List<RoleCheckBean> roleList = service.checkRole();
		model.addAttribute("roleList", roleList);
//	  System.out.println(roleList+"~~~~~~~~~~~~~~~~~~~");

		return "ajax/rights";
	}
	
	@GetMapping("/forRoleRight")
	public @ResponseBody List<Integer> forRoleRight(Model model, int rsbList) {
		return service.forRoleRight(rsbList);
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

	//// 下拉式選單取管理員的值
	@GetMapping("/selectRights")
	public String selectRole(Model model) {
		List<RoleSaveBean> rsbList = service.selectRole();
		model.addAttribute("rsbList", rsbList);
		System.out.println(rsbList + "~~~~~~~~~~~~~~~~~~~");
		return "ajax/rights";
	}

	// 存節點和人員
	// 確定鍵
	@GetMapping("/rights")
	public String roleSave(Model model, @RequestParam String roleSave, @RequestParam String ztreeSave) {
		service.saveRsb(roleSave, ztreeSave);
//	 System.out.println(+"~~~~~~~~~~~~~~~~~~~");
		return "ajax/rights";
	}
//	<=========================================================================================>

	// 會員部分controller
	
	// 關鍵字角色查詢
			@GetMapping("/ajax_role_keyWords")
			public String selectrole(Model model, @RequestParam String keyword) {
				List<RoleBean> ro = service.selectRoles(keyword);
				int elementsNum = ro.size();
				model.addAttribute("RolesNum", elementsNum);
				model.addAttribute("Roles", ro);
				System.out.println(ro);
				System.out.println(keyword);
				return "ajax/CMSRole"; // 分配到ajax jsp
			}
			// 關鍵字會員查詢
			@GetMapping("/ajax_member_keyWords")
			public String selectMemb(Model model, @RequestParam String keyword) {
				List<MemberBean> mb = service.selectMemb(keyword);
				int elementsNum = mb.size();
				model.addAttribute("MemB", elementsNum);
				model.addAttribute("Members", mb);
				System.out.println(mb);
				System.out.println(keyword);
				return "ajax/CMSMembers"; // 分配到ajax jsp
			}
	
	
	
	
	
	
	
	
//		 搜尋全部角色
	@GetMapping("/ajax_selectAllRoles")
	public String selectAllRoles(Model model) {
		List<RoleBean> ro = service.selectAllRoles();
		model.addAttribute("Roles", ro);
//		System.out.println(ro);
		return "ajax/CMSRole"; // 分配到ajax jsp
	}

	// 搜尋全部成員
	@GetMapping("/ajax_selectAllMembers")
	public String selectAllMembers(Model model) {
		List<MemberBean> mb = service.selectAllMembers();
		model.addAttribute("Members", mb);
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

		service.updateRole(roleB1);// 更新完成

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
		service.updateRole(roleB1);// 更新完成

		return map; // 分配到ajax jsp 回傳MAP JSON
	}
	// 日誌部分controller
//	 搜尋全部日誌
	@GetMapping("/ajax_selectSystemLog")
	public String selectSystemLog(Model model) {
		List<SystemLog> log = service.selectSystemLog();
		model.addAttribute("Log", log);
		return "ajax/CMSLog"; // 分配到ajax jsp
	}
	
	
//	=======訂單====================================================================
	
	// 搜尋全部訂單
		@GetMapping("/ajax_selectAllOrder")
		public String selectAllOrder(Model model) {
			List<OrderBean> ob = service.selectAllOrder();
			model.addAttribute("Order", ob);
			return "ajax/CMSOrder"; // 分配到ajax jsp
		}
	

}
