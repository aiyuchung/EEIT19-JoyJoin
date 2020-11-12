package com.web.activity.service.impl;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

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

	// 查詢討論熱門清單
	@Override
	public Map<String, Integer> updateHitCount(int forumSeq) {
		Integer hit = dao.updateHitCount(forumSeq);
		Map<String, Integer> hitCount = new HashMap<>();
		hitCount.put("hitCount", hit);
		return hitCount;
	}

	// 查詢討論活動類型
	@Override
	public List<ForumBean> selectForumType() {
		return dao.selectForumType();
	}

	// 查詢討論發文者
	@Override
	public List<ForumBean> selectForumAuthore() {
		return dao.selectForumAuthore();
	}

	// 查詢討論活動地區
	@Override
	public List<ForumBean> selectForumLocation() {
		return dao.selectForumLocation();
	}

}
