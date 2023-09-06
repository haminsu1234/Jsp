package kr.co.farmstory2.controller.market;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;

import kr.co.farmstory2.dto.ProductDTO;
import kr.co.farmstory2.service.ProductService;
import kr.co.farmstory2.service.UserService;
@WebServlet("/market/view.do")
public class ViewController extends HttpServlet {
	
	
	/**
	 * 
	 */
	private static final long serialVersionUID = 7298621507752312340L;
	private Logger logger =LoggerFactory.getLogger(this.getClass());
	private UserService service1 = UserService.INSTANCE;
	private ProductService service2 = ProductService.INSTANCE;
	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {

		String pno = req.getParameter("pno");
		
		ProductDTO product =service2.selectProduct(pno);
		
		req.setAttribute("product", product);
		
		
		
		RequestDispatcher dispatcher=req.getRequestDispatcher("/market/view.jsp");
		dispatcher.forward(req, resp);
		
		
	}
	
	
	
	
}
