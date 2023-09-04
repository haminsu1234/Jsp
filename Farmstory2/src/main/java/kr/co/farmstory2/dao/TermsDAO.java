package kr.co.farmstory2.dao;

import kr.co.farmstory2.dto.TermsDTO;

import kr.farmstory2.db.DBHelper;
import kr.farmstory2.db.SQL;

public class TermsDAO extends DBHelper {

	public static TermsDAO instance =new TermsDAO();
	public static TermsDAO getInstance () {
		return instance;
	}

	
	public TermsDTO termsUser() {
		TermsDTO dto =new TermsDTO();
		try {
			conn=getConnection();
			stmt=conn.createStatement();
			rs=stmt.executeQuery(SQL.SELECT_TEMRS);
			
			if(rs.next()) {
				dto.setTerms(rs.getString(1));
				dto.setPrivacy(rs.getString(2));
			}
			close();
			
		} catch (Exception e) {
			e.printStackTrace();
		}
		return dto;
		
		
	}


}
