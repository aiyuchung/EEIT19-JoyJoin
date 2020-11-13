package com.web.activity.service.impl;

import javax.transaction.Transactional;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.web.activity.dao.MemberDao;
import com.web.activity.model.MemberBean;
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
	
		
		
		
		
}
