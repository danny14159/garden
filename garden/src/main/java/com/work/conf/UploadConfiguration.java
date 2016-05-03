package com.work.conf;

import org.springframework.boot.autoconfigure.condition.ConditionalOnMissingBean;
import org.springframework.boot.bind.RelaxedPropertyResolver;
import org.springframework.context.EnvironmentAware;
import org.springframework.context.annotation.Bean;
import org.springframework.context.annotation.Configuration;
import org.springframework.core.env.Environment;
import org.springframework.web.multipart.commons.CommonsMultipartResolver;

//@Configuration
public class UploadConfiguration  implements EnvironmentAware{

	private RelaxedPropertyResolver propertyResolver;
	
	public void setEnvironment(Environment environment) {
		
		this.propertyResolver = new RelaxedPropertyResolver(environment, "upload.");
	}

	@Bean()
	@ConditionalOnMissingBean
	public CommonsMultipartResolver multipartResolver(){
		CommonsMultipartResolver resolver = new CommonsMultipartResolver();
		resolver.setDefaultEncoding(propertyResolver.getProperty("defaultEncoding"));
		resolver.setMaxUploadSize(propertyResolver.getProperty("maxUploadSize",long.class));
		
		return resolver;
	}
}
