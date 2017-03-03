package com.company.demo.pojo;

import org.hibernate.validator.constraints.Length;
import org.hibernate.validator.constraints.NotBlank;

import javax.validation.GroupSequence;
import java.util.Date;

public class Admin implements java.io.Serializable {

	private static final long serialVersionUID = 1L;
	
	public interface JsonToSimple{};
	
	public interface One{}
	public interface Two{}
	@GroupSequence(value={One.class,Two.class})
	public interface GroupChecks{};
	
	// Fields
	private Integer id;
	private String roleId;
	@NotBlank(groups={One.class})
	private String account;
	@NotBlank(groups={One.class})
	@Length(min=6,max=30,groups={Two.class})
	private String password;
	private String realName;
	private Boolean sex;
	private Date birthday;
	private Date inputTime;
	private Boolean online;
	private Boolean enabled;
	private String explain;
	
	private AdminRole adminRole;
	
	
	/*private Set<Building> buildingsForPublishUserId = new HashSet<Building>(0);
	private Set<Building> buildingsForLastUpdateUserId = new HashSet<Building>(0);
	private Set<Housing> housingsForPublishUserId = new HashSet<Housing>(0);
	private Set<Housing> housingsForLastUpdateUserId = new HashSet<Housing>(0);
	private Set<HouseSell> houseSells = new HashSet<HouseSell>(0);
	private Set<HouseRent> houseRents = new HashSet<HouseRent>(0);*/

	// Constructors

	/** default constructor */
	public Admin() {
	}

	/** minimal constructor */
	public Admin(AdminRole adminRole, String account, String password, Date inputTime, Boolean online, Boolean enabled) {
		this.adminRole = adminRole;
		this.account = account;
		this.password = password;
		this.inputTime = inputTime;
		this.online = online;
		this.enabled = enabled;
	}

	/** full constructor */
	public Admin(AdminRole adminRole, String account, String password, String realName, Boolean sex, Date birthday, Date inputTime, Boolean online, Boolean enabled, String explain/*,
			Set<Building> buildingsForPublishUserId, Set<Building> buildingsForLastUpdateUserId, Set<Housing> housingsForPublishUserId, Set<Housing> housingsForLastUpdateUserId,
			Set<HouseSell> houseSells, Set<HouseRent> houseRents*/) {
		this.adminRole = adminRole;
		this.account = account;
		this.password = password;
		this.realName = realName;
		this.sex = sex;
		this.birthday = birthday;
		this.inputTime = inputTime;
		this.online = online;
		this.enabled = enabled;
		this.explain = explain;
		/*this.buildingsForPublishUserId = buildingsForPublishUserId;
		this.buildingsForLastUpdateUserId = buildingsForLastUpdateUserId;
		this.housingsForPublishUserId = housingsForPublishUserId;
		this.housingsForLastUpdateUserId = housingsForLastUpdateUserId;
		this.houseSells = houseSells;
		this.houseRents = houseRents;*/
	}

	public Integer getId() {
		return this.id;
	}
	public void setId(Integer id) {
		this.id = id;
	}

	public String getRoleId() {
		return roleId;
	}
	public void setRoleId(String roleId) {
		this.roleId = roleId;
	}
	
	public AdminRole getAdminRole() {
		return this.adminRole;
	}

	public void setAdminRole(AdminRole adminRole) {
		this.adminRole = adminRole;
	}


	public String getAccount() {
		return this.account;
	}
	public void setAccount(String account) {
		this.account = account;
	}

	public String getPassword() {
		return this.password;
	}
	public void setPassword(String password) {
		this.password = password;
	}

	public String getRealName() {
		return this.realName;
	}
	public void setRealName(String realName) {
		this.realName = realName;
	}

	public Boolean getSex() {
		return this.sex;
	}
	public void setSex(Boolean sex) {
		this.sex = sex;
	}

	public Date getBirthday() {
		return this.birthday;
	}
	public void setBirthday(Date birthday) {
		this.birthday = birthday;
	}


	public Date getInputTime() {
		return this.inputTime;
	}
	public void setInputTime(Date inputTime) {
		this.inputTime = inputTime;
	}

	public Boolean getOnline() {
		return this.online;
	}
	public void setOnline(Boolean online) {
		this.online = online;
	}

	public Boolean getEnabled() {
		return this.enabled;
	}

	public void setEnabled(Boolean enabled) {
		this.enabled = enabled;
	}
	public String getExplain() {
		return this.explain;
	}

	public void setExplain(String explain) {
		this.explain = explain;
	}
/*
	@OneToMany(cascade = CascadeType.ALL, fetch = FetchType.LAZY, mappedBy = "adminByPublishUserId")
	public Set<Building> getBuildingsForPublishUserId() {
		return this.buildingsForPublishUserId;
	}

	public void setBuildingsForPublishUserId(Set<Building> buildingsForPublishUserId) {
		this.buildingsForPublishUserId = buildingsForPublishUserId;
	}

	@OneToMany(cascade = CascadeType.ALL, fetch = FetchType.LAZY, mappedBy = "adminByLastUpdateUserId")
	public Set<Building> getBuildingsForLastUpdateUserId() {
		return this.buildingsForLastUpdateUserId;
	}

	public void setBuildingsForLastUpdateUserId(Set<Building> buildingsForLastUpdateUserId) {
		this.buildingsForLastUpdateUserId = buildingsForLastUpdateUserId;
	}

	@OneToMany(cascade = CascadeType.ALL, fetch = FetchType.LAZY, mappedBy = "adminByPublishUserId")
	public Set<Housing> getHousingsForPublishUserId() {
		return this.housingsForPublishUserId;
	}

	public void setHousingsForPublishUserId(Set<Housing> housingsForPublishUserId) {
		this.housingsForPublishUserId = housingsForPublishUserId;
	}

	@OneToMany(cascade = CascadeType.ALL, fetch = FetchType.LAZY, mappedBy = "adminByLastUpdateUserId")
	public Set<Housing> getHousingsForLastUpdateUserId() {
		return this.housingsForLastUpdateUserId;
	}

	public void setHousingsForLastUpdateUserId(Set<Housing> housingsForLastUpdateUserId) {
		this.housingsForLastUpdateUserId = housingsForLastUpdateUserId;
	}

	@OneToMany(cascade = CascadeType.ALL, fetch = FetchType.LAZY, mappedBy = "admin")
	public Set<HouseSell> getHouseSells() {
		return this.houseSells;
	}

	public void setHouseSells(Set<HouseSell> houseSells) {
		this.houseSells = houseSells;
	}

	@OneToMany(cascade = CascadeType.ALL, fetch = FetchType.LAZY, mappedBy = "admin")
	public Set<HouseRent> getHouseRents() {
		return this.houseRents;
	}

	public void setHouseRents(Set<HouseRent> houseRents) {
		this.houseRents = houseRents;
	}*/

}