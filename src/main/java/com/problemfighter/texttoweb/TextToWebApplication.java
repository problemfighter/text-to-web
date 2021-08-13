package com.problemfighter.texttoweb;

import org.springframework.boot.SpringApplication;
import org.springframework.boot.autoconfigure.SpringBootApplication;
import org.springframework.web.servlet.config.annotation.ResourceHandlerRegistry;
import org.springframework.web.servlet.config.annotation.WebMvcConfigurer;

@SpringBootApplication
public class TextToWebApplication implements WebMvcConfigurer  {

	@Override
	public void addResourceHandlers(ResourceHandlerRegistry registry) {
		registry
				.addResourceHandler("/internal-asset/**")
				.addResourceLocations(
						"classpath:/internal-asset/"
				);
	}

	public static void main(String[] args) {
		SpringApplication.run(TextToWebApplication.class, args);
	}

}
