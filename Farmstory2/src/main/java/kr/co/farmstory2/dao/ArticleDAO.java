package kr.co.farmstory2.dao;

import java.awt.dnd.DropTargetContext;
import java.util.ArrayList;
import java.util.List;


import org.slf4j.Logger;
import org.slf4j.LoggerFactory;


import kr.co.farmstory2.dto.ArticleDTO;
import kr.farmstory2.db.DBHelper;
import kr.farmstory2.db.SQL;

public class ArticleDAO extends DBHelper{

	public static ArticleDAO instance = new ArticleDAO();
	public static ArticleDAO getInstance() {
		return instance;
	}
	private Logger logger =LoggerFactory.getLogger(this.getClass());
	
	public int insertArticle(ArticleDTO dto) {
		

		int no=0;
		
		try {
			conn=getConnection();
			conn.setAutoCommit(false);//트랜잭션시작 //이걸하는이유 만약에 insert와 select 작업사이에 누군가 insert작업을 수행하면 max가 바껴버림 그래서 트랜잭션을 걸어서 수행함
			stmt=conn.createStatement();
			psmt=conn.prepareStatement(SQL.INSERT_ARTICLE);

			psmt.setString(1,dto.getCate());
			psmt.setString(2,dto.getTitle());
			psmt.setString(3,dto.getContent());
			
			psmt.setString(4,dto.getWriter());
			psmt.setInt(5,dto.getFile());
			psmt.setString(6,dto.getRegip());
			
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
	
	public int insertComment(ArticleDTO dto) {
		int result=0;
		
		try {
			conn=getConnection();
			psmt=conn.prepareStatement(SQL.INSERT_COMMENT);
			psmt.setInt(1, dto.getParent());
			psmt.setString(2, dto.getContent());
			psmt.setString(3, dto.getWriter());
			psmt.setString(4, dto.getRegip());
			
			result=psmt.executeUpdate();
			
			close();
			
		} catch (Exception e) {
			logger.error("insertComment error : "+e.getMessage());
		}
		
		return result;
		
	}
	
	
	public void selectArticle() {}
	public int updateArticle(ArticleDTO dto) {
		int no =0;
		try {
			conn=getConnection();
			psmt=conn.prepareStatement(SQL.UPDATE_ARTICLE);
			psmt.setString(1, dto.getTitle());
			psmt.setString(2, dto.getContent());
			psmt.setInt(3, dto.getNo());
			no=dto.getNo();
			psmt.executeUpdate();
			
			close();
			
			
		} catch (Exception e) {
			logger.error("updateArticle error : " + e.getMessage());
		}
		
		return no;
	}
	
	public void updateViewHit(String no) {
		
		try {
			conn=getConnection();
			psmt=conn.prepareStatement(SQL.UPDATE_VIEW_HIT);
			psmt.setString(1, no);
			
			psmt.executeUpdate();
			
			close();
			
		} catch (Exception e) {
			logger.error("updateViewHit error : " + e.getMessage());
		}
		
	}
	
	public void updateCommentNum(String parent) {
		
		try {
			conn=getConnection();
			psmt=conn.prepareStatement(SQL.UPDATE_COMMENT_NUM);
			psmt.setString(1, parent);
			psmt.setString(2, parent);
			
			psmt.executeUpdate();
			
			close();
			
		} catch (Exception e) {
			logger.error("updateCommentNum error : " + e.getMessage());
		}
		
	}
	
	public int updateComment(ArticleDTO dto) {
		int result=0;
		try {
			conn=getConnection();
			psmt=conn.prepareStatement(SQL.UPDATE_COMMENT);
			psmt.setString(1, dto.getContent());
			psmt.setInt(2, dto.getNo());
	
			
			result=psmt.executeUpdate();
			
			close();
			
			
		} catch (Exception e) {
			logger.error("updateArticle error : " + e.getMessage());
		}
		
		return result;
	}
	public void deleteArticle(String no) {
		
		try {
			conn=getConnection();
			psmt=conn.prepareStatement(SQL.DELETE_ARTICLE);
			psmt.setString(1, no);
			
			psmt.executeUpdate();
			
			close();
			
		} catch (Exception e) {
			logger.error("deleteArticle error : "+e.getMessage());
			
		}
		
	}
	
	public int deleteComment(String no) {
		
		int result =0;
		
		try {
			conn=getConnection();
			psmt=conn.prepareStatement(SQL.DELETE_ARTICLE);
			psmt.setString(1, no);
			
			result =psmt.executeUpdate();
			
			close();
			
		} catch (Exception e) {
			logger.error("deleteComment error : "+e.getMessage());
			
		}
		return result;
	}
	
	
	
	public List<ArticleDTO> selectArticles(int start,String cate) {
		List<ArticleDTO> articles = new ArrayList<>();
		try {
			conn=getConnection();
			psmt=conn.prepareStatement(SQL.SELECT_ARTICLES);
			psmt.setString(1, cate);
			psmt.setInt(2, start);
			
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
				vo.setWriter(rs.getString(16)); //어짜피 list페이지에서 writer를 쓸일이 없기에 writer 자리에 nick값을 넣음
				vo.setRegip(rs.getString(10));	// 나중에는 이클래스에서 writer를 쓸수도있기때문에 확장성이나 유지보수를 고려하면 nick은 따로 넣어주는게 좋을것같음
				vo.setRdate(rs.getString(11));
				
				articles.add(vo);
			}
			
			
		} catch (Exception e) {
			logger.info("selectArticles : " + e.getMessage());
		}
		
		
		return articles;
		
	}
	
	
	public List<ArticleDTO> selectArticlesLatest(String cate, int lateNum) {
		List<ArticleDTO> latest = new ArrayList<>();
		try {
			conn=getConnection();
			psmt=conn.prepareStatement(SQL.SELECT_ARTICLES_LATE);
			psmt.setString(1, cate);
			psmt.setInt(2, lateNum);
			
			rs=psmt.executeQuery();
			
			while(rs.next()) {
				ArticleDTO vo=new ArticleDTO();
				vo.setNo(rs.getInt(1));
				vo.setTitle(rs.getString(2));
				vo.setRdate(rs.getString(3));
				
				latest.add(vo);
			}
			
			
		} catch (Exception e) {
			logger.info("selectArticles : " + e.getMessage());
		}
		
		
		return latest;
		
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
				dto.setFile(rs.getInt(4));

			}
			
			close();
		} catch (Exception e) {
			e.printStackTrace();
		}
	
		return dto;
	
	}
	
	public List<ArticleDTO> selectComments(String parent) {
		List<ArticleDTO> comments = new ArrayList<>();
		try {
			conn=getConnection();
			psmt=conn.prepareStatement(SQL.SELECT_COMMENTS);
			psmt.setString(1, parent);
			
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
			
			
		} catch (Exception e) {
			logger.info("selectArticles : " + e.getMessage());
		}
		
		
		return comments;
		
	}
	
	public void updateCountFile(String no) {
		try {
			conn=getConnection();
			psmt=conn.prepareStatement(SQL.UPDATE_COUNT_FILE);
			psmt.setString(1, no);
			
			psmt.executeUpdate();
			
			close();
			
		} catch (Exception e) {
			logger.info("countFile : " +e.getMessage());
		}
	}
	
	public void updateCountFile2(String no) {
		try {
			conn=getConnection();
			psmt=conn.prepareStatement(SQL.UPDATE_COUNT_FILE2);
			psmt.setString(1, no);
			
			psmt.executeUpdate();
			
			close();
			
		} catch (Exception e) {
			logger.info("countFile : " +e.getMessage());
		}
	}
	
}
