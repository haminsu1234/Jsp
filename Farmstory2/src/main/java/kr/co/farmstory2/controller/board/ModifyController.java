package kr.co.farmstory2.controller.board;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;

import com.oreilly.servlet.MultipartRequest;

import kr.co.farmstory2.service.ArticleService;
import kr.co.farmstory2.service.FileService;
import kr.co.farmstory2.dto.ArticleDTO;
import kr.co.farmstory2.dto.FileDTO;

@WebServlet("/board/modify.do")
public class ModifyController extends HttpServlet {
	private static final long serialVersionUID = 2225893371093230317L;
	private ArticleService service1 =ArticleService.INSTANCE;
	private FileService service2=FileService.INSTANCE;
	private Logger logger =LoggerFactory.getLogger(this.getClass());
	
	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {

		
		String no = req.getParameter("no");
		String group = req.getParameter("group");
		String cate = req.getParameter("cate");
		
		ArticleDTO views =service1.selectView(no);

		req.setAttribute("views", views);
		
		if(views.getFile() > 1) {
			FileDTO file = service2.selectFile(no);
			req.setAttribute("file", file);
		}
		
		req.setAttribute("group", group);
		req.setAttribute("cate", cate);
		
		RequestDispatcher dispatcher = req.getRequestDispatcher("/board/modify.jsp");
		dispatcher.forward(req, resp);	
		
		
		
		
		
	}
	
	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		
		MultipartRequest mr=service1.uploadFile(req);
		
		//파일명수정

		
		
		//폼데이터 수신
		String no = mr.getParameter("no");
		String group=mr.getParameter("group");
		String cate=mr.getParameter("cate");
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
		logger.info("regip : "+cate);
		logger.info("regip : "+group);
		
		//DTO생성
		ArticleDTO dto = new ArticleDTO();
		dto.setTitle(title);
		dto.setContent(content);
		dto.setFile(oName);
		dto.setWriter(writer);
		dto.setRegip(regip);
		dto.setCate(cate);
		dto.setNo(no);
		//DB INSERT
		int ano=service1.updateArticle(dto);;
		
		
		//파일명 수정및 FILE테이블 INSERT
		if(oName!=null) {
			
			String sName=service1.renameToFile(req, oName);
			
			//FILE 테이블 INSERT
			FileDTO filedto = new FileDTO();
			filedto.setAno(ano);
			filedto.setOriName(oName);
			filedto.setNewName(sName);
			
			service2.insertFile(filedto);
			service1.
			
			
		}
		
		
		resp.sendRedirect("/Farmstory2/board/view.do?group="+group+"&cate="+cate+"&no="+no);
		
		
	}
}