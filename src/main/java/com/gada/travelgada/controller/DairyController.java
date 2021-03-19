package com.gada.travelgada.controller;

import java.io.File;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.DeleteMapping;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.PutMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RestController;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.ModelAndView;

import com.gada.travelgada.domain.DiaryVO;
import com.gada.travelgada.service.DiaryService;

import lombok.AllArgsConstructor;
import lombok.extern.slf4j.Slf4j;

@Slf4j
@RestController
@AllArgsConstructor
public class DairyController {

	@Autowired
	private DiaryService diaryService;
	
	  private static final String FILE_SERVER_PATH = "C:\\Users\\김보람\\git\\travelgada\\src\\main\\webapp\\resources";
	 

	@GetMapping("diary")
	public ModelAndView diary(ModelAndView mav) {
		log.info("diary();");
		mav.addObject("diary", diaryService.getDiary());
		mav.addObject("planner", diaryService.getPlanner());
		mav.setViewName("diary/diary");
		return mav;
	}

	@GetMapping("diary_write_view")
	public ModelAndView diary_write_view(ModelAndView mav, DiaryVO diaryVO) {
		log.info("diary_write_view();");
		mav.addObject("planner", diaryVO);
		mav.setViewName("diary/diary_write_view");
		return mav;
	}

	@PostMapping("diary_write")
	public ModelAndView diary_write(ModelAndView mav, DiaryVO diaryVO) {
		log.info("diary_write();");
//		   model.addAttribute("write")
		diaryService.writeDiary(diaryVO);
		mav.setViewName("redirect:diary");
		return mav;
	}

	 @PostMapping("upload")
	   public ModelAndView upload(ModelAndView mav,MultipartFile[] uploadFile){
	    log.info("하고 있다.");
	    
	    String uploadFolder = "C:\\Users\\김보람\\git\\travelgada\\src\\main\\webapp\\resources\\diary";
	    mav.setViewName("diary/uploadok");
	    for(MultipartFile multipartFile: uploadFile) {
	    	log.info("------------------------");
	    	log.info("Upload File Name:" + multipartFile.getOriginalFilename());
	    	log.info("Upload File Size:" + multipartFile.getSize());
	    	
	    	String uploadFileName = multipartFile.getOriginalFilename();
	    	
	    	uploadFileName = uploadFileName.substring(uploadFileName.lastIndexOf("\\")+ 1 );
	    	
	    	log.info("only file name:"+uploadFileName);
	    	
	    	File saveFile = new File(uploadFolder,uploadFileName);
	    	
	    	try {
	    		multipartFile.transferTo(saveFile);
	    	}catch(Exception e) {
	    		log.error(e.getMessage());
	    	}
	    }
	    
	    return mav;
	 }

	  @DeleteMapping("diary/{diary_id}")
	   public ResponseEntity<String> diary_delete(@RequestBody DiaryVO DiaryVO ,Model model) {
	      ResponseEntity<String> entity = null;
	      log.info("diary_delete...");
	      try {
	    	  diaryService.deleteDiary(DiaryVO.getDiary_id());
	      
	            entity = new ResponseEntity<String>("SUCCESS", HttpStatus.OK);
	        } catch (Exception e) {
	            e.printStackTrace();
	        
	            entity = new ResponseEntity<String>(e.getMessage(), HttpStatus.BAD_REQUEST);
	        }
	   
	        return entity;

	   } 
	  
	   @PutMapping("/board/{diary_id}")
	   public ResponseEntity<String> diary_put(@RequestBody DiaryVO diaryVO) {
		   
		   ResponseEntity<String> entity = null;
	      log.info("rest_put..");
	      try {
	         diaryService.modifyDiary(diaryVO);
	            entity = new ResponseEntity<String>("SUCCESS", HttpStatus.OK);
	        } catch (Exception e) {
	            e.printStackTrace();
	           
	            entity = new ResponseEntity<String>(e.getMessage(), HttpStatus.BAD_REQUEST);
	        }
	        
	        return entity;
	   } 
	   
		@GetMapping("diary_modify_view/{diary_id}")
		public ModelAndView diary_modify_view(ModelAndView mav, DiaryVO diaryVO) {
			log.info("diary_write_view();");
			mav.addObject("diary_view", diaryService.view_Diary(diaryVO.getDiary_id()));
			mav.setViewName("diary/diary_modify_view");
			return mav;
		}
	
		@GetMapping("diary_test")
		public ModelAndView diary_test(ModelAndView mav) {
			log.info("diary_test();");
			mav.setViewName("diary/test");
			return mav;
		}
}
