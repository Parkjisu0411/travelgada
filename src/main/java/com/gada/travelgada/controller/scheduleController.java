package com.gada.travelgada.controller;

import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

@RestController
public class scheduleController {

   @RequestMapping("/schedule")
   public String Home() {
      return "schedule";      // 리턴값을 body로 가져다 직접 출력하는 것임.
   }                              // 따라서 view가 없어도 출력됨.

}