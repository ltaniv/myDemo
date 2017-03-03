package com.company.demo.pojo;

import java.util.ArrayList;
import java.util.List;

public class ProjectModule implements java.io.Serializable {

	private static final long serialVersionUID = 1L;
	
	// Fields
	private Integer id;
	private String moduleName;
	private String alias;
	private String icon;
	private String href;
	private Integer parentId;
	private String rank;
	
	private List<ProjectModule> projectModules = new ArrayList<ProjectModule>();

	

	// Constructors
	/** default constructor */
	public ProjectModule() {
	}

	/** minimal constructor */
	public ProjectModule(String moduleName, String href, String rank) {
		this.moduleName = moduleName;
		this.href = href;
		this.rank = rank;
	}

	/** full constructor */
	public ProjectModule(String moduleName, String alias, String href, Integer parentId, String rank/*, Set<AdminAccredit> adminAccredits*/) {
		this.moduleName = moduleName;
		this.alias = alias;
		this.href = href;
		this.parentId = parentId;
		this.rank = rank;
		/*this.adminAccredits = adminAccredits;*/
	}

	// Property accessors
	public Integer getId() {
		return this.id;
	}
	public void setId(Integer id) {
		this.id = id;
	}


	public String getModuleName() {
		return this.moduleName;
	}
	public void setModuleName(String moduleName) {
		this.moduleName = moduleName;
	}

	public String getIcon() {
		return icon;
	}
	public void setIcon(String icon) {
		this.icon = icon;
	}
	
	public String getAlias() {
		return this.alias;
	}
	public void setAlias(String alias) {
		this.alias = alias;
	}

	public String getHref() {
		return this.href;
	}
	public void setHref(String href) {
		this.href = href;
	}

	public Integer getParentId() {
		return this.parentId;
	}
	public void setParentId(Integer parentId) {
		this.parentId = parentId;
	}

	public String getRank() {
		return this.rank;
	}
	public void setRank(String rank) {
		this.rank = rank;
	}
	
	public List<ProjectModule> getProjectModules() {
		return projectModules;
	}

	public void setProjectModules(List<ProjectModule> projectModules) {
		this.projectModules = projectModules;
	}

/*	@OneToMany(cascade = CascadeType.ALL, fetch = FetchType.LAZY, mappedBy = "projectModule")
	public Set<AdminAccredit> getAdminAccredits() {
		return this.adminAccredits;
	}

	public void setAdminAccredits(Set<AdminAccredit> adminAccredits) {
		this.adminAccredits = adminAccredits;
	}*/

}