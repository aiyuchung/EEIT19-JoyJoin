package com.web.activity.service.impl;

import java.math.BigDecimal;
import java.util.List;

import javax.transaction.Transactional;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.web.activity.dao.ActivityDao;
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
@Transactional
public class MemberServieImpl implements MemberService {

		@Autowired
		MemberDao memberDao;
		
		@Autowired
		ActivityDao activityDao;		
		
		@Override
		public void signUp(MemberBean mb) {
			memberDao.signUp(mb);
			memberDao.sentMail(mb.getMail());
		}
		
		
		@Override
		public MemberBean getMember(String account) {
			return memberDao.getMember(account);
		}
		
		
		@Override
		public RoleBean getRole(String account) {
			return memberDao.getRole(account);
		}
		
		
		@Override
		public String getMail(String account) {
			return memberDao.getMail(account);
		}		
		
		
		@Override
		public void newPwd(String account, String password) {
			memberDao.newPwd(account, password);
		}
		
		
		@Override
		public Integer checkID(String account, String password) {
			return memberDao.checkID(account, password);
		}
		
		
		@Override
        public Integer checkLevel(String account) {
            return memberDao.checkLevel(account);
		}

		
		@Override
		public void updateInfo(MemberBean mb) {
			memberDao.updateInfo(mb);
		}
		
		
		@Override
		 public boolean checkAccount(String account) {
			 return memberDao.checkAccount(account);
		 }

		 
		 @Override
    	public boolean checkEmail(String email) {
    		return memberDao.checkEmail(email);
    	}

		
		@Override
		public void openType(String account) {
			memberDao.openType(account);
		}

		
		@Override
		public void updateTime(String account, String time) {
			memberDao.updateTime(account, time);
		}
		
		
		@Override
		public void updateSign(String account) {
			memberDao.updateSign(account);
		}
		
		
		@Override
		public void updatePost(String account) {
			memberDao.updatePost(account);
		}

		
		@Override
		public void updateFinish(String account) {
			memberDao.updateFinish(account);			
		}

		
		@Override
		public List<MemberBean> getPair(String account) {
			MemberBean mb = memberDao.getMember(account);
			List<MemberBean> list = memberDao.getPair();
//			for(MemberBean m : list) {
//				if(m==mb) {
//					list.remove(m);
//				}
//			}
			return list;
		}
		
		
		@Override
		public List<ActivityFollowedBean> getFollowedActivity(Integer memberNo) {
			return memberDao.getFollowedActivity(memberNo);
		}

		
		@Override
		public List<ActivityJoinedBean> getJoinedActivity(Integer memberNo) {
			return memberDao.getJoinedActivity(memberNo);
		}
	
		
		@Override
		public List<MessageBean> getAllMsg(String account){
			return memberDao.getAllMsg(account);
		}
		
		
		@Override
		public boolean checkStatus(String account) {
			return memberDao.checkStatus(account);
		}
		
		
		@Override
		public MessageBean getMsg(int msgNo) {
			return memberDao.getMsg(msgNo);
		}
		
		
		@Override
		public void sendMsg(MessageBean mb) {
			memberDao.sendMsg(mb);
		}

		
		@Override
		public void readMsg(int msgNo) {
			memberDao.readMsg(msgNo);
		}
		
		
		@Override
		public void delMsg(int msgNo) {
			memberDao.delMsg(msgNo);
		}
		
		
		@Override
		public OrderBean createOrder(Integer memberNo, OrderBean order) {
			return memberDao.createOrder(memberNo,order);
		}
		
		
		@Override
		public Integer checkType2Back(String account) {
			return memberDao.checkType2Back(account);
		}
		
		
		@Override
		public void changeType2Back(String account, int type) {
			memberDao.changeType2Back(account, type);
		}

		@Override
		public List<OrderBean> orderRecords(Integer memberNo) {
			return memberDao.orderRecords(memberNo);
		}
		
		@Override
		public List<String> getAllFriendList(String account){
			List<String> List1 = memberDao.getFriendListOne(account);
			List<String> List2 = memberDao.getFriendListTwo(account);
			List<String> List3 = List1;
			for( String id1 : List1 ) {
				for( String id2 : List2 ) {
					if( id1 != id2) {
						List3.add(id2);
					}
				}
			}
			return List3;
		}
		
		@Override
		public boolean checkFriend (String host, String account) {
			return memberDao.checkFriend(host, account);
		}
		
		@Override
		public void saveFriend(FriendBean fb) {
			memberDao.saveFriend(fb);
		}
	
		@Override
		public void delFriend(String host, String account) {
			memberDao.delFriend(host, account);
		}

		@Override
		public void updateStatus(String host, String account) {
			memberDao.updateStatus(host, account);;
		}
		
		@Override
		public String checkFriendType(String host, String account) {
			return memberDao.checkFriendType(host, account);
		}
		
		@Override
		public void addEmpforBuying(String account, int point) {
			memberDao.addEmpforBuying(account, point);
		}
		
		@Override
		public double getPersonalScore(String account) {
			List<BigDecimal> list = activityDao.getPersonalScore(account);
			double i = 0;
			for ( BigDecimal j : list) {
				double k = j.doubleValue();
				i+=k;
			}
			int m = list.size();
			i = i/m;
			return i;
		}
		
		
}
