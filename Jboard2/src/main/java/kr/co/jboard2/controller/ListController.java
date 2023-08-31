package kr.co.jboard2.controller;

import java.io.IOException;
import java.util.ArrayList;
import java.util.List;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebListener;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;

import kr.co.jboard2.dto.ArticleDTO;
import kr.co.jboard2.dto.UserDTO;
import kr.co.jboard2.service.ArticleService;

@WebServlet("/list.do")
public class ListController extends HttpServlet {

	/**
	 * 
	 */
	private static final long serialVersionUID = -6512143563601311260L;
	private ArticleService service1 = ArticleService.INSTATNCE;
	private Logger logger =LoggerFactory.getLogger(this.getClass());
	
	
	
	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
	
		//현재 세션 가져오기

		HttpSession session=req.getSession();
		UserDTO sessUser=(UserDTO)session.getAttribute("sessUser");
		
		if(sessUser==null) {			
			resp.sendRedirect("/Jboard2/user/login.do?success=101");
			
		}else {
			String pg =req.getParameter("pg");
			//페이지 관련 변수
			int start=0;
			int currentPage =1;
			int total=0;
			int lastPageNum=0;
			int pageGroupCurrent=1;
			int pageGroupStart=1;
			int pageGroupEnd=0;
			int pageStartNum=0;
			
			
			//현재페이지계산
			if(pg!=null){
				currentPage =Integer.parseInt(pg);
				
			}
			
			//LIMIT 시작값계산
			start =(currentPage -1)*10;

			
			
			//전체 게시물 갯수조회
			total =service1.selectCountTotal();
			
			if(total%10 == 0){
				lastPageNum =(total/10);
			}else{
				lastPageNum =(total/10)+1;
			}
			
			//페이지 그룹계산
			pageGroupCurrent=(int) Math.ceil(currentPage/10.0);
			pageGroupStart=(pageGroupCurrent-1)*10+1;
			pageGroupEnd=pageGroupCurrent*10;
			
			if(pageGroupEnd > lastPageNum){
				pageGroupEnd=lastPageNum;
			}
			
			//페이지 시작번호 계산
			pageStartNum =total-start;
			
			logger.info("start : " + start);
			logger.info("start : " + currentPage);
			logger.info("start : " + total);
			logger.info("start : " + lastPageNum);
			logger.info("start : " + pageGroupCurrent);
			logger.info("start : " + pageGroupStart);
			logger.info("start : " + pageGroupEnd);
			logger.info("start : " + pageStartNum);
			
			
			
			req.setAttribute("start", start);
			req.setAttribute("currentPage", currentPage);
			req.setAttribute("total", total);
			req.setAttribute("lastPageNum", lastPageNum);
			req.setAttribute("pageGroupCurrent", pageGroupCurrent);
			req.setAttribute("pageGroupStart", pageGroupStart);
			req.setAttribute("pageGroupEnd", pageGroupEnd);
			req.setAttribute("pageStartNum", pageStartNum);
			
			

			List<ArticleDTO> article = service1.selectArticles(start);
			req.setAttribute("article", article);
			
			RequestDispatcher dispatcher=req.getRequestDispatcher("./list.jsp");
			dispatcher.forward(req, resp);
		}
	
		
	
		
		
		
		
	}
	
}
