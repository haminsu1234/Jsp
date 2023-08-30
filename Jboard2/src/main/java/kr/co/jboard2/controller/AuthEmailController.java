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

@WebServlet("/user/authEmail.do")
public class AuthEmailController extends HttpServlet{

	private static final long serialVersionUID = 7822057743180169976L;

	private UserService service = UserService.INSTATNCE;
	private Logger logger =LoggerFactory.getLogger(this.getClass());
	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {


		
		String type = req.getParameter("type");
		String email = req.getParameter("email");
		String name = req.getParameter("name");
		String uid = req.getParameter("uid");
		
		int result4=0;
		int status=0;
		if(type.equals("REGISTER")) {
			
			//회원가입시 이거 근데 이렇게하면 회원가입할떄 인증안될것같은디?
			result4 =service.selectCountEmail(email);
			if(result4==0) {
				status = service.sendCodeByEmail(email);
			}
		}else if(type.equals("FIND_ID")) {
			
			//아이디찾기활때
			result4 =service.selectCountNameAndEmail(email,name);
			if(result4==1) {
				status = service.sendCodeByEmail(email);
			}
		}else if(type.equals("FIND_PASS")) {
			result4 =service.selectCountUidAndEmail(email,uid);
			if(result4==1) {
				status = service.sendCodeByEmail(email);
			}
			
		}else if(type.equals("MODIFY")) {
			//result4 =service.selectCountUidAndEmail(email,uid);
			//이메일을 수정할때
			result4 =service.selectCountEmail(email);
			if(result4==0) {
				status = service.sendCodeByEmail(email);
			}
		}
		
		
		//logger.info("email : " +email);
		logger.info("status : "+status);
		logger.info("result4 : "+result4);

		JsonObject json = new JsonObject();
		json.addProperty("status", status);
		json.addProperty("result4", result4);
		// Json 출력
		PrintWriter writer = resp.getWriter();
		writer.print(json.toString());
		
		
	}
	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		String code =req.getParameter("code");
		
		int result=service.confirmCodeByEmail(code);
		
		JsonObject json = new JsonObject();
		json.addProperty("result", result);
		
		// Json 출력
		PrintWriter writer = resp.getWriter();
		writer.print(json.toString());
		
		
	}
}
