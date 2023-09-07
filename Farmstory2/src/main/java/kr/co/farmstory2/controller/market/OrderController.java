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

import ch.qos.logback.classic.pattern.Util;
import kr.farmstory2.db.Utils;

@WebServlet("/market/order.do")
public class OrderController extends HttpServlet {
	private Logger logger =LoggerFactory.getLogger(this.getClass());
	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {

		/*String pName = req.getParameter("pName");
		String pno = req.getParameter("pNo");
		String thumb2 = req.getParameter("thumb2");
		String delivery = req.getParameter("delivery");
		String price = req.getParameter("price");
		String count = req.getParameter("count");
		String total = req.getParameter("total");
		String finalPrice = req.getParameter("final");
		
		logger.info("pname : "+pName);
		logger.info("pname : "+pno);
		logger.info("pname : "+thumb2);
		logger.info("pname : "+delivery);
		logger.info("pname : "+price);
		logger.info("pname : "+count);
		logger.info("pname : "+total);
		logger.info("pname : "+finalPrice);
		
		
		req.setAttribute("pName", pName);
		req.setAttribute("pno", pno);
		req.setAttribute("thumb2", thumb2);
		req.setAttribute("delivery", delivery);
		req.setAttribute("price", price);
		req.setAttribute("count", count);
		req.setAttribute("total", total);
		req.setAttribute("finalPrice", finalPrice);
		*/
		

		
	}
	
	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		
		String pName = req.getParameter("pName");
		String pno = req.getParameter("pNo");
		String thumb2 = req.getParameter("thumb2");
		String delivery = req.getParameter("delivery");
		String price = req.getParameter("price");
		String count = req.getParameter("count");
		String total = req.getParameter("total");
		String finalPrice = req.getParameter("final");
		
		
		logger.info("pname : "+pName);
		logger.info("pname : "+pno);
		logger.info("pname : "+thumb2);
		logger.info("pname : "+delivery);
		logger.info("pname : "+price);
		logger.info("pname : "+count);
		logger.info("pname : "+total);
		logger.info("pname : "+finalPrice);
		
		
		req.setAttribute("pName", pName);
		req.setAttribute("pno", pno);
		req.setAttribute("thumb2", thumb2);
		req.setAttribute("commadelivery",Utils.comma(delivery));
		req.setAttribute("delivery",delivery);
		req.setAttribute("commaprice", Utils.comma(price));
		req.setAttribute("price", price);
		req.setAttribute("count", count);
		req.setAttribute("commatotal", Utils.comma(total));
		req.setAttribute("total", total);
		req.setAttribute("commafinalPrice", Utils.comma(finalPrice));
		req.setAttribute("finalPrice", finalPrice);
		
		
		RequestDispatcher dispatcher=req.getRequestDispatcher("/market/order.jsp");
		dispatcher.forward(req, resp);
		
		
		
		
		//resp.sendRedirect("/Farmstory2/market/order.do");
		
		

	
	}
	
	
}
