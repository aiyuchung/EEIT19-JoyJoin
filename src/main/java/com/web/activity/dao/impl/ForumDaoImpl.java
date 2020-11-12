package com.web.activity.dao.impl;

import java.time.LocalDateTime;

import java.util.List;

import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.hibernate.query.Query;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;
import org.springframework.util.StringUtils;

import com.web.activity.dao.ForumDao;
import com.web.activity.model.ForumBean;
@SuppressWarnings("unchecked")
@Repository
public class ForumDaoImpl implements ForumDao {
	@Autowired
	SessionFactory factory;
	//----------------------------------------新增點擊率並回傳--------------------------------------------


	@Override
	public List<ForumBean>  createForum(ForumBean forumBean) {
		Session session = factory.getCurrentSession();
		session.save(forumBean);
		String hql = "FROM ForumBean";
		List<ForumBean> list = session.createQuery(hql).getResultList();
		return list;
	}
	
	@Override
	public ForumBean updateForum(int forumSeq,ForumBean forumBean) {
		Session session = factory.getCurrentSession();
		forumBean.setForumSeq(forumSeq);
		session.save(forumBean);
		return this.selectOneForum(forumSeq);
	}
	
	@Override
	public ForumBean updateForumByParam(int forumSeq,ForumBean forumBean) {
	    Session session = factory.getCurrentSession();
		LocalDateTime nowDateTime = LocalDateTime.now();
	    StringBuffer sb = new StringBuffer();
	    sb.append("UPDATE ForumBean SET ");
	    sb.append("time = :time").append(",");
	    sb.append("photo = :photo").append(",");
	    sb.append("article = :article");
	    sb.append(" WHERE forumSeq = :forumSeq" );
		String hql = sb.toString();
		session.createQuery(hql)
		.setParameter("time", nowDateTime)
		.setParameter("photo", forumBean.getPhoto())
		.setParameter("article", forumBean.getArticle())
		.setParameter("forumSeq",forumSeq)
		.executeUpdate();
		return this.selectOneForum(forumSeq);
	}
	
	@Override
	public Integer plusPopularity(int forumSeq) {
		Session session = factory.getCurrentSession();
		//先查出指定資料
		//String hql = "FROM ForumBean WHERE status = 'ACTIVE' AND forumSeq = :forumSeq ";
		ForumBean forumRes = this.selectOneForum(forumSeq);
		Integer popularity = forumRes.getPopularity();
		System.out.println("hit from bean=====================" + popularity);
		popularity += 1;
		//更新指定資料的點擊率
		String hql = "UPDATE ForumBean SET popularity= :popularity WHERE status = 'ACTIVE' AND forumSeq = :forumSeq ";
		session.createQuery(hql).setParameter("popularity", popularity).setParameter("forumSeq", forumSeq).executeUpdate();
		return popularity;
	}
	

	@Override
	public List<ForumBean> selectAllForumByParam(ForumBean forumBean){
		Session session = factory.getCurrentSession();
		StringBuffer  sb = new StringBuffer("FROM ForumBean WHERE 1=1 ");
		if(forumBean.getForumType() != null) {
			sb.append(" AND forumType = :forumType");
		}
		if(forumBean.getCode() != null && !StringUtils.isEmpty(forumBean.getCode())) {
			sb.append(" AND code = :code");
		}
		if(forumBean.getType() != null && !StringUtils.isEmpty(forumBean.getType())) {
			sb.append(" AND type = :type");
		}
		String hql = sb.toString();
		  Query<ForumBean> query = session.createQuery(hql);
		
		if(forumBean.getForumType() != null) {
			query.setParameter("forumType", forumBean.getForumType());
		}
		if(forumBean.getCode() != null && !StringUtils.isEmpty(forumBean.getCode())) {
			query.setParameter("code", forumBean.getCode());
		}
		if(forumBean.getType() != null && !StringUtils.isEmpty(forumBean.getType())) {
			query.setParameter("type", forumBean.getType());
		}
		List<ForumBean> list =query.getResultList();
		
		if(forumBean.getType() != null && !StringUtils.isEmpty(forumBean.getType())) {
			sb.append(" AND type = :type");
		}
		return list;
	}
	
	@Override
	public ForumBean selectOneForum(int forumSeq){
		Session session = factory.getCurrentSession();
		//先查出指定資料
		String hql = "FROM ForumBean WHERE status = 'ACTIVE' AND forumSeq = :forumSeq ";
		return (ForumBean) session.createQuery(hql).setParameter("forumSeq", forumSeq).getSingleResult();
	}

}
