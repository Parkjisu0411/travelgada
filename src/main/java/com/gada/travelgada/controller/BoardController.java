package com.gada.travelgada.controller;

import java.io.File;
import java.io.FileOutputStream;
import java.io.IOException;
import java.io.OutputStream;
import java.io.PrintWriter;
import java.util.HashMap;
import java.util.List;
import java.util.UUID;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.apache.ibatis.annotations.Param;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.security.core.annotation.AuthenticationPrincipal;
import org.springframework.web.bind.annotation.DeleteMapping;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.PutMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.bind.annotation.RestController;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.multipart.commons.CommonsMultipartResolver;
import org.springframework.web.servlet.ModelAndView;

import com.gada.travelgada.domain.BoardVO;
import com.gada.travelgada.domain.CriteriaVO;
import com.gada.travelgada.domain.DiaryVO;
import com.gada.travelgada.domain.MemberDetails;
import com.gada.travelgada.domain.MemberVO;
import com.gada.travelgada.domain.PageVO;
import com.gada.travelgada.domain.TodoVO;
import com.gada.travelgada.service.BoardService;

import jdk.internal.org.jline.utils.Log;
import lombok.AllArgsConstructor;
import lombok.extern.slf4j.Slf4j;

@Slf4j
@RestController
@AllArgsConstructor
public class BoardController {
	private BoardService boardService;
	
	@GetMapping("/board/{board_type_id}")
	public ModelAndView reviewBoard(ModelAndView modelAndView, CriteriaVO cri, @AuthenticationPrincipal MemberDetails member, BoardVO boardVO) {
		int nowPage = (cri.getNowPage() - 1) * cri.getAmount();
		
		log.info("reviewBoard");
		modelAndView.setViewName("/board/review");
		//modelAndView.addObject("boardReviewList", boardService.getReviewBoard(cri.getNowPage(), cri.getAmount()));
		//modelAndView.addObject("boardNoticeList", boardService.getNotice(cri.getNowPage(), cri.getAmount()));
		modelAndView.addObject("boardReviewList", boardService.getReviewBoard(nowPage, cri.getAmount(), boardVO.getBoard_type_id() ));
		modelAndView.addObject("boardNoticeList", boardService.getNotice());
		modelAndView.addObject("getBoardTypeId", boardVO.getBoard_type_id());
		
		//modelAndView.addObject("userName", member.getUsername());
		
		int total = boardService.getTotalReviewBoard(boardVO.getBoard_type_id());
		log.info("total" + total);
		modelAndView.addObject("pageMaker", new PageVO(cri, total));
		
		return modelAndView;
	}
	
//	@GetMapping("/board/{board_type_id}")
//	public ModelAndView qnaBoard(ModelAndView modelAndView, CriteriaVO cri) {
//		int nowPage = (cri.getNowPage() - 1) * cri.getAmount();
//		
//		log.info("qnaBoard");
//		modelAndView.setViewName("/board/Q&A");
//		modelAndView.addObject("boardQnAList", boardService.getQnABoard(nowPage, cri.getAmount()));
//		modelAndView.addObject("boardNoticeList", boardService.getNotice());
//		modelAndView.addObject("getBoardTypeId", 2);
//		
//		int total = boardService.getTotalQnABoard(cri);
//		log.info("total" + total);
//		modelAndView.addObject("pageMaker", new PageVO(cri, total));
//		
//		return modelAndView;
//	}
//	
//	@GetMapping("/board/3")
//	public ModelAndView accompanyBoard(ModelAndView modelAndView, CriteriaVO cri) {
//		int nowPage = (cri.getNowPage() - 1) * cri.getAmount();
//		
//		log.info("accompanyBoard");
//		modelAndView.setViewName("/board/accompany");
//		modelAndView.addObject("boardAccompanyList", boardService.getAccompanyBoard(nowPage, cri.getAmount()));
//		modelAndView.addObject("boardNoticeList", boardService.getNotice());
//		modelAndView.addObject("getBoardTypeId", 3);
//		
//		int total = boardService.getTotalAccompanyBoard(cri);
//		log.info("total" + total);
//		modelAndView.addObject("pageMaker", new PageVO(cri, total));
//		
//		return modelAndView;
//	}
	
	
	@GetMapping("/board/{board_id}/{member_id}")
	public ModelAndView boardContentView(ModelAndView modelAndView, MemberVO memberVO, BoardVO boardVO) {

		log.info("boardContentView");
		log.info("확인!!!!!!" + memberVO.getProfile_img_path());
		
	
		modelAndView.setViewName("/board/board_content_view");
		//modelAndView.addObject("bContentView", boardService.boardContentView(boardVO.getBoard_id(), memberVO.getMember_id()));
		//modelAndView.addObject("bContentView", boardService.boardContentView(memberVO));
		modelAndView.addObject("bContentView", boardService.boardContentView(boardVO));
		modelAndView.addObject("bImgPath", boardService.boardImgPath(memberVO));
		
		return modelAndView;
	}
	
	
	@GetMapping("/board")
	//@GetMapping("/board/{board_type_id}")
	public ModelAndView boardWriteView(ModelAndView modelAndView) {

		log.info("boardWriteView");
		//log.info(member.getName());
		//log.info("" + boardVO.getBoard_type_id());
		
		//String member_id = member.getName();
		//Integer board_type_id = (Integer)boardVO.getBoard_type_id();

		modelAndView.setViewName("/board/board_write_view");
		//modelAndView.addObject("bWriteView", member_id);
		//modelAndView.addObject("bWriteView", board_type_id);
		
		return modelAndView;
	}
	
	
	@PostMapping("/board")
	public ModelAndView writeBoard(ModelAndView modelAndView, BoardVO boardVO, @RequestParam ("username") String username) {
		
		log.info("boardWrite");
		int BT = boardVO.getBoard_type_id();
		log.info("BT : " + BT);
		
		boardVO.setMember_id(username);
				
		try {
			boardService.writeBoard(boardVO);
			if(BT == 1) {
				modelAndView.setViewName("redirect:/board/1");
			}else if(BT == 2) {
				modelAndView.setViewName("redirect:/board/2");
			}else {
				modelAndView.setViewName("redirect:/board/3");
			}
			
		}catch(Exception e){
			e.printStackTrace();
		}
	
		return modelAndView;
	}
	
	
	@GetMapping("/board/modify/{board_id}&{member_id}")
	public ModelAndView boardModifyView(ModelAndView modelAndView, MemberVO memberVO, BoardVO boardVO) {

		log.info("boardModifyView");

		modelAndView.setViewName("/board/board_modify_view");
		
		modelAndView.addObject("bContentView", boardService.boardContentView(boardVO));
		modelAndView.addObject("bImgPath", boardService.boardImgPath(memberVO));
		
		return modelAndView;
	}
	
	
	@PutMapping("/board/{board_id}")
	public ResponseEntity<String> modifyContent(@RequestBody BoardVO boardVO) {
		ResponseEntity<String> entity = null;
		
		log.info("modifyContent");
		
		try {
			boardService.modifyBoardContent(boardVO);
			entity = new ResponseEntity<String>("SUCCESS", HttpStatus.OK);
		}catch(Exception e){
			e.printStackTrace();
			entity = new ResponseEntity<String>(e.getMessage(), HttpStatus.BAD_REQUEST);
		}
	
		return entity;
	}
	
	
	@DeleteMapping("/board/{board_id}")
	public ResponseEntity<String> deleteBoard(BoardVO boardVO){
		ResponseEntity<String> entity = null;
		
		log.info("deleteBoard");
		
		try {
			boardService.deleteBoard(boardVO);
			entity = new ResponseEntity<String>("SUCCESS", HttpStatus.OK);
		}catch(Exception e){
			e.printStackTrace();
			entity = new ResponseEntity<String>(e.getMessage(), HttpStatus.BAD_REQUEST);
		}
	
		return entity;
	}
	
	@PostMapping("/board/reply")
	public ResponseEntity<String> writeReply(BoardVO boardVO) {
		ResponseEntity<String> entity = null;
		
		log.info("getReply");
		
		try {
			boardService.writeReply(boardVO);
			entity = new ResponseEntity<String>("SUCCESS", HttpStatus.OK);
		}catch(Exception e){
			e.printStackTrace();
			entity = new ResponseEntity<String>(e.getMessage(), HttpStatus.BAD_REQUEST);
		}
	
		return entity;
	}
	
	@GetMapping("/board/replyList")
	public ModelAndView getReply(ModelAndView modelAndView, BoardVO boardVO) {

		log.info("getReply");

		modelAndView.setViewName("/board/board_content_view");
		
		modelAndView.addObject("bReply", boardService.getReply(boardVO));
		
		return modelAndView;
	}
	
	// ck 에디터에서 파일 업로드
			@PostMapping("/admin/goods/ckUpload")
			public void postCKEditorImgUpload(HttpServletRequest req, HttpServletResponse res, @RequestParam MultipartFile upload) throws Exception {
			 log.info("post CKEditor img upload");
			 
			 String uploadPath = req.getSession().getServletContext().getRealPath("/").concat("resources/").concat("img");
			 System.out.println("uploadPath  : "+uploadPath);
			 // 랜덤 문자 생성
			 UUID uid = UUID.randomUUID();
			 
			 OutputStream out = null;
			 PrintWriter printWriter = null;
			  
			 // 인코딩
			 res.setCharacterEncoding("utf-8");
			 res.setContentType("application/json");
			 
			 try {
			  
			  String fileName =  upload.getOriginalFilename(); // 파일 이름 가져오기
			  byte[] bytes = upload.getBytes();
			  
			  // 업로드 경로
			  String ckUploadPath = uploadPath + File.separator + "CKeditor" + File.separator + uid + "_" +fileName;
			  
			  out = new FileOutputStream(new File(ckUploadPath));
			  out.write(bytes);
			  out.flush(); // out에 저장된 데이터를 전송하고 초기화
			  
			  //String callback = req.getParameter("CKEditorFuncNum");
			  printWriter = res.getWriter();
			  String fileUrl = "/ckUpload/" + uid + "_" +fileName; // 작성화면
			  // 업로드시 메시지 출력
//			  JsonObject json = new JsonObject();
//			  json.addProperty("uploaded", 1);
//			  json.addProperty("fileName", fileName);
//			  json.addProperty("url", fileUrl);
//			  printWriter.println(json);
			  printWriter.println("{\"filename\" : \""+fileName+"\", \"uploaded\" : 1, \"url\":\""+fileUrl+"\"}");
			  
			  printWriter.flush();
			  System.out.println("test url : "+req.getSession().getServletContext().getRealPath("resouces/img/CKeditor"));
			  System.out.println("url : "+fileUrl);
			  System.out.println("ckUploadPath : "+ckUploadPath);
			 } catch (IOException e) { e.printStackTrace();
			 } finally {
			  try {
			   if(out != null) { out.close(); }
			   if(printWriter != null) { printWriter.close(); }
			  } catch(IOException e) { e.printStackTrace(); }
			 }
			 
			 return; 
			}
			

	
}
