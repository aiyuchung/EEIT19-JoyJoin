package com.web.activity.controller;

import java.io.ByteArrayOutputStream;
import java.io.IOException;
import java.io.InputStream;
import java.sql.Blob;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;
import java.util.Map;

import javax.servlet.ServletContext;
import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import javax.sql.rowset.serial.SerialBlob;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.CacheControl;
import org.springframework.http.HttpHeaders;
import org.springframework.http.HttpStatus;
import org.springframework.http.MediaType;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.CookieValue;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.SessionAttributes;
import org.springframework.web.multipart.MultipartFile;

import com.web.activity.model.ActivityBean;
import com.web.activity.model.ActivityClassBean;
import com.web.activity.model.ActivityFollowedBean;
import com.web.activity.model.ActivityForm;
import com.web.activity.model.ActivityJoinedBean;
import com.web.activity.model.ActivityMsgBean;
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

	@Autowired
	ServletContext servletContext;
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
			HttpSession session, @ModelAttribute("msg") ActivityMsgBean msg,
			@RequestParam (required=false) String condition) {
		boolean frombtn = false;
		if (condition != null) {
			frombtn = true;
		}
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
		List<ActivityFollowedBean> followed = memberService.getFollowedActivity(member.getMemberNo());
		boolean isFollowed = false;
		for(ActivityFollowedBean afb:followed) {
			String followedAccount = afb.getMemberBean().getAccount();
			if (followedAccount.equals(account)) {  //如果使用者在參加名單內回傳true
				isFollowed = true;
				break;
			}
		}
		boolean levelLimit = false;
		int levelSetting = activity.getLevelLimit();
		String level = (String) session.getAttribute("level");
		if (Integer.parseInt(level) < levelSetting) {
			levelLimit = true;
		}
		model.addAttribute("frombtn",frombtn);
		model.addAttribute("nickname",nickname);
		model.addAttribute("isJoined",isJoined);
		model.addAttribute("isFollowed",isFollowed);
		model.addAttribute("levelLimit",levelLimit);
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
			,@ModelAttribute("newform") ActivityBean newform) {
		
		List<ActivityBean> list = service.selectAllActivities();
		List<ActivityTypeBean> types = service.showAllTypes();
		List<ActivityClassBean> categoryList = service.selectAllClasses();
		List<ProvinceBean> provs = service.selectAllProvs();
		
		ActivityBean bean = service.selectOneActivity(activityNo);
		model.addAttribute("newform",bean);
		model.addAttribute("activities",list);
		model.addAttribute("allTypes",types);
		model.addAttribute("categoryList",categoryList);
		model.addAttribute("provs",provs);
		
		return "CreateNewActivity";
	}
//-----------------------------------------新增活動空的form表單↓-----------------------------------------	
	@ModelAttribute("activities")
	public List<ActivityBean> a1() {
		List<ActivityBean> list = service.selectAllActivities();
		return list;
	}
	
	@ModelAttribute("types")
	public List<ActivityTypeBean> a2() {
		List<ActivityTypeBean> types = service.showAllTypes();
		return types;
	}
	
	@ModelAttribute("categoryList")
	public List<ActivityClassBean> a3() {
		List<ActivityClassBean> categoryList = service.selectAllClasses();
		return categoryList;
	}
	
	@ModelAttribute("provs")
	public List<ProvinceBean> a4() {
		List<ProvinceBean> provs = service.selectAllProvs();
		return provs;
	}
	
	@ModelAttribute("nickname")
	public String a5(HttpSession session) {
		String account =  (String) session.getAttribute("account");
		MemberBean member = memberService.getMember(account);
		String nickname = member.getNickname();
		return nickname;
	}
	
	@GetMapping("/newActivities")	
	public String newAcitivity(Model model
			) {
		ActivityBean acb = new ActivityBean();
		model.addAttribute("newform",acb);
	    return "CreateNewActivity";
	   }
//-----------------------------------------新增活動↓-----------------------------------------
	@PostMapping("/newActivities")
	public String createNewAcitivity(HttpSession session, Model model, 
			 @ModelAttribute("newform") ActivityBean newform) {
		
		String account =  (String) session.getAttribute("account");
		MemberBean member = memberService.getMember(account);
		Integer memberNo = member.getMemberNo();
		
		MultipartFile mFile = newform.getUpdateImg();
		System.out.println("controller file name-----------------------"+mFile);
		
			//取得檔案型態 令存檔名
		String original = mFile.getOriginalFilename();
		System.out.println("controller original -----------------------"+original);
		newform.setFileName(original);
//		UUID uuid = UUID.randomUUID();
//		String fileTyle = original.substring(original.lastIndexOf("."), original.length());
//		albumn.setPicContent("Pet_" + uuid + "_" + service.MaxID() + fileTyle);
			
			
		if (mFile != null && !mFile.isEmpty()) {
			byte[] b;
			try {
				b = mFile.getBytes();
				Blob blob = new SerialBlob(b);
				newform.setActivityPic(blob);
				System.out.println("controller blob-----------------------"+blob);
			} catch (IOException | SQLException e) {
				e.printStackTrace();
				throw new RuntimeException("異常:" + e.getMessage());
			}
		}
		
		String prov= newform.getProv();
		System.out.println("controller prov:"+prov);
		service.createActivity(memberNo, newform);
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
	
	@GetMapping("/ajax_keyWordscookie")
	public String cookie(@CookieValue(value = "s", defaultValue = "Atta") String username,
			Model model, HttpServletResponse response,
			@RequestParam String keyword) {
		 Cookie cookie = new Cookie("s", "Jovan");
		 response.addCookie(cookie);
		return  "";

	}
	
	List<String> cookies = new ArrayList<>();
	@RequestMapping(value = "checkCookie")
    public String checkCookie(HttpSession httpsession,String keyword, HttpServletResponse response, Model model){
        // 新建Cookie
        // 輸出到客戶端
		if(cookies.size() == 0) {
			cookies.add(keyword);
		}else {
			for(int i =0; i <cookies.size(); i++) {
				if (!cookies.get(i).equals(keyword)) {
					cookies.add(keyword);
					break;
					
				}else {
					break;
				}
			}if (cookies.size()>10) {
				cookies.remove(0);
			}
		}
		
		httpsession.setAttribute("keywords", cookies);
		model.addAttribute("keywords",cookies);
		
        return "ajax/cookie";
	}
	
	@RequestMapping(value = "getCookie")
    public String getCookie(HttpSession httpsession, Model model){
        // 控制檯輸出
//        System.out.println("keyword: " + keyword);
        
        return "ajax/cookie";
    }

//	@ModelAttribute
//	public MemberBean isexist(
//			@RequestParam(value="userId"), required = false Integer id)
	
	
//-----------------------------------------關注活動↓-----------------------------------------	
	@PostMapping("/ajax_follow")
	public void follow(Model model, HttpSession session, String activityUrl,Integer activityNo) {
		String account = (String) session.getAttribute("account");
		MemberBean member = memberService.getMember(account);
		Integer memberNo = member.getMemberNo();
		
		ActivityFollowedBean follow = new ActivityFollowedBean();
		follow.setActivityUrl(activityUrl);
		service.followActivity(memberNo, follow, activityNo); 
		
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
//-----------------------------------------前端讀圖片↓-----------------------------------------		
	@GetMapping("/getPicture/{id}")
	  public ResponseEntity<byte[]> getPicture(
	    @PathVariable("id") int activityNo) throws Exception{
	   //用商品ID來抓取圖片的ID
//	   System.out.println("commodityId="+ImageID);
	   //先定義一下mimeType和InputStream
	   InputStream is = null;
	   String mimeType = null;
	//   CommodityBean bean = service.getcommodityID(ImageID);
	   //將得到的ImageID也就是透過商品ID 去查詢本方法在Imagebean裡設的外鍵欄位=商品id
	   //所以list 會取得所有綁定這個外鍵id的圖片
	   
//	   List<ImageBean> list = service.getImageByCommodityID(ImageID);
	   //定義blob
	   Blob blob=null;
	   //將取得的商品id所綁定的圖片抓出來
	   ActivityBean bean = service.selectOneActivity(activityNo);
	   if(bean != null) {
		   blob = bean.getActivityPic();
	   }
	   if(blob != null) {
		   is = blob.getBinaryStream();
		   mimeType = servletContext.getMimeType(bean.getFileName());
	   }
	   
	   ResponseEntity<byte[]> re = null;
	//   if(list != null) {
	//    
	//   if(blob != null){
//	    is = blob.getBinaryStream();
//	    mimeType = servletContext.getMimeType(bean.getCommodityImagefilename());
//	      
//	    }
	//   }
	   //如果抓到的圖片為null值 給一個預設圖片
	   if(is == null) {
	    is = servletContext.getResourceAsStream("/images/noImage.jpg");
	    mimeType = servletContext.getMimeType("noImage.jpg");
	   }
	   //將得到的mimeType塞進來
	   MediaType mediaType = MediaType.valueOf(mimeType);
	   HttpHeaders headers = new HttpHeaders();
	   //再將剛得到的mimeType塞進回應headers的ContentType內
	   headers.setContentType(mediaType);
	   headers.setCacheControl(CacheControl.noCache().getHeaderValue());
	   ByteArrayOutputStream baos = new ByteArrayOutputStream();
	   byte[] b = new byte[81920];
	   int len = 0;
	   while((len = is.read(b)) != -1) {
	    baos.write(b,0,len);
	   }
	   byte[] content = baos.toByteArray();
	   re = new ResponseEntity<byte[]>(content, headers, HttpStatus.OK);
	   return re;
	  }
}
