package kr.co.farmstory2.dao;

import java.util.List;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;

import kr.farmstory2.db.DBHelper;
import kr.farmstory2.db.SQL;
import kr.co.farmstory2.dto.FileDTO;


public class FileDAO extends DBHelper {

	private static FileDAO instance = new FileDAO();
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
				dto.setDownload(rs.getInt(3));
			}
			
			close();
		} catch (Exception e) {
			logger.error("Select file error : "+e.getMessage());
		}
	
		return dto;
	}
	
	public FileDTO selectFile2(String fno) {
		
		FileDTO dto = null;
		try {
			conn = getConnection();
			psmt = conn.prepareStatement(SQL.SELECT_FILE2);
			psmt.setString(1, fno);
			rs = psmt.executeQuery();
			
			if(rs.next()) {
				dto = new FileDTO();
				dto.setFno(rs.getInt(1));
				dto.setAno(rs.getInt(2));
				dto.setOriName(rs.getString(3));
				dto.setNewName(rs.getString(4));
				dto.setDownload(rs.getInt(5));
				dto.setRdate(rs.getString(6));
			}
			close();
		}catch (Exception e) {
			logger.error("selectFile() : "+e.getMessage());
		}
		return dto;
	}
	
	public List<FileDTO> selectFiles() {
		return null;
	}
	
	public void updateFile(FileDTO dto) {}
	
	public int deleteFile(String ano) {
		int result=0;
		try {
			conn =getConnection();
			psmt=conn.prepareStatement(SQL.DELETE_FILE);
			psmt.setString(1, ano);
			result =psmt.executeUpdate();
			
			close();
			
		} catch (Exception e) {
			logger.error("deletfile : "+e.getMessage());
		}
		return result;
	}
	
	
	
}
