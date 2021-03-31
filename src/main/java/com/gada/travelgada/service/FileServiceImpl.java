package com.gada.travelgada.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.gada.travelgada.mapper.FileMapper;

import lombok.NoArgsConstructor;
import lombok.extern.slf4j.Slf4j;

@Slf4j
@Service
@NoArgsConstructor
public class FileServiceImpl {
	
	@Autowired
	private FileMapper fileMapper;

	public String getNextProfilePath(String member_id) {
		String profilePath = fileMapper.selectProfilePath(member_id);
		System.out.println(profilePath.substring(0, member_id.length()));
		if(profilePath == null || profilePath == "" || !profilePath.substring(0, member_id.length()).equals(member_id)) {
			log.info("profile init =======================");
			profilePath = member_id + "0";
		} else {
			log.info("update profile=======================");
			int index = Integer.parseInt(profilePath.substring(member_id.length(), profilePath.length()));
			index++;
			profilePath = profilePath.substring(0, member_id.length()) + index;
		}
		return profilePath;
	}

}