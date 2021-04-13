package com.gada.travelgada.controller;

import java.io.File;
import java.io.FileOutputStream;
import java.io.IOException;
import java.io.OutputStream;
import java.io.PrintWriter;

import java.util.UUID;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.security.core.annotation.AuthenticationPrincipal;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.DeleteMapping;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.PutMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.RestController;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.ModelAndView;

import com.gada.travelgada.domain.AnswerVO;
import com.gada.travelgada.domain.BoardVO;
import com.gada.travelgada.domain.CriteriaVO;
import com.gada.travelgada.domain.MemberDetails;
import com.gada.travelgada.domain.MemberVO;
import com.gada.travelgada.domain.PageVO;
import com.gada.travelgada.service.BoardService;

import lombok.AllArgsConstructor;
import lombok.extern.slf4j.Slf4j;

@Slf4j
@RestController
@AllArgsConstructor
public class BoardController {
	private BoardService boardService;
	
	@GetMapping("/board/{board_type_id}")
	public ModelAndView reviewBoard(ModelAndView modelAndView, Model model, CriteriaVO cri, @AuthenticationPrincipal MemberDetails member, BoardVO boardVO) {
		int nowPage = (cri.getNowPage() - 1) * cri.getAmount();
		
		log.info("reviewBoard");
		
		int BT = boardVO.getBoard_type_id();
		log.info("BT : " + BT);
		
		if(BT == 1) {
			modelAndView.setViewName("/board/review");
		}else if(BT == 2) {
			modelAndView.setViewName("/board/Q&A");
		}else {
			modelAndView.setViewName("/board/accompany");
		} 

		modelAndView.addObject("boardReviewList", boardService.getReviewBoard(nowPage, cri.getAmount(), boardVO.getBoard_type_id() ));
		modelAndView.addObject("boardNoticeList", boardService.getNotice());
		modelAndView.addObject("getBoardTypeId", boardVO.getBoard_type_id());
		
//		int replyCount = boardService.getReply_count(boardVO.getBoard_id());
//		log.info("확인222222222" + boardVO.getBoard_id());
//		
//		//modelAndView.addObject("getReplyCount", replyCount);
//		model.addAttribute("getReplyCount", replyCount);
		
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
		
		//boardService.writeReply(boardVO);
		modelAndView.addObject("bReply", boardService.getReply(boardVO));
		modelAndView.addObject("bRecentReply", boardService.getRecentReply(boardVO));
		
		
		return modelAndView;
	}
	
	
	@GetMapping("/board")
	//@GetMapping("/board/{board_type_id}")
	public ModelAndView boardWriteView(ModelAndView modelAndView, Model model) {

		log.info("boardWriteView");
		//log.info(member.getName());
		//log.info("" + boardVO.getBoard_type_id());
		
		//String member_id = member.getName();
		//Integer board_type_id = (Integer)boardVO.getBoard_type_id();

		modelAndView.setViewName("/board/board_write_view");
		model.addAttribute("checkAuthority", MemberDetails.hasAdminRole());
		//modelAndView.addObject("bWriteView", member_id);
		//modelAndView.addObject("bWriteView", board_type_id);
		
		return modelAndView;
	}
	
	
	
	@PutMapping("/board")
	public ResponseEntity<String> writeBoard(@RequestBody BoardVO boardVO) {
		ResponseEntity<String> entity = null;
		
		log.info("writeBoard");
				
		try {
			boardService.writeBoard(boardVO);
			entity = new ResponseEntity<String>("SUCCESS", HttpStatus.OK);
		}catch(Exception e){
			e.printStackTrace();
			entity = new ResponseEntity<String>(e.getMessage(), HttpStatus.BAD_REQUEST);
		}
	
		return entity;
	}
	
	
	@GetMapping("/board/modify/{board_id}/{member_id}")
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
			boardService.delete_allAnswer(boardVO);
			boardService.deleteBoard(boardVO);
			entity = new ResponseEntity<String>("SUCCESS", HttpStatus.OK);
		}catch(Exception e){
			e.printStackTrace();
			entity = new ResponseEntity<String>(e.getMessage(), HttpStatus.BAD_REQUEST);
		}
	
		return entity;
	}
	
	@PutMapping("/board/reply")
	public ResponseEntity<String> writeReply(@RequestBody BoardVO boardVO) {
		ResponseEntity<String> entity = null;
		
		log.info("writeReply");
		
		
		try {
			boardService.writeReply(boardVO);
			entity = new ResponseEntity<String>("SUCCESS", HttpStatus.OK);
		}catch(Exception e){
			e.printStackTrace();
			entity = new ResponseEntity<String>(e.getMessage(), HttpStatus.BAD_REQUEST);
		}
	
		return entity;
	}
	
	@DeleteMapping("/board/reply/{answer_id}")
	public ResponseEntity<String> deleteReply(AnswerVO answerVO){
		ResponseEntity<String> entity = null;
		
		log.info("deleteReply");
		
		try {
			boardService.deleteReply(answerVO);
			entity = new ResponseEntity<String>("SUCCESS", HttpStatus.OK);
		}catch(Exception e){
			e.printStackTrace();
			entity = new ResponseEntity<String>(e.getMessage(), HttpStatus.BAD_REQUEST);
		}
	
		return entity;
	}
	
	
	@GetMapping("/board/answer/{board_id}")
	public ModelAndView boardAnswerView(ModelAndView modelAndView, BoardVO boardVO) {

		log.info("boardAnswerView");

		modelAndView.setViewName("/board/board_answer_view");
		modelAndView.addObject("board_answer_view", boardService.boardAnswerView(boardVO));
		
		return modelAndView;
	}
	
	@PostMapping("/board/{board_id}")
	public ResponseEntity<String> boardAnswer(@RequestBody BoardVO boardVO){
		ResponseEntity<String> entity = null;
		
		log.info("reply");
		
		try {
			boardService.boardAnswer(boardVO);
			entity = new ResponseEntity<String>("SUCCESS", HttpStatus.OK);
		}catch(Exception e){
			e.printStackTrace();
			entity = new ResponseEntity<String>(e.getMessage(), HttpStatus.BAD_REQUEST);
		}
		
		return entity;
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
