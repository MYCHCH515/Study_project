package com.ch.s1.config;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.context.annotation.Configuration;
import org.springframework.web.servlet.config.annotation.InterceptorRegistry;
import org.springframework.web.servlet.config.annotation.WebMvcConfigurer;

import com.ch.s1.interceptor.AdminInterceptor;
import com.ch.s1.interceptor.MemberLoginInterceptor;
import com.ch.s1.interceptor.NoticeAdminInterceptor;

@Configuration
public class InterceptorConfig implements WebMvcConfigurer{

	@Autowired
	private NoticeAdminInterceptor noticeAdminInterceptor;
	
	@Autowired
	private AdminInterceptor adminInterceptor;
	
	@Autowired
	private MemberLoginInterceptor memberLoginInterceptor;
	
	@Override
	public void addInterceptors(InterceptorRegistry registry) {

		registry.addInterceptor(noticeAdminInterceptor)
		.addPathPatterns("/notice/**")
		.excludePathPatterns("/notice/noticeList")
		.excludePathPatterns("/notice/noticeSelect");
		
		registry.addInterceptor(adminInterceptor)
		.addPathPatterns("/admin/**");
		
		registry.addInterceptor(memberLoginInterceptor)
		.addPathPatterns("/locker/lockerReserveForm")
		.addPathPatterns("/reserve/**")
		.addPathPatterns("/member/**")
		.excludePathPatterns("/member/memberAgree")
		.excludePathPatterns("/member/memberJoin")
		.excludePathPatterns("/member/memberLogin")
		.excludePathPatterns("/member/memberSearchId")
		.excludePathPatterns("/member/memberSearchPw");
		WebMvcConfigurer.super.addInterceptors(registry);
	}
}
