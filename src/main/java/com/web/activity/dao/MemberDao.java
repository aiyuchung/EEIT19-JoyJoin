package com.web.activity.dao;

import com.web.activity.model.MemberBean;

public interface MemberDao {
				
		public void signUp(MemberBean mb);
			//註冊會員,快速註冊表單只需要Account, Password, Email, nickname
		public void createRole(String account);
			//獲得虛擬資料,資料固定
		public boolean checkID(String account, String password);
			//判斷帳號密碼正確與否
		public boolean checkType(String account);
					//作為方法,判斷帳號狀態
		public void updateInfo(MemberBean mb);
			//更新帳號資訊
		public void updateSign(String account);
			//直接更新登入次數
		public void updatePost(String account);
			//直接更新貼文次數
		public void updateFinish(String account);
			//直接更新成行次數
}
