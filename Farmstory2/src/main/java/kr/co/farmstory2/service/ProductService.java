package kr.co.farmstory2.service;

import java.util.List;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;


import kr.co.farmstory2.dao.ProductDAO;
import kr.co.farmstory2.dto.ProductDTO;

public enum ProductService {
	INSTANCE;
	private Logger logger =LoggerFactory.getLogger(this.getClass());
	private ProductDAO dao =ProductDAO.getInstance();


	public void insertProduct(ProductDTO dto) {
		 dao.insertProduct(dto);
	}
	
	public ProductDTO selectProduct(String pno) {
		return dao.selectProduct(pno);
	}
	
	public List<ProductDTO> selectProducts(String type, int start) {
		return dao.selectProducts(type,start);
	}
	
	public void updateProduct() {}
	
	public void deleteProduct() {}

	public int selectCountProductTotal(String type) {
		
		return dao.selectCountProductTotal(type);
		
	}



}
