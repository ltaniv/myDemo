package com.company.demo.dao;

import com.company.demo.pojo.Admin;
import org.apache.ibatis.annotations.Param;

public interface IAdminDao{

	/** 手机号和密码查询管理员用户
	 * @param account 手机号
	 * @param password 密码
	 * @return
	 */
	Admin findByAccountAndPassword(@Param("account") String account, @Param("password") String password);
	
	/** 新增管理员用户对象
	 * @param admin
	 */
	void save(Admin admin);
	
	/** 由旧密码更新新密码
	 * @param account
	 * @param password
	 * @param newPassword
	 * @return
	 */
	int updatePassword(@Param("account") String account, @Param("password") String password, @Param("newPassword") String newPassword);
	
	/** 删除管理员对象
	 * @param id 对象ID
	 * @return
	 */
	int delete(@Param("id") Integer id);
	
	/** 帐号是否存在
	 * @param account
	 * @return
	 */
	Boolean isExist(@Param("account") String account);
	
}