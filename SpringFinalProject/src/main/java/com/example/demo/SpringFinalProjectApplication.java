package com.example.demo;

import org.mybatis.spring.annotation.MapperScan;
import org.springframework.boot.SpringApplication;
import org.springframework.boot.autoconfigure.SpringBootApplication;
import org.springframework.context.annotation.ComponentScan;

@SpringBootApplication
@ComponentScan({"boot.sist.*","com.example.demo"})
@MapperScan("boot.sist.*")
public class SpringFinalProjectApplication {

	public static void main(String[] args) {
		SpringApplication.run(SpringFinalProjectApplication.class, args);
	}

}
