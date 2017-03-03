package com.company.demo.pojo;

import java.util.ArrayList;
import java.util.List;

public class AdminRole implements java.io.Serializable {

	private static final long serialVersionUID = 1L;
	
	// Fields
	private String id;
	private String roleName;
	private String remark;

	private List<AdminAccredit> adminAccredits = new ArrayList<AdminAccredit>();

	// Constructors

	/** default constructor */
	public AdminRole() {
	}

	/** minimal constructor */
	public AdminRole(String id, String roleName) {
		this.id = id;
		this.roleName = roleName;
	}

	/** full constructor */
	public AdminRole(String id, String roleName,List<AdminAccredit> adminAccredits) {
		this.id = id;
		this.roleName = roleName;
		this.adminAccredits = adminAccredits;
	}

	public String getId() {
		return this.id;
	}
	public void setId(String id) {
		this.id = id;
	}

	public String getRoleName() {
		return this.roleName;
	}
	public void setRoleName(String roleName) {
		this.roleName = roleName;
	}

	public String getRemark() {
		return remark;
	}

	public void setRemark(String remark) {
		this.remark = remark;
	}

	public List<AdminAccredit> getAdminAccredits() {
		return this.adminAccredits;
	}
	public void setAdminAccredits(List<AdminAccredit> adminAccredits) {
		this.adminAccredits = adminAccredits;
	}

}