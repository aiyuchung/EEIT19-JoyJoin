package com.web.activity.service;

import java.util.List;

import com.web.activity.model.ActivityFollowedBean;
import com.web.activity.model.ActivityJoinedBean;
import com.web.activity.model.MemberBean;
import com.web.activity.model.MessageBean;
import com.web.activity.model.OrderBean;
import com.web.activity.model.RoleBean;

public interface MemberService {
		
		public void signUp(MemberBean mb);
			//註冊會員,同時獲得虛擬資料
		public MemberBean getMember(String account);
			//抓取單一會員資料
		public RoleBean getRole(String account);
			//抓取角色資料
		public String getMail(String account);
			//取得信箱地址
		public void newPwd(String account, String password);
			//更改密碼
		public Integer checkID(String account, String password);
			//判斷帳密,同時判斷帳號狀態
		public Integer checkLevel(String account);
        	//判斷帳號權限    
		public void updateInfo(MemberBean mb);
			//更新個人資料
		 public boolean checkAccount(String account);
     		//判斷帳號重複
		 public boolean checkEmail(String email);
     		//判斷信箱重複
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
		public List<MemberBean> getPair(String pair, String account);
			//取得配對成員
		public List<ActivityFollowedBean> getFollowedActivity(Integer memberNo);
			//取得會員關注活動連結
		public List<ActivityJoinedBean> getJoinedActivity(Integer memberNo);
			//取得會員關注活動連結
		public List<MessageBean> getAllMsg(String account);
			//取得全部對話訊息
		public MessageBean getMsg(int msgNo);
			//取得單一筆訊息
		public void sendMsg(MessageBean mb);
			//送出訊息
		public OrderBean createOrder(Integer memberNo, OrderBean order);
			//存訂單 並取出
		
}	
