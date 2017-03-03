package com.company.demo.context.spring;

import org.springframework.context.ApplicationContext;
import org.springframework.context.ApplicationListener;
import org.springframework.context.event.ContextRefreshedEvent;
import org.springframework.stereotype.Component;

@Component
public class SpringApplicationListener implements ApplicationListener<ContextRefreshedEvent> {

	public static ApplicationContext ac=null;

	public void onApplicationEvent(ContextRefreshedEvent event) {
		ac = event.getApplicationContext();
		if (ac.getParent() != null) {// root application context 没有parent，他就是老大.
			System.out.println("Spring 初始化完成 ...");

		}
	}
}
