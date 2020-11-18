package com.web.activity.service.impl;

import java.math.BigDecimal;
import java.math.MathContext;
import java.math.RoundingMode;
import java.util.ArrayList;
import java.util.Comparator;
import java.util.List;
import java.util.stream.Collectors;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.dao.support.DaoSupport;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.web.activity.Enum.ForumType;
import com.web.activity.dao.ForumDao;
import com.web.activity.model.ActivityBean;
import com.web.activity.model.ForumBean;
import com.web.activity.model.MemberBean;
import com.web.activity.service.ActivityService;
import com.web.activity.service.ForumService;
@Transactional
@Service
public class ForumServiceImpl implements ForumService {

	@Autowired
	ForumDao forumDao;
	
	@Autowired
	ActivityService activityService;

	// 查詢討論標題清單
	public List<ForumBean> selectForumTitleListByParam(ForumBean forumBean) {
		forumBean.setForumType(ForumType.TITLE);
		return forumDao.selectAllForumByParam(forumBean);
	}
	
	// 查詢討論內容清單
	public List<ForumBean> selectForumDteailListByParam(ForumBean forumBean) {
		//forumBean.setForumType(ForumType.DETAIL);
		//forumBean.setCode(String.valueOf(forumBean.getForumSeq()));
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
	
	@Override
	 public void createNewArticle(ForumBean forumBean){
		forumBean.setForumType(ForumType.DETAIL);
		forumBean.setPopularity(0);
		forumDao.createForum(forumBean);
	 }
	
	
	@Override
	public Integer createForumTitle(Integer activityNo) {
		ActivityBean activeBean = activityService.selectOneActivity(activityNo);
		MemberBean memberBean = activeBean.getMemberBean();
		ForumBean forumBean = new ForumBean(); // 邏輯上需要設定 forumBean.setActivityCode(activeBean.toString());
		forumBean.setActivityCode(activityNo.toString());
		forumBean.setType(activeBean.getActivityTypeName());
		forumBean.setTitle(activeBean.getName());
		forumBean.setLocation(activeBean.getProv());
		forumBean.setAuthor(memberBean.getMemberNo().toString());
		forumBean.setForumType(ForumType.TITLE);
		forumBean.setPopularity(0);
		forumBean.setScore(BigDecimal.ZERO); // 呼叫寫入討論的DAO
		Integer forumSeq =  forumDao.createForum(forumBean);
		forumBean.setCode(forumSeq.toString());
		forumDao.updateForum(forumSeq, forumBean);
		return forumSeq;
	}
	
	@Override
	public List<ForumBean> saveOrUpdateArticle(ForumBean forumBean){
		//如果沒有key值，進行新增文章
		List<ForumBean> resultList = new ArrayList<ForumBean>();
		if(forumBean.getForumSeq() == null) {
			 this.createNewArticle(forumBean);
		}else {
		//若已存在key值，則進行文章更新
			forumBean.setForumType(ForumType.DETAIL);
			forumDao.updateForum(forumBean.getForumSeq(), forumBean);
		}
		ForumBean queryForum = new ForumBean();
		queryForum.setCode(forumBean.getCode());
		resultList = this.selectForumDteailListByParam(queryForum);
		//更新TITLE的平均分數
		this.updateScore(resultList);
		return resultList;
	}
	
	private void updateScore(List<ForumBean> forumList){	
		ForumBean forumBean = forumList.stream()
				.filter(f -> ForumType.TITLE.equals(f.getForumType()))
				.findAny()
				.orElse(new ForumBean());
		List<ForumBean> forumDetailList = forumList.stream()
				.sorted(Comparator.comparing(ForumBean::getForumSeq))
				.filter(f -> ForumType.DETAIL.equals(f.getForumType()))
				.collect(Collectors.toList());
		BigDecimal averageNumber = forumDetailList.stream().map(ForumBean::getScore)
				.reduce(BigDecimal::add).orElse(BigDecimal.ZERO)
				.divide(new BigDecimal(forumDetailList.size()),1,RoundingMode.CEILING);
		
		forumBean.setScore(averageNumber);
		forumDao.updateForum(forumBean.getForumSeq(), forumBean);

	}
	
	
}
