package com.douzone.config.web;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.context.annotation.Bean;
import org.springframework.context.annotation.Configuration;
import org.springframework.context.annotation.PropertySource;
import org.springframework.core.env.Environment;
import org.springframework.web.multipart.commons.CommonsMultipartResolver;
import org.springframework.web.servlet.config.annotation.ResourceHandlerRegistry;
import org.springframework.web.servlet.config.annotation.WebMvcConfigurerAdapter;

@Configuration
@PropertySource("classpath:com/douzone/config/web/properties/multipart.properties")
public class FileUploadConfig extends WebMvcConfigurerAdapter{
	@Autowired
	private Environment env;
	
	//multipart resolver
	@Bean
	public CommonsMultipartResolver multipartResolver() {
		CommonsMultipartResolver multipartResolver = new CommonsMultipartResolver();
		multipartResolver.setMaxUploadSize(env.getProperty("multipart.maxUploadSize", Long.class));
		multipartResolver.setMaxInMemorySize(env.getProperty("multipart.maxInMemorySize", Integer.class));
		multipartResolver.setDefaultEncoding(env.getProperty("multipart.defaultEncoding"));
		return multipartResolver;
	}
	
	// resources mapping to url
	@Override
	public void addResourceHandlers(ResourceHandlerRegistry registry) {
		registry.addResourceHandler("/up/images/**").addResourceLocations("file:/uploads/");
	}
}
