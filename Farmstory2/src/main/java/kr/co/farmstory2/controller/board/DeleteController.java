package kr.co.farmstory2.controller.board;

import java.io.File;
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
import kr.co.farmstory2.service.FileService;
import kr.co.farmstory2.service.UserService;


@WebServlet("/board/delete.do")
public class DeleteController extends HttpServlet {


	/**
	 * 
	 */
	private static final long serialVersionUID = 6174594878377156019L;

	private ArticleService service = ArticleService.INSTANCE;
	private FileService service2 =FileService.INSTANCE;
	private Logger logger =LoggerFactory.getLogger(this.getClass());
	
	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {		

		String no = req.getParameter("no");
		String group = req.getParameter("group");
		String cate = req.getParameter("cate");
		String onlyfile = req.getParameter("onlyfile");
		// onlyfile 값이 있을경우에만 파일만(중요) 삭제함 왜냐? onlyfile에 값이 들어오는경우는 modify에서 파일수정할때 말고는 없기때문 
		if(onlyfile != null) {
			int result =service2.deleteFile(no);
				
			if(result > 0) {
			service.updateCountFile(no);
			String path = service.getUploadPath(req);
			
			File file = new File(path+"/"+"파일명");
			
			if(file.exists()) {
				file.delete();	
			}
			resp.sendRedirect("/Farmstory2/board/modify.do?group="+group+"&cate="+cate+"&no="+no);
			}
		}else if (onlyfile==null){ // onlyfile 값이 null 일경우에는 view -> delete 이기떄문에 게시글까지 삭제하는것
			int result =service2.deleteFile(no);
			service.deleteArticle(no);
			if(result > 0) {
			String path = service.getUploadPath(req);
			
			File file = new File(path+"/"+"파일명");
			
				if(file.exists()) {
					file.delete();	
				}
			}
			resp.sendRedirect("/Farmstory2/board/list.do?group="+group+"&cate="+cate);
		}
		
		
		
		
					
		

	}
	
	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		String kind = req.getParameter("kind");
		String no = req.getParameter("no");
		String parent = req.getParameter("no");
		
		logger.info("kind : "+kind);
		logger.info("no : "+no);
		logger.info("parent : "+parent);
		
		int result=0;
		switch(kind) {
		case"REMOVE":
			result=service.deleteComment(no);
			
			break;
		}

		JsonObject json = new JsonObject();
		json.addProperty("result", result);
		resp.getWriter().print(json);
	
	}

}


