package com.gada.travelgada.controller;

import java.io.File;
import java.io.IOException;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.core.annotation.AuthenticationPrincipal;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.RestController;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.ModelAndView;

import com.gada.travelgada.domain.DiaryVO;
import com.gada.travelgada.domain.MemberDetails;
import com.gada.travelgada.service.DiaryService;
import com.gada.travelgada.service.ScheduleService;

import lombok.AllArgsConstructor;
import lombok.extern.slf4j.Slf4j;

@Slf4j
@RestController
@AllArgsConstructor
public class DairyController {

	@Autowired
	private DiaryService diaryService;

	@Autowired
	private ScheduleService scheduleService;

	private static final String FILE_SERVER_PATH = "C:\\Users\\김보람\\git\\travelgada\\src\\main\\webapp\\resources\\diary";

	@GetMapping("diary")
	public ModelAndView diary(ModelAndView mav, @AuthenticationPrincipal MemberDetails member) {
		log.info("diary();");

		mav.addObject("diary", diaryService.getDiary(member.getUsername()));
		mav.addObject("planner", diaryService.getPlanner(member.getUsername()));
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
	public ModelAndView diary_write(@RequestParam("uploadfile") MultipartFile file, ModelAndView mav, DiaryVO diaryVO,
			Model model) throws IllegalStateException, IOException {
		log.info("diary_write();");

		String img_path = file.getOriginalFilename();
		diaryVO.setImg_path(img_path);
		diaryService.writeDiary(diaryVO);

		mav.setViewName("redirect:diary");

		if (!file.getOriginalFilename().isEmpty()) {
			file.transferTo(new File(FILE_SERVER_PATH, file.getOriginalFilename()));
			model.addAttribute("msg", "File uploaded successfully.");
		} else {
			model.addAttribute("msg", "Please select a valid mediaFile..");
		}
		return mav;
	}

	@GetMapping("diary_modify_view/{diary_id}")
	public ModelAndView diary_modify_view(ModelAndView mav, DiaryVO diaryVO) {
		log.info("diary_write_view();");

		mav.addObject("diary_view", diaryService.view_Diary(diaryVO.getDiary_id()));
		mav.setViewName("diary/diary_modify_view");

		return mav;
	}

	// 테스트 중인 것들을 사용하는 것
	@GetMapping("diary_test")
	public ModelAndView diary_test(ModelAndView mav) {
		log.info("diary_test();");

		mav.setViewName("diary/test");

		return mav;
	}

	@PostMapping("upload")
	public ModelAndView upload(ModelAndView mav, MultipartFile[] uploadFile) {
		log.info("하고 있다.");

		String uploadFolder = "C:\\Users\\김보람\\git\\travelgada\\src\\main\\webapp\\resources\\diary";
		mav.setViewName("diary/uploadok");
		for (MultipartFile multipartFile : uploadFile) {
			log.info("------------------------");
			log.info("Upload File Name:" + multipartFile.getOriginalFilename());
			log.info("Upload File Size:" + multipartFile.getSize());

			String uploadFileName = multipartFile.getOriginalFilename();

			uploadFileName = uploadFileName.substring(uploadFileName.lastIndexOf("\\") + 1);

			log.info("only file name:" + uploadFileName);

			File saveFile = new File(uploadFolder, uploadFileName);

			try {
				multipartFile.transferTo(saveFile);
			} catch (Exception e) {
				log.error(e.getMessage());
			}
		}

		return mav;
	}
}