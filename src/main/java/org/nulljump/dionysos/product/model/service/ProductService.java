package org.nulljump.dionysos.product.model.service;

import java.util.ArrayList;
import java.util.List;
<<<<<<< Updated upstream

=======
>>>>>>> Stashed changes

import org.nulljump.dionysos.common.Paging;
import org.nulljump.dionysos.product.model.vo.Product;

public interface ProductService {

<<<<<<< Updated upstream

	int selectListCount();               				 //상품 목록의 총 갯수 조회   
	ArrayList<Product> selectProductList(Paging page);  //상품 목록 조회  
	ArrayList<Product> selectTop4();				// 가장 많이 팔린 4개 조회
	ArrayList<Product> selectNew4();                 //신상품 4개 조회
	Product selectProduct(int product_id);           //특정 상품 id에 해당하는 상품 조회     
	ArrayList<Product> selectFilterProductList();    //특정 범위에 해당하는 상품 목록 조회
	int selectLastProductId(); 
	
	
	//검색을 위한 메소드

=======
	int selectListCount();               				 // 상품 갯수 확인
	ArrayList<Product> selectProductList(Paging page);  // 상품 리스트 조회(페이징)
	ArrayList<Product> selectTop4();				// 최다 판매량 상품 4개 조회(베스트상품)
	ArrayList<Product> selectNew4();                // 최신 입고 상품 4개 조회(신상품)
	Product selectProduct(int product_id);
	ArrayList<Product> selectSearchProduct(String action, String keyword, Paging page); //상품 번호 기준 조회
	int selectLastProductId(); // 마지막 상품번호 조회(관리자 상품 추가시 첨부파일명 설정에 필요함)
	ArrayList<Product> selectFilterProductList();    //??
	
	
	int selectSearchProductCount(String action, String keyword);
	// 상품 검색 기능
>>>>>>> Stashed changes
	ArrayList<Product> selectSearchProductId(int keyword);
	ArrayList<Product> selectSearchProductName(String keyword);
	ArrayList<Product> selectSearchProductEname(String keyword);
	ArrayList<Product> selectSearchProductPrice(int keyword);
	ArrayList<Product> selectSearchProductAlcohol(float keyword);
	ArrayList<Product> selectSearchProductAcidity(int keyword);
	ArrayList<Product> selectSearchProductSweetness(int keyword);
	ArrayList<Product> selectSearchProductBody(int keyword);
	ArrayList<Product> selectSearchProductTannin(int keyword);
<<<<<<< Updated upstream

=======
>>>>>>> Stashed changes
	ArrayList<Product> selectSearchWineOrigin(String keyword);
	ArrayList<Product> selectSearchWineType(String keyword);
	ArrayList<Product> selectSearchGrapeType(String keyword);
	
<<<<<<< Updated upstream
	//관리자
	int insertProduct(Product product);           //상품 추가
=======
	// 관리자 상품 추가, 수정, 삭제
	int insertProduct(Product product);           //상품추가
>>>>>>> Stashed changes
	int updateProduct(Product product);           //상품 수정
	int deleteProduct(Product product);           //상품 삭제

	ArrayList<Product> selectFilter(List<String> wine_type, List<String> wine_origin, int product_price, int sweetness, int acidity, int body, int tannin);
	

	ArrayList<Product> selectFilter(List<String> wine_type, List<String> wine_origin, int product_price, int sweetness, int acidity, int body, int tannin);


	
}
