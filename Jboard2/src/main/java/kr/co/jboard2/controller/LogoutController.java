package kr.co.jboard2.controller;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;

import kr.co.jboard2.service.UserService;
@WebServlet("/user/logout.do")
public class LogoutController extends HttpServlet {
	/**
	 * 
	 */
	private static final long serialVersionUID = 6475245142948472244L;
	private UserService service = UserService.INSTATNCE;
	private Logger logger =LoggerFactory.getLogger(this.getClass());
	
	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {

		HttpSession session=req.getSession();
		session.invalidate();	

		resp.sendRedirect("/Jboard2/user/login.do?success=201");
	}


}