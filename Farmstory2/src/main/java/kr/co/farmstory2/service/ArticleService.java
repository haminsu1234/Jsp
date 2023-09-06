package kr.co.farmstory2.service;

import java.io.BufferedInputStream;
import java.io.BufferedOutputStream;
import java.io.File;
import java.io.FileInputStream;
import java.io.IOException;
import java.net.URLEncoder;
import java.util.List;
import java.util.UUID;

import javax.servlet.ServletContext;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;

import com.oreilly.servlet.MultipartRequest;
import com.oreilly.servlet.multipart.DefaultFileRenamePolicy;

import kr.co.farmstory2.dao.ArticleDAO;
import kr.co.farmstory2.dto.ArticleDTO;
import kr.co.farmstory2.dto.UserDTO;
import kr.co.farmstory2.dto.FileDTO;


public enum ArticleService {
	INSTANCE;
	private Logger logger =LoggerFactory.getLogger(this.getClass());
	private ArticleDAO dao =ArticleDAO.getInstance();
	
	public List<ArticleDTO> selectComments(String parent) {
		return dao.selectComments(parent);
	}
	
	public List<ArticleDTO> selectArticles(int start, String cate) {
		return dao.selectArticles(start, cate);
	}
	
	public int insertArticle(ArticleDTO dto) {
		return dao.insertArticle(dto);
	}
	
	public int insertComment(ArticleDTO dto) {
		return dao.insertComment(dto);
	}
	
	public int updateArticle(ArticleDTO dto) {
		return dao.updateArticle(dto);
	}
	
	public int updateComment(ArticleDTO dto) {
		return dao.updateComment(dto);
	}
	
	public void updateCommentNum(String parent) {
		dao.updateCommentNum(parent);
	}
	
	public void updateViewHit(String no) {
		 dao.updateViewHit(no);
	}
	
	public void deleteArticle(String no) {
		 dao.deleteArticle(no);
	}
	
	public int deleteComment(String no) {
		 return dao.deleteComment(no);
	}
	
	public ArticleDTO selectView(String no) {
		return dao.selectView(no);
	}
	
	public void updateCountFile(String no) {
		dao.updateCountFile(no);
	}
	
	public void updateCountFile2(String no) {
		dao.updateCountFile2(no);
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
		// 파일 다운로드
			public void downloadFile(HttpServletRequest req, HttpServletResponse resp, FileDTO dto) throws IOException {
				// response 파일 다운로드 헤더 수정
				resp.setContentType("application/octet-stream");
				resp.setHeader("Content-Disposition", "attachment; filename="+URLEncoder.encode(dto.getOriName(), "utf-8"));
				resp.setHeader("Content-Transfer-Encoding", "binary");
				resp.setHeader("Pragma", "no-cache");
				resp.setHeader("Cache-Control", "private");
				
				// response 파일 스트림 작업
				String path = getUploadPath(req);
				
				File file = new File(path+"/"+dto.getNewName());
				
				BufferedInputStream bis = new BufferedInputStream(new FileInputStream(file));
				BufferedOutputStream bos = new BufferedOutputStream(resp.getOutputStream());
						
				while(true){
					
					int data = bis.read();
					if(data == -1){
						break;
					}
					
					bos.write(data);
				}
				
				bos.close();
				bis.close();
			}
	
}
