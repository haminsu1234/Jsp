package kr.co.farmstory2.service;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;

import kr.co.farmstory2.dao.TermsDAO;
import kr.co.farmstory2.dto.TermsDTO;

public enum TermsService {

	INSTANCE;
	
	private Logger logger =LoggerFactory.getLogger(this.getClass());
	private TermsDAO dao =TermsDAO.getInstance();
	
	
	public TermsDTO selectTerms() {
		return dao.termsUser();
	}
	
}
