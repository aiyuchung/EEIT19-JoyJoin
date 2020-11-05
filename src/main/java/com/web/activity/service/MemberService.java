package com.web.activity.service;

import com.web.activity.model.MemberBean;

public interface MemberService {
		
		public void signUp(MemberBean mb);
			//註冊會員,同時獲得虛擬資料
		public boolean checkID(String account, String password);
			//判斷帳密,同時判斷帳號狀態
		public boolean checkManager(String account);
			//判斷是否為管理員帳號
		public void updateInfo(MemberBean mb);
			//更新個人資料
		public void openType(String account);
			//開通帳號
		public void updateSign(String account);
			//更新登入次數
		public void updatePost(String account);
			//更新貼文次數
		public void updateFinish(String account);
			//更新成行次數
}	
