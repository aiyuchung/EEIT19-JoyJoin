package com.web.activity.controller;

import java.io.ByteArrayOutputStream;
import java.io.IOException;
import java.io.InputStream;
import java.sql.Blob;
import java.sql.SQLException;
import java.text.DateFormat;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Date;
import java.util.List;
import java.util.Properties;

import javax.mail.Message;
import javax.mail.MessagingException;
import javax.mail.Session;
import javax.mail.Transport;
import javax.mail.internet.InternetAddress;
import javax.mail.internet.MimeMessage;
import javax.servlet.ServletContext;
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
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.bind.annotation.SessionAttributes;
import org.springframework.web.bind.support.SessionStatus;
import org.springframework.web.multipart.MultipartFile;

import com.web.activity.model.ActivityFollowedBean;
import com.web.activity.model.FormBean;
import com.web.activity.model.ForumBean;
import com.web.activity.model.FriendBean;
import com.web.activity.model.MemberBean;
import com.web.activity.model.MessageBean;
import com.web.activity.model.OrderBean;
import com.web.activity.model.RoleBean;
import com.web.activity.service.ActivityService;
import com.web.activity.service.MemberService;

@Controller
@SessionAttributes( value = {"member", "role","level","account","friend"} )
public class MemberController {

		@Autowired
		MemberService memberService;
		
		@Autowired
		ActivityService service;

		@Autowired
		ServletContext servletContext;
		
		
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
        public String updateInfo(@ModelAttribute("memberBean") MemberBean mb  ,HttpSession httpsession) {
            
            MultipartFile mFile = mb.getUpdateImg();
            String original = mFile.getOriginalFilename();
            mb.setFileName(original);
            if (mFile != null && !mFile.isEmpty()) {
                byte[] b;
				try {
					b = mFile.getBytes();
					Blob blob = new SerialBlob(b);
					mb.setPicture(blob);
				} catch (IOException | SQLException e) {
					e.printStackTrace();
					throw new RuntimeException("異常:" + e.getMessage());
				}
			}
            mb.setAccount((String)httpsession.getAttribute("account"));
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
					send2mailBox(account);
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
					case 3: model.addAttribute("errMsg", "密碼輸入錯誤!!");break;
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
		  
		  public void send2mailBox(String account) {
			  MessageBean mb = new MessageBean();
			  mb.setAccount(account);
			  mb.setfromAccount("揪in Server");
			  DateFormat dateFormat = new SimpleDateFormat("yyyy-MM-dd");
	   		  String time = dateFormat.format(new Date());
	   		  mb.setTime(time);
	   		  mb.setReadStatus(0);
	   		  mb.setSubject("系統訊息");
	   		  mb.setMsg("您已經成功開通帳號,\r\n歡迎加入揪in!!");
	   		  memberService.sendMsg(mb);
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
		  
		  @GetMapping("/getPair")	
		  public String getPair(Model model, HttpSession session) {
				String account = (String) session.getAttribute("account");
				System.out.println("START OK=======>");
				List<MemberBean> mbl = memberService.getPair(account);
				System.out.println("GET LIST OK=======>"+mbl);
				int max = mbl.size();
				MemberBean luckyguy = null;
				do {
					int posi = (int) (Math.random()*(max-0.1));
					System.out.println("POSITION=======>"+posi);
					luckyguy = mbl.get(posi);
					System.out.println("GET ONE GUY=======>"+luckyguy);
				}while(luckyguy.getAccount()==account);
				System.out.println("======抓成功了======");
				double dou = memberService.getPersonalScore(account);
				System.out.println(dou+"----------");
				String score = "評價"+String.valueOf(dou)+"分";
//				model.addAttribute("score",score);
				model.addAttribute("luckyguy", luckyguy);
				return "login/ajax_membercard";
			}

//		  private List<MemberBean> getList(String account){			
//			  List<MemberBean> list = new ArrayList<>();
//			  do {
//				  String pair = "";
//			  			while(pair == "") {				
//			  				int digit = (int) ((Math.random()*4.9)+1);
//			  				switch(digit) {
//			  				case 1:pair = "starSign";break;
//			  				case 2:pair = "bloodType";break;
//			  				case 3:pair = "school";break;
//			  				case 4:pair = "hobby";break;
//			  				default:pair = "all";break;
//			  				}
//						list = memberService.getPair(pair, account);	
//					}						
//			  	}while(list==null);
//			  System.out.println("FINISH LIST=======>"+list);
//			  return list;
//		  }
		  
		  
		  
		  
//---------------------------------------------▼取得活動連結▼---------------------------------------------//			
		
		  @GetMapping("/ajax_getFollowed")
		public String getFollowedActivity(Model model, HttpSession session) {
			MemberBean mb = (MemberBean) session.getAttribute("member");
			Integer memberNo = mb.getMemberNo();
			
			List<ActivityFollowedBean> beans = memberService.getFollowedActivity(memberNo);
//			List<ActivityJoinedBean> joined = memberService.getJoinedActivity(memberNo);//取得此會員參加的活動名單
//			List <Integer> joinedActivities = new ArrayList<>();
			for(ActivityFollowedBean afb:beans) {
				String statusa = afb.getCondition();
				System.out.println("urlnO: "+ afb.getUrlNo());
				if (statusa.equalsIgnoreCase("舉辦") ) {
//					
					Date date = afb.getActivityBean().getActivityDate();
					Date today = new Date();
					SimpleDateFormat dateFormat = new SimpleDateFormat("yyyy-MM-dd");
					String sttoday = dateFormat.format(today);
					String stdate = dateFormat.format(date);
//					System.out.println(date+"  --date");
//					System.out.println(today+"  --today");
					if (sttoday.equals(stdate)) {
						System.out.println("staus will change");
						afb.setCondition("可發討論");
					}
				}
			}
			List<ForumBean> forums = service.issuedForums(memberNo);  //舉辦人的id
			List<String> codes = new ArrayList<>();
			for (ForumBean fb:forums) {
				codes.add(fb.getActivityCode());
			}
			List<String> numbers = service.selectAllForums();  //全部討論版
			model.addAttribute("followed",beans);
			model.addAttribute("forums",codes);
			model.addAttribute("numbers",numbers);
			return "ajax/followedActivities";
		}		  
		  
//---------------------------------------------▼購買點數畫面▼---------------------------------------------//            
		
		@GetMapping("/ajax_shop")
		public String shop(Model model, HttpSession session) {
		    return "ajax/order";
		}		  
//---------------------------------------------▼購買紀錄畫面▼---------------------------------------------//            

		@GetMapping("/ajax_orders")
		public String orderRecord(Model model, HttpSession session) {
			String account =  (String) session.getAttribute("account");
			MemberBean member = memberService.getMember(account);
			Integer memberNo = member.getMemberNo();
			List<OrderBean> orders = memberService.orderRecords(memberNo);
			model.addAttribute("orders",orders);
		    return "ajax/orderRecords";
		}	  
//---------------------------------------------▼訊息系統▼---------------------------------------------//		

		@GetMapping("/mailMsg")
		public String gotoMailBox(Model model, HttpSession session) {
			String account = (String) session.getAttribute("account");
			MessageBean mb = new MessageBean();
			List<MessageBean> list = memberService.getAllMsg(account);
			model.addAttribute("msgBean",mb);
			model.addAttribute("msgList", list);
			return "login/mailbox";
		}
		
		@PostMapping("/mailMsg")
		public String sendMail(@ModelAttribute("msgBean") MessageBean mb, Model model,HttpSession session) {
			String fromId = (String) session.getAttribute("account");
			DateFormat dateFormat = new SimpleDateFormat("yyyy-MM-dd,hh:mm:ss");
   		 	String time = dateFormat.format(new Date());//抓時間
			mb.setfromAccount(fromId);
			mb.setTime(time);
			mb.setReadStatus(0);
			memberService.sendMsg(mb);
			System.out.println("OK=============>");
			return "redirect:/mailMsg";
		}
//		
//		@GetMapping("/showMsg")
//		public @ResponseBody MessageBean getMsg(Model model, int msgNo) {
//			MessageBean mb = memberService.getMsg(msgNo);
//			model.addAttribute("msgOne", mb);
//			return mb;
//		}
		
		@GetMapping("/checkStatus")
		public @ResponseBody String checkReadStatus(Model model, HttpSession session) {
			String account = (String) session.getAttribute("account");
			boolean flag = memberService.checkStatus(account);
			if(flag) {
				return "yes";
			}else {
				return "no";
			}
		}
		
		@GetMapping("/changeStatus")
		public String changeStatus(int msgNo, Model model,  HttpSession session) {
			memberService.readMsg(msgNo);
			String account = (String) session.getAttribute("account");
			MessageBean mb = new MessageBean();
			List<MessageBean> list = memberService.getAllMsg(account);
			model.addAttribute("msgBean",mb);
			model.addAttribute("msgList", list);
			return "login/ajax_msg";
		}
		
		@GetMapping("/delMsg/{msgNo}")
		public String deleteMsg(@PathVariable int msgNo) {
			memberService.delMsg(msgNo);
			return "redirect:/mailMsg";
		}
		
//---------------------------------------------▼名片▼---------------------------------------------//
		
		@GetMapping("/detailCard/{account}")
		public String getOne(Model model, @PathVariable String account) {
			System.out.println("------------enter controller");
			MemberBean mb = memberService.getMember(account);
			model.addAttribute("mbcard", mb);
			System.out.println(mb.getAccount());
			return "login/ajax_membercard2";
		}
		

//---------------------------------------------▼前端讀圖片▼---------------------------------------------//
		@GetMapping("/getMemberPicture/{account}")
        public ResponseEntity<byte[]> getPicture(
                @PathVariable String account,
                HttpSession session) throws Exception{
         InputStream is = null;
         String mimeType = null;
         Blob blob=null;
//         String account = (String) session.getAttribute("account");
//         String sessionccount = (String) session.getAttribute("account");
//         account = sessionccount;
         MemberBean bean = memberService.getMember(account);
         if(bean != null) {
             blob = bean.getPicture();
	       }
	       if(blob != null) {
	             is = blob.getBinaryStream();
	             mimeType = servletContext.getMimeType(bean.getFileName());
	       }
	       ResponseEntity<byte[]> re = null;
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
			

      //---------------------------------------------▼好友系統▼---------------------------------------------//		

        	@GetMapping("/getAllFriend")
      		public String getFriendList(Model model, HttpSession session) {		//做為方法讀取至MEMBER
      			String account = (String) session.getAttribute("account");
      			List<String> list = memberService.getAllFriendList(account);
      			model.addAttribute("friend", list);
      			return "login/ajax_memberlist";
      		}
      		
      		@PostMapping("/getFriend/{account}")
      		public String newFriend(HttpSession session, @PathVariable String account) {		//host為出發點,申請好友並寄出系統訊息
      			String host = (String) session.getAttribute("account");
      			boolean flag = memberService.checkFriend(host, account);
      			FriendBean fb = new FriendBean();
      			fb.setAccountOne(host);
      			fb.setAccountTwo(account);
      			fb.setOneType(1);
      			fb.setTwoType(0);
      			fb.setStatus(0);
      			if(flag){		//SAVE好友
      				memberService.saveFriend(fb);
      				sendServerMsg2friend(host, account);
      			}else {
      				sendServerMsgNoCatch(host, account);
      			}
      			return "redirect:/mailMsg";
      		}
      		
      		//刪除好友,傳入host和對象Account帳號
      		@PostMapping("/delFriend/{account}")
      		public String deleteFriend(HttpSession session, @PathVariable String account) {		
      			String host = (String) session.getAttribute("account");
      			boolean flag = memberService.checkFriend(host, account);
      			if(flag) {
      				memberService.delFriend(host, account);
      			}else {
      				;
      			}
      			return "redirect:/member";
      		}
      		
      		//查詢對象狀態,確認交友狀態並顯示ajax
      		@GetMapping("/showFriendType/{account}")
      		public String showFriendType(Model model, HttpSession session, @PathVariable String account) {
      			String host = (String) session.getAttribute("account");
      			String str = memberService.checkFriendType(host, account);
      			model.addAttribute("btn",str);
      			return "ajax...";
      			
      		}
      		
      		//設計空白jsp做為同意好友跳板
      		@GetMapping("/ansFriend/agree")
      		public String friendAgree(HttpSession session, String account) {
      			//path?host=host&account=
      			String host = (String) session.getAttribute("account");
      			memberService.updateStatus(host, account);
      			return "redirect:/member";
      		}
      		
      		//設計空白jsp做為拒絕好友跳板,刪除db
      		@GetMapping("/ansFriend/no")
      		public String friendNope(HttpSession session, String account) {
      			//path?host=host&account=
      			String host = (String) session.getAttribute("account");
      			memberService.delFriend(host, account);
      			return "redirect:/member";
      		}
      		
      		public void sendServerMsg2friend(String host, String account) {		//加好友送出系統站內訊息
      			MessageBean mb = new MessageBean();
      			mb.setfromAccount("揪in Server");
      			mb.setAccount(account);
      			DateFormat dateFormat = new SimpleDateFormat("yyyy-MM-dd");
         		 	String time = dateFormat.format(new Date());
         		 	mb.setTime(time);
         		 	mb.setReadStatus(0);
         		 	mb.setSubject("系統訊息:您有一則好友申請");
         		 	mb.setMsg(host+"加你好友 \r\n 同意:http://localhost:8080/JoyJoin/ansFriend/agree \r\n 拒絕:http://localhost:8080/JoyJoin/ansFriend/no");
         		 	memberService.sendMsg(mb);
      		}

      		public void sendServerMsgNoCatch(String host, String account) {		//加好友失敗送出系統站內訊息
      			MessageBean mb = new MessageBean();
      			mb.setfromAccount("揪in Server");
      			mb.setAccount(account);
      			DateFormat dateFormat = new SimpleDateFormat("yyyy-MM-dd");
         		 	String time = dateFormat.format(new Date());
         		 	mb.setTime(time);
         		 	mb.setReadStatus(0);
         		 	mb.setSubject("系統訊息");
         		 	mb.setMsg(host+"與您已經是好友或正在申請中");
         		 	memberService.sendMsg(mb);
      		}      		
      		
      		//名片傳訊息
      		@PostMapping("talk2u/{account}")
      		public void sendMsgagain(HttpSession session, @PathVariable String account) {
      			String fromAccount = (String) session.getAttribute("account");
      			MessageBean mb = new MessageBean();
      			mb.setfromAccount(fromAccount);
      			mb.setAccount(account);
      			DateFormat dateFormat = new SimpleDateFormat("yyyy-MM-dd");
         		 	String time = dateFormat.format(new Date());
         		 	mb.setTime(time);
         		 	mb.setReadStatus(0);
         		 	mb.setSubject("系統訊息");
         		 	mb.setMsg("與您已經是好友或正在申請中");
         		 	memberService.sendMsg(mb);
      		}
      		
//      		--------------
      		
      		@GetMapping("/notice/{account}")
      		public void send2notice(@PathVariable String account, HttpSession session) {
      			System.out.println("有進來,account===>"+account);
      			String fromAccount = (String) session.getAttribute("account");
      			MessageBean mb = new MessageBean();
      			mb.setfromAccount(fromAccount);
      			mb.setAccount(account);
      			DateFormat dateFormat = new SimpleDateFormat("yyyy-MM-dd");
         		 	String time = dateFormat.format(new Date());
         		 	mb.setTime(time);
         		 	mb.setReadStatus(0);
         		 	mb.setSubject("系統訊息:您獲得一則關注");
         		 	mb.setMsg(fromAccount+"正在關注您 \r\n點選下面連結以關注對方 \r\n http://localhost:8080/JoyJoin/notice/"+fromAccount);
         		 	memberService.sendMsg(mb);
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
