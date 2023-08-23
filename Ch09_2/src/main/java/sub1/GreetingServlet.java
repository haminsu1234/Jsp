package sub1;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

@WebServlet("/greeting.do")
public class GreetingServlet extends HttpServlet{

	/**
	 * 
	 */
	private static final long serialVersionUID = 3L;
	@Override
	public void init() throws ServletException {

		System.out.println("GreetingServlet init()...");

	}
	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		//클라이언트의 get 요청할때
				System.out.println("GreetingServlet doGet()...");
				
				//HTML출력
				resp.setContentType("text/html;charset=UTF-8");
				
				PrintWriter writer=resp.getWriter();
				writer.println("<html>");
				writer.println("<head>");
				writer.println("<meta charset='UTF-8'>");
				writer.println("<title>GreetingServlet</title>");
				writer.println("</head>");
				writer.println("<body>");
				writer.println("<h3>GreetingServlet</h3>");
				writer.println("<a href='./1_Servlet.jsp'>서블릿메인</a>");
				writer.println("<a href='./hello.do'>helloservlet</a>");
				writer.println("<a href='./welcome.do'>WelcomServlet</a>");
				writer.println("<a href='./greeting.do'>GreetingServlet</a>");
				writer.println("</body>");
				writer.println("</html>");
	}
	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		System.out.println("GreetingServlet doPost()...");
	}
	private void destory() {
		System.out.println("GreetingServlet doPost()...");
	}
	
}