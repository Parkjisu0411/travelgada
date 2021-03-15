package com.gada.travelgada.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;

import lombok.AllArgsConstructor;
import lombok.extern.slf4j.Slf4j;

@Controller
@Slf4j
@AllArgsConstructor
public class LoginController {
	
	   @GetMapping("/login/loginForm")
	   public String loginForm() {
	      log.info("Login Form >>> ");
	      return "login/loginForm";
	   }
	   
	   @GetMapping("/login/user")
	   public String user() {
	      log.info("user Form >>> ");
	      return "login/user";
	   }
	   
	   @GetMapping("/login/admin")
	   public String admin() {
	      log.info("admin Form >>> ");
	      return "login/admin";
	   }
	   
	   @GetMapping("/login/home")
	   public String home() {
	      log.info("home Form >>> ");
	      return "login/home";
	   }
}
