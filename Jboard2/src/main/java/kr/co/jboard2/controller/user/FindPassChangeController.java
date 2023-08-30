package kr.co.jboard2.controller.user;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;

import kr.co.jboard2.dto.UserDTO;
import kr.co.jboard2.service.UserService;

@WebServlet("/user/findPassChange.do")
public class FindPassChangeController extends HttpServlet{

	/**
	 * 
	 */
	private static final long serialVersionUID = 8027699714672515127L;
	private UserService service = UserService.INSTATNCE;
	private Logger logger =LoggerFactory.getLogger(this.getClass());
	
	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		//개별페이지에대한 인가처리
		HttpSession session =req.getSession();
		String uid =(String) session.getAttribute("uid");
		
		if(uid==null) {
			resp.sendRedirect("/Jboard2/user/findPass.do");
		}else {
			RequestDispatcher dispatcher=req.getRequestDispatcher("/user/findPassChange.jsp");
			dispatcher.forward(req, resp);

		}
		

	
	}
	
	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		String uid=req.getParameter("uid");
		String pass=req.getParameter("pass2");
		
	
		service.updatePass(uid,pass);
		resp.sendRedirect("/Jboard2/user/login.do?success=104");
		
		/*String uid=req.getParameter("uid");
		String email=req.getParameter("email");
		String pass2=req.getParameter("pass2");
		String type=req.getParameter("type");
		
		logger.info("user : "+email);
		logger.info("user : "+uid);
		logger.info("user : "+pass2);
		logger.info("user : "+type);
		
		if(type.equals("FIND_PASS")) {
			logger.info("user : "+type);
			logger.info("user : "+pass2);
			UserDTO user=service.selectUserByUidAndEmail(uid, email);
			req.setAttribute("user", user);
		}else {

			
			logger.info("user : "+pass2);
			logger.info("user : "+type);

		}*/
		
	}
	
}
