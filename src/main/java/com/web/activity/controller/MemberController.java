package com.web.activity.controller;

import java.io.IOException;
import java.text.DateFormat;
import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.List;
import java.util.Properties;

import javax.mail.Message;
import javax.mail.MessagingException;
import javax.mail.Session;
import javax.mail.Transport;
import javax.mail.internet.InternetAddress;
import javax.mail.internet.MimeMessage;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.bind.annotation.SessionAttributes;
import org.springframework.web.bind.support.SessionStatus;

import com.web.activity.model.ActivityFollowedBean;
import com.web.activity.model.FormBean;
import com.web.activity.model.MemberBean;
import com.web.activity.model.MessageBean;
import com.web.activity.model.RoleBean;
import com.web.activity.service.ActivityService;
import com.web.activity.service.MemberService;

@Controller
@SessionAttributes( value = {"member", "role","level","account"} )
public class MemberController {

		@Autowired
		MemberService memberService;
		
		@Autowired
		ActivityService service;
		
//---------------------------------------------▼會員頁面&修改▼---------------------------------------------//	
		
		@GetMapping("/member")
		public String selectMemberInfo(HttpSession session ,Model model) {
			String account = (String) session.getAttribute("account");
			MemberBean mb = memberService.getMember(account);
			RoleBean rb = memberService.getRole(account);
			model.addAttribute("memberBean", mb);
			model.addAttribute("member", mb);
			model.addAttribute("role", rb);
			return "login/member";
		}
		
		@PostMapping("/member")
		public String updateInfo(MemberBean mb) {
			memberService.updateInfo(mb);
			return "redirect:/member";
		}
		
//---------------------------------------------▼會員註冊&登入▼---------------------------------------------//	
		
		@GetMapping("/login")
		public String login(Model model) {
			FormBean fb = new FormBean();
			model.addAttribute("formBean",fb);
			return "login/login";
		}
		
		
		@PostMapping("/login")
		public String checkID(FormBean fb, Model model) throws IOException {
			String nickname = fb.getNickname();	//如果只有帳密==>登入,有暱稱==>註冊
			String account = fb.getAccount();
			String password = fb.getPassword();
			String email = fb.getMail();
			String checkNo = fb.getCheckNo();
			if( account == "" || password == "") { //確認帳密要輸入
				model.addAttribute("errMsg", "請確實輸入資料");
				return "login/login";
			}
			
			if( nickname != null) {			//有暱稱===>註冊		
				boolean checkAccount = memberService.checkAccount(account);
				boolean checkEmail = memberService.checkEmail(email);
				if(checkAccount==true&&checkEmail==true) {
					MemberBean mb = setAccount(account, password, email, nickname);
					memberService.signUp(mb);		//====註冊====
					System.out.println("======================>"+"註冊成功");
					send2open(account, email);
					System.out.println("======================>"+"信件已發送");
					return "redirect:/index";					
				}else {			//帳號或信箱有重複
					if(!checkEmail) {
						model.addAttribute("errMsg", "此信箱已被註冊");
					}
					if(!checkAccount) {
						model.addAttribute("errMsg", "此帳號已被註冊");
					}
					return "login/login";
				}
			}else if(nickname==null&&checkNo!=null){			//沒暱稱,有驗證碼===>忘記密碼
				
				boolean flag = memberService.checkAccount(account);
				  if(flag) {
					  model.addAttribute("errMsg","此帳號沒有資料");
					  return "login/login";
				  }else {
					  String mail = memberService.getMail(account);
					  send2pwd(account, mail);
				  }			  
				  return "redirect:/login";
				  
			}else if(nickname==null&&checkNo==null){			//沒暱稱,沒驗證碼===>登入
		
				int flag = memberService.checkID(account, password);
	            int level = memberService.checkLevel(account);
				//用Dao判斷帳密正確與權限
				if( flag == 1 ) {
					String level123 = String.valueOf(level);
					model.addAttribute("level", level123);    //權限存入session
	                model.addAttribute("account", account);    //帳號存入session
	                DateFormat dateFormat = new SimpleDateFormat("yyyy-MM-dd");
	       		 	String time = dateFormat.format(new Date());
					memberService.updateTime(account, time);
					return "redirect:/index";
				}else {
					switch(flag) {
					case 2: model.addAttribute("errMsg", "此帳號沒有資料");break;
					case 3: model.addAttribute("errMsg", "密碼錯誤請重新輸入");break;
					case 4: model.addAttribute("errMsg", "此帳號尚未開通");break;
						default: model.addAttribute("errMsg", "登入失敗!!");break;
					}
					return "login/login";
				}	            
			}
			return "redirect:/login";
		}
		
		private MemberBean setAccount(String account, String password, String mail, String nickname) {
			MemberBean mb = new MemberBean();
			mb.setAccount(account);
			mb.setPassword(password);
			mb.setMail(mail);
			mb.setNickname(nickname);
			return mb;
		}
		
		
//---------------------------------------------▼會員登出▼---------------------------------------------//			
		
		  @RequestMapping("/out")
		  public String logOut (HttpSession session, SessionStatus sessionStatus) {
		   session.invalidate();
		   sessionStatus.setComplete();
		   return "redirect:/index";
		  }
		
//---------------------------------------------▼信箱驗證▼---------------------------------------------//			

		  
		  @GetMapping("/check")
		  public String openType( Model model, String account) {  			  
			memberService.openType(account);
			model.addAttribute("level", "1");    //權限存入session
            model.addAttribute("account", account);    //帳號存入session
			return	"redirect:/index";	
//要寄出		  http://localhost:8080/JoyJoin/check?account=A1234
		  }
		  
		  //做為方法寄信
		  public void send2open(String account, String mail) {
//			  String user = "eeit19joinjoy";
			  String pwd = "jkwwrqowszlonefv";		//寄件者信箱密碼
			  String to = mail;
			  String from = "eeit19joinjoy@gmail.com";
			  String host = "smtp.gmail.com";
			  String subject = "歡迎加入JoyJoin的大家庭";
			  String body = "http://localhost:8080/JoyJoin/check?account=" + account + "\r\n點選以開通帳號";
			  
			  Properties properties = System.getProperties();
				properties.put("mail.smtp.starttls.enable", "true");
				properties.put("mail.smtp.host", host);
				properties.put("mail.smtp.user", from);
				properties.put("mail.smtp.password", pwd);
				properties.put("mail.smtp.port", "25");
				properties.put("mail.smtp.auth", "true");
				properties.put("mail.mime.allowutf8", "true");
				properties.put("mail.smtp.ssl.trust", "smtp.gmail.com");

				Session session = Session.getDefaultInstance(properties);

				System.out.println("======================>"+"註冊信成功設定信件發送");
				try {
					MimeMessage message = new MimeMessage(session);
					message.setFrom(new InternetAddress(from));
					message.addRecipient(Message.RecipientType.TO, new InternetAddress(to));
					message.setSubject(subject);
					message.setText(body);
					
					Transport transport = session.getTransport("smtp");
					transport.connect(host, from, pwd);
					transport.sendMessage(message, message.getAllRecipients());
		            System.out.println("發送成功");	
					transport.close();
				} catch (MessagingException mex) {
					mex.printStackTrace();
				}  
		  }
		  
//---------------------------------------------▼忘記密碼▼---------------------------------------------//	
		  
		  @GetMapping("/getPwd")
		  public String newPwd(Model model) {
			  MemberBean mb = new MemberBean();
			  model.addAttribute("memberBean",mb);
			  return "login/newpwd";
		  }
		  
		  
		  @PostMapping("/getPwd")
		  public String getNewPwd(MemberBean mb, String account, String password) {
			  memberService.newPwd(account, password);
			  return "redirect:/login";
		  }

		  public void send2pwd(String account, String mail) {
//			  String user = "eeit19joinjoy";
			  String pwd = "jkwwrqowszlonefv";		//寄件者信箱密碼
			  String to = mail;
			  String from = "eeit19joinjoy@gmail.com";
			  String host = "smtp.gmail.com";
			  String subject = "JoyJoin找回遺失的密碼";
			  String body = "http://localhost:8080/JoyJoin/getPwd?account=" + account + "\r\n點選建立新密碼";
			  
			  Properties properties = System.getProperties();
				properties.put("mail.smtp.starttls.enable", "true");
				properties.put("mail.smtp.host", host);
				properties.put("mail.smtp.user", from);
				properties.put("mail.smtp.password", pwd);
				properties.put("mail.smtp.port", "25");
				properties.put("mail.smtp.auth", "true");
				properties.put("mail.mime.allowutf8", "true");
				properties.put("mail.smtp.ssl.trust", "smtp.gmail.com");

				Session session = Session.getDefaultInstance(properties);

				System.out.println("======================>"+"尋找密碼信成功設定信件發送");
				try {
					MimeMessage message = new MimeMessage(session);
					message.setFrom(new InternetAddress(from));
					message.addRecipient(Message.RecipientType.TO, new InternetAddress(to));
					message.setSubject(subject);
					message.setText(body);
					
					Transport transport = session.getTransport("smtp");
					transport.connect(host, from, pwd);
					transport.sendMessage(message, message.getAllRecipients());
		            System.out.println("發送成功");	
					transport.close();
				} catch (MessagingException mex) {
					mex.printStackTrace();
				}  
		  }

//---------------------------------------------▼配對系統▼---------------------------------------------//			
		  
			public String getPair(Model model, HttpSession session) {
				String pair = "";
				while(pair == "") {				
					int digit = (int) ((Math.random()*4)+1);
					switch(digit) {
					case 1:pair = "starSign";break;
					case 2:pair = "bloodType";break;
					case 3:pair = "school";break;
					case 4:pair = "hobby";break;
						default:pair = "all";break;
					}
				}
				String account = (String) session.getAttribute("account");
				List<MemberBean> mbl = memberService.getPair(pair, account);
				if(mbl!=null) {
					model.addAttribute("mblist",mbl);
				}else {
					getPair(model, session);
				}
				return "";
			}

		  
//---------------------------------------------▼取得活動連結▼---------------------------------------------//			
		@GetMapping("/ajax_getFollowed")
		public String getFollowedActivity(Model model, HttpSession session) {
			MemberBean mb = (MemberBean) session.getAttribute("member");
			Integer memberNo = mb.getMemberNo();
			
			List<ActivityFollowedBean> beans = memberService.getFollowedActivity(memberNo);
//			List<ActivityJoinedBean> joined = memberService.getJoinedActivity(memberNo);//取得此會員參加的活動名單
			
//			List <Integer> joinedActivities = new ArrayList<>();
//			for(ActivityJoinedBean ajb:joined) {
//				int joinedActivity = ajb.getActivityBean().getActivityNo();
//				joinedActivities.add(joinedActivity);
//			}
			
			model.addAttribute("followed",beans);
//			model.addAttribute("joinedActivities",joinedActivities);
			return "ajax/followedActivities";
		}		  
		  
		  
		  
		  
//---------------------------------------------▼訊息系統▼---------------------------------------------//		
		//GGGGGGG
		@GetMapping("/showAllMsg")
		public String getAllMsg(Model model, HttpSession session) {
			String account = (String) session.getAttribute("account");
			List<MessageBean> list = memberService.getAllMsg(account);
			model.addAttribute("msgList", list);
			return "login/ajax_msg";
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
