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
import com.web.activity.model.ForumBean;
import com.web.activity.model.MemberBean;
import com.web.activity.model.ProvinceBean;
import com.web.activity.service.ActivityService;
import com.web.activity.service.ForumService;
import com.web.activity.service.MemberService;

@Controller

public class ForumController {

	@Autowired
	ForumService service;
	
	
	@GetMapping("/forum")
	public String selectAllForum(HttpServletRequest request, Model model) {
		HttpSession session = request.getSession();
		ForumBean forumBean = new ForumBean();
		List<ForumBean>forumList = service.selectForumTitleListByParam(forumBean);
		model.addAttribute("forumList", forumList);
		return "forum/forum";
	}
	
	@GetMapping("/ajax_forum")
	public String selectRecentMon(Model model,@RequestParam String activeType) {
		ForumBean forumBean = new ForumBean();
		forumBean.setType(activeType);
		List<ForumBean>forumList = service.selectForumTitleListByParam(forumBean);
		model.addAttribute("forumList",forumList);
		return "ajax/forumTable";

	}
	
	@GetMapping("/forumDetail")
	public String getForumDetail(Model model,@ModelAttribute("form") ForumBean form) {
		service.plusPopularity(form.getForumSeq());
		List<ForumBean>forumList = service.selectForumDteailListByParam(form);
		model.addAttribute("forumList",forumList);
		return "forum/forumDetail";
	}
	
	
	@GetMapping("/forumDetail_ONE")
	public String getForumDetailOne(Model model,@RequestParam Integer forumSeq) {
		ForumBean forum = service.selectOneForum(forumSeq);
		model.addAttribute("forum", forum);
		return "forum/forumDetail";
	}
	
	@GetMapping("/forumNewArticle")
	public String getforumNewArticle(HttpServletRequest request, Model model) {
		HttpSession session = request.getSession();
		String account = (String) session.getAttribute("id");
		return "forum/forumNewArticle";
	}
}