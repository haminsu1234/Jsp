package kr.co.farmstory2.controller.user;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;

import com.google.gson.JsonObject;

import kr.co.farmstory2.service.UserService;


@WebServlet("/user/checkNick.do")
public class CheckNickController extends HttpServlet{
	
	/**
	 * 
	 */
	private static final long serialVersionUID = 2376478724878747624L;
	/**
	 * 
	 */

	private UserService service = UserService.INSTANCE;
	private Logger logger =LoggerFactory.getLogger(this.getClass());
	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {


		
		String nick = req.getParameter("nick");


		int result2 =service.selectCountNick(nick);


		logger.info("result2 : "+result2);

		JsonObject json = new JsonObject();

		json.addProperty("result2", result2);

		
		// Json 출력
		PrintWriter writer = resp.getWriter();
		writer.print(json.toString());
		
		
	}

	
	
}
