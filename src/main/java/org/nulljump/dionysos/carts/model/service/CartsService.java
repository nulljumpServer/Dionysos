package org.nulljump.dionysos.carts.model.service;

import java.util.ArrayList;

import org.nulljump.dionysos.carts.model.vo.Carts;
import org.nulljump.dionysos.carts.model.vo.MyCart;


public interface CartsService {
    int insertCarts(Carts carts);				    //  상품 삽입
    ArrayList<Carts> listCarts(String user_id);     // 상품 전체 조회
    int deleteCarts(int product_id);				    // 상품 삭제
    int updateCarts(Carts carts); 				    // 상품 업데이트
	ArrayList<MyCart> selectCarts(Carts cart);
	int getCarts(Carts carts);
	Carts getCartsByProductIdAndUserId(String user_id, int product_id);
	int updateQty(Carts carts);
    
  
}