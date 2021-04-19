package com.gada.travelgada.controller;

import java.io.File;

import java.io.IOException;
import java.util.List;

import javax.servlet.http.HttpSessionEvent;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.security.core.annotation.AuthenticationPrincipal;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.DeleteMapping;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.bind.annotation.RestController;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.ModelAndView;

import com.gada.travelgada.domain.DiaryVO;
import com.gada.travelgada.domain.MemberDetails;
import com.gada.travelgada.service.DiaryService;
import com.gada.travelgada.service.UserCounter;

import lombok.AllArgsConstructor;
import lombok.extern.slf4j.Slf4j;

@Slf4j
@RestController
@AllArgsConstructor
public class DairyController {

	private DiaryService diaryService;

	private static final String FILE_SERVER_PATH = "C:\\Users\\김보람\\git\\travelgada\\src\\main\\webapp\\resources\\diary";

	// 다이어리
	@GetMapping("/diary")
	public ModelAndView diary(ModelAndView mav, @AuthenticationPrincipal MemberDetails member) {
		log.info("controller diary();");
		
		mav.addObject("diary", diaryService.getDiary(member.getUsername()));
		mav.addObject("planner", diaryService.getPlanner(member.getUsername()));

		mav.setViewName("diary/diary");

		return mav;

	}// diary end

	// 다이어리 작성 페이지
	@GetMapping("/diary_write_view")
	public ModelAndView diary_write_view(ModelAndView mav, DiaryVO diaryVO) {
		log.info("controller diary_write_view();");

		mav.addObject("planner", diaryVO);
		mav.setViewName("diary/diary_write_view");

		return mav;

	}// diary_write_view end

   
	// 다이어리 작성
	@PostMapping("/diary_write")
	public ModelAndView diary_write(@RequestParam("uploadfile") MultipartFile file, ModelAndView mav, DiaryVO diaryVO,
			@AuthenticationPrincipal MemberDetails member) throws IllegalStateException, IOException {
		log.info("controller diary_write();");

		String img_path = file.getOriginalFilename();
		int seq = diaryService.getImg_seq();
		seq++;
		String img_seq = Integer.toString(seq);

		diaryVO.setImg_path(img_seq);
		diaryService.writeDiary(diaryVO);

		mav.addObject("other", diaryVO);
		mav.addObject("diary", diaryService.getDiaryOther(diaryVO.getPlanner_id()));
		mav.addObject("planner", diaryService.getPlanner(member.getUsername()));
		mav.setViewName("diary/diary");

		if (!file.getOriginalFilename().isEmpty()) {
			file.transferTo(new File(FILE_SERVER_PATH, img_seq));
			/* mav.addObject("msg", "File uploaded successfully."); */
		} else {
			/* mav.addObject("msg", "Please select a valid mediaFile.."); */
		}

		return mav;

	}// diary_write end

	// 다이어리 수정 페이지
	@GetMapping("/diary_modify_view/{diary_id}&{planner_id}")
	public ModelAndView diary_modify_view(ModelAndView mav, DiaryVO diaryVO) {
		log.info("controller diary_write_view();");

		mav.addObject("planner", diaryVO);
		mav.addObject("diary_view", diaryService.view_Diary(diaryVO.getDiary_id()));
		mav.setViewName("diary/diary_modify_view");

		return mav;

	}// diary_modify_view end
  
	// 다이어리 수정
	@PostMapping("/diary_modify")
	public ModelAndView diary_modify(ModelAndView mav, DiaryVO diaryVO, @RequestParam("uploadfile") MultipartFile file,
			@RequestParam("currImg") String currImg, @AuthenticationPrincipal MemberDetails member)
			throws IllegalStateException, IOException {
		log.info("controller diary_modify()");
		log.info(currImg);

		String img_path = file.getOriginalFilename();
		int seq = diaryService.getImg_seq();
		seq++;
		String img_seq = Integer.toString(seq);

		if (img_path.length() == 0) {
			diaryVO.setImg_path(currImg);
			diaryService.modifyDiary(diaryVO);

			log.info("플래너 아이디 : " + diaryVO.getPlanner_id());
			mav.addObject("other", diaryVO);
			mav.addObject("diary", diaryService.getDiaryOther(diaryVO.getPlanner_id()));
			mav.addObject("planner", diaryService.getPlanner(member.getUsername()));
			mav.setViewName("diary/diary");

		} else {
			diaryVO.setImg_path(img_seq);
			diaryService.modifyDiary(diaryVO);

			mav.addObject("other", diaryVO);
			mav.addObject("diary", diaryService.getDiaryOther(diaryVO.getPlanner_id()));
			mav.addObject("planner", diaryService.getPlanner(member.getUsername()));
			mav.setViewName("diary/diary");

		} // if end

		if (!file.getOriginalFilename().isEmpty()) {
			file.transferTo(new File(FILE_SERVER_PATH, img_seq));
			/* mav.addObject("msg", "File uploaded successfully."); */

		} else {
			/* mav.addObject("msg", "Please select a valid mediaFile.."); */

		} // if end

		return mav;

	}// diary_modify end
        
	// 다이어리 삭제
	@DeleteMapping("/diary/{diary_id}")
	public ResponseEntity<String> diary_delete(DiaryVO DiaryVO, Model model) {
		ResponseEntity<String> entity = null;
		log.info("controller diary_delete()");

		try {
			diaryService.deleteDiary(DiaryVO.getDiary_id());
			entity = new ResponseEntity<String>("SUCCESS", HttpStatus.OK);

		} catch (Exception e) {
			e.printStackTrace();
			entity = new ResponseEntity<String>(e.getMessage(), HttpStatus.BAD_REQUEST);

		} // try catch end

		return entity;

	}// diary_delete end
      
	// 다른 다이어리로 이동 json
	@GetMapping("/diary_other/{planner_id}")
	public List<DiaryVO> diary_another(@AuthenticationPrincipal MemberDetails member, DiaryVO diaryVO) {
		log.info("controller diary_test();");
		log.info("!!!!!!!!!!!!!!!!!!!!!!!!!!1"+diaryVO.getPlanner_id());
		log.info("나와야 한다.!!!!!!!!!!!!!!!!!!!!!!!!"+diaryService.getDiaryOther(diaryVO.getPlanner_id()));
		return diaryService.getDiaryOther(diaryVO.getPlanner_id());

	}// end
	
	// 다이어리
	@GetMapping("/sta")
	public ModelAndView test(ModelAndView mav, @AuthenticationPrincipal MemberDetails member) {
		log.info("controller diary();");

		mav.setViewName("diary/test");

		return mav;

	}// diary end
	

}// Controller end