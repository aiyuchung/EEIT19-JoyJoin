package com.web.activity.controller;

import java.io.IOException;
import java.text.SimpleDateFormat;
import java.util.Date;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.SessionAttributes;

import com.web.activity.model.MemberBean;
import com.web.activity.model.RoleBean;
import com.web.activity.service.MemberService;

@Controller
@SessionAttributes({"member"})
public class MemberController {

		@Autowired
		MemberService memberService;
		
//---------------------------------------------▼點擊個人頁面取得資料▼---------------------------------------------//	
		
		@GetMapping("/selectMember")
		public String getMemberBean2Select(HttpServletRequest request, Model model) {
			HttpSession session = request.getSession();
			String account = (String) session.getAttribute("id");
			MemberBean mb = memberService.getMember(account);
			model.addAttribute("member", mb);
			return "login/member";
		}
		
//---------------------------------------------▼會員註冊▼---------------------------------------------//	
		
//		@GetMapping("/insert")
//		public String getMemberBean2SignUp(Model model) {
//			MemberBean mb = new MemberBean();
//			model.addAttribute("memberBean", mb);
//			model.addAttribute(mb);
//			return "signup";
//		}
//		
//		@PostMapping(value="/insert")
//		public String sighUp(MemberBean mb) {
//			memberService.signUp(mb);
//			return "index";
//		}
//		
//---------------------------------------------▼會員資料更新▼---------------------------------------------//	
		
		@GetMapping("/update")
		public String getMemberBean2Update(Model model) {
			MemberBean mb = new MemberBean();
			model.addAttribute("memberBean", mb);
			model.addAttribute(mb);
			return "update";
		}
		
		@PostMapping("/update")
		public String update(MemberBean mb) {
			memberService.updateInfo(mb);
			return "redirect:/index";
		}
		
//---------------------------------------------▼跳轉頁面(暫)▼---------------------------------------------//			
		
		@GetMapping("/jumpTo")
		public String jumpToIndex() {
			return "redirect:/index";
		}
		
//---------------------------------------------▼會員帳號開通(暫)▼---------------------------------------------//	
		
		@GetMapping("/verification")
		public String verification(Model model) {
			RoleBean rb = new RoleBean();
			model.addAttribute("roleBean", rb);
			model.addAttribute(rb);
			return "verification";
		}
		
		@PostMapping("/verification")
		public String open(@RequestParam String account) {
			memberService.openType(account);
			return "redirect:/index";
		}
		
//---------------------------------------------▼會員登入帳號判斷▼---------------------------------------------//	
		
		@GetMapping("/login")
		public String login(Model model) {
			MemberBean mb = new MemberBean();
			model.addAttribute("memberBean", mb);
//			model.addAttribute(mb);
			return "login/login";
		}
		
		@PostMapping("/login")
		public String checkID(MemberBean mb, Model model) throws IOException {
			String nickname = mb.getNickname();	//如果只有帳密==>登入,有暱稱==>註冊
			if( nickname != null) {
				memberService.signUp(mb);		//====註冊====
				return "redirect:/index";
			}else {
				String account = mb.getAccount();		//====登入====
				String password = mb.getPassword();			
				boolean flag = memberService.checkID(account, password);
				int level = memberService.checkLevel(account);
				//用Dao判斷帳密正確與權限
				if( flag ) {
					model.addAttribute("level", level);	//權限存入session
					model.addAttribute("id", account);	//帳號存入session
					SimpleDateFormat sdf = new SimpleDateFormat("yyyy/mm/dd");
					String time = sdf.format(new Date());
					memberService.updateTime(account, time);
					return "redirect:/index";
				}else {
					model.addAttribute("status", "登入失敗");
					return "redirect:/login";
				}
			}
		}
		
//		public String getDate() {
//			
//			SimpleDateFormat sdf = new SimpleDateFormat("yyyy/mm/dd");
//			Date current = new Date();
//			return sdf.format(current);
//		}
		
		
		
		
//-----------------------------------------------------------------------
		
//		@RequestMapping()
//		public String processAddNewProductForm(@ModelAttribute("memberBean") MemberBean mb, BindingResult result) {
//			String[] suppressedFields = result.getSuppressedFields();
//			if (suppressedFields.length > 0) {
//				throw new RuntimeException("嘗試傳入不允許的欄位: " + StringUtils.arrayToCommaDelimitedString(suppressedFields));
//			}
//			if (mb.getStock() == null) {
//				mb.setStock(0);
//			}
//			MultipartFile productImage = bb.getProductImage();
//			String originalFilename = productImage.getOriginalFilename();
//			mb.setFileName(originalFilename);
//			// 建立Blob物件，交由 Hibernate 寫入資料庫
//			if (productImage != null && !productImage.isEmpty()) {
//				try {
//					byte[] b = productImage.getBytes();
//					Blob blob = new SerialBlob(b);
//					bb.setCoverImage(blob);
//				} catch (Exception e) {
//					e.printStackTrace();
//					throw new RuntimeException("檔案上傳發生異常: " + e.getMessage());
//				}
//			}
//			service.addProduct(bb);
//			String ext = originalFilename.substring(originalFilename.lastIndexOf("."));
//			String rootDirectory = context.getRealPath("/"); // 回傳真實路徑
//			try {
//				File imageFolder = new File(rootDirectory, "images");
//				if (!imageFolder.exists())
//					imageFolder.mkdirs();// 如果資料夾不存在,新增資料夾
//				File file = new File(imageFolder, bb.getBookId() + ext);
//				productImage.transferTo(file);
//			} catch (Exception e) {
//				e.printStackTrace();
//				throw new RuntimeException("檔案上傳發生異常: " + e.getMessage());
//			}
//			return "redirect:/products";
//		}
}
