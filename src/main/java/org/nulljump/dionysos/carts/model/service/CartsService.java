package org.nulljump.dionysos.carts.model.service;

import java.util.ArrayList;

import org.nulljump.dionysos.carts.model.vo.Carts;


public interface CartsService {
    int insertCarts(Carts carts);				    
    ArrayList<Carts> listCarts(String user_id);     
    int deleteCarts(int cart_id);				    
    int deleteAllCarts(String user_id); 		   
    int updateCarts(Carts carts); 				  
    int totalPrice(String user_id); 				    
  //int countCarts(String user_id, int product_id); 
}