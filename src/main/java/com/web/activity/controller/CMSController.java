package com.web.activity.controller;

import java.util.List;
//import java.util.Map;

//import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;

import com.web.activity.model.ActivityBean;

import com.web.activity.service.CMSService;

@Controller
public class CMSController {

	
	@Autowired
	CMSService service;					//service乘載DAO方法    SERVICE與DAO歸類  model 
//計算地區出現次數
	@GetMapping("/ajax_counts")
	public String counts(Model model) {
		long loc = service.getActiveLocation();
		model.addAttribute("location",loc);	
		return "ajax/counts";
		
	}
	
//	<===========================================>
	
	//用在CMS頁面出現的活動資料
	@GetMapping("/allactive")//請求路徑
	public String list(Model model) {
		List<ActivityBean> list = service.selectAllActivities();		//宣告list物件 "list" 用selectAllActivies 方法
		model.addAttribute("activities",list);		//model 裝進去東西 識別字串 activities 
//		System.out.println("hello world");
		return "CMS"; // 分配jsp
		
	}
	
	@GetMapping("/ajax_selallactive")
	public String selectallactive(Model model) {
		List<ActivityBean> beans = service.selectAllActivities();
		model.addAttribute("activities",beans);
		System.out.println("hello world");
		return "ajax/CMSActives";		//  分配到ajax jsp
	}
	
}
