package com.ch.s1.config;

import java.util.Locale;

import org.springframework.context.annotation.Bean;
import org.springframework.context.annotation.Configuration;
import org.springframework.web.servlet.LocaleResolver;
import org.springframework.web.servlet.config.annotation.InterceptorRegistry;
import org.springframework.web.servlet.config.annotation.WebMvcConfigurer;
import org.springframework.web.servlet.i18n.CookieLocaleResolver;
import org.springframework.web.servlet.i18n.LocaleChangeInterceptor;
import org.springframework.web.servlet.i18n.SessionLocaleResolver;

@Configuration //설정파일이라는 의미의 어노테이션
public class MessageLocaleConfig implements WebMvcConfigurer{
	
	@Bean
	public LocaleResolver localeResolver() {
		
		//session
		SessionLocaleResolver sessionLocaleResolver = new SessionLocaleResolver();
		//기본값 한국어
		sessionLocaleResolver.setDefaultLocale(Locale.KOREAN);
		
		//cookie
		CookieLocaleResolver cookieLocaleResolver = new CookieLocaleResolver();
		cookieLocaleResolver.setDefaultLocale(Locale.KOREAN);
		
		cookieLocaleResolver.setCookieName("lang");
		
		//return sessionLocaleResolver;
		return cookieLocaleResolver;
	}
	
	//이미 있는 Interceptor class 객체 생성
	@Bean
	public LocaleChangeInterceptor localeChangeInterceptor() {
		LocaleChangeInterceptor localeChangeInterceptor = new LocaleChangeInterceptor();
		//parameter 받아서 언어를 구분\
		//url주소? lang=ko
		localeChangeInterceptor.setParamName("lang");
		
		return localeChangeInterceptor;
	}
	
	// LocaleChangeInterceptor 등록
	@Override
	public void addInterceptors(InterceptorRegistry registry) {
		
		registry.addInterceptor(localeChangeInterceptor())
		.addPathPatterns("/**");
		
		WebMvcConfigurer.super.addInterceptors(registry);
	}
}