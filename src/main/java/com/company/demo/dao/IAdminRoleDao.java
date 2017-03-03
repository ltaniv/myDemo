package com.company.demo.dao;

import com.company.demo.pojo.AdminRole;
import org.apache.ibatis.annotations.Param;

import java.util.List;

public interface IAdminRoleDao {

	/**
	 * @return
	 */
	List<AdminRole> findAll();
	
	/**
	 * @param id
	 * @return
	 */
	AdminRole findById(@Param("id") String id);
	
	/**
	 * @param roleName
	 * @return
	 */
	AdminRole findByRoleName(@Param("roleName") String roleName);
	
	/**
	 * @param adminRole
	 */
	void save(AdminRole adminRole);
	
	/**
	 * @param id
	 * @return
	 */
	int delete(@Param("id") String id);
	
	/**
	 * @param adminRole
	 * @return
	 */
	int update(AdminRole adminRole);
	
}
