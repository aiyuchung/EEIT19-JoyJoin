package com.web.activity.annotation;

import java.lang.reflect.Method;
import java.util.Date;
import java.util.UUID;

import javax.annotation.Resource;
//import javax.servlet.http.HttpServletRequest;
//import javax.servlet.http.HttpSession;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.aspectj.lang.JoinPoint;
import org.aspectj.lang.annotation.After;
import org.aspectj.lang.annotation.Aspect;
import org.aspectj.lang.annotation.Before;
import org.aspectj.lang.annotation.Pointcut;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;
import org.springframework.web.bind.annotation.SessionAttributes;
import org.springframework.web.context.request.RequestAttributes;
import org.springframework.web.context.request.RequestContextHolder;

import com.web.activity.model.MemberBean;
import com.web.activity.model.SystemLog;
import com.web.activity.service.Aop_Service;

@Aspect
@Component
@SessionAttributes(value = { "member", "role", "level", "account" })

public class aop_aspect {

	@SuppressWarnings("unused")
	@Autowired
	private HttpServletRequest request; // 直接注入

	// 注入Service用于把日志保存数据库
	@Autowired// 这里我用resource注解，一般用的是@Autowired，他们的区别如有时间我会在后面的博客中来写
	private Aop_Service service;

//	    private 
	public static final Logger logger = LoggerFactory.getLogger(aop_aspect.class); // 寫在LOG裡面 在BEFORE裡面寫

	// Controller pointcut
	@Pointcut("execution (* com.web.activity.controller.*.*(..))")
	public void controllerAspect() {
	}

	/**
	 * 前置通知 用于拦截Controller层记录用户的操作
	 * 
	 * @param joinPoint 切点
	 */

	@Before("controllerAspect()")
	public void doBefore(JoinPoint joinPoint) {
		System.out.println("==========執行controller @Before前的通知===============");

		if (logger.isInfoEnabled()) {
			logger.info("before " + joinPoint);
		}
	}

	@After("controllerAspect()")
	public void doAfter(JoinPoint joinPoint) {
		System.out.println("=====controller @After通知=====");

		HttpSession session = (HttpSession) RequestContextHolder.currentRequestAttributes()
				.resolveReference(RequestAttributes.REFERENCE_SESSION);
		String account = (String) session.getAttribute("account");
		Date today = new Date();
		MemberBean mb = new MemberBean();
//		String ip = request.getRemoteAddr();

		if (account != null) {
			System.out.println("帳號" + account + "操作中");
			System.out.println("現在時間" + today);
		} else {
			account="訪客";
			System.out.println("訪客操作中");
			System.out.println("現在時間" + today);
		}


//		<=====================================>
//		MemberBean mb = new MemberBean();
//        mb.setMemberNo(1);

		mb.setAccount(account);
		String ip = request.getRemoteAddr();
		;

		try {
			// 獲取連線點目標類名
			String targetName = joinPoint.getTarget().getClass().getName(); // 成功
			// 獲取連線點簽名的方法名
			String methodName = joinPoint.getSignature().getName(); // 寫在BEFORE 寫出日誌//成功
			// 獲取連線點引數
			Object[] arguments = joinPoint.getArgs(); // 寫在BEFORE 寫出日誌 用在LOG裡面//成功
			// 根據連線點類的名字獲取指定類
			@SuppressWarnings("rawtypes")
			Class targetClass = Class.forName(targetName);// 成功
			// 獲取類裡面的方法
			Method[] methods = targetClass.getMethods();// 成功
//			String operationType = "";
//			String operationName = "";
//			System.out.println("method[]--->" + methods);
//			for (Method method : methods) {
//				if (method.getName().equals(methodName)) {
////					System.out.println("method.getName()--->"+method.getName());
////					System.out.println("methodName--->"+methodName);
////					System.out.println("method.getParameterTypes()e--->"+method.getParameterTypes());
//					Class[] clazzs = method.getParameterTypes();//這邊有問題
//					if (clazzs.length == arguments.length) {//這邊有問題
//						operationType = method.getAnnotation(Log.class).operationType();//這邊有問題
//						operationName = method.getAnnotation(Log.class).operationName();//這邊有問題
//						break;
//					}
//					
//				
//				}
//			}

//	===================================================================================================

			System.out.println("=====controller通知開始=====");
			System.out.println("請求方法:"
					+ (joinPoint.getTarget().getClass().getName()));
			System.out.println("請求人:" + mb.getAccount());
			System.out.println("請求人IP:" + ip);
			System.out.println("--準備進資料庫");
			// *========存進資料庫=========*//
			SystemLog log = new SystemLog();// service方法存進資料庫
			log.setMethod(methodName);
			log.setRequestIp(ip);
			log.setCreateBy(account);
			log.setCreateDate(today);
			// 資料庫數據保存
			service.insert(log);
			System.out.println("=====controller處理完存進資料庫=====");
//	===================================================================================================

		} catch (Exception e) {
			// 紀錄本地異常狀態
			logger.error("==異常通知==");
			logger.error("異常訊息:{}", e.getMessage());
			System.out.println("exception報錯");
			e.printStackTrace();
		}

	}
}
