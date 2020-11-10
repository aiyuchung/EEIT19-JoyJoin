package com.web.activity.controller;

import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.bind.annotation.SessionAttributes;

import com.web.activity.model.ActivityBean;
import com.web.activity.model.ActivityClassBean;
import com.web.activity.model.ActivityForm;
import com.web.activity.model.ActivityMsgBean;
import com.web.activity.model.ActivityTypeBean;
import com.web.activity.model.MemberBean;
import com.web.activity.model.ProvinceBean;
import com.web.activity.service.ActivityService;
import com.web.activity.service.MemberService;

@Controller

public class ForumController {

	@Autowired
	ActivityService service;
	
	@Autowired
	MemberService memberService;
	
	@GetMapping("/forum")
	public String getMemberBean2Select(HttpServletRequest request, Model model) {
		HttpSession session = request.getSession();
		String account = (String) session.getAttribute("id");
		return "forum/forum";
	}
	
	@GetMapping("/forumDetail")
	public String getForumDetail(HttpServletRequest request, Model model) {
		HttpSession session = request.getSession();
		String account = (String) session.getAttribute("id");
		return "forum/forumDetail";
	}
	
	@GetMapping("/forumNewArticle")
	public String getforumNewArticle(HttpServletRequest request, Model model) {
		HttpSession session = request.getSession();
		String account = (String) session.getAttribute("id");
		return "forum/forumNewArticle";
	}
}