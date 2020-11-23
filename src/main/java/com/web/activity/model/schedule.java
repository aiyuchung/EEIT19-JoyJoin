package com.web.activity.model;

import java.text.DateFormat;
import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.List;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.scheduling.annotation.Scheduled;
import org.springframework.stereotype.Component;
import org.springframework.web.bind.annotation.SessionAttributes;

import com.web.activity.dao.ActivityDao;
import com.web.activity.service.MemberService;

@Component
@SessionAttributes({"level", "id","member","account"})
public class schedule{
	
	@Autowired
	ActivityDao dao;
	 
	@Autowired
	MemberService memberService;
	
	/**
	 * 每天凌晨执行一次
	 */
	@Scheduled(cron = "0 0 0 * * ?")
	public void scheduledTask(HttpSession session){
		String account = (String) session.getAttribute("account");
		List<ActivityBean> lastDay = dao.getLastDay();
		List<ActivityBean> ok = dao.getOkOnes();
		List<ActivityBean> inactive = dao.getInactiveOnes();
		
		if (lastDay.size() > 0) {
			for (ActivityBean ab: lastDay) {
				if(ab.getMemberBean().getAccount().equals(account)) {
					MessageBean mb = new MessageBean();
					mb.setfromAccount("揪in Server");
					mb.setAccount(ab.getMemberBean().getAccount());
					DateFormat dateFormat = new SimpleDateFormat("yyyy-MM-dd");
					 	String time = dateFormat.format(new Date());
					 	mb.setTime(time);
					 	mb.setReadStatus(0);
					 	mb.setSubject("系統訊息: 最後截止日提醒");
					 	mb.setMsg(ab.getMemberBean().getNickname()+"，你舉辦的活動 <"+ab.getName()+"> 今天截止，請注意參加人數是否達標~");
					 	memberService.sendMsg(mb);
				}
			}
		
		}else if (ok.size() > 0) {
			for (ActivityBean ab: ok) {
				if(ab.getMemberBean().getAccount().equals(account)) {
					MessageBean mb = new MessageBean();
					mb.setfromAccount("揪in Server");
					mb.setAccount(ab.getMemberBean().getAccount());
					DateFormat dateFormat = new SimpleDateFormat("yyyy-MM-dd");
					 	String time = dateFormat.format(new Date());
					 	mb.setTime(time);
					 	mb.setReadStatus(0);
					 	mb.setSubject("系統訊息: 活動人數達標通知");
				 	mb.setMsg(ab.getMemberBean().getNickname()+"，恭喜你舉辦的活動 <"+ab.getName()+"> 人數達標，可以在活動前幾天提醒大家喔~");
					 	memberService.sendMsg(mb);
				}else {
					List<ActivityJoinedBean> joined = dao.joinedMember(ab.getActivityNo());
					for (ActivityJoinedBean ajb:joined) {
						MessageBean mb = new MessageBean();
						mb.setfromAccount("揪in Server");
						mb.setAccount(ajb.getMemberBean().getAccount());
						DateFormat dateFormat = new SimpleDateFormat("yyyy-MM-dd");
						 	String time = dateFormat.format(new Date());
						 	mb.setTime(time);
						 	mb.setReadStatus(0);
						 	mb.setSubject("系統訊息: 活動準時舉辦通知");
					 	mb.setMsg(ab.getMemberBean().getNickname()+"，你參加的活動 <"+ab.getName()+"> 將會準時舉辦，別忘了喔~");
						 	memberService.sendMsg(mb);
					}
				}
				
			}
			
		}else if(inactive.size() > 0) {
			for (ActivityBean ab: inactive) {
				if(ab.getMemberBean().getAccount().equals(account)) {
					MessageBean mb = new MessageBean();
					mb.setfromAccount("揪in Server");
					mb.setAccount(ab.getMemberBean().getAccount());
					DateFormat dateFormat = new SimpleDateFormat("yyyy-MM-dd");
					 	String time = dateFormat.format(new Date());
					 	mb.setTime(time);
					 	mb.setReadStatus(0);
					 	mb.setSubject("系統訊息: 活動下架通知");
				 	mb.setMsg(ab.getMemberBean().getNickname()+"，很遺憾你舉辦的活動 <"+ab.getName()+"> 人數未達標，系統將會自動下架本活動");
					 	memberService.sendMsg(mb);
				}else {
					List<ActivityJoinedBean> joined = dao.joinedMember(ab.getActivityNo());
					for (ActivityJoinedBean ajb:joined) {
						MessageBean mb = new MessageBean();
						mb.setfromAccount("揪in Server");
						mb.setAccount(ajb.getMemberBean().getAccount());
						DateFormat dateFormat = new SimpleDateFormat("yyyy-MM-dd");
						 	String time = dateFormat.format(new Date());
						 	mb.setTime(time);
						 	mb.setReadStatus(0);
						 	mb.setSubject("系統訊息: 活動下架通知");
					 	mb.setMsg(ab.getMemberBean().getNickname()+"，很遺憾你參加的活動 <"+ab.getName()+"> 人數未達標，系統將會自動下架本活動");
						 	memberService.sendMsg(mb);
					}
				}
				
			}
			
		}
	}

	
	

	
	
}
