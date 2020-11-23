package com.web.activity.service.impl;


import org.hibernate.annotations.Source;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.web.activity.dao.Aop_dao;
//import com.web.activity.annotation.Log;
import com.web.activity.model.SystemLog;
import com.web.activity.service.Aop_Service;



@Transactional
@Service("Aop_Service")
public class Aop_ServiceImpl implements Aop_Service {

	@Autowired
	private Aop_dao dao;

	

	@Override

	public void insert(SystemLog record) {

		dao.insert(record);
	}


}
