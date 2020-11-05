package com.web.activity.service.impl;

import javax.transaction.Transactional;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.web.activity.dao.MemberDao;
import com.web.activity.model.MemberBean;
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
		public boolean checkID(String account, String password) {
			return memberDao.checkID(account, password);
		}
		
		@Transactional
		@Override
		public boolean checkManager(String account) {
			return memberDao.checkManager(account);
		}

		@Transactional
		@Override
		public void updateInfo(MemberBean mb) {
			memberDao.updateInfo(mb);
		}

		@Transactional
		@Override
		public void openType(String account) {
			memberDao.openType(account);
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
	
		
		
		
		
}