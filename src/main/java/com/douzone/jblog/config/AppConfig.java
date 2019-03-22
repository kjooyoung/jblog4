package com.douzone.jblog.config;

import org.springframework.context.annotation.ComponentScan;
import org.springframework.context.annotation.Configuration;
import org.springframework.context.annotation.Import;
import org.springframework.web.servlet.config.annotation.EnableWebMvc;

import com.douzone.config.app.DBConfig;
import com.douzone.config.app.MyBatisConfig;

@Configuration
@EnableWebMvc
@ComponentScan(value= {"com.douzone.jblog.repository","com.douzone.jblog.service"})
@Import(value= {MyBatisConfig.class, DBConfig.class})
public class AppConfig {

}
