package kr.co.jboard2.controller;

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

import kr.co.jboard2.dto.ArticleDTO;
import kr.co.jboard2.dto.FileDTO;
import kr.co.jboard2.service.ArticleService;
import kr.co.jboard2.service.FileService;

@WebServlet("/view.do")
public class ViewController extends HttpServlet {
	/**
	 * 
	 */
	private static final long serialVersionUID = -8034180251253488390L;
	private ArticleService service1 = ArticleService.INSTATNCE;
	private FileService service2 = FileService.INSTATNCE;
	private Logger logger =LoggerFactory.getLogger(this.getClass());
	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		
		String no=req.getParameter("no");
		
		String content=req.getParameter("content");
		String writer=req.getParameter("writer");
		String regip= req.getRemoteAddr();
		
		
		
		ArticleDTO view=service1.selectView(no);
		FileDTO file =service2.selectFile(no);
		
		

		req.setAttribute("view", view);
		req.setAttribute("file", file);
		
		List<ArticleDTO> comments = service1.selectComments(no);
		req.setAttribute("comments", comments);

		RequestDispatcher dispatcher=req.getRequestDispatcher("./view.jsp");
		dispatcher.forward(req, resp);
	}
	
	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		
		String parent=req.getParameter("parent");		
		String content=req.getParameter("content");
		String writer=req.getParameter("writer");
		String regip= req.getRemoteAddr();
		
		ArticleDTO dto =new ArticleDTO();
		dto.setParent(parent);
		dto.setContent(content);
		dto.setWriter(writer);
		dto.setRegip(regip);
		
		service1.insertComment(dto);
		
		resp.sendRedirect("/Jboard2/view.do?no="+parent);
	
	}
	
}
