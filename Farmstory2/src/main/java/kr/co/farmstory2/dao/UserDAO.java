package kr.co.farmstory2.dao;

import java.sql.SQLException;
import java.util.List;

import javax.servlet.http.HttpServlet;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;

import kr.co.farmstory2.dto.UserDTO;
import kr.farmstory2.db.DBHelper;
import kr.farmstory2.db.SQL;

public class UserDAO extends DBHelper{

	public static UserDAO instance = new UserDAO();
	public static UserDAO getInstance() {
		return instance;
	}
	private Logger logger =LoggerFactory.getLogger(this.getClass());
	
	public void insertUser(UserDTO dto) {
		
		try {
			conn=getConnection();
			psmt=conn.prepareStatement(SQL.INSERT_USER);
			psmt.setString(1, dto.getUid());
			psmt.setString(2, dto.getPass());
			psmt.setString(3, dto.getName());
			psmt.setString(4, dto.getNick());
			psmt.setString(5, dto.getEmail());
			psmt.setString(6, dto.getHp());
			psmt.setString(7, dto.getZip());
			psmt.setString(8, dto.getAddr1());
			psmt.setString(9, dto.getAddr2());
			psmt.setString(10, dto.getRegip());
			
			psmt.executeUpdate();
			
			close();
		} catch (Exception e) {
			logger.error("insertUser error : "+e.getMessage());
		}
		
		
		
	}
	public UserDTO selectUser(String uid, String pass) {
		UserDTO dto = null;
		try {
			
			conn=getConnection();
			
			psmt=conn.prepareStatement(SQL.SELECT_USER);
			psmt.setString(1, uid);
			psmt.setString(2, pass);
			
			rs=psmt.executeQuery();
			
			if(rs.next()) {
				
				dto = new UserDTO();
				dto.setUid(rs.getString(1));
				dto.setPass(rs.getString(2));
				dto.setName(rs.getString(3));
				dto.setNick(rs.getString(4));
				dto.setEmail(rs.getString(5));
				dto.setHp(rs.getString(6));
				dto.setRole(rs.getString(7));
				dto.setZip(rs.getString(8));
				dto.setAddr1(rs.getString(9));
				dto.setAddr2(rs.getString(10));
				dto.setRegip(rs.getString(11));
				dto.setRegDate(rs.getString(12));
				dto.setLeaveDate(rs.getString(13));

			}
			
			close();
				
		} catch (Exception e) {
			logger.error("selecttUser error : "+e.getMessage());
		}
		
		return dto;
	}
	public List<UserDTO> selectUsers(String start,String cate) {
		return null;
		
	}
	public void deleteUser() {}
	public void updateUser(UserDTO dto) {}
	
	public int selectCountUid(String uid) {
		int result1 =0;
		
		
		try {
			conn=getConnection();
			psmt=conn.prepareStatement(SQL.SELECT_COUNT_UID);
			psmt.setString(1, uid);
			
			rs=psmt.executeQuery();
			
			if(rs.next()) {
				result1=rs.getInt(1);
			}
			
			close();
		} catch (SQLException e) {
			logger.error("selectCountUid error : "+e.getMessage());
		}
		
		return result1;
	}
	
	public int selectCountNick(String nick) {
		int result2 =0;
		
		
		try {
			conn=getConnection();
			psmt=conn.prepareStatement(SQL.SELECT_COUNT_NICK);
			psmt.setString(1, nick);
			
			rs=psmt.executeQuery();
			
			if(rs.next()) {
				result2=rs.getInt(1);
			}
			
			close();
		} catch (SQLException e) {
			logger.error("selectCountNick error : "+e.getMessage());
		}
		
		return result2;
	}
	
	public int selectCountHp(String hp) {
		int result3 =0;
		
		
		try {
			conn=getConnection();
			psmt=conn.prepareStatement(SQL.SELECT_COUNT_HP);
			psmt.setString(1, hp);
			
			rs=psmt.executeQuery();
			
			if(rs.next()) {
				result3=rs.getInt(1);
			}
			
			close();
		} catch (SQLException e) {
			logger.error("selectCountNick error : "+e.getMessage());
		}
		
		return result3;
	}
	
	public int selectCountEmail(String email) {
		int result4 =0;
		
		
		try {
			conn=getConnection();
			psmt=conn.prepareStatement(SQL.SELECT_COUNT_EMAIL);
			psmt.setString(1, email);
			
			rs=psmt.executeQuery();
			
			if(rs.next()) {
				result4=rs.getInt(1);
			}
			
			close();
		} catch (SQLException e) {
			logger.error("selectCountNick error : "+e.getMessage());
		}
		
		return result4;
	}
	
	public int selectCountTotal(String cate) {
		int total=0;
		try {
			conn=getConnection();
			psmt=conn.prepareStatement(SQL.SELECT_COUNT_TOTAL);
			psmt.setString(1, cate);
			
			rs=psmt.executeQuery();
			
			if(rs.next()) {
				total=rs.getInt(1);
			}
			
			
		} catch (Exception e) {
			logger.error("selectCountTotal error : "+e.getMessage());
		}
		
		return total;
	}
	
	
}
