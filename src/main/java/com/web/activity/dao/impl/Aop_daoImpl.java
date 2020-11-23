package com.web.activity.dao.impl;

import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.web.activity.dao.Aop_dao;
import com.web.activity.model.SystemLog;

@Repository
public class Aop_daoImpl implements Aop_dao {
	@Autowired
	SessionFactory factory;


	@Override
	public void insert(SystemLog record) {
		Session session = factory.getCurrentSession();

		session.save(record);
		
	}

	

}
