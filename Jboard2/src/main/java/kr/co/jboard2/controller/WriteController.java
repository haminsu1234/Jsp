package kr.co.jboard2.controller;

import java.io.File;
import java.io.IOException;
import java.util.UUID;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletContext;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;

import com.oreilly.servlet.MultipartRequest;
import com.oreilly.servlet.multipart.DefaultFileRenamePolicy;

import kr.co.jboard2.dto.ArticleDTO;
import kr.co.jboard2.dto.FileDTO;
import kr.co.jboard2.service.ArticleService;
import kr.co.jboard2.service.FileService;
@WebServlet("/write.do")
public class WriteController extends HttpServlet{
	
	/**
	 * 
	 */
	private static final long serialVersionUID = -9218145124590394491L;
	private ArticleService service1 = ArticleService.INSTATNCE;
	private FileService service2 = FileService.INSTATNCE;
	private Logger logger =LoggerFactory.getLogger(this.getClass());
	
	
	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {

		RequestDispatcher dispatcher=req.getRequestDispatcher("./write.jsp");
		dispatcher.forward(req, resp);
		
	}
	
	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {

		MultipartRequest mr=service1.uploadFile(req);
		
		//파일명수정

		
		
		//폼데이터 수신
		String title=mr.getParameter("title");
		String content=mr.getParameter("content");
		String writer=mr.getParameter("writer");
		String oName=mr.getOriginalFileName("file");
		String regip=req.getRemoteAddr();
		
		//로그
		logger.info("title : "+title);
		logger.info("content : "+content);
		logger.info("writer : "+writer);
		logger.info("file : "+oName);
		logger.info("regip : "+regip);
		
		//DTO생성
		ArticleDTO dto = new ArticleDTO();
		dto.setTitle(title);
		dto.setContent(content);
		dto.setFile(oName);
		dto.setWriter(writer);
		dto.setRegip(regip);
		
		//DB INSERT
		int ano=service1.insertArticle(dto);;
		
		
		//파일명 수정및 FILE테이블 INSERT
		if(oName!=null) {
			
			String sName=service1.renameToFile(req, oName);
			
			//FILE 테이블 INSERT
			FileDTO filedto = new FileDTO();
			filedto.setAno(ano);
			filedto.setOriName(oName);
			filedto.setNewName(sName);
			service2.insertFile(filedto);
			
			
			
		}

		//REDIRECT
		resp.sendRedirect("/Jboard2/list.do");

	}
	
}
