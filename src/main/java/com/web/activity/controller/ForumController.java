package com.web.activity.controller;

import java.io.ByteArrayOutputStream;
import java.io.InputStream;
import java.sql.Blob;
import java.util.ArrayList;
import java.util.Comparator;
import java.util.List;
import java.util.stream.Collectors;

import javax.servlet.ServletContext;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.CacheControl;
import org.springframework.http.HttpHeaders;
import org.springframework.http.HttpStatus;
import org.springframework.http.MediaType;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestParam;

import com.web.activity.Enum.ForumType;
import com.web.activity.model.ForumBean;
import com.web.activity.model.MemberBean;
import com.web.activity.model.RoleBean;
import com.web.activity.model.userBean;
import com.web.activity.service.ActivityService;
import com.web.activity.service.ForumService;
import com.web.activity.service.MemberService;

@Controller

public class ForumController {

	@Autowired
	ForumService service;
	
	@Autowired
	ActivityService activityService;
	
	@Autowired
	MemberService memberService;
	
	@Autowired
	ServletContext servletContext;
	
	
	@GetMapping("/forum")
	public String selectAllForum(Model model,@ModelAttribute("form") ForumBean form) {
		List<ForumBean>forumList = service.selectForumTitleListByParam(form);
		model.addAttribute("forumList", forumList);
		return "forum/forum";
	}
	
	@GetMapping("/ajax_forum")
	public String selectRecentMon(Model model, String activeType, String keyWord,String code) {
		ForumBean forumBean = new ForumBean();
		forumBean.setType(activeType);
		forumBean.setKeyWord(keyWord);
		forumBean.setCode(code);
		List<ForumBean>forumList = service.selectForumTitleListByParam(forumBean);
		model.addAttribute("forumList",forumList);
		return "ajax/forumTable";

	}
	
	@GetMapping("/forumDetail")
	public String getForumDetail(Model model,@ModelAttribute("form") ForumBean form) {
		service.plusPopularity(form.getForumSeq());
		form.setCode(String.valueOf(form.getForumSeq()));
		List<ForumBean>forumList = service.selectForumDteailListByParam(form);
		ForumBean forumBean = forumList.stream()
				.filter(f -> ForumType.TITLE.equals(f.getForumType())).findAny()
				.orElse(new ForumBean());
		List<ForumBean> forumDetailList = forumList.stream()
				.sorted(Comparator.comparing(ForumBean::getForumSeq))
				.filter(f -> ForumType.DETAIL.equals(f.getForumType()))
				.collect(Collectors.toList());

		model.addAttribute("forumBean",forumBean);
		model.addAttribute("forumDetailList",forumDetailList);
		return "forum/forumDetail";
	}
	
	
	@GetMapping("/forumDetail_ONE")
	public String getForumDetailOne(Model model,@RequestParam Integer forumSeq) {
		ForumBean forum = service.selectOneForum(forumSeq);
		model.addAttribute("forum", forum);
		return "forum/forumDetail";
	}
	
	@GetMapping("/forumNewArticle")
	public String getforumNewArticle(Model model,  HttpSession session,@ModelAttribute("form") ForumBean form) {
		String account = (String) session.getAttribute("account");
		MemberBean member = memberService.getMember(account);
		form.setMemberBean(member);
		form.setAuthor(member.getMemberNo().toString());
		model.addAttribute("forumBean",form);
		
		return "forum/forumNewArticle";
	}
	
	
	@GetMapping("/forumUpdateArticle")
	public String forumUpdateArticle( Model model,@ModelAttribute("form") ForumBean form) {
		ForumBean forumRes = service.selectOneForum(form.getForumSeq());
		model.addAttribute("forumBean",forumRes);
		return "forum/forumNewArticle";
	}
	
	@GetMapping("/createNewTitle/{id}")
	public String getforumNewArticle(Model model, HttpSession session, @PathVariable("id") Integer activeNo) {
		//傳入活動號碼，建立新的討論標題
		Integer forumSeq  = service.createForumTitle(activeNo);
		//取得剛存好的討論標題ID，使用ID查詢詳細資料
		ForumBean forumBean = service.selectOneForum(forumSeq);
		//清空ID
		forumBean.setForumSeq(null);
		//這行可能不用加，記得儲存標題的時候就有做了，如果有就刪掉
		forumBean.setAuthor(forumBean.getMemberBean().getMemberNo().toString());
		//把標題資訊傳到新增頁面
		List<ForumBean> forumBeans = new ArrayList();
		forumBeans.add(forumBean);
		model.addAttribute("forumBean",forumBean);
		model.addAttribute("forumList", forumBeans);
		return "forum/forumNewArticle";
	}
	
	@PostMapping("/saveOrUpdateArticle")
	public String saveOrUpdateArticle( Model model,@ModelAttribute("form") ForumBean form,HttpSession session) {
		//抓取使用者帳號
		String id = (String) session.getAttribute("account");
		//用ID抓MEMBERBEAN ROLEBEAN
		MemberBean mb = memberService.getMember(id);
		RoleBean rb = memberService.getRole(id);
		//
		userBean ub = new userBean();
		ub.setAccount(id);
		ub.setNickname(mb.getNickname());
		ub.setLevel(rb.getLevel());
		ub.setEmp(rb.getEmp());
		ub.setPic(mb.getPicture());
		//service.createForumTitle(26);
		List<ForumBean> forumList = service.saveOrUpdateArticle(form);
		ForumBean forumBean = forumList.stream()
				.filter(f -> ForumType.TITLE.equals(f.getForumType())).findAny()
				.orElse(new ForumBean());
		List<ForumBean> forumDetailList = forumList.stream()
				.filter(f -> ForumType.DETAIL.equals(f.getForumType()))
				.collect(Collectors.toList());
		
		model.addAttribute("forumBean",forumBean);
		model.addAttribute("forumDetailList",forumDetailList);
		return "forum/forumDetail";
	}
	
	@GetMapping("/getForumPicture/{id}/{seq}")
	  public ResponseEntity<byte[]> getPicture(@PathVariable("id") int forumSeq,@PathVariable("seq") int seq) throws Exception{
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
	   ForumBean bean = service.selectOneForum(forumSeq);
	   if(bean != null) {
		   if(seq == 1) {
			   blob = bean.getPhoto();
		   }else {
			   blob = bean.getPhoto2();
		   }
		  
	   }
	   if(blob != null) {
		   is = blob.getBinaryStream();
		   mimeType = servletContext.getMimeType("Test.jpg");
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
//	    is = servletContext.getResourceAsStream("/images/noImage.jpg");
//	    mimeType = servletContext.getMimeType("noImage.jpg");
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