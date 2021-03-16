package com.gada.travelgada.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
public class HomeController {

   @RequestMapping("/")
   public String Home() {
      return "member/home";      // 리턴값을 body로 가져다 직접 출력하는 것임.
   }                              // 따라서 view가 없어도 출력됨.
}