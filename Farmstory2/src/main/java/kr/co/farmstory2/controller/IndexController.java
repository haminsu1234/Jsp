package kr.co.farmstory2.controller;

import java.io.IOException;
import java.util.ArrayList;
import java.util.List;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;

import kr.co.farmstory2.dto.ArticleDTO;
import kr.co.farmstory2.service.ArticleService;
@WebServlet(value = {"", "/index.do"})
public class IndexController extends HttpServlet {
	private static final long serialVersionUID = -5141473195026626452L;

	private ArticleService service = ArticleService.INSTANCE;
	private Logger logger =LoggerFactory.getLogger(this.getClass());
	
	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {

		String cate1 = "grow";
		String cate2 = "story";
		String cate3 = "school";
		String cate4 = "notice";
		String cate5 = "qna";
		String cate6 = "faq";
		
		int lateNum = 5;
		int lateNum2 = 3;
		
		List<ArticleDTO> latest1 = service.selectArticlesLatest(cate1,lateNum);
		List<ArticleDTO> latest2 = service.selectArticlesLatest(cate2,lateNum);
		List<ArticleDTO> latest3 = service.selectArticlesLatest(cate3,lateNum);
		List<ArticleDTO> tabs1 = service.selectArticlesLatest(cate4,lateNum2);
		List<ArticleDTO> tabs2 = service.selectArticlesLatest(cate5,lateNum2);
		List<ArticleDTO> tabs3 = service.selectArticlesLatest(cate6,lateNum2);
		
		req.setAttribute("latest1", latest1);
		req.setAttribute("latest2", latest2);
		req.setAttribute("latest3", latest3);
		req.setAttribute("tabs1", tabs1);
		req.setAttribute("tabs2", tabs2);
		req.setAttribute("tabs3", tabs3);

		

		RequestDispatcher dispatcher = req.getRequestDispatcher("/index.jsp");
		dispatcher.forward(req, resp);	
	}
}