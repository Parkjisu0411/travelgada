package com.gada.travelgada.controller;

import java.io.File;
import java.io.IOException;

import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.security.core.annotation.AuthenticationPrincipal;
import org.springframework.transaction.annotation.Transactional;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.DeleteMapping;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.RestController;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.ModelAndView;

import com.gada.travelgada.domain.CriteriaVO;
import com.gada.travelgada.domain.DiaryVO;
import com.gada.travelgada.domain.MemberDetails;
import com.gada.travelgada.domain.PageVO;
import com.gada.travelgada.domain.PlannerVO;
import com.gada.travelgada.service.DiaryService;
import com.gada.travelgada.service.PlannerService;

import lombok.AllArgsConstructor;
import lombok.extern.slf4j.Slf4j;

@Slf4j
@RestController
@AllArgsConstructor
public class DiaryController {

	private DiaryService diaryService;
	private PlannerService plannerService;

	private static final String FILE_SERVER_PATH = "C:\\Users\\김보람\\git\\travelgada\\src\\main\\webapp\\resources\\diary";

	// 다이어리
	@GetMapping("/diary")
	public ModelAndView diary(@AuthenticationPrincipal MemberDetails member, ModelAndView mav, CriteriaVO cri) {
		log.info("controller diary();");
		log.info("nowPage : "+cri.getNowPage());
		log.info("planner_id============= : "+member.getPlanner_id());
		
		int amount = 20;
		int nowPage = (cri.getNowPage() - 1) * amount;
		int total = diaryService.getTotal(member.getUsername());
		int planner_id = member.getPlanner_id();
		
		cri.setAmount(amount);
		
		if(planner_id == 0) {
			
			mav.addObject("diary", diaryService.getDiary(member.getUsername(),nowPage, amount));
			mav.addObject("planner", plannerService.getPlanner(member.getUsername()));
			mav.addObject("pageMaker", new PageVO(cri, total));
			mav.addObject("nowPage", cri.getNowPage());
			
			mav.setViewName("diary/diary");
			
		}else {

			mav.setViewName("redirect:/diary_other");
		}
		
		return mav;

	}// diary end
	
	@GetMapping("/diary/{planner_id}")
	public ResponseEntity<String> selectOtherPlanner(@AuthenticationPrincipal MemberDetails memberDetails, PlannerVO plannerVO) {
		
		ResponseEntity<String> entity = null;
		
		try {
			
			memberDetails.setPlanner_id(plannerVO.getPlanner_id());
			entity = new ResponseEntity<String>("SUCCESS", HttpStatus.OK);
			
		} catch(Exception e) {
			
			e.printStackTrace();
			entity = new ResponseEntity<String>(e.getMessage(), HttpStatus.BAD_REQUEST);
			
		}
		return entity;
	}
	
	// 다른 다이어리로 이동
	@GetMapping("/diary_other")
	public ModelAndView diaryOther(@AuthenticationPrincipal MemberDetails member,  ModelAndView mav, CriteriaVO cri) {
		log.info("controller diaryOther();");
		log.info("====planner_id : "+member.getPlanner_id());
		
		int amount = 20;
		int nowPage = (cri.getNowPage() - 1) * amount;
		int total = diaryService.getOtherTotal(member.getUsername(), member.getPlanner_id());
		int planner_id = member.getPlanner_id();
		
		cri.setAmount(amount);
		
		if(planner_id == 0) {
			
			mav.setViewName("redirect:/diary");
			
		}else {
		
			mav.addObject("diary", diaryService.getDiaryOtherPaging(planner_id,nowPage, amount));
			mav.addObject("planner", plannerService.getPlanner(member.getUsername()));
			mav.addObject("pageMaker", new PageVO(cri, total));
			mav.addObject("planner_id", planner_id);
			mav.addObject("nowPage", cri.getNowPage());
			
			mav.setViewName("diary/diary_other");
		
		}
		
		return mav;

	}// end

	// 다이어리 작성 페이지
	@GetMapping("/diary_write_view")
	public ModelAndView diary_write_view(ModelAndView mav, DiaryVO diaryVO) {
		log.info("controller diary_write_view();");
		
		mav.addObject("planner", diaryVO);
		
		mav.setViewName("diary/diary_write_view");

		return mav;

	}// diary_write_view end

   
	// 다이어리 작성
	@Transactional
	@PostMapping("/diary_write")
	public ModelAndView diary_write(@RequestParam("uploadfile") MultipartFile file, ModelAndView mav, DiaryVO diaryVO,
			@AuthenticationPrincipal MemberDetails member, CriteriaVO cri) 
					throws IllegalStateException, IOException {
		log.info("controller diary_write();");
		
		int seq = diaryService.getImg_seq();
		seq++;
		String img_seq = Integer.toString(seq);
		int amount = 20;
		int nowPage = (cri.getNowPage() - 1) * amount;
		int total = diaryService.getOtherTotal(member.getUsername(), diaryVO.getPlanner_id());
	
		diaryVO.setImg_path(img_seq);
		diaryService.writeDiary(diaryVO);
		cri.setAmount(amount);
		file.transferTo(new File(FILE_SERVER_PATH, img_seq));
		member.setPlanner_id(diaryVO.getPlanner_id());
		
		mav.addObject("diary", diaryService.getDiaryOtherPaging(diaryVO.getPlanner_id(),nowPage, amount));
		mav.addObject("planner", plannerService.getPlanner(member.getUsername()));
		mav.addObject("pageMaker", new PageVO(cri, total));
		mav.addObject("planner_id", diaryVO.getPlanner_id());
		mav.addObject("nowPage", cri.getNowPage());
		
		mav.setViewName("redirect:/diary");

		return mav;

	}// diary_write end

	// 다이어리 수정 페이지
	@GetMapping("/diary_modify_view/{diary_id}/{planner_id}")
	public ModelAndView diary_modify_view(ModelAndView mav, DiaryVO diaryVO) {
		log.info("controller diary_write_view();");
		
		mav.addObject("planner", diaryVO);
		mav.addObject("diary_view", diaryService.view_Diary(diaryVO.getDiary_id()));
		
		mav.setViewName("diary/diary_modify_view");

		return mav;

	}// diary_modify_view end
  
	// 다이어리 수정
	@Transactional
	@PostMapping("/diary_modify")
	public ModelAndView diary_modify(ModelAndView mav, DiaryVO diaryVO, @RequestParam("uploadfile") MultipartFile file,
			@RequestParam("currImg") String currImg, @AuthenticationPrincipal MemberDetails member, CriteriaVO cri)
					throws IllegalStateException, IOException {
		
		log.info("controller diary_modify()");
		log.info(currImg);
		log.info("플래너 아이디 : " + diaryVO.getPlanner_id());

		String img_path = file.getOriginalFilename();
		String img_seq = diaryVO.getImg_path();
		int amount = 20;
		int nowPage = (cri.getNowPage() - 1) * amount;
		int total = diaryService.getOtherTotal(member.getUsername(), diaryVO.getPlanner_id());
		
		cri.setAmount(amount);
		member.setPlanner_id(diaryVO.getPlanner_id());
		
		if (img_path.length() == 0) {
			
			diaryVO.setImg_path(currImg);
			diaryService.modifyDiary(diaryVO);

		} else {
			
			diaryVO.setImg_path(img_seq);
			diaryService.modifyDiary(diaryVO);
			file.transferTo(new File(FILE_SERVER_PATH, img_seq));

		} // if end
		
		mav.addObject("diary", diaryService.getDiaryOtherPaging(diaryVO.getPlanner_id(),nowPage, amount));
		mav.addObject("planner", plannerService.getPlanner(member.getUsername()));
		mav.addObject("pageMaker", new PageVO(cri, total));
		mav.addObject("other", diaryVO);
		mav.addObject("planner_id", diaryVO.getPlanner_id());
		mav.addObject("nowPage", cri.getNowPage());
		
		mav.setViewName("redirect:/diary");

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

}// Controller end