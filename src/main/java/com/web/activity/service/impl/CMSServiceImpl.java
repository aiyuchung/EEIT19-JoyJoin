package com.web.activity.service.impl;

import java.util.List;

//import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.web.activity.dao.CMSDao;
import com.web.activity.model.ActivityBean;
import com.web.activity.service.CMSService;

@Transactional
@Service
public class CMSServiceImpl implements CMSService {

	@Autowired
	CMSDao dao;
	
	@Override
	public List<ActivityBean> selectAllActivities() {
		return dao.selectAllActivities();
	}

	public long getGenderCounts() {
		return dao.getGenderCounts();
	}

	public long getActiveLocation() {
		return dao.getActiveLocation();
	}

}
