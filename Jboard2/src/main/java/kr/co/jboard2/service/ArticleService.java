package kr.co.jboard2.service;

import java.io.File;
import java.util.ArrayList;
import java.util.List;
import java.util.UUID;

import javax.servlet.ServletContext;
import javax.servlet.http.HttpServletRequest;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;

import com.oreilly.servlet.MultipartRequest;
import com.oreilly.servlet.multipart.DefaultFileRenamePolicy;

import kr.co.jboard2.dao.ArticleDAO;
import kr.co.jboard2.dto.ArticleDTO;
import kr.co.jboard2.dto.UserDTO;


public enum ArticleService {

	INSTATNCE;
	
	private ArticleDAO dao = ArticleDAO.getInstance();
	
	private static String generatedCode;
	
	private Logger logger =LoggerFactory.getLogger(this.getClass());
	
	public int insertArticle(ArticleDTO dto) {
		return dao.insertArticle(dto);
	}
	
	public void insertComment(ArticleDTO dto) {
		dao.insertComment(dto);
	}
	
	
	public int selectCountTotal() {
		return dao.selectCountTotal();
		
	}
	
	public List<ArticleDTO> selectArticles(int start) {
		return dao.selectArticles(start);
	}
	
	public void updateArticle(ArticleDTO dto) {
		dao.updateArticle(dto);
	}
	public void deleteArticle(String no) {
		
		dao.deleteArticle(no);
	}
	
	public ArticleDTO selectView(String no) {
		return dao.selectView(no);
	}
	
	public void updateUseynView(ArticleDTO dto) {
		return;
	}
	
	public List<ArticleDTO> selectComments(String parent) {
		return dao.selectsComments(parent);
	}
	
	
	//업로드 경로 구하기
	public String getUploadPath(HttpServletRequest req) {
		//파일업로드 경로
		ServletContext ctx=req.getServletContext();
		String path=ctx.getRealPath("/upload");
		
		return path;
	}
	
	//파일명 수정
	public String renameToFile(HttpServletRequest req,String oName) {
		
		String path =getUploadPath(req);
		
		int i =oName.lastIndexOf(".");
		String ext=oName.substring(i);
	
		String uuid=UUID.randomUUID().toString();
		String sName =uuid+ext;
	
		File f1 = new File(path+"/"+oName);
		File f2 = new File(path+"/"+sName);
		//파일명 수정
		f1.renameTo(f2);
		
		return sName;
	}
	
	//파일업로드
	public MultipartRequest  uploadFile(HttpServletRequest req ) {
		//경로구하기
		String path =getUploadPath(req);
		//최대 업로드 파일크기
		int maxSize =1024*1024*10;
		
		
		//파일업로드 및 Multipart 객체 생성
		MultipartRequest mr =null;
		try {
			mr =new MultipartRequest(req,
									path,
									maxSize,
									"UTF-8",
									new DefaultFileRenamePolicy());
		} catch (Exception e) {
			logger.error("uploadFile : " +e.getMessage());
		}
		
		//이렇게하면 
		//C:\Users\Java\Desktop\Workspace\Jsp\.metadata\.plugins\org.eclipse.wst.server.core\tmp0\wtpwebapps\Jboard2\/u/pload
		//에올라감
		
		return mr;
		
	}
	
	//파일 다운로드
	public void downloadFile() {
		
	}

}
