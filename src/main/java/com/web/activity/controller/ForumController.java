package com.web.activity.controller;

import java.util.ArrayList;
import java.util.List;
import java.util.Map;
import java.util.stream.Collector;
import java.util.stream.Collectors;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;
import javax.swing.event.ListSelectionEvent;

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

import com.web.activity.Enum.ForumType;
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
	public String selectRecentMon(Model model, String activeType, String keyWord) {
		ForumBean forumBean = new ForumBean();
		forumBean.setType(activeType);
		forumBean.setKeyWord(keyWord);
		List<ForumBean>forumList = service.selectForumTitleListByParam(forumBean);
		model.addAttribute("forumList",forumList);
		return "ajax/forumTable";

	}
	
	@GetMapping("/forumDetail")
	public String getForumDetail(Model model,@ModelAttribute("form") ForumBean form) {
		service.plusPopularity(form.getForumSeq());
		form.setCode(String.valueOf(form.getForumSeq()));
		List<ForumBean>forumList = service.selectForumDteailListByParam(form);
		ForumBean forumTitle = forumList.stream()
				.filter(f -> ForumType.TITLE.equals(f.getForumType())).findAny()
				.orElse(new ForumBean());
		List<ForumBean> forumDetailList = forumList.stream()
				.filter(f -> ForumType.DETAIL.equals(f.getForumType()))
				.collect(Collectors.toList());
		
		model.addAttribute("forumTitle",forumTitle);
		model.addAttribute("forumDetailList",forumDetailList);
		return "forum/forumDetail";
	}
	
	
	@GetMapping("/forumDetail_ONE")
	public String getForumDetailOne(Model model,@RequestParam Integer forumSeq) {
		ForumBean forum = service.selectOneForum(forumSeq);
		model.addAttribute("forum", forum);
		return "forum/forumDetail";
	}
	
	@GetMapping("/forumNewArticle")
	public String getforumNewArticle( Model model,@ModelAttribute("form") ForumBean form) {
		model.addAttribute("forumBean",form);
		return "forum/forumNewArticle";
	}
	
	
	@GetMapping("/forumUpdateArticle")
	public String forumUpdateArticle( Model model,@ModelAttribute("form") ForumBean form) {
		ForumBean forumRes = service.selectOneForum(form.getForumSeq());
		model.addAttribute("forumBean",forumRes);
		return "forum/forumNewArticle";
	}
	
	
	
	
	@PostMapping("/saveOrUpdateArticle")
	public String saveOrUpdateArticle( Model model,@ModelAttribute("form") ForumBean form) {
		List<ForumBean> forumList = service.saveOrUpdateArticle(form);
		ForumBean forumTitle = forumList.stream()
				.filter(f -> ForumType.TITLE.equals(f.getForumType())).findAny()
				.orElse(new ForumBean());
		List<ForumBean> forumDetailList = forumList.stream()
				.filter(f -> ForumType.DETAIL.equals(f.getForumType()))
				.collect(Collectors.toList());
		
		model.addAttribute("forumTitle",forumTitle);
		model.addAttribute("forumDetailList",forumDetailList);
		return "forum/forumDetail";
	}
}