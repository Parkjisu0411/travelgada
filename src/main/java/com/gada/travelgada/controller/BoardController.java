package com.gada.travelgada.controller;

import java.io.File;
import java.io.FileOutputStream;
import java.io.IOException;
import java.io.OutputStream;
import java.io.PrintWriter;
import java.util.HashMap;
import java.util.Map;
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
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.bind.annotation.RestController;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.ModelAndView;

import com.gada.travelgada.domain.AnswerVO;
import com.gada.travelgada.domain.BoardVO;
import com.gada.travelgada.domain.CriteriaVO;
import com.gada.travelgada.domain.MemberDetails;
import com.gada.travelgada.domain.MemberVO;
import com.gada.travelgada.domain.PageVO;
import com.gada.travelgada.domain.ScheduleVO;
import com.gada.travelgada.service.BoardService;

import lombok.AllArgsConstructor;
import lombok.extern.slf4j.Slf4j;
import net.minidev.json.JSONObject;

@Slf4j
@RestController
@AllArgsConstructor
public class BoardController {
	private BoardService boardService;
	
	@GetMapping("/board/{board_type_id}")
	public ModelAndView reviewBoard(ModelAndView modelAndView, CriteriaVO cri, @AuthenticationPrincipal MemberDetails member, BoardVO boardVO) {
		int nowPage = (cri.getNowPage() - 1) * cri.getAmount();
		
		log.info("reviewBoard");
		
		int BT = boardVO.getBoard_type_id();
		log.info("BT : " + BT);
		
		if(BT == 1) {
			modelAndView.setViewName("/board/review");
		}else if(BT == 2) {
			modelAndView.setViewName("/board/Q&A");
		}else if(BT == 3){
			modelAndView.setViewName("/board/accompany");
		}else {
			modelAndView.setViewName("/board/notice");
		}

		modelAndView.addObject("boardReviewList", boardService.getReviewBoard(nowPage, cri.getAmount(), boardVO.getBoard_type_id() ));
		modelAndView.addObject("boardNoticeList", boardService.getNotice());
		modelAndView.addObject("getBoardTypeId", boardVO.getBoard_type_id());
		
		int total = boardService.getTotalReviewBoard(boardVO.getBoard_type_id());
		log.info("total" + total);
		modelAndView.addObject("pageMaker", new PageVO(cri, total));
		
		return modelAndView;
	}
	
	
	@GetMapping("/board/{board_id}/{member_id}/{board_type_id}")
	public ModelAndView boardContentView(ModelAndView modelAndView, CriteriaVO cri, MemberVO memberVO, BoardVO boardVO) {

		log.info("boardContentView");
		log.info("getProfile_img_path : " + memberVO.getProfile_img_path());
		
	
		modelAndView.setViewName("/board/board_content_view");

		modelAndView.addObject("bContentView", boardService.boardContentView(boardVO));
		modelAndView.addObject("bImgPath", boardService.boardImgPath(memberVO));

		modelAndView.addObject("bReply", boardService.getReply(boardVO));
		//modelAndView.addObject("bRecentReply", boardService.getRecentReply(boardVO));
		
		int nowPage = (cri.getNowPage() - 1) * cri.getAmount();
		
		modelAndView.addObject("boardReviewList", boardService.getReviewBoard(nowPage, cri.getAmount(), boardVO.getBoard_type_id() ));
		modelAndView.addObject("getBoardTypeId", boardVO.getBoard_type_id());
		
		int total = boardService.getTotalReviewBoard(boardVO.getBoard_type_id());
		log.info("total" + total);
		modelAndView.addObject("pageMaker", new PageVO(cri, total));
		
		return modelAndView;
	}
	
//	@GetMapping("/board/{board_id}/{member_id}")
//	public ModelAndView boardContentView(ModelAndView modelAndView, MemberVO memberVO, BoardVO boardVO) {
//
//		log.info("boardContentView");
//		log.info("getProfile_img_path : " + memberVO.getProfile_img_path());
//		
//	
//		modelAndView.setViewName("/board/board_content_view");
//
//		modelAndView.addObject("bContentView", boardService.boardContentView(boardVO));
//		modelAndView.addObject("bImgPath", boardService.boardImgPath(memberVO));
//
//		modelAndView.addObject("bReply", boardService.getReply(boardVO));
//		//modelAndView.addObject("bRecentReply", boardService.getRecentReply(boardVO));
//		
//		return modelAndView;
//	}
	
	@GetMapping("/board/replyContent/{board_id}/{member_id}")
	public ModelAndView boardReplyContentView(ModelAndView modelAndView, MemberVO memberVO, BoardVO boardVO) {

		log.info("boardContentView");
		log.info("확인!!!!!!" + memberVO.getProfile_img_path());
		
	
		modelAndView.setViewName("/board/board_content_view_reply");

		modelAndView.addObject("bContentView", boardService.boardContentView(boardVO));
		modelAndView.addObject("bImgPath", boardService.boardImgPath(memberVO));
		
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
   
   
	@PostMapping("/board/reply")
	public ResponseEntity<Map<String,String>> writeReply(@RequestBody BoardVO boardVO) {
		ResponseEntity<Map<String,String>> entity = null;
		Map<String, String> data = new HashMap<>();
		try {
			boardService.writeReply(boardVO);
			BoardVO reply = boardService.getRecentReply(boardVO);
			data.put("answer_date",String.valueOf(reply.getAnswerList().get(0).getAnswer_date()));
			data.put("answer_id", String.valueOf(reply.getAnswerList().get(0).getAnswer_id()));
			data.put("board_id", String.valueOf(reply.getAnswerList().get(0).getBoard_id()));
			data.put("member_id", String.valueOf(reply.getAnswerList().get(0).getMember_id()));
			data.put("text", reply.getAnswerList().get(0).getText());
			data.put("top_answer_id", String.valueOf(reply.getAnswerList().get(0).getTop_answer_id()));
			entity = new ResponseEntity<Map<String, String>>(data, HttpStatus.OK);
		} catch(Exception e) {
			data.put("error", e.getMessage());
			entity = new ResponseEntity<Map<String, String>>(data, HttpStatus.BAD_REQUEST);
			log.info("ERROR Message : " + e.getMessage());
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
//           JsonObject json = new JsonObject();
//           json.addProperty("uploaded", 1);
//           json.addProperty("fileName", fileName);
//           json.addProperty("url", fileUrl);
//           printWriter.println(json);
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