package org.asgardtime.rezume.config;

import java.util.List;

import org.springframework.context.annotation.Bean;
import org.springframework.context.annotation.Configuration;

import io.swagger.v3.oas.models.servers.Server;
import io.swagger.v3.oas.models.OpenAPI;

@Configuration
public class SwaggerConfig {
     @Bean
     public OpenAPI api() {
        return new OpenAPI().servers(List.of(new Server().url("http://localhost:8080")));
    }
}
