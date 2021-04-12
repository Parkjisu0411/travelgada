package com.gada.travelgada;

import org.springframework.boot.SpringApplication;
import org.springframework.boot.autoconfigure.SpringBootApplication;
import org.springframework.boot.web.servlet.ServletComponentScan;
@SpringBootApplication
@ServletComponentScan
public class TravelgadaApplication {

	public static void main(String[] args) {
		SpringApplication.run(TravelgadaApplication.class, args);
	}

}
