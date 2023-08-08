package kr.co.jboard1.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.Statement;

import javax.naming.Context;
import javax.naming.InitialContext;
import javax.sql.DataSource;

import kr.co.jboard1.db.DBHelper;
import kr.co.jboard1.db.SQL;
import kr.co.jboard1.dto.TermsDTO;
import kr.co.jboard1.dto.UserDTO;

public class UserDAO extends DBHelper{
	
	private static UserDAO instance =new UserDAO();
	public static UserDAO getInstance() {
		return instance;
	}

	public void insertUser(UserDTO vo) {
		
		
		try{
			conn=getConnection();
			
			PreparedStatement psmt=conn.prepareStatement(SQL.INSERT_USER);
			
			psmt.setString(1, vo.getUid());
			psmt.setString(2, vo.getPass());
			psmt.setString(3, vo.getName());
			psmt.setString(4, vo.getNick());
			psmt.setString(5, vo.getEmail());
			psmt.setString(6, vo.getHp());
			psmt.setString(7, vo.getZip());
			psmt.setString(8, vo.getAddr1());
			psmt.setString(9, vo.getAddr2());
			psmt.setString(10, vo.getRegip());

			
			psmt.executeUpdate();
			
			close();
			
			
		}catch(Exception e){
			e.printStackTrace();
		}

		
	}
	
	public UserDTO selectUser(String uid, String pass) {

		UserDTO vo=null;
		
		try{
			
			conn=getConnection();

			PreparedStatement psmt=conn.prepareStatement(SQL.SELECT_USER);
			psmt.setString(1, uid);
			psmt.setString(2, pass);
			ResultSet rs = psmt.executeQuery();
			
			if(rs.next()){
				vo=new UserDTO();
				vo.setUid(rs.getString(1));
				vo.setPass(rs.getString(2));
				vo.setName(rs.getString(3));
				vo.setNick(rs.getString(4));
				vo.setEmail(rs.getString(5));
				vo.setHp(rs.getString(6));
				vo.setRole(rs.getString(7));
				vo.setZip(rs.getString(8));
				vo.setAddr1(rs.getString(9));
				vo.setAddr2(rs.getString(10));
				vo.setRegip(rs.getString(11));
				vo.setRegDate(rs.getString(12));
				vo.setLeaveDate(rs.getString(13));

			}
			
			close();
			
		}catch(Exception e){
			e.printStackTrace();
		}
		return vo;
	}
	
	public int selectCountUid(String uid) {
		int result=0;
		
		try{
			conn=getConnection();
			psmt = conn.prepareStatement(SQL.SELECT_COUNT_UID);
			psmt.setString(1, uid);
			
			rs = psmt.executeQuery();
			
			if(rs.next()){
				result = rs.getInt(1);
			}
			
			close();
			
		}catch(Exception e){
			e.printStackTrace();
		}
		return result;
	}
	
	public int selectCountNick(String nick) {
		int result=0;
		try{
			
			conn=getConnection();
			
			psmt = conn.prepareStatement(SQL.SELECT_COUNT_NICK);
			psmt.setString(1, nick);
			
			rs = psmt.executeQuery();
			
			if(rs.next()){
				result = rs.getInt(1);
			}
			
			close();
			
		}catch(Exception e){
			e.printStackTrace();
		}
		
		
		
		
		return result;
	}
	
	public int selectCountHp(String hp) {
		int result=0;
		try{
			conn=getConnection();
			
			psmt=conn.prepareStatement(SQL.SELECT_COUNT_HP);
			psmt.setString(1, hp);
			
			rs=psmt.executeQuery();
			
			if(rs.next()){
				result=rs.getInt(1);
			}
			
			close();
		}catch(Exception e){
			e.printStackTrace();
		}
		
		return result;
	}
	
	public int selectCountEmail(String email) {
		int result=0;
		
		try{
			
			conn=getConnection();
			
			 psmt=conn.prepareStatement(SQL.SELECT_COUNT_EMAIL);
			psmt.setString(1, email);
			rs = psmt.executeQuery();
			
			if(rs.next()){
				result=rs.getInt(1);
			}
			
			close();
			
		}catch(Exception e){
			e.printStackTrace();
		}
		
		
		
		return result;
	}
	
	
	public void selectUsers() {}
	public void updatetUser() {}
	public void deleteUser() {}
	
	public TermsDTO termsUser() {
		TermsDTO vo = new TermsDTO();
		try{

			conn=getConnection();
			
			stmt = conn.createStatement();
			rs = stmt.executeQuery(SQL.SELECT_TERMS);
			
			if(rs.next()){
				vo.setTerms(rs.getString(1));
				vo.setPrivacy(rs.getString(2));
			}
			
			close();
		}catch(Exception e){
			e.printStackTrace();
		}
	
		return vo;
	}
	

	
	
	
}
