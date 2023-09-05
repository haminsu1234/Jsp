package kr.co.farmstory2.service;

import java.util.List;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;

import kr.co.farmstory2.dao.FileDAO;
import kr.co.farmstory2.dto.FileDTO;

public enum FileService {
	INSTANCE;
	
	
	
	private Logger logger =LoggerFactory.getLogger(this.getClass());
	private FileDAO dao = FileDAO.getInstance();
 	
	public void insertFile(FileDTO dto) {
		dao.insertFile(dto);
	}
	
	public FileDTO selectFile(String ano) {
		return dao.selectFile(ano);
	}
	
	public FileDTO selectFile2(String fno) {
		return dao.selectFile(fno);
	}
	
	
	public List<FileDTO> selectFiles() {
		return null;
	}
	
	public void updateFile(FileDTO dto) {}
	
	/*public int deleteFile(String ano) {
		
		return dao.deleteFile(ano);
		
	}*/
	
}
