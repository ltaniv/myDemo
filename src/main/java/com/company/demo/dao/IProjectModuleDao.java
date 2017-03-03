package com.company.demo.dao;

import com.company.demo.pojo.ProjectModule;
import org.apache.ibatis.annotations.Param;

import java.util.List;


public interface IProjectModuleDao{

	List<ProjectModule> findByParentId(@Param("id") Integer id);
	
}