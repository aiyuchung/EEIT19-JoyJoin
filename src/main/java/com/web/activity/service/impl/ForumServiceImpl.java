package com.web.activity.service.impl;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.web.activity.Enum.ForumType;
import com.web.activity.dao.ForumDao;
import com.web.activity.model.ForumBean;
import com.web.activity.service.ForumService;

@Service
public class ForumServiceImpl implements ForumService {

	@Autowired
	ForumDao forumDao;

	// 查詢討論標題清單
	public List<ForumBean> selectForumTitleList(ForumBean forumBean) {
		forumBean.setForumType(ForumType.TITLE);
		return forumDao.selectAllForumByParam(forumBean);
	}

}
