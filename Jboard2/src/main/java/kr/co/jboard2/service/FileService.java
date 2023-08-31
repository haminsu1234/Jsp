package kr.co.jboard2.service;

import java.util.List;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;

import kr.co.jboard2.dao.FileDAO;
import kr.co.jboard2.db.DBHelper;
import kr.co.jboard2.dto.FileDTO;

public enum FileService {
	INSTATNCE;
	
	
	
	private Logger logger =LoggerFactory.getLogger(this.getClass());
	private FileDAO dao = FileDAO.getInstance();
 	
	public void insertFile(FileDTO dto) {
		dao.insertFile(dto);
	}
	
	public FileDTO selectFile(String ano) {
		return dao.selectFile(ano);
	}
	
	public List<FileDTO> selectFiles() {
		return null;
	}
	
	public void updateFile(FileDTO dto) {}
	
	public void deleteFile(int fno) {}
	
	
}
