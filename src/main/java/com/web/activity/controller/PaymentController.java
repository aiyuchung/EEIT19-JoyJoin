package com.web.activity.controller;

import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.HashMap;
import java.util.Map;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.bind.annotation.SessionAttributes;

import com.web.activity.model.MemberBean;
import com.web.activity.model.OrderBean;
import com.web.activity.service.MemberService;

import ecpay.payment.integration.AllInOne;
import ecpay.payment.integration.domain.AioCheckOutALL;


@Controller
@SessionAttributes({"account"})
public class PaymentController {

	@Autowired
	MemberService memberService;

	@PostMapping(value = {"/shopping"})
	@ResponseBody
    public Map <String,String> checkout(@RequestBody Map<String,String> param,ModelMap model,HttpSession session) {
		String account = (String) session.getAttribute("account");
		MemberBean member = memberService.getMember(account);
		Integer memberNo = member.getMemberNo();
		OrderBean order = new OrderBean();
		
		
		
		order.setOrderItem(param.get("item"));
		order.setOrderNum(Integer.parseInt(param.get("num")));
		order.setOrderPrice(Integer.parseInt(param.get("price")));
		
		System.out.println("item"+order.getOrderItem());
		
		System.out.println("price"+order.getOrderPrice());
		System.out.println("num"+order.getOrderNum());
		
		OrderBean thisOrder = memberService.createOrder(memberNo,order);
		
		AioCheckOutALL payment = new AioCheckOutALL();
		
		payment.setMerchantTradeNo(thisOrder.getOrderNo());
		payment.setMerchantTradeDate(new SimpleDateFormat("yyyy/MM/dd HH:mm:ss").format(new Date()));
		String total= Integer.toString(thisOrder.getOrderNum() * thisOrder.getOrderPrice());
		System.out.println("String total-----------------"+total);
		payment.setTotalAmount(total);
		payment.setTradeDesc("揪IN活動揪團網站");
		String orderItem = thisOrder.getOrderItem() + " x"+Integer.toString(thisOrder.getOrderNum());
		payment.setItemName(orderItem);
		payment.setReturnURL("<c:url value='/' />");
		payment.setClientBackURL("<c:url value='/' />");
		payment.setChooseSubPayment("TAISHIN");
		
		AllInOne all = new AllInOne("");
		 //回傳form (自動submit 所有資料)
		all.aioCheckOut(payment, null);
		param.put("pay",all.aioCheckOut(payment, null));
		return param;
	}
	
//	@ModelAttribute("memberNo")
//	public Integer a1(HttpSession session) {
//		String account = (String) session.getAttribute("account");
//		MemberBean member = memberService.getMember(account);
//		Integer memberNo = member.getMemberNo();
//		return memberNo;
//	}
	
	@GetMapping("orderfinalcheck")
	 public String checkout(Model model) {
		return "/ajax/orderfinalcheck";
	}
}
