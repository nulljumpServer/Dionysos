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
	Product selectProduct(int product_id); //상품 번호 기준 조회
	int selectLastProductId(); // 마지막 상품번호 조회(관리자 상품 추가시 첨부파일명 설정에 필요함)
	ArrayList<Product> selectFilterProductList();    //??
	
	// 상품 검색 기능
	ArrayList<Product> selectSearchProductId(int keyword);
	ArrayList<Product> selectSearchProductName(String keyword);
	ArrayList<Product> selectSearchProductEname(String keyword);
	ArrayList<Product> selectSearchProductPrice(int keyword);
	ArrayList<Product> selectSearchProductAlcohol(float keyword);
	ArrayList<Product> selectSearchProductAcidity(int keyword);
	ArrayList<Product> selectSearchProductSweetness(int keyword);
	ArrayList<Product> selectSearchProductBody(int keyword);
	ArrayList<Product> selectSearchProductTannin(int keyword);
	ArrayList<Product> selectSearchProductOrigin(String keyword);
	ArrayList<Product> selectSearchProductType(String keyword);
	
	// 관리자 상품 추가, 수정, 삭제
	int insertProduct(Product product);           //��ǰ �߰�
	int updateProduct(Product product);           //��ǰ ����
	int deleteProduct(Product product);           //��ǰ ����

	ArrayList<Product> selectAdvancedSearch(List<String> wine_type, List<String> wine_origin, int product_price, int sweetness, int acidity, int body, int tannin);

	
}
