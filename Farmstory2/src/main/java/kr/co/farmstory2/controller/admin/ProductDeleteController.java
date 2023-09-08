package kr.co.farmstory2.controller.admin;

import java.io.IOException;
import java.util.List;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;

import kr.co.farmstory2.dto.OrderDTO;
import kr.co.farmstory2.dto.ProductDTO;
import kr.co.farmstory2.dto.UserDTO;
import kr.co.farmstory2.service.OrderService;
@WebServlet("/admin/delete.do")
public class ProductDeleteController extends HttpServlet {

	/**
	 * 
	 */
	private static final long serialVersionUID = 5545232834974423771L;
	private OrderService service = OrderService.INSTANCE;
	private Logger logger =LoggerFactory.getLogger(this.getClass());
	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {

		String chks[]=req.getParameterValues("chk");
		
		logger.info("chk :" + chks);
		
		
		for(String orderNo : chks){
			
			service.deleteOrder(orderNo);
		}
		
		resp.sendRedirect("/Farmstory2/admin/orderList.do?pg=1");
	
	
	}

	
	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {


	
	}
	
}
