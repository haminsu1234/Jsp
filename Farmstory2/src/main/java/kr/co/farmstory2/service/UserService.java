package kr.co.farmstory2.service;

import java.util.List;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;

import kr.co.farmstory2.dao.UserDAO;
import kr.co.farmstory2.dto.UserDTO;

public enum UserService {

	INSTANCE;
	private Logger logger =LoggerFactory.getLogger(this.getClass());
	private UserDAO dao =UserDAO.getInstance();
	
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
