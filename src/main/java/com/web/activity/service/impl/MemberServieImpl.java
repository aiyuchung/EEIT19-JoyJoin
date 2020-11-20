package com.web.activity.service.impl;

import java.util.List;

import javax.transaction.Transactional;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.web.activity.dao.MemberDao;
import com.web.activity.model.ActivityFollowedBean;
import com.web.activity.model.ActivityJoinedBean;
import com.web.activity.model.FriendBean;
import com.web.activity.model.MemberBean;
import com.web.activity.model.MessageBean;
import com.web.activity.model.OrderBean;
import com.web.activity.model.RoleBean;
import com.web.activity.service.MemberService;

@Service
public class MemberServieImpl implements MemberService {

		@Autowired
		MemberDao memberDao;
		
		@Transactional
		@Override
		public void signUp(MemberBean mb) {
			memberDao.signUp(mb);
			memberDao.sentMail(mb.getMail());
		}
		
		@Transactional
		@Override
		public MemberBean getMember(String account) {
			return memberDao.getMember(account);
		}
		
		@Transactional
		@Override
		public RoleBean getRole(String account) {
			return memberDao.getRole(account);
		}
		
		@Transactional
		@Override
		public String getMail(String account) {
			return memberDao.getMail(account);
		}		
		
		@Transactional
		@Override
		public void newPwd(String account, String password) {
			memberDao.newPwd(account, password);
		}
		
		@Transactional
		@Override
		public Integer checkID(String account, String password) {
			return memberDao.checkID(account, password);
		}
		
		@Transactional
		@Override
        public Integer checkLevel(String account) {
            return memberDao.checkLevel(account);
		}

		@Transactional
		@Override
		public void updateInfo(MemberBean mb) {
			memberDao.updateInfo(mb);
		}
		
		@Transactional
		@Override
		 public boolean checkAccount(String account) {
			 return memberDao.checkAccount(account);
		 }

		 @Transactional
		 @Override
    	public boolean checkEmail(String email) {
    		return memberDao.checkEmail(email);
    	}

		@Transactional
		@Override
		public void openType(String account) {
			memberDao.openType(account);
		}

		@Transactional
		@Override
		public void updateTime(String account, String time) {
			memberDao.updateTime(account, time);
		}
		
		@Transactional
		@Override
		public void updateSign(String account) {
			memberDao.updateSign(account);
		}
		
		@Transactional
		@Override
		public void updatePost(String account) {
			memberDao.updatePost(account);
		}

		@Transactional
		@Override
		public void updateFinish(String account) {
			memberDao.updateFinish(account);			
		}

		@Transactional
		@Override
		public List<MemberBean> getPair(String pair, String account) {
			return memberDao.getPair(pair, account);
		}
		
		@Transactional
		@Override
		public List<ActivityFollowedBean> getFollowedActivity(Integer memberNo) {
			return memberDao.getFollowedActivity(memberNo);
		}

		@Transactional
		@Override
		public List<ActivityJoinedBean> getJoinedActivity(Integer memberNo) {
			return memberDao.getJoinedActivity(memberNo);
		}
	
		@Transactional
		@Override
		public List<MessageBean> getAllMsg(String account){
			return memberDao.getAllMsg(account);
		}
		
		@Transactional
		@Override
		public boolean checkStatus(String account) {
			return memberDao.checkStatus(account);
		}
		
		@Transactional
		@Override
		public MessageBean getMsg(int msgNo) {
			return memberDao.getMsg(msgNo);
		}
		
		@Transactional
		@Override
		public void sendMsg(MessageBean mb) {
			memberDao.sendMsg(mb);
		}

		@Transactional
		@Override
		public void readMsg(int msgNo) {
			memberDao.readMsg(msgNo);
		}
		
		@Transactional
		@Override
		public void delMsg(int msgNo) {
			memberDao.delMsg(msgNo);
		}
		
		@Transactional
		@Override
		public OrderBean createOrder(Integer memberNo, OrderBean order) {
			return memberDao.createOrder(memberNo,order);
		}
		
		@Transactional
		@Override
		public Integer checkType2Back(String account) {
			return memberDao.checkType2Back(account);
		}
		
		@Transactional
		@Override
		public void changeType2Back(String account, int type) {
			memberDao.changeType2Back(account, type);
		}
		
		@Transactional
		@Override
		public List<String> getFriendList(String account){
			List<String> list1 = memberDao.getFriendListA(account);
			List<String> list2 = memberDao.getFriendListB(account);
			List<String> list3 = list1;
			for( String id : list2 ) {
				for( String id2 : list1 ) {
					if( !id.equals(id2)) {
						list3.add(id);
					}
				}
			}
			return list3;
		}
		
		@Transactional
		@Override
		public void friendWithMe(FriendBean fb) {
			memberDao.friendWithMe(fb);
		}
		
		
		
}
