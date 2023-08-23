package sub1;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

public class WelcomServlet extends HttpServlet{

	/**
	 * 
	 */
	private static final long serialVersionUID = 2L;
	@Override
	public void init() throws ServletException {

		System.out.println("WelcomServlet init()...");

	}
	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		//클라이언트의 get 요청할때
				System.out.println("WelcomServlet doGet()...");
				
				//HTML출력
				resp.setContentType("text/html;charset=UTF-8");
				
				PrintWriter writer=resp.getWriter();
				writer.println("<html>");
				writer.println("<head>");
				writer.println("<meta charset='UTF-8'>");
				writer.println("<title>WelcomServlet</title>");
				writer.println("</head>");
				writer.println("<body>");
				writer.println("<h3>WelcomServlet</h3>");
				writer.println("<a href='./1_Servlet.jsp'>서블릿메인</a>");
				writer.println("<a href='./hello.do'>helloservlet</a>");
				writer.println("<a href='./welcome.do'>WelcomServlet</a>");
				writer.println("</body>");
				writer.println("</html>");
	}
	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		System.out.println("WelcomServlet doPost()...");
	}
	private void destory() {
		System.out.println("WelcomServlet doPost()...");
	}
	
}
