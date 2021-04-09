package com.gada.travelgada.service;

import javax.servlet.annotation.WebListener;

import javax.servlet.http.HttpSessionEvent;
import javax.servlet.http.HttpSessionListener;

import lombok.extern.slf4j.Slf4j;

@Slf4j
@WebListener
public class UserCounter implements HttpSessionListener {

	@Override
    public void sessionCreated(HttpSessionEvent se)  {
		VisitorDao dao = new VisitorDao();

        log.info("===============================================================================");
        log.info("세션이 생성 되었습니다." + se.getSession().getId());
        
        //DB에 넣어주는 서비스 호출
        dao.setCount();
        
    }
 
	@Override
    public void sessionDestroyed(HttpSessionEvent se)  {
  
        log.info("===============================================================================");
        log.info("세션이 종료 되었습니다." + se.getSession().getId());
        
    }
     
}