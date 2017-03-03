package com.company.demo.dao;

import com.company.demo.pojo.AdminAccredit;
import org.apache.ibatis.annotations.Param;

import java.util.List;


public interface IAdminAccreditDao {

	List<AdminAccredit> findRootByRoleId(@Param("roleId") String roleId);
	
}
