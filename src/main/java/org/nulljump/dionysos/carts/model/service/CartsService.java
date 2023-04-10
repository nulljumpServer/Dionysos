package org.nulljump.dionysos.carts.model.service;

import java.util.ArrayList;

import org.nulljump.dionysos.carts.model.vo.Carts;
import org.nulljump.dionysos.carts.model.vo.MyCart;


public interface CartsService {
    boolean insertCarts(Carts carts);				    //  상품 삽입
    ArrayList<Carts> listCarts(String user_id);     // 상품 전체 조회

    int deleteCarts(int cart_id);				    // 상품 삭제
    boolean updateCarts(Carts carts); 				    // 상품 업데이트
	ArrayList<MyCart> selectCarts(Carts cart);
//    boolean findCartProduct(Carts carts); // 상품 찾기
//    void addProductCart(Carts carts); // 카트에 상품 추가
//	boolean addCart(int product_id, String user_id);
	int getCarts(Carts carts);
	Carts getCartsByProductIdAndUserId(String user_id, int product_id);
    
  //int countCarts(String user_id, int product_id); //��ٱ��� ��ǰ ����
}