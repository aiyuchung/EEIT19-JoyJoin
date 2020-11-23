package com.web.activity.model;

import javax.persistence.Entity;
import javax.persistence.Id;
import javax.persistence.Table;

@Entity
@Table(name="RoleCheckBean")
public class RoleCheckBean implements java.io.Serializable{
	private static final long serialVersionUID = 1L;
	
	@Id
	private Integer id;
	private	Integer roleId;
	private	String roleName;
	
	public Integer getId() {
		return id;
	}
	public void setId(Integer id) {
		this.id = id;
	}
	public Integer getRoleId() {
		return roleId;
	}
	public void setRoleId(Integer roleId) {
		this.roleId = roleId;
	}
	public String getRoleName() {
		return roleName;
	}
	public void setRoleName(String roleName) {
		this.roleName = roleName;
	}
		
}
