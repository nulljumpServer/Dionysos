package org.nulljump.dionysos.product.model.service;

import java.util.ArrayList;
import java.util.List;

import org.nulljump.dionysos.common.Paging;
import org.nulljump.dionysos.product.model.vo.Product;

public interface ProductService {

	int selectListCount();               				 // 상품 갯수 확인
	
	ArrayList<Product> selectProductList(Paging page);  // 상품 리스트 조회(페이징)
	
	ArrayList<Product> selectTop4();				// 최다 판매량 상품 4개 조회(베스트상품)
	
	ArrayList<Product> selectNew4();                // 최신 입고 상품 4개 조회(신상품)
	
	Product selectProduct(int product_id); // 상세페이지 접근 시 1:1매칭용
	
	ArrayList<Product> selectSearchProduct(String action, String keyword, Paging page); //상품검색 페이징
	
	int selectSearchProductCount(String action, String keyword); // 상품 검색결과의 갯수 조회(페이징)
	
	int selectLastProductId(); // 마지막 상품번호 조회(관리자 상품 추가시 첨부파일명 설정에 필요함)
	
	
	// 관리자 상품 추가, 수정, 삭제
	int insertProduct(Product product);           //상품추가
	int updateProduct(Product product);           //상품 수정
	int deleteProduct(Product product);           //상품 삭제

	ArrayList<Product> selectFilter(List<String> wine_type, List<String> wine_origin, int product_price, int sweetness, int acidity, int body, int tannin);
	

	
}
