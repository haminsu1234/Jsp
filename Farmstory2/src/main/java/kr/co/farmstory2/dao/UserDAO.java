package kr.co.farmstory2.dao;

import java.util.List;

import javax.servlet.http.HttpServlet;

import kr.co.farmstory2.dto.UserDTO;
import kr.farmstory2.db.DBHelper;

public class UserDAO extends DBHelper{

	public static UserDAO instance = new UserDAO();
	public static UserDAO getInstance() {
		return instance;
	}

	
	public void insertUser(UserDTO dto) {}
	public UserDTO selectUser() {
		return null;
	}
	public List<UserDTO> selectUsers() {
		return null;
	}
	public void deleteUser() {}
	public void updateUser(UserDTO dto) {}
	

	
	
}
