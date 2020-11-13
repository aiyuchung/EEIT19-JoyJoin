package com.web.activity.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;

import com.web.activity.service.ActivityService;


@Controller
public class HomeController {
	@Autowired
	ActivityService service;
	
	@GetMapping({"/","/index"})
	public String home() {
		service.updateLeftDays();
		return "index";	
	}

}
