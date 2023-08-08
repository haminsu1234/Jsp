package kr.co.jboard1.dao;

import java.util.ArrayList;
import java.util.List;

import kr.co.jboard1.db.DBHelper;
import kr.co.jboard1.db.SQL;
import kr.co.jboard1.dto.ArticleDTO;
import kr.co.jboard1.dto.UserDTO;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.Statement;

public class ArticleDAO extends DBHelper {

	
	public void insertArticle(ArticleDTO vo) {
		try {
			conn=getConnection();
			
			psmt=conn.prepareStatement(SQL.INSERT_ARTICLE);
			psmt.setString(1, vo.getTitle());
			psmt.setString(2, vo.getContent());
			psmt.setString(3, vo.getWriter());
			psmt.setString(4, vo.getRegip());
			
			psmt.executeUpdate();
			
			close();
			
		} catch (Exception e) {
			e.printStackTrace();
		}

	}
	
	public ArticleDTO selectArticle(int no) {
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
	public void updateArticle() {}
	public void deleteArticle() {}
	
	public ArticleDTO selectView(String no) {
		
		ArticleDTO vo = new ArticleDTO();
		try {
			conn=getConnection();
			psmt=conn.prepareStatement(SQL.SELECT_VIEW);
			psmt.setString(1,no);
			
			rs=psmt.executeQuery();
			
			if(rs.next()) {
				vo.setTitle(rs.getString(1));
				vo.setContent(rs.getString(2));
			}
			
			close();
		} catch (Exception e) {
			e.printStackTrace();
		}
	
		return vo;
	
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

	
	
}
