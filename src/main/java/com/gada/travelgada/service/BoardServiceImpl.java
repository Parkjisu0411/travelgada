package com.gada.travelgada.service;

import java.io.File;
import java.io.FileOutputStream;
import java.io.OutputStream;
import java.io.PrintWriter;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.stereotype.Service;
import org.springframework.web.multipart.MultipartFile;

import com.gada.travelgada.domain.BoardVO;
import com.gada.travelgada.domain.CriteriaVO;
import com.gada.travelgada.domain.MemberVO;
import com.gada.travelgada.mapper.BoardMapper;

import lombok.AllArgsConstructor;

//@NoArgsConstructor
@AllArgsConstructor
@Service
public class BoardServiceImpl implements BoardService {
	
	private BoardMapper boardMapper;
	
	@Override
	public List<BoardVO> getReviewBoard(int nowPage, int amount) {
		return boardMapper.selectReviewBoard(nowPage, amount);
	}
	
//	@Override
//	public List<BoardVO> getReviewBoard(CriteriaVO cri) {
//		return boardMapper.selectReviewBoard(cri);
//	}

	@Override
	public int getTotalReviewBoard(CriteriaVO cri) {
		return boardMapper.getTotalReviewBoard(cri);
	}
	
	@Override
	public List<BoardVO> getQnABoard(int nowPage, int amount) {
		return boardMapper.selectQnABoard(nowPage, amount);
	}
	
	@Override
	public int getTotalQnABoard(CriteriaVO cri) {
		return boardMapper.getTotalQnABoard(cri);
	}

	@Override
	public List<BoardVO> getAccompanyBoard(int nowPage, int amount) {
		return boardMapper.getAccompanyBoard(nowPage, amount);
	}
	
	@Override
	public int getTotalAccompanyBoard(CriteriaVO cri) {
		return boardMapper.getTotalAccompanyBoard(cri);
	}
	
	@Override
	public BoardVO boardContentView(BoardVO boardVO) {
		boardMapper.addHit(boardVO);
		return boardMapper.boardContentView(boardVO);
	}
	
	@Override
	public MemberVO boardImgPath(MemberVO memberVO) {
		return boardMapper.boardImgPath(memberVO);
	}
	
	@Override
	public List<BoardVO> getNotice() {
		return boardMapper.getNotice();
	}
	
//	@Override
//	public void writeBoard(BoardVO boardVO, String username) {
//		boardMapper.writeBoard(boardVO, username);
//	}
	
	@Override
	public void writeBoard(BoardVO boardVO) {
		boardMapper.writeBoard(boardVO);
	}

	@Override
	public void modifyBoardContent(BoardVO boardVO) {
		boardMapper.modifyBoardContent(boardVO);
	}


	@Override
	public void deleteBoard(BoardVO boardVO) {
		boardMapper.deleteBoard(boardVO);
	}

//	@Override
//	@SuppressWarnings("resource")
//	public void ckeditorImageUpload(HttpServletRequest request, HttpServletResponse response, MultipartFile upload) {
//		OutputStream out = null;
//
//		PrintWriter printWriter = null;	
//
//		String fileName = upload.getOriginalFilename();
//
//		byte[] bytes = upload.getBytes();
//
//		String uploadPath = "C:\\Users\\김슬기\\git\\travelgada\\src\\main\\webapp\\resources\\ckeditor" + "\\" + fileName;
//
//		
//
//		System.out.println(uploadPath);
//
//		out = new FileOutputStream(new File(uploadPath));
//
//		out.write(bytes);
//
//		String callback = request.getParameter("CKEditorFuncNum");
//
//		
//
//		printWriter = response.getWriter();
//		
//		String save_url = "/board/board_modify_view";
//
//		String fileUrl = request.getContextPath() + save_url + "/" +fileName; //url 경로
//
//		
//
//		printWriter.println("<script type='text/javascript'>window.parent.CKEDITOR.tools.callFunction("
//
//	               + callback
//
//	               + ",'"
//
//	               + fileUrl
//
//	               + "','이미지를 업로드 하였습니다.'"
//
//	               + ")</script>");
//
//	       printWriter.flush();
//	}


	
	
	
	





	

















}
