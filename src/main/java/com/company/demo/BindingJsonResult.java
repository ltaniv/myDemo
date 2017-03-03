package com.company.demo;

import com.alibaba.fastjson.JSONObject;
import org.springframework.validation.BeanPropertyBindingResult;
import org.springframework.validation.FieldError;

import java.util.List;
import java.util.Map;

public class BindingJsonResult {

	/**
	 * 失败或成功
	 * 
	 * @param msg
	 *            失败文本信息 或 字段错误JSON对象
	 * @return
	 */
	private static JSONObject fors(boolean fs, Object msg) {
		JSONObject jo = new JSONObject();
		jo.put("success", fs);
		jo.put("msg", msg);
		return jo;
	}

	/**
	 * 字段错误处理 {字段名:错误信息,...}
	 * 
	 * @param model
	 * @param clzs
	 * @return
	 */
	public static JSONObject getFieldError(Map<String, Object> model, Class<?>... clzs) {
		JSONObject json = new JSONObject();
		for (Class<?> c : clzs) {
			String name = c.getSimpleName();
			BeanPropertyBindingResult bpbr = (BeanPropertyBindingResult) model.get("org.springframework.validation.BindingResult." + (name.charAt(0) + "").toLowerCase() + name.substring(1));
			if (bpbr != null) {
				List<FieldError> errors = bpbr.getFieldErrors();
				for (FieldError fe : errors) {
					json.put(fe.getField(), fe.getDefaultMessage());
				}
			}
		}
		return json;
	}

	/**
	 * 成功
	 * 
	 * @param msg
	 * @return
	 */
	public static JSONObject success(Object msg) {
		return fors(true, msg);
	}

	/**
	 * 失败
	 * 
	 * @param msg
	 * @return
	 */
	public static JSONObject fail(Object msg) {
		return fors(false, msg);
	}

}
