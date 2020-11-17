package com.web.activity.controller;

import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.HashMap;
import java.util.Map;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.SessionAttributes;

import com.web.activity.model.MemberBean;
import com.web.activity.model.OrderBean;
import com.web.activity.service.MemberService;

import ecpay.payment.integration.AllInOne;
import ecpay.payment.integration.domain.AioCheckOutALL;


@Controller
@SessionAttributes({"level", "id","member","account"})
public class PaymentController {

	@Autowired
	MemberService memberService;

	@PostMapping(value = {"/shopping"})
    public String checkout(ModelMap model,HttpSession session, OrderBean order) {
		String account = (String) session.getAttribute("account");
		MemberBean member = memberService.getMember(account);
		Integer memberNo = member.getMemberNo();
		System.out.println(order.getOrderItem());
		System.out.println(order.getOrderPrice());
		System.out.println(order.getOrderNum());
		OrderBean thisOrder = memberService.createOrder(memberNo,order);
		
		AioCheckOutALL payment = new AioCheckOutALL();
		
		payment.setMerchantTradeNo(thisOrder.getOrderNo());
		payment.setMerchantTradeDate(new SimpleDateFormat("yyyy/MM/dd HH:mm:ss").format(new Date()));
		String total= Integer.toString(thisOrder.getOrderNum() * thisOrder.getOrderPrice());
		payment.setTotalAmount(total);
		payment.setTradeDesc("揪IN活動揪團網站");
		String orderItem = thisOrder.getOrderItem() + " x"+Integer.toString(thisOrder.getOrderNum());
		payment.setItemName(orderItem);
		payment.setReturnURL("<c:url value='/member' />");
		payment.setClientBackURL("<c:url value='/member' />");
		payment.setChooseSubPayment("TAISHIN");
		
		AllInOne all = new AllInOne("");
		all.aioCheckOut(payment, null); //回傳form (自動submit 所有資料)
		
		Map <String,AllInOne> creditPay = new HashMap<>();
		creditPay.put("pay",all);
//		
//		100點x1#50點x1
		model.addAttribute("order",thisOrder);
		model.addAttribute("orderTotal",total);
		model.addAttribute("creditPay",creditPay);
        return "/ajax/checkout";
    }
	
	

}
