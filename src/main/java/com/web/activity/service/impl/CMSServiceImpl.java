package com.web.activity.service.impl;

import java.util.List;
import java.util.Map;

//import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.web.activity.dao.CMSDao;
import com.web.activity.model.ActivityBean;
import com.web.activity.model.MemberBean;
import com.web.activity.model.Menubean;
import com.web.activity.model.OrderBean;
import com.web.activity.model.RoleBean;
import com.web.activity.model.RoleCheckBean;
import com.web.activity.model.RoleSaveBean;
import com.web.activity.model.SystemLog;
import com.web.activity.service.CMSService;

@Transactional
@Service
public class CMSServiceImpl implements CMSService {

	@Autowired
	CMSDao dao;

	
	//<活動部分>
		@Override
		public List<ActivityBean> selectAllActivities() {
			return dao.selectAllActivities();
		}
		
	//左邊標頭
		@Override
		public List<Menubean>  getMenuName(String classId){ 
		return dao.getMenuName(classId);}
		//權限設定	
		@Override
		public List<Menubean> rights() {
			return dao.rights();
		}
		//下拉式選單管理員選擇
		@Override
		public List<RoleCheckBean> checkRole() {
			
			return dao.checkRole();
		}
		//下拉式選單取管理員的值
		@Override
		public List<RoleSaveBean> selectRole() {
			
			return dao.saveRsb();
		}
		//存節點和人員
		public void  saveRsb(String roleId, String ztreeSave){
			String[] tokens = ztreeSave.split(",");
			for (String token:tokens) {
				   System.out.println(token);
				   dao.saveRsb(roleId,token);
				 }if(roleId != null && !roleId.equals("")){
						
				 }
		}	
		@Override
		public List<Integer> forRoleRight(int rsbList){
			return dao.forRoleRight(rsbList);		
		}
		
		//關鍵字查詢
		@Override
		public List<ActivityBean> selectActivities(String keyWord) {
			return dao.selectActivities(keyWord);
		}
		
		//單獨更新activityStatus
			@Override
		public int updateActivityStatus(String activityStatus,String activityNo) {
			return dao.updateActivityStatus(activityStatus,activityNo);
			}

		@Override
		public List<ActivityBean> selectAllActivitiesAtive() {
			return dao.selectAllActivitiesAtive();
		}

		@Override
		public List<ActivityBean> selectAllActivitiesInAtive() {
			return dao.selectAllActivitiesInAtive();
		}
	
	
	
	
	
	//==========訂單==============================================================	
		
		@Override
		public List<OrderBean> selectAllOrder() {
			return dao.selectAllOrder();
		}
	
	
	
	
	
	
	//========================================================================	
	
	
	//圖表製作
	@Override
	public Map<String, Long> getGenderCounts() {
		return dao.getGenderCounts();
	}

	@Override
	public Map<String, Long> getActiveLocation() {
		return dao.getActiveLocation();

	}

	public Map<String, Long> getActivityProv(){
		return dao.getActivityProv();
	}
	
	
	@Override
	public Map<String, Long> getstarSignCounts(){
		return dao.getstarSignCounts();
	}
	
	
	
	
	
	
	
//========================================================================	
	//<會員部分>
	public List<MemberBean> selectAllMembers(){
		return dao.selectAllMembers();
	}
	public List<RoleBean> selectAllRoles(){
		return dao.selectAllRoles();
	}
	
	@Transactional
	@Override
	public void updateRole(RoleBean RoleB) {
		dao.updateRole(RoleB);
//		System.out.println("ro="+ro);
	}
	@Override
	public RoleBean getRole(Integer roleNo) {
		return dao.getRole(roleNo);
	}
	@Override
	public List<SystemLog> selectSystemLog(){
		return dao.selectSystemLog();
	}
	
	
	//角色關鍵字查詢
		@Override
		public List<RoleBean> selectRoles(String keyWord) {
			return dao.selectRoles(keyWord);
		}
	

}
