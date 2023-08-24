package kr.farmstory1.dao;

import java.util.ArrayList;
import java.util.List;

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
			psmt.setString(12, dto.getOrderreceiver());
		
			psmt.executeUpdate();
			
			close();
		} catch (Exception e) {
			e.printStackTrace();
		}
		
		
	}
	
	public OrderDTO selectOrder(String orderno) {
			
		OrderDTO dto =new OrderDTO();
		
		try {
			conn=getConnection();
			psmt = conn.prepareStatement(SQL.SELECT_ORDER);
			psmt.setString(1, orderno);;
			rs=psmt.executeQuery();
			
			if(rs.next()) {
				
				dto.setOrderno(rs.getInt(1));
				dto.setOrderproduct(rs.getInt(2));
				dto.setOrderreceiver(rs.getString(3));
				dto.setOrdercount(rs.getInt(4));
				dto.setOrderdelivery(rs.getInt(5));
				dto.setOrderprice(rs.getInt(6));
				dto.setOrderhp(rs.getString(8));
				dto.setOrderzip(rs.getString(9));
				dto.setOrderaddr1(rs.getString(10));
				dto.setOrderaddr2(rs.getString(11));
				dto.setOrderetc(rs.getString(12));
				dto.setOrderuser(rs.getString(13));
				dto.setOrderdate(rs.getString(14));
				
			}
			
			close();
			
		} catch (Exception e) {
			e.printStackTrace();
		} 
		
		return dto;
		
		
	}
	
	public List<OrderDTO> selectOrders(int start) {
		List<OrderDTO> orders = new ArrayList<>();
		try {
			conn=getConnection();
			psmt = conn.prepareStatement(SQL.SELECT_ORDERS);
			psmt.setInt(1, start);
			rs=psmt.executeQuery();
			
			while(rs.next()) {
				OrderDTO dto =new OrderDTO();
				dto.setOrderno(rs.getInt(1));
				dto.setOrderproduct(rs.getInt(2));
				dto.setOrderreceiver(rs.getString(3));
				dto.setOrdercount(rs.getInt(4));
				dto.setOrderdelivery(rs.getInt(5));
				dto.setOrderprice(rs.getInt(6));
				dto.setOrderhp(rs.getString(8));
				dto.setOrderzip(rs.getString(9));
				dto.setOrderaddr1(rs.getString(10));
				dto.setOrderaddr2(rs.getString(11));
				dto.setOrderetc(rs.getString(12));
				dto.setOrderuser(rs.getString(13));
				dto.setOrderdate(rs.getString(14));
				dto.setpName(rs.getString(16));
				dto.setThumb1(rs.getString(17));
				
				orders.add(dto);
				
			}
			
			close();
			
		} catch (Exception e) {
			e.printStackTrace();
		} 
		
		
		return orders;
	}
	
	public int selectCountOrderAllTotal() {
		int total =0;
		
		try {
			conn=getConnection();
			psmt=conn.prepareStatement(SQL.SELECT_COUNT_ORDER);
			rs=psmt.executeQuery();
			
			if(rs.next()) {
				total=rs.getInt(1);
			}
			
			
		} catch (Exception e) {
			e.printStackTrace();
		}
		
		return total;
	}
	
	public void updateOrder() {
		
	}
	
	public void deleteOrder(String orderno) {
		
		try {
			conn=getConnection();
			psmt=conn.prepareStatement(SQL.UPDATE_USEYN_ORDER);
			psmt.setString(1, orderno);
			psmt.executeUpdate();
			
			close();
		}catch (Exception e) {
			e.printStackTrace();
		}
	}
	
	
}
