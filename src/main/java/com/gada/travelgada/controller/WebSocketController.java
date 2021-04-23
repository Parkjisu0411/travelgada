package com.gada.travelgada.controller;

import java.util.HashSet;
import java.util.Set;

import org.springframework.security.core.annotation.AuthenticationPrincipal;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RestController;
import org.springframework.web.servlet.ModelAndView;

import com.gada.travelgada.domain.MemberDetails;

import lombok.extern.slf4j.Slf4j;

@RestController
@Slf4j
public class WebSocketController {
	
	private Set<String> roomList = new HashSet<String>();
	
	@GetMapping("/chat")
	public ModelAndView chatUser(ModelAndView modelAndView) {
		modelAndView.setViewName("/chat/chat_user");
		return modelAndView;
	}
	
    @GetMapping("/chat/{username}")
    public ModelAndView chat(ModelAndView modelAndView, @PathVariable("username") String username) {
    	log.info("========================= " + username + "의 채팅방에 입장했습니다.");
    	modelAndView.addObject("username", username);
    	modelAndView.setViewName("/chat/chat_admin");
    	return modelAndView;
    }
    
    @GetMapping("/admin/room")
    public ModelAndView room(ModelAndView modelAndView) {
    	log.info("========================= 현재 채팅방의 수 : " + String.valueOf(roomList.size()));
    	modelAndView.addObject("roomList", roomList);
    	modelAndView.setViewName("/admin/room");
    	return modelAndView;
    }
    
    @GetMapping("room/list")
    public Set<String> getRoomList() {
    	return roomList;
    }
    
    @PostMapping("/room")
    public Set<String> createRoom(@AuthenticationPrincipal MemberDetails memberDetails) {
    	String username = memberDetails.getUsername();
		
		roomList.add(username);
		
		return roomList;
    }
}
