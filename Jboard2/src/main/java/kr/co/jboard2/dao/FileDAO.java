package kr.co.jboard2.dao;

import java.util.List;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;


import kr.co.jboard2.db.DBHelper;
import kr.co.jboard2.db.SQL;
import kr.co.jboard2.dto.FileDTO;

public class FileDAO extends DBHelper {

	private static FileDAO  instance = new FileDAO();
	private Logger logger =LoggerFactory.getLogger(this.getClass());
	
	
	public static FileDAO getInstance() {
		return instance;
	}
	
	public void insertFile(FileDTO dto) {
		
		try {
			conn=getConnection();
			psmt=conn.prepareStatement(SQL.INSERT_FILE);
			psmt.setInt(1, dto.getAno());
			psmt.setString(2, dto.getOriName());
			psmt.setString(3, dto.getNewName());
			psmt.executeUpdate();
			
			close();
		} catch (Exception e) {
			logger.error("insertUser error : "+e.getMessage());
		}
		
		
	}
	
	public FileDTO selectFile(String ano) {
		
		FileDTO dto = new FileDTO();
		try {
			conn=getConnection();
			psmt=conn.prepareStatement(SQL.SELECT_FILE);
			psmt.setString(1,ano);
			
			rs=psmt.executeQuery();
			
			if(rs.next()) {
				dto.setOriName(rs.getString(1));
				dto.setNewName(rs.getString(2));
			}
			
			close();
		} catch (Exception e) {
			e.printStackTrace();
		}
	
		return dto;
		
		

	}
	
	public List<FileDTO> selectFiles() {
		return null;
	}
	
	public void updateFile(FileDTO dto) {}
	
	public void deleteFile(int fno) {}
	
	
}
