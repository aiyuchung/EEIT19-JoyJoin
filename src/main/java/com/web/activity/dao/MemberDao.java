package com.web.activity.dao;

import java.util.List;

import com.web.activity.model.ActivityFollowedBean;
import com.web.activity.model.ActivityJoinedBean;
import com.web.activity.model.FriendBean;
import com.web.activity.model.MemberBean;
import com.web.activity.model.MessageBean;
import com.web.activity.model.OrderBean;
import com.web.activity.model.RoleBean;

public interface MemberDao {
	
//---------------------------------------------▼會員資料CRUD▼---------------------------------------------//		
	
		public void signUp(MemberBean mb);
			//註冊會員,快速註冊表單只需要Account, Password, Email, nickname
		public void createRole(String account);
					//獲得虛擬資料,資料固定
		public void sentMail(String email);
			//送出驗證信
		public void updateInfo(MemberBean mb);
			//更新帳號資訊
		public MemberBean getMember(String account);
			//抓取個人資料
		public RoleBean getRole(String account);
			//抓取角色
		public String getMail(String account);
			//取得信箱位置===>忘記密碼第二步
		public void newPwd(String account, String password);
			//更改密碼===>忘記密碼最後一步
		
//---------------------------------------------▼角色屬性判斷更改▼---------------------------------------------//	
		
		public void checkEmp2Level(String account);
			//判斷經驗,更改等級
		public void login2Emp(String account) ;
		//比對登入時間,第一次登入增加經驗

//---------------------------------------------▼會員登入判斷▼---------------------------------------------//		
		
		public Integer checkID(String account, String password);
			//判斷帳號密碼正確與否
		public boolean checkType(String account);
					//作為方法,判斷帳號狀態
        public Integer checkLevel(String account);
        	//判斷帳號權限 
        public boolean checkAccount(String account);
        	//判斷帳號重複
        public boolean checkEmail(String email);
        	//判斷信箱重複
		
//---------------------------------------------▼自增值方法▼---------------------------------------------//			
        
		public void openType(String account);
			//開通帳號
		public void updateTime(String account, String time);
			//更新最後上線時間
		public void updateSign(String account);
			//直接更新登入次數
		public void updatePost(String account);
			//直接更新貼文次數
		public void updateFinish(String account);
			//直接更新成行次數
		
//---------------------------------------------▼配對系統▼---------------------------------------------//			

		public List<MemberBean> getPair(String pair,String account);

		
		
//---------------------------------------------▼其他▼---------------------------------------------//			
		
		public List<ActivityFollowedBean> getFollowedActivity(Integer memberNo);
			//取得會員關注活動連結
		public List<ActivityJoinedBean> getJoinedActivity(Integer memberNo);
			//取得會員關注活動連結
		public OrderBean createOrder(Integer memberNo, OrderBean order);
        	//存訂單 並取出	
		public List<OrderBean> orderRecords(Integer memberNo);
    		//取訂單紀錄
//---------------------------------------------▼訊息系統▼---------------------------------------------//			
		
		public List<MessageBean> getAllMsg(String account);
			//獲得收件人為此帳號的所有訊息,以時間為判斷降冪排列,以閱讀狀態為判斷GROUP BY
		public boolean checkStatus(String account);
			//確認有無未讀信件
		public MessageBean getMsg(int msgNo);
			//獲得單筆訊息
		public void sendMsg(MessageBean mb);
			//寄出訊息
		public void readMsg(int msgNo);
			//讀取訊息
		public void delMsg(int msgNo);
			//刪除訊息
		
//---------------------------------------------▼黑名單判斷▼---------------------------------------------//		

		public Integer checkType2Back(String account);
			//回傳帳號狀態 0為未開通 1為正常 2為黑名單
		public void changeType2Back(String account, int type);
			//後臺改變帳號狀態
				
//---------------------------------------------▼好友功能▼---------------------------------------------//		
		
		public List<String> getFriendListOne(String account);
					
		public List<String> getFriendListTwo(String account);
			//抓取所有好友清單在SERVICE加起來丟回CONTROLLER
		public boolean checkFriend(String host, String account);
			//確認是否為好友或申請中
		public void saveFriend(FriendBean fb);
			//提出好友申請
		public void delFriend(String host, String account);
			//刪除好友
		public void updateStatus(String host, String account);
			//同意好友更改狀態
		public String checkFriendType(String host, String account);
			//檢查交友狀態
		
				
		
		
		
}
