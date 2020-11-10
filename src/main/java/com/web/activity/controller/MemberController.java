package com.web.activity.controller;

import java.io.IOException;
import java.text.SimpleDateFormat;
import java.util.Date;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.SessionAttributes;

import com.web.activity.model.MemberBean;
import com.web.activity.model.RoleBean;
import com.web.activity.service.MemberService;

@Controller
@SessionAttributes( value = {"member", "role","level","account"} )
public class MemberController {

		@Autowired
		MemberService memberService;
		
//---------------------------------------------▼會員頁面&修改▼---------------------------------------------//	
		
		@GetMapping("/member")
		public String selectMemberInfo(HttpSession session ,Model model) {
			String account = (String) session.getAttribute("account");
			MemberBean mb = memberService.getMember(account);
			RoleBean rb = memberService.getRole(account);
			model.addAttribute("member", mb);
			model.addAttribute("role", rb);
			return "login/member";
		}
		
		@PostMapping("/member")
		public String updateMemberInfo(@ModelAttribute MemberBean mb) {
			memberService.updateInfo(mb);
			return "redirect:/login/member";
		}
//---------------------------------------------▼會員註冊&登入▼---------------------------------------------//	
		
		@GetMapping("/login")
		public String login(Model model) {
			MemberBean mb = new MemberBean();
			model.addAttribute("memberBean", mb);
			return "login/login";
		}
		
		
		@PostMapping("/login")
		public String checkID(MemberBean mb, Model model) throws IOException {
			String nickname = mb.getNickname();	//如果只有帳密==>登入,有暱稱==>註冊
			String account = mb.getAccount();
			String password = mb.getPassword();
			if( nickname != null) {
				memberService.signUp(mb);		//====註冊====
				return "redirect:/index";
			}else {
				int flag = memberService.checkID(account, password);
	            int level = memberService.checkLevel(account);
				//用Dao判斷帳密正確與權限
				if( flag == 1 ) {
					String level123 = String.valueOf(level);
					System.out.println("level=" + level123);
					model.addAttribute("level", level123);    //權限存入session
	                model.addAttribute("account", account);    //帳號存入session
	    			SimpleDateFormat sdf = new SimpleDateFormat("yyyy/mm/dd");
	    			String time = sdf.format(new Date());
					memberService.updateTime(account, time);
					model.addAttribute("msg", "登入成功!!");
					System.out.println("==================>"+level);
					return "redirect:/index";
				}else {
					switch(flag) {
					case 2: model.addAttribute("msg", "此帳號沒有資料。");break;
					case 3: model.addAttribute("msg", "密碼錯誤,請重新輸入。!!");break;
					case 4: model.addAttribute("msg", "此帳號尚未開通。");break;
						default: model.addAttribute("msg", "登入失敗!!");break;
					}
					return "login/login";
				}	            
			}
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
//}
