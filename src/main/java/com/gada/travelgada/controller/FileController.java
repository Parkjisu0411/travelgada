package com.gada.travelgada.controller;

import java.io.File;

import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.security.core.annotation.AuthenticationPrincipal;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.RestController;
import org.springframework.web.multipart.MultipartFile;

import com.gada.travelgada.domain.MemberDetails;

import lombok.AllArgsConstructor;
import lombok.extern.slf4j.Slf4j;

@RestController
@AllArgsConstructor
@Slf4j
public class FileController {

	private static final String FILE_PROFILE_PATH = "/Users/parkjisu/git/travelgada/src/main/webapp/resources/img/profile";

	@PostMapping("/file/profile")
	public ResponseEntity<String> uploadProfile(@RequestParam("uploadfile") MultipartFile file, @AuthenticationPrincipal MemberDetails memberDetails) {
		ResponseEntity<String> entity = null;
		
		String member_id = memberDetails.getUsername();
		String profile_img_path = member_id;
		log.info("Profile Path : " + profile_img_path);
		try {
			if (!file.getOriginalFilename().isEmpty()) {
				file.transferTo(new File(FILE_PROFILE_PATH, profile_img_path));
				entity = new ResponseEntity<String>(profile_img_path, HttpStatus.OK);
			} else {
				entity = new ResponseEntity<String>(profile_img_path, HttpStatus.OK);
			}
			memberDetails.setProfile(profile_img_path);
		} catch (Exception e) {
			e.printStackTrace();
			entity = new ResponseEntity<String>(e.getMessage(), HttpStatus.BAD_REQUEST);
		}
		return entity;
	}
}
