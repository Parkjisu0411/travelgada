package com.gada.travelgada.configurer;

import org.springframework.boot.web.servlet.FilterRegistrationBean;
import org.springframework.context.annotation.Bean;
import org.springframework.context.annotation.Configuration;
import org.springframework.security.config.annotation.web.configuration.EnableWebSecurity;
import org.springframework.web.multipart.MultipartResolver;
import org.springframework.web.multipart.commons.CommonsMultipartResolver;
import org.springframework.web.multipart.support.MultipartFilter;
import org.springframework.web.servlet.config.annotation.ResourceHandlerRegistry;
import org.springframework.web.servlet.config.annotation.WebMvcConfigurer;

import lombok.AllArgsConstructor;

@Configuration
@EnableWebSecurity
@AllArgsConstructor
public class CKeditorConfig implements WebMvcConfigurer {
	
    @Override
    public void addResourceHandlers(ResourceHandlerRegistry registry) {
    	 // /ckUpload/** 은 /resources/ckUpload/ 으로 시작하는 uri호출은 /resources/ckUpload/ 경로 하위에 있는 리소스 파일이다 라는 의미입니다.
        registry.addResourceHandler("/ckUpload/**")
				.addResourceLocations("/resources/img/CKeditor/");
        
        //다른 이미지 업로드를 위한 경로
//        registry.addResourceHandler("/images/**")
//        		.addResourceLocations("/resources/images/");
//        registry.addResourceHandler("/ckUpload/**")
//				.addResourceLocations("/resources/ckUpload/");
    }
}