package com.web.activity.dao;

import com.web.activity.model.MemberBean;

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

//---------------------------------------------▼會員登入判斷▼---------------------------------------------//			
		public boolean checkID(String account, String password);
			//判斷帳號密碼正確與否
		public boolean checkType(String account);
					//作為方法,判斷帳號狀態
		public boolean checkManager(String account);
			//判斷是否為管理員帳號		
		
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
}
