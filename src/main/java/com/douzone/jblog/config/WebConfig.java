package com.douzone.jblog.config;

import org.springframework.context.annotation.ComponentScan;
import org.springframework.context.annotation.Configuration;
import org.springframework.context.annotation.Import;
import org.springframework.web.servlet.config.annotation.EnableWebMvc;

import com.douzone.config.web.FileUploadConfig;
import com.douzone.config.web.MVCConfig;
import com.douzone.config.web.MessageConfig;
import com.douzone.config.web.SecurityConfig;

@Configuration
@EnableWebMvc
@ComponentScan(value= {"com.douzone.jblog.controller"})
@Import(value= {MVCConfig.class, MessageConfig.class, SecurityConfig.class, FileUploadConfig.class})
public class WebConfig {
	
}
