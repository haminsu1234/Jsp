package kr.co.farmstory2.service;

import java.util.List;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;

import kr.co.farmstory2.dao.ArticleDAO;
import kr.co.farmstory2.dao.OrderDAO;
import kr.co.farmstory2.dto.OrderDTO;

public enum OrderService {
	
	INSTANCE;
	private Logger logger =LoggerFactory.getLogger(this.getClass());
	private OrderDAO dao =OrderDAO.getInstance();
	
	
	
	public void insertOrder(OrderDTO dto) {
		dao.insertOrder(dto);
	}
	
	
	
	public void selectOrder() {}
	public List<OrderDTO> selectOrders(int start){
		return dao.selectOrders(start);
	}
	{}
	public void updateOrder() {}
	public void deleteOrder() {}
	
	public int selectCountOrderTotal() {
		return dao.selectCountOrderTotal();
	}
	
	
}
