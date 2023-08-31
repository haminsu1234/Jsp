package kr.co.jboard2.dao;

import java.util.ArrayList;
import java.util.List;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;

import kr.co.jboard2.db.DBHelper;
import kr.co.jboard2.db.SQL;
import kr.co.jboard2.dto.ArticleDTO;



public class ArticleDAO extends DBHelper{
	
	private static ArticleDAO instance = new ArticleDAO();
	private Logger logger =LoggerFactory.getLogger(this.getClass());
	public static ArticleDAO getInstance() {
		return instance;
	}
	
	public int insertArticle(ArticleDTO dto) {
		
		int no=0;
		
		try {
			conn=getConnection();
			conn.setAutoCommit(false);//트랜잭션시작 //이걸하는이유 만약에 insert와 select 작업사이에 누군가 insert작업을 수행하면 max가 바껴버림 그래서 트랜잭션을 걸어서 수행함
			stmt=conn.createStatement();
			psmt=conn.prepareStatement(SQL.INSERT_ARTICLE);

			psmt.setString(1,dto.getTitle());
			psmt.setString(2,dto.getContent());
			psmt.setInt(3,dto.getFile());
			psmt.setString(4,dto.getWriter());
			psmt.setString(5,dto.getRegip());
			
			psmt.executeUpdate();
			rs=stmt.executeQuery(SQL.SELECT_MAX_NO);
			conn.commit();//작업확정
			if(rs.next()) {
				no=rs.getInt(1);
			}
			
			close();
		} catch (Exception e) {
			logger.error("insertUser error : "+e.getMessage());
		}
		
		return no;
		
	}
	

	public ArticleDTO selectArticle(String no) {
		return null;
	}
	
	public int selectCountTotal() {
			int total=0;
		try {
			conn=getConnection();
			psmt=conn.prepareStatement(SQL.SELECT_COUNT_TOTAL);
			rs=psmt.executeQuery();
			
			if(rs.next()) {
				total=rs.getInt(1);
			}
			
			close();
			
			
		} catch (Exception e) {
			e.printStackTrace();
		}
		return total;
	}
	
	public List<ArticleDTO> selectArticles(int start) {
		List<ArticleDTO> articles = new ArrayList<>();
		try{
			conn=getConnection();
			psmt =conn.prepareStatement(SQL.SELECT_ARTICLES);
			psmt.setInt(1, start);
			rs=psmt.executeQuery();
			
			while(rs.next()) {
				ArticleDTO vo=new ArticleDTO();
				vo.setNo(rs.getInt(1));
				vo.setParent(rs.getInt(2));
				vo.setComment(rs.getInt(3));
				vo.setCate(rs.getString(4));
				vo.setTitle(rs.getString(5));
				vo.setContent(rs.getString(6));
				vo.setFile(rs.getInt(7));
				vo.setHit(rs.getInt(8));
				vo.setWriter(rs.getString(15)); //어짜피 list페이지에서 writer를 쓸일이 없기에 writer 자리에 nick값을 넣음
				vo.setRegip(rs.getString(10));	// 나중에는 이클래스에서 writer를 쓸수도있기때문에 확장성이나 유지보수를 고려하면 nick은 따로 넣어주는게 좋을것같음
				vo.setRdate(rs.getString(11));
				
				articles.add(vo);
			}
			
			close();
			
		}catch(Exception e){
			e.printStackTrace();
		}
		return articles;
		
	}
	public void updateArticle(ArticleDTO dto) {
		
		try {
			conn=getConnection();
			psmt=conn.prepareStatement(SQL.UPDATE_ARTICLE);
			psmt.setString(1, dto.getTitle());
			psmt.setString(2, dto.getContent());
			psmt.setInt(3, dto.getNo());
			
			psmt.executeUpdate();
			
			close();
		} catch (Exception e) {
			e.printStackTrace();
		}
	}
	
	
	
	public void deleteArticle(String no) {
		try {
			conn=getConnection();
			psmt=conn.prepareStatement(SQL.DELETE_ARTICLE);
			psmt.setString(1, no);
			
			psmt.executeUpdate();
			
			close();
			
			
		} catch (Exception e) {
			e.printStackTrace();
		}
		
	}
	
	public ArticleDTO selectView(String no) {
		
		ArticleDTO dto = new ArticleDTO();
		try {
			conn=getConnection();
			psmt=conn.prepareStatement(SQL.SELECT_VIEW);
			psmt.setString(1,no);
			
			rs=psmt.executeQuery();
			
			if(rs.next()) {
				dto.setTitle(rs.getString(1));
				dto.setContent(rs.getString(2));
				dto.setNo(rs.getInt(3));
			}
			
			close();
		} catch (Exception e) {
			e.printStackTrace();
		}
	
		return dto;
	
	}

	public void updateUseynView(ArticleDTO dto) {
		
		try {
			conn=getConnection();
			psmt=conn.prepareStatement(SQL.UPDATE_VIEW);
			psmt.setInt(1, dto.getNo());
			psmt.executeUpdate();
			
			close();
		}catch (Exception e) {
			e.printStackTrace();
		}
		
	}
	
	public List<ArticleDTO>  selectsComments(String parent) {
		List<ArticleDTO> comments = new ArrayList<>();
		try {
			conn=getConnection();
			psmt=conn.prepareStatement(SQL.SELECT_COMMENTS);
			psmt.setString(1,parent);
			rs=psmt.executeQuery();
			while(rs.next()) {
				ArticleDTO dto=new ArticleDTO();
				dto.setNo(rs.getInt(1));
				dto.setParent(rs.getInt(2));
				dto.setComment(rs.getInt(3));
				dto.setCate(rs.getString(4));
				dto.setTitle(rs.getString(5));
				dto.setContent(rs.getString(6));
				dto.setFile(rs.getInt(7));
				dto.setHit(rs.getInt(8));
				dto.setWriter(rs.getString(9)); //어짜피 list페이지에서 writer를 쓸일이 없기에 writer 자리에 nick값을 넣음
				dto.setRegip(rs.getString(10));	// 나중에는 이클래스에서 writer를 쓸수도있기때문에 확장성이나 유지보수를 고려하면 nick은 따로 넣어주는게 좋을것같음
				dto.setRdate(rs.getString(11));
				dto.setNick(rs.getString(16));
				comments.add(dto);
				
			}
			
			close();
		} catch (Exception e) {
			e.printStackTrace();
		}
		
		
		
		return comments;
		
	}
	
	public void insertComment(ArticleDTO dto) {
		
		try {
			conn=getConnection();
			psmt=conn.prepareStatement(SQL.INSERT_COMMENT);
			psmt.setInt(1,dto.getParent());
			psmt.setString(2,dto.getContent());
			psmt.setString(3,dto.getWriter());
			psmt.setString(4,dto.getRegip());

			
			psmt.executeUpdate();
			
			close();
		} catch (Exception e) {
			e.printStackTrace();
		}
		
	
		
	}
	
	
	
	
}
