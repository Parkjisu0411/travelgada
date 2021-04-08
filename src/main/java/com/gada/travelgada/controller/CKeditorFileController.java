package com.gada.travelgada.controller;

import java.io.ByteArrayOutputStream;
import java.io.File;
import java.io.FileInputStream;
import java.io.FileOutputStream;
import java.io.IOException;
import java.io.OutputStream;
import java.io.PrintWriter;
import java.util.UUID;

import javax.servlet.ServletException;
import javax.servlet.ServletOutputStream;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.RestController;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.multipart.MultipartHttpServletRequest;

import com.gada.travelgada.service.BoardService;

import lombok.AllArgsConstructor;
import lombok.extern.slf4j.Slf4j;

@RestController
@AllArgsConstructor
@Slf4j
public class CKeditorFileController {
	 
	 private BoardService fileService;
	 
	 @RequestMapping(value="/file/ckeditorImageUpload.do", method=RequestMethod.POST)

	 public void ckeditorImageUpload(HttpServletRequest request, HttpServletResponse response, @RequestParam MultipartFile upload) throws     Exception {
	 	response.setCharacterEncoding("UTF-8");

	 	response.setContentType("text/html;charset-utf-8");

	 	try {

	 		//fileService.ckeditorImageUpload(request, response, upload);

	 	} catch (Exception  e) {
	 		e.printStackTrace();
	 	}

	 }

}
