package org.nulljump.dionysos.carts.model.service;

import java.util.ArrayList;

import org.nulljump.dionysos.carts.model.vo.Carts;


public interface CartsService {
    int insertCarts(Carts carts);				    //��ٱ��� �߰�
    ArrayList<Carts> listCarts(String user_id);     //��ٱ��� ���
    int deleteCarts(int cart_id);				    //��ٱ��� ���� ����
    int deleteAllCarts(String user_id); 		    //��ٱ��� ����
    int updateCarts(Carts carts); 				    //��ٱ��� ���� ����
    int totalPrice(String user_id); 				    //��ٱ��� �ݾ� �հ�
  //int countCarts(String user_id, int product_id); //��ٱ��� ��ǰ ����
}