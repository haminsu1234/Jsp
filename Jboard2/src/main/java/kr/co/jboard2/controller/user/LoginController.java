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

import com.mysql.cj.Session;

import kr.co.jboard2.dto.UserDTO;
import kr.co.jboard2.service.UserService;
@WebServlet("/user/login.do")
public class LoginController extends HttpServlet {
	
	/**
	 * 
	 */
	private static final long serialVersionUID = -4186835984534841942L;
	private UserService service = UserService.INSTATNCE;
	private Logger logger =LoggerFactory.getLogger(this.getClass());
	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		
		String success = req.getParameter("success");
		req.setAttribute("success", success);

				
		RequestDispatcher dispatcher=req.getRequestDispatcher("/user/login.jsp");
		dispatcher.forward(req, resp);
	}
	
	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		
		String uid=req.getParameter("uid");
		String pass=req.getParameter("pass");
		
		logger.info("pass : "+pass);
		UserDTO user =service.selectUser(uid, pass);
		
		logger.info("user : "+user);
				
		
		
		if(user!=null) {
			HttpSession session=req.getSession();
			session.setAttribute("sessUser",user);
			
			resp.sendRedirect("/Jboard2/list.do");
		}else {
			resp.sendRedirect("/Jboard2/user/login.do?success=100");
		}
		
		
		
	}
	
}
