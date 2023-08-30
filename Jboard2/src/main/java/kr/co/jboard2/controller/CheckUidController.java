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
@WebServlet("/user/checkUid.do")
public class CheckUidController extends HttpServlet{
	
	/**
	 * 
	 */
	private static final long serialVersionUID = 4032692125840041835L;
	private UserService service = UserService.INSTATNCE;
	private Logger logger =LoggerFactory.getLogger(this.getClass());
	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {

		String uid=req.getParameter("uid");



		int result =service.selectCountUid(uid);



		
		logger.info("result : "+result);



		
		JsonObject json = new JsonObject();
		json.addProperty("result", result);


		
		// Json 출력
		PrintWriter writer = resp.getWriter();
		writer.print(json.toString());
		
		
	}

	
	
}
