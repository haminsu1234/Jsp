package kr.co.farmstory2.controller.board;

import java.io.IOException;
import java.util.List;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;

import com.google.gson.JsonObject;

import kr.co.farmstory2.dto.ArticleDTO;
import kr.co.farmstory2.dto.UserDTO;
import kr.co.farmstory2.service.ArticleService;
import kr.co.farmstory2.service.UserService;


@WebServlet("/board/delete.do")
public class DeleteController extends HttpServlet {


	/**
	 * 
	 */
	private static final long serialVersionUID = 6174594878377156019L;

	private ArticleService service = ArticleService.INSTANCE;
	private Logger logger =LoggerFactory.getLogger(this.getClass());
	
	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {		

		String no = req.getParameter("no");
		String group = req.getParameter("group");
		String cate = req.getParameter("cate");
		
		service.deleteArticle(no);
		
		resp.sendRedirect("/Farmstory2/board/list.do?group="+group+"&cate="+cate);
					
		

	}
	
	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		String kind = req.getParameter("kind");
		String no = req.getParameter("no");
		
		int result=0;
		switch(kind) {
		case"REMOVE":
			result=service.deleteComment(no);
		}
		JsonObject json = new JsonObject();
		json.addProperty("result", result);
		resp.getWriter().print(json);
	
	}

}


