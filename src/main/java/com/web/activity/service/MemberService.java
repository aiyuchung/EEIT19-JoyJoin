package com.web.activity.service;

import com.web.activity.model.MemberBean;

public interface MemberService {
		
		public void signUp(MemberBean mb);
			//註冊會員,同時獲得虛擬資料
		public MemberBean getMember(String account);
			//抓取單一會員資料
		public boolean checkID(String account, String password);
			//判斷帳密,同時判斷帳號狀態
		public Integer checkLevel(String account);
			//回傳帳號權限等級
		public void updateInfo(MemberBean mb);
			//更新個人資料
		public void openType(String account);
			//開通帳號
		public void updateTime(String account, String time);
			//更新最後上線時間
		public void updateSign(String account);
			//更新登入次數
		public void updatePost(String account);
			//更新貼文次數
		public void updateFinish(String account);
			//更新成行次數
}	
