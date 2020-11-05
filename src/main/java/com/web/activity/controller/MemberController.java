package com.web.activity.controller;

import java.io.IOException;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestParam;

import com.web.activity.model.MemberBean;
import com.web.activity.model.RoleBean;
import com.web.activity.service.MemberService;

@Controller
public class MemberController {

		@Autowired
		MemberService memberService;
		
		
		
	
//-----------------------------------------------------------------------		
		
		@GetMapping("/insert")
		public String getMemberBean(Model model) {
			MemberBean mb = new MemberBean();
			model.addAttribute("memberBean", mb);
			model.addAttribute(mb);
			return "signup";
		}
		
		@PostMapping(value="/insert")
		public String sighUp(MemberBean mb) {
			memberService.signUp(mb);
			return "jump";
		}
		
//-----------------------------------------------------------------------		
		
		@GetMapping("/update")
		public String getMemberBean2(Model model) {
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
		
//-----------------------------------------------------------------------		
		
		@GetMapping("/jumpTo")
		public String jumpToIndex() {
			return "redirect:/index";
		}
		
//-----------------------------------------------------------------------		
		
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
		
//-----------------------------------------------------------------------	
		
		@GetMapping("/login")
		public String login(Model model) {
			return "login/login";
		}
		
		@PostMapping("/login")
		public String checkID(@RequestParam String account, @RequestParam String password, HttpServletRequest request) throws IOException {
			boolean flag = memberService.checkID(account, password);
			boolean isMama = memberService.checkManager(account);
			//用Dao判斷帳密正確與權限
			if( flag ) {
				if( isMama ) {
					request.setAttribute("level", 4);
				}else {
					request.setAttribute("level", 1);
				}
				return "redirect:/index";
			}else {
				return "redirect:/login/login";
			}
		}
		

			
		
		
		
		
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