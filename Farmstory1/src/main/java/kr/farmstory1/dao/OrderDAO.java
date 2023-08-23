package kr.farmstory1.dao;

import kr.farmstory1.db.DBHelper;
import kr.farmstory1.db.SQL;
import kr.farmstory1.dto.OrderDTO;

public class OrderDAO extends DBHelper {

	//기본CRUD
	
	public void insertOrder(OrderDTO dto) {
		
		try {
			conn=getConnection();
			psmt=conn.prepareStatement(SQL.INSERT_ORDER);
			psmt.setInt(1, dto.getOrderproduct());
			psmt.setInt(2, dto.getOrdercount());
			psmt.setInt(3, dto.getOrderdelivery());
			psmt.setInt(4, dto.getOrderprice());
			psmt.setInt(5, dto.getOrdertotal());
			psmt.setString(6, dto.getOrderhp());
			psmt.setString(7, dto.getOrderzip());
			psmt.setString(8, dto.getOrderaddr1());
			psmt.setString(9, dto.getOrderaddr2());
			psmt.setString(10, dto.getOrderetc());
			psmt.setString(11, dto.getOrderuser());
			psmt.setString(12, dto.getOrdereceiver());
		
			psmt.executeUpdate();
			
			close();
		} catch (Exception e) {
			e.printStackTrace();
		}
		
		
	}
	
	public void selectOrder() {
		
	}
	
	public void updateOrder() {
		
	}
	
	public void deleteOrder() {
		
	}
	
	
}
