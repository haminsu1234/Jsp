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

import kr.co.farmstory2.service.ArticleService;
import kr.co.farmstory2.service.FileService;
import kr.co.farmstory2.dto.ArticleDTO;
import kr.co.farmstory2.dto.FileDTO;

@WebServlet("/board/view.do")
public class ViewController extends HttpServlet {
	private static final long serialVersionUID = 5396628695552480490L;
	private ArticleService service1 = ArticleService.INSTANCE;
	private FileService service2 = FileService.INSTANCE;
	private Logger logger =LoggerFactory.getLogger(this.getClass());

	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {

		String group = req.getParameter("group");
		String cate = req.getParameter("cate");
		String no=req.getParameter("no");		
		String content=req.getParameter("content");
		String writer=req.getParameter("writer");
		String regip= req.getRemoteAddr();
		
		req.setAttribute("group", group);
		req.setAttribute("cate", cate);
		

		
		logger.info("content : "+content);
		logger.info("writer : "+writer);
		logger.info("regip : "+regip);
		
		//ArticleDTO article =service1.selectViewFile(no);
		service1.updateViewHit(no);
		ArticleDTO view=service1.selectView(no);
		FileDTO file =service2.selectFile(no);
		
		
		//req.setAttribute("article", article);
		req.setAttribute("view", view);
		req.setAttribute("file", file);
		
		List<ArticleDTO> comments = service1.selectComments(no);
		req.setAttribute("comments", comments);

		
		
		RequestDispatcher dispatcher = req.getRequestDispatcher("/board/view.jsp");
		dispatcher.forward(req, resp);	
	
	
	
	
	
	}
	
	





}