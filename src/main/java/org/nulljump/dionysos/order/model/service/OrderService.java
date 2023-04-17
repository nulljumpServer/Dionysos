package org.nulljump.dionysos.order.model.service;

import java.util.ArrayList;
import java.util.Map;

import org.nulljump.dionysos.order.model.vo.Order;

public interface OrderService {
	
	  // 주문 정보 추가
    public int insertOrder(Order order);

	public Order selectOrder(Order order);
	public ArrayList<Order> selectOrderlist(Order order);
	public int selectListCount();
	
	public ArrayList<Order> orderMyList(Map<String, Object> paramMap);    //마이페이지 주문내역 리스트
	public int selectMyorderListCount(String user_id);    //마이페이지 주문내역 전체 갯수 조회
	
	public int updateOrderCancelStatus(Order order);      //주문취소용
	public Order selectOrderForCancel(long order_number);   //주문취소시 주문내역 조회

}
