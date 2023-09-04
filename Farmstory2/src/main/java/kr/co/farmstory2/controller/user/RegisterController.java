package kr.co.farmstory2.controller.user;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;

import kr.co.farmstory2.dto.UserDTO;
import kr.co.farmstory2.service.UserService;
@WebServlet("/user/register.do")
public class RegisterController extends HttpServlet {

	private static final long serialVersionUID = -5076283254618512813L;
	private Logger logger =LoggerFactory.getLogger(this.getClass());
	private UserService service = UserService.INSTANCE;
	
	@Override	
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
	
		RequestDispatcher dispatcher=req.getRequestDispatcher("/user/register.jsp");
		dispatcher.forward(req, resp);
		
		
	}
	
	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		
		String uid =req.getParameter("uid");
		String pass =req.getParameter("pass2");
		String name =req.getParameter("name");
		String nick =req.getParameter("nick");
		String email =req.getParameter("email");
		String hp =req.getParameter("hp");
		String addr1 =req.getParameter("addr1");
		String addr2 =req.getParameter("addr2");
		String regip =req.getRemoteAddr();
		
		logger.info("uid : "+uid);
		logger.info("pass : "+pass);
		logger.info("name : "+name);
		logger.info("nick : "+nick);
		logger.info("email : "+email);
		logger.info("hp : "+hp);
		logger.info("addr1 : "+addr1);
		logger.info("addr2 : "+addr2);
		logger.info("regip : "+regip);
		
		
		UserDTO dto =new UserDTO();
		dto.setUid(uid);
		dto.setPass(pass);
		dto.setName(name);
		dto.setNick(nick);
		dto.setEmail(email);
		dto.setHp(hp);
		dto.setAddr1(addr1);
		dto.setAddr2(addr2);
		dto.setRegip(regip);
		
		service.insertUser(dto);
		
		resp.sendRedirect("/Farmstory2/user/login.do?success=200");
		
		
		
	
	}
}
