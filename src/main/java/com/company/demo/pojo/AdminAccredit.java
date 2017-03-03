package com.company.demo.pojo;

public class AdminAccredit implements java.io.Serializable {

	private static final long serialVersionUID = 1L;
	
	// Fields
	private String roleId;
	private Integer projectModuleId;

	private ProjectModule projectModule;

	// Constructors

	/** default constructor */
	public AdminAccredit() {
	}


	/** full constructor */
	public AdminAccredit(String roleId,Integer projectModuleId) {
		this.roleId = roleId;
		this.projectModuleId = projectModuleId;
	}


	public String getRoleId() {
		return this.roleId;
	}
	public void setRoleId(String roleId) {
		this.roleId = roleId;
	}
	
	public Integer getProjectModuleId() {
		return projectModuleId;
	}
	public void setProjectModuleId(Integer projectModuleId) {
		this.projectModuleId = projectModuleId;
	}

	public ProjectModule getProjectModule() {
		return this.projectModule;
	}
	public void setProjectModule(ProjectModule projectModule) {
		this.projectModule = projectModule;
	}

}