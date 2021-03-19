package com.gada.travelgada.configurer;

import org.springframework.context.annotation.Bean;
import org.springframework.context.annotation.Configuration;
import org.springframework.security.config.annotation.web.configuration.EnableWebSecurity;
import org.springframework.web.multipart.MultipartResolver;
import org.springframework.web.multipart.commons.CommonsMultipartResolver;
import lombok.AllArgsConstructor;

@Configuration
@EnableWebSecurity
@AllArgsConstructor
public class diaryConfig {
	
	@Bean(name = "multipartResolver") 
	public MultipartResolver multipartResolver() { 
			return new CommonsMultipartResolver(); 
		}



}
