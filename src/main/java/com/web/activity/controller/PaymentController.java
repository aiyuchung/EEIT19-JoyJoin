package com.web.activity.controller;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.SessionAttributes;

import com.web.activity.service.MemberService;


@Controller
@SessionAttributes({"level", "id","member","account"})
public class PaymentController {

	@Autowired
	MemberService memberService;

	@PostMapping(value = {"/checkout/{id}"})
    public String checkout(@PathVariable String id, ModelMap model,HttpSession session) {
//		AioCheckOutALL payment = new AioCheckOutALL();
//		AllInOne all = new AllInOne("");
//		payment.set..all..all
//		all.aioCheckOut(payment, null); //回傳form (自動submit 所有資料)
//		
//		100點x1#50點x1
		
//		
//		String account = (String) session.getAttribute("account"); //取得目前使用者帳號
//		MemberBean member = memberService.getMember(account);
////		Integer memberNo = member.getMemberNo();
//		Map<String, String> map = new HashMap<>();
//		map.put("MerchantID",account);
//		map.put("MerchantTradeNo","ABC123");
//		map.put("MerchantTradeDate",new SimpleDateFormat("yyyy/MM/dd HH:mm:ss").format(new Date()));
//		map.put("PaymentType ","aio");
//		map.put("TotalAmount","1000"); //int
//		map.put("TradeDesc ","揪IN活動揪團網站");
//		map.put("ItemName ","點數500");
//		map.put("ReturnURL","<c:url value='/member' />");
//		map.put("ChoosePayment","Credit");
//		map.put("CheckMacValue",);
//		map.put("EncryptType",1);
        

        return "/cashflow/checkout";
    }

}
