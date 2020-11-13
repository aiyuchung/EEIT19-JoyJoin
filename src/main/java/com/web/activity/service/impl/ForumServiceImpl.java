package com.web.activity.service.impl;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.web.activity.Enum.ForumType;
import com.web.activity.dao.ForumDao;
import com.web.activity.model.ForumBean;
import com.web.activity.service.ForumService;
@Transactional
@Service
public class ForumServiceImpl implements ForumService {

	@Autowired
	ForumDao forumDao;

	// 查詢討論標題清單
	public List<ForumBean> selectForumTitleListByParam(ForumBean forumBean) {
		forumBean.setForumType(ForumType.TITLE);
		return forumDao.selectAllForumByParam(forumBean);
	}
	
	// 查詢討論內容清單
	public List<ForumBean> selectForumDteailListByParam(ForumBean forumBean) {
		forumBean.setForumType(ForumType.DETAIL);
		forumBean.setCode(String.valueOf(forumBean.getForumSeq()));
		forumBean.setForumSeq(null);
		return forumDao.selectAllForumByParam(forumBean);
	}


	@Override
	public Integer plusPopularity(int forumSeq) {
		Integer hit = forumDao.plusPopularity(forumSeq);
		return hit;
	}
	
	@Override
	public ForumBean selectOneForum(int forumSeq) {
		 ForumBean forumBean = forumDao.selectOneForum(forumSeq);
		return forumBean;
	}


}
