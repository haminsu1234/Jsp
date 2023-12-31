package kr.co.jboard2.controller;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;

import kr.co.jboard2.dto.ArticleDTO;
import kr.co.jboard2.service.ArticleService;
import kr.co.jboard2.service.FileService;
@WebServlet("/modify.do")
public class ModifyController extends HttpServlet {
	
	/**
	 * 
	 */
	private static final long serialVersionUID = -8310872414785208795L;
	private ArticleService service1 = ArticleService.INSTATNCE;
	private FileService service2 = FileService.INSTATNCE;
	private Logger logger =LoggerFactory.getLogger(this.getClass());
	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {

		String no = req.getParameter("no");
		
		ArticleDTO views =service1.selectView(no);
		
		req.setAttribute("views", views);
		
		
		RequestDispatcher dispatcher=req.getRequestDispatcher("./modify.jsp");
		dispatcher.forward(req, resp);
	}
	
	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {

		String no=req.getParameter("no");
		String content=req.getParameter("content");
		String title=req.getParameter("title");
		
		ArticleDTO dto = new ArticleDTO();
		dto.setNo(no);
		dto.setContent(content);
		dto.setTitle(content);
		service1.updateArticle(dto);
		
		resp.sendRedirect("/Jboard2/list.do");
		
	
	}
}
