package kr.co.jboard2.controller;

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

import kr.co.jboard2.service.UserService;
@WebServlet("/user/checkEmail.do")
public class CheckEmailController extends HttpServlet{
	


	/**
	 * 
	 */
	private static final long serialVersionUID = -6051236612341479193L;
	private UserService service = UserService.INSTATNCE;
	private Logger logger =LoggerFactory.getLogger(this.getClass());
	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {


		
		String email = req.getParameter("email");


		int result4 =service.selectCountEmail(email);


		logger.info("result4 : "+result4);

		JsonObject json = new JsonObject();

		json.addProperty("result4", result4);

		
		// Json 출력
		PrintWriter writer = resp.getWriter();
		writer.print(json.toString());
		
		
	}

	
	
}
