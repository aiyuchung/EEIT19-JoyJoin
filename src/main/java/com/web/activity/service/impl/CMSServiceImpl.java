package com.web.activity.service.impl;

import java.util.List;

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

	public long getGenderCounts() {
		return dao.getGenderCounts();
	}

	public List<ActivityBean> getActiveLocation() {
		return dao.getActiveLocation();
	}

}
