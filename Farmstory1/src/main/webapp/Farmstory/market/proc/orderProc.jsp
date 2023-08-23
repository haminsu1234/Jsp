<%@page import="kr.farmstory1.dao.OrderDAO"%>
<%@page import="kr.farmstory1.dto.OrderDTO"%>
<%@page import="kr.farmstory1.dto.ProductDTO"%>
<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%

	request.setCharacterEncoding("UTF-8");

	String orderuser=request.getParameter("buyer");
	String orderhp=request.getParameter("hp");
	String orderzip=request.getParameter("zip");
	String orderaddr1=request.getParameter("addr1");
	String orderaddr2=request.getParameter("addr2");
	String orderetc=request.getParameter("etc");
	String orderprice=request.getParameter("price");
	String orderdelivery=request.getParameter("delivery");
	String ordertotal=request.getParameter("finalPrice");
	String ordercount=request.getParameter("count");
	String orderproduct=request.getParameter("pNo");
	String ordereceiver=request.getParameter("receiver");


	
	
	
	OrderDTO dto = new OrderDTO();
	dto.setOrderuser(orderuser);
	dto.setOrderhp(orderhp);
	dto.setOrderzip(orderzip);
	dto.setOrderaddr1(orderaddr1);
	dto.setOrderaddr2(orderaddr2);
	dto.setOrderetc(orderetc);
	dto.setOrderprice(orderprice);
	dto.setOrderdelivery(orderdelivery);
	dto.setOrdertotal(ordertotal);
	dto.setOrdercount(ordercount);
	dto.setOrderproduct(orderproduct);
	dto.setOrdereceiver(ordereceiver);
	OrderDAO dao =new OrderDAO();
	
	dao.insertOrder(dto);
	
	response.sendRedirect("/Farmstory1/Farmstory/market/view.jsp?pno="+orderproduct);

%>