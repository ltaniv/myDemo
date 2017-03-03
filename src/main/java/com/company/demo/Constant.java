package com.company.demo;

public class Constant {

	public final static String URL="http://localhost/demo/index.html";


	public String getUrl() {
		return URL; 
	}
	
	/** 从会话中取验证码的KEY **/
	public final static String SES_CAPTCHA="captcha";
	/** 从会话中取登录用户信息对象的KEY **/
	public final static String SES_KEY = "sesKey";
	/** 从全局对象中取公共信息对象的KEY **/
	public final static String APP_KEY = "appKey";

	/** 密码最大错误次数, 在这之后将被锁定 **/
	public final static int VAL_PWD_LOCK_MAX_ERR = 10;
	/** 密码最大错误次数, 在这之后将会有时间限制 **/
	public final static int VAL_PWD_LIMIT_MAX_ERR = 5;
	/** 密码最大错误次数, 在这之后被提醒剩余次数 **/
	public final static int VAL_PWD_PROMPT_MAX_ERR = 3;
	/** 密码最大错误次数, 在这之后将输入验证码 **/
	public final static int VAL_PWD_CAPTCHA_MAX_ERR = 2;
	/** 密码未被 锁定之前，再次输入密码的间隔时间 **/
	public final static int VAL_PWD_INTERVAL_TIME=5;//5分钟

	
}
