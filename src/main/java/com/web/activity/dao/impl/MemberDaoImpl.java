package com.web.activity.dao.impl;

import java.util.Date;
import java.util.List;

import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.web.activity.dao.MemberDao;
import com.web.activity.model.ActivityFollowedBean;
import com.web.activity.model.ActivityJoinedBean;
import com.web.activity.model.FriendBean;
import com.web.activity.model.MemberBean;
import com.web.activity.model.MessageBean;
import com.web.activity.model.OrderBean;
import com.web.activity.model.RoleBean;

@Repository
public class MemberDaoImpl implements MemberDao {

	@Autowired
	SessionFactory factory;

	@Override
	public void signUp(MemberBean mb) {
			Session session = factory.getCurrentSession();
			createRole(mb.getAccount());
			session.save(mb);
	}

	@Override
	public void createRole(String account) {
			RoleBean rb = new RoleBean();
			rb.setAccount(account);
			rb.setLevel(1);
			rb.setEmp(0);
			rb.setLastTime("0");
			rb.setSignTrip(1);
			rb.setPostTrip(0);
			rb.setFinishTrip(0);
			rb.setAccountType(0);
			rb.setSignType(1);
			rb.setNoticeType(1);
			Session session = factory.getCurrentSession();
			session.save(rb);
			}

	@Override
	public void sentMail(String email) {
		
	}
	
	@Override
	public void updateInfo(MemberBean mb) {
		Session session = factory.getCurrentSession();
		String hql = "UPDATE MemberBean SET password = :password, gender = :gender, picture = :picture"
				+ ", nickname = :nickname, phone = :phone, birthYear = :year, birthMonth = :month, starSign = :star, bloodType = :blood"
				+ ", country = :country, address = :address, hobby = :hobby, education = :education, school = :school"
				+ ", company = :company, job = :job, income = :income, signature = :signature, introduction = :introduction"
				+ ", fileName = :filename"
				+ " WHERE account = :id";
		session.createQuery(hql).setParameter("id", mb.getAccount())
											  .setParameter("password", mb.getPassword())
											  .setParameter("gender", mb.getGender())
											  .setParameter("picture", mb.getPicture())
											  .setParameter("nickname", mb.getNickname())
											  .setParameter("phone", mb.getPhone())
											  .setParameter("year", mb.getBirthYear())
											  .setParameter("month", mb.getBirthMonth())
											  .setParameter("star", mb.getStarSign())
											  .setParameter("blood", mb.getBloodType())
											  .setParameter("country", mb.getCountry())
											  .setParameter("address", mb.getAddress())
											  .setParameter("hobby", mb.getHobby())
											  .setParameter("education", mb.getEducation())
											  .setParameter("school", mb.getSchool())
											  .setParameter("company", mb.getCompany())
											  .setParameter("job", mb.getJob())
											  .setParameter("income", mb.getIncome())
											  .setParameter("signature", mb.getSignature())
											  .setParameter("introduction", mb.getIntroduction())
											  .setParameter("filename", mb.getFileName())
											 .executeUpdate();		
		}

	public MemberBean getMember(String account) {
		String hql = "FROM MemberBean WHERE account = :id";
		Session session = factory.getCurrentSession();
		MemberBean mb = new MemberBean();
		try {
			mb = (MemberBean) session.createQuery(hql)
											.setParameter("id", account)
											.getSingleResult();
		}catch(Exception e) {
			;
		}
		return mb;
	}
	
	@Override
	public RoleBean getRole(String account) {
		String hql = "FROM RoleBean WHERE account = :id";
		Session session = factory.getCurrentSession();
		checkEmp2Level(account);
		RoleBean rb = new RoleBean();
		try {
			rb = (RoleBean) session.createQuery(hql)
									.setParameter("id", account)
									.getSingleResult();
		}catch(Exception e) {
			;
		}
		return rb;
	}
	
	@Override
	public String getMail(String account) {
		String hql = "SELECT mail FROM MemberBean WHERE account = :id";
		Session session = factory.getCurrentSession();
		String mail = null;
		try {
			 mail = (String) session.createQuery(hql).setParameter("id", account).getSingleResult();			
		}catch(Exception e) {
			;
		}
		return mail;
	}
	
	@Override
	public void newPwd(String account, String password) {
		String hql = "UPDATE MemberBean SET password = :pwd WHERE account = :id";
		Session session = factory.getCurrentSession();
		session.createQuery(hql).setParameter("pwd", password).setParameter("id", account).executeUpdate();
	}
	
	@Override
	public void checkEmp2Level(String account) {
		String hql = "FROM RoleBean WHERE account = :id";
		String hql2 = "UPDATE RoleBean SET level = :iv WHERE account = :id";
		Session session = factory.getCurrentSession();
		int emp = 0;
		try {
			emp = (int) session.createQuery(hql). setParameter("id", account).getSingleResult();			
		}catch(Exception e) {
			;
		}
		if(emp>5000) {
			session.createQuery(hql2).setParameter("lv","1" ).setParameter("id", account).executeUpdate();
		}else if(emp>=5000 && emp<10000) {
			session.createQuery(hql2).setParameter("lv","2" ).setParameter("id", account).executeUpdate();
		}else if(emp>=10000) {
			session.createQuery(hql2).setParameter("lv","3" ).setParameter("id", account).executeUpdate();			
		}
	}
	//判斷經驗,更改等級


	
	
	
	
	
	@Override
	public Integer checkID(String account, String password) {
		String hql = "SELECT password FROM MemberBean WHERE account = :id";
		Session session = factory.getCurrentSession();
		String pwd = null;
		try {
			pwd = (String) session.createQuery(hql).setParameter("id", account)
																		 .getSingleResult();
		}catch(Exception e){
			return 2;
		}
		
		if( pwd.equals(password)) {
			if( checkType(account) ) {
				return 1;
			}else {
				return 4;
			}			
		}else {
			return 3;
		}
	}

	@Override
    public boolean checkAccount(String account) {
		String hql = "FROM MemberBean WHERE account = :id";
		Session session = factory.getCurrentSession();
		try {
			session.createQuery(hql).setParameter("id", account).getSingleResult();
		}catch(Exception e){
			return true;
		}
		return false;
	}

    @Override
    public boolean checkEmail(String email) {
    	String hql = "FROM MemberBean WHERE mail = :email";
		Session session = factory.getCurrentSession();
		try {
			session.createQuery(hql).setParameter("email", email).getSingleResult();
		}catch(Exception e){
			return true;
		}
		return false;
    }
	
	@Override
	public boolean checkType(String account) {
		String hql = "SELECT accountType FROM RoleBean WHERE account = :id";
		Session session = factory.getCurrentSession();
		Integer flag = null;
		try {
			flag = (Integer) session.createQuery(hql)
												.setParameter("id", account)
												.getSingleResult();
		}catch(Exception e) {
			return false;
		}
		if ( flag == 1 ) {
			return true;
		}else
			return false;
	}

    public Integer checkLevel(String account) {
		String hql = "SELECT level FROM RoleBean WHERE account = :id";
		Session session = factory.getCurrentSession();
        Integer level = null;
		try {
            level = (Integer) session.createQuery(hql)
												.setParameter("id", account)
												.getSingleResult();
		}catch(Exception e) {
            return 0;
		}
        return level;
	}
	
	@Override
	public void openType(String account) {
		String hql = "UPDATE RoleBean SET accountType = :type WHERE account = :id";
		Session session = factory.getCurrentSession();
		session.createQuery(hql).setParameter("type", 1)
											  .setParameter("id", account).executeUpdate();
	};
	
	@Override
	public void updateTime(String account, String time) {
		Session session = factory.getCurrentSession();
		String hql1 = "SELECT lastTime FROM RoleBean WHERE Account = :id";
		String lastTime = "";
		try {
			lastTime = (String) session.createQuery(hql1).setParameter("id", account)
															   .getSingleResult();
		}catch(Exception e) {
			;
		}
		if((!(lastTime.equals(time)))||(lastTime.equals(""))) {
			String hql2 = "UPDATE RoleBean SET lastTime = :time WHERE account = :id";
			session.createQuery(hql2).setParameter("time", time).setParameter("id", account).executeUpdate();
			login2Emp(account);
			updateSign(account);
		}else {
			;
		}
	}
	
	@Override
	public void login2Emp(String account) {
		String hql = "SELECT emp FROM RoleBean WHERE account = :id";
		String hql2 = "UPDATE RoleBean SET emp = :emp WHERE account = :id";
		Session session = factory.getCurrentSession();
		int emp = 0;
		try {
			emp = ((int) session.createQuery(hql).setParameter("id", account).getSingleResult())+10;
			System.out.println("emp==========>"+emp);
		}catch(Exception e) {
			;
		}
		session.createQuery(hql2).setParameter("emp", emp).setParameter("id", account).executeUpdate();
	}
	//比對登入時間,第一次登入增加經驗
	
	
	
	
	
	@Override
	public void updateSign(String account) {
		String hql1 = "SELECT signTrip FROM RoleBean WHERE account = :id";
		String hql2 = "UPDATE RoleBean SET signTrip = :st WHERE account = :id";
		Session session = factory.getCurrentSession();
		Integer time = null;
		try{
			time = ((Integer) session.createQuery(hql1).setParameter("id", account).getSingleResult())+1;
		}catch(Exception e) {
			;
		}
		session.createQuery(hql2).setParameter("st", time)
												.setParameter("id", account)
												.executeUpdate();
	}

	@Override
	public void updatePost(String account) {
		String hql1 = "SELECT postType FROM RoleBean WHERE account = :id";
		String hql2 = "UPDATE RoleBean SET postTrip = :pt WHERE account = :id";
		Session session = factory.getCurrentSession();
		Integer time = null;
		try{
			time = ((Integer) session.createQuery(hql1).setParameter("id", account).getSingleResult())+1;
		}catch(Exception e) {
			;
		}
		session.createQuery(hql2).setParameter("pt", time)
												.setParameter("id", account)
												.executeUpdate();
	}

	@Override
	public void updateFinish(String account) {
		String hql1 = "SELECT finishType FROM RoleBean WHERE account = :id";
		String hql2 = "UPDATE RoleBean SET finishType = :ft WHERE account = :id";
		Session session = factory.getCurrentSession();
		Integer time = null;
		try{
			time = ((Integer) session.createQuery(hql1).setParameter("id", account).getSingleResult())+1;
		}catch(Exception e) {
			;
		}
		session.createQuery(hql2).setParameter("ft", time)
												.setParameter("id", account)
												.executeUpdate();

	}
	
	@SuppressWarnings("unchecked")
	@Override
	public List<MemberBean> getPair(String pair, String account) {
		String hql1 = "SELECT "+pair+" FROM MemberBean WHERE account = :id";
		Session session = factory.getCurrentSession();
		String val = "";
		try {
			val = (String) session.createQuery(hql1).setParameter("id", account).getSingleResult();
		}catch(Exception e) {
			;
		}
		
		String hql2 = "";
		List<MemberBean> mbl = null;
		if(!pair.equals("all")) {
			hql2 = "FROM MemberBean WHERE "+pair+" = :p";
			mbl = session.createQuery(hql2).setParameter("p", val).getResultList();
		}else {
			hql2 = "FROM MemberBean";
			mbl = session.createQuery(hql2).getResultList();
		}
		if(mbl!=null) {
			return mbl;
		}else {
			return null;
		}
	}


	@Override
	public List<ActivityFollowedBean> getFollowedActivity(Integer memberNo) {
		Session session = factory.getCurrentSession();
		String hql = "FROM ActivityFollowedBean WHERE memberNo = :no";
		@SuppressWarnings("unchecked")
		List<ActivityFollowedBean> urls = session.createQuery(hql).setParameter("no", memberNo).getResultList();
		return urls;
	}

	@Override
	public List<ActivityJoinedBean> getJoinedActivity(Integer memberNo) {
		Session session = factory.getCurrentSession();
		String hql = "FROM ActivityJoinedBean WHERE memberNo = :no";
		@SuppressWarnings("unchecked")
		List<ActivityJoinedBean> list = session.createQuery(hql).setParameter("no", memberNo).getResultList();
		return list;
	}

	@Override
	public List<MessageBean> getAllMsg(String account){
		Session session = factory.getCurrentSession();
		String hql = "FROM MessageBean WHERE account = :id ORDER BY readStatus ASC , time DESC";
		@SuppressWarnings("unchecked")
		List<MessageBean> list = session.createQuery(hql).setParameter("id", account).getResultList();
		System.out.println("id=======>"+account);
		return list;
	}
	
	@Override
	public boolean checkStatus(String account) {
		Session session = factory.getCurrentSession();
		String hql = "FROM MessageBean WHERE account = :id and readStatus = :status";
		@SuppressWarnings("unchecked")
		List<MessageBean> list = session.createQuery(hql).setParameter("id", account)
														.setParameter("status", 0).getResultList();
		if(list.size()>0) {
			return true;
		}else
			return false;
	}
	
	@Override
	public MessageBean getMsg(int msgNo) {
		Session session = factory.getCurrentSession();
		String hql = "FROM MessageBean WHERE msgNo = :no";
		MessageBean mb = null;
		try {
			mb = (MessageBean) session.createQuery(hql).setParameter("no", msgNo).getSingleResult();
		}catch(Exception e) {
			;
		}
		return mb;
	}
	
	@Override
	public void sendMsg(MessageBean mb) {
		Session session = factory.getCurrentSession();
		session.save(mb);
	}
	
	@Override
	public void readMsg(int msgNo) {
		Session session = factory.getCurrentSession();
		String hql = "UPDATE MessageBean SET readStatus = :status WHERE msgNo = :no";
		session.createQuery(hql).setParameter("status", 1).setParameter("no", msgNo).executeUpdate();
	}
	
	@Override
	public void delMsg(int msgNo) {
		Session session = factory.getCurrentSession();
		String hql = "DELETE FROM MessageBean WHERE msgNo = :no";
		session.createQuery(hql).setParameter("no", msgNo).executeUpdate();
	}
	
	@Override
    public OrderBean createOrder(Integer memberNo, OrderBean order) {
        Session session = factory.getCurrentSession();
        int i = (int) (new Date().getTime()/1000);
        String orderNo = "J"+ Integer.toString(i);
        order.setOrderNo(orderNo);
        order.setMemberBean(session.get(MemberBean.class,memberNo));
        session.save(order);
        
        String hql = "FROM OrderBean where orderNo = :no";
        OrderBean thisorder = (OrderBean) session.createQuery(hql).setParameter("no", orderNo).getSingleResult();
        return thisorder;
        
    }
	
	@Override
	public Integer checkType2Back(String account) {
		Session session = factory.getCurrentSession();
		String hql = "SELECT accountType FROM RoleBean WHERE account = :id";
		Integer result = null;
		try {
			result = (Integer) session.createQuery(hql).setParameter("id", account).getSingleResult();
		}catch(Exception e) {
			;
		}
		return result;
	}
	
	@Override
	public void changeType2Back(String account, int type) {
		Session session = factory.getCurrentSession();
		String hql = "UPDATE RoleBean SET accountType = :type WHERE account = :id ";
		session.createQuery(hql).setParameter("type", type).setParameter("id", account).executeUpdate();
	}

	//---------------------------------------------▼好友功能▼---------------------------------------------//		
	
			public List<String> getFriendListA(String account){
				Session session = factory.getCurrentSession();
				String hql = "SELECT accountTwo FROM FriendBean WHERE accountOne = :id";
				@SuppressWarnings("unchecked")
				List<String> friend = (List<String>) session.createQuery(hql).setParameter("id", account);
				return friend;
			}

			public List<String> getFriendListB(String account){
				Session session = factory.getCurrentSession();
				String hql = "SELECT accountOne FROM FriendBean WHERE accountTwo = :id";
				@SuppressWarnings("unchecked")
				List<String> friend = (List<String>) session.createQuery(hql).setParameter("id", account);
				return friend;
			}
			public boolean hostAndFriend() {
				
			}

			public boolean friendPostReady() {
				
			}
			
			public void friendWithMe() {
				
			}
				
			public Integer friendStatus() {
				
			}
			
			public void changeStatus() {
				
			}
				//更改交友狀態
	
	
}
