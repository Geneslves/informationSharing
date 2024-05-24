package com.ledao;

import org.mybatis.spring.annotation.MapperScan;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.boot.SpringApplication;
import org.springframework.boot.autoconfigure.SpringBootApplication;
import org.springframework.boot.builder.SpringApplicationBuilder;
import org.springframework.boot.web.servlet.support.SpringBootServletInitializer;

/**
 * @author
 */
@SpringBootApplication
@MapperScan("com.ledao.mapper")
public class InformationsharingApplication extends SpringBootServletInitializer {

    private static final Logger logger = LoggerFactory.getLogger(InformationsharingApplication.class);

    public static void main(String[] args) {
        SpringApplication.run(InformationsharingApplication.class, args);
    }

    @Override
    protected SpringApplicationBuilder configure(SpringApplicationBuilder application) {
        return application.sources(InformationsharingApplication.class);
    }

}
