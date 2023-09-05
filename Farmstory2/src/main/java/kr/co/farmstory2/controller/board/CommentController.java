package kr.co.farmstory2.controller.board;

import java.io.IOException;
import java.util.List;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;

import com.google.gson.JsonObject;

import kr.co.farmstory2.service.ArticleService;
import kr.co.farmstory2.service.FileService;
import kr.co.farmstory2.dto.ArticleDTO;
import kr.co.farmstory2.dto.FileDTO;

@WebServlet("/board/comment.do")
public class CommentController extends HttpServlet {

	/**
	 * 
	 */
	private static final long serialVersionUID = -8224605952270627121L;
	private ArticleService service1 = ArticleService.INSTANCE;
	private Logger logger =LoggerFactory.getLogger(this.getClass());

	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		String no=req.getParameter("no");
		String content=req.getParameter("comment");
		String writer=req.getParameter("writer");
		String regip=req.getRemoteAddr();
		
		logger.info("parent :" +no);
		logger.info("parent :" +content);
		logger.info("parent :" +writer);
		
		ArticleDTO dto =new ArticleDTO();
		dto.setNo(no);
		dto.setContent(content);
		dto.setWriter(writer);
		dto.setRegip(regip);
		
		int result = service1.updateComment(dto);
		
		JsonObject json =new JsonObject();
		json.addProperty("result", result);
		resp.getWriter().print(json);
	
	}
	
	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		String parent=req.getParameter("parent");
		String content=req.getParameter("content");
		String writer=req.getParameter("writer");
		String regip=req.getRemoteAddr();
		
		ArticleDTO dto =new ArticleDTO();
		dto.setParent(parent);
		dto.setContent(content);
		dto.setWriter(writer);
		dto.setRegip(regip);
		
		int result=service1.insertComment(dto);
		service1.updateCommentNum(parent);
		
		JsonObject json =new JsonObject();
		json.addProperty("result", result);
		resp.getWriter().print(json);
	
	}





}