package org.nulljump.dionysos.order.model.service;

import java.util.ArrayList;

import org.nulljump.dionysos.order.model.dao.OrderDao;
import org.nulljump.dionysos.order.model.vo.Order;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

@Service
public class OrderServiceImpl implements OrderService{
	
	@Autowired
	private OrderDao orderDao;

//	@Override
//	public ArrayList<Order> orders(Order order) {
//		return orderDao.orders(order);
//	}
//
//	
////	@Override
////	public void insert(Order order) {
////		return orderDao.insert(order);
////	}
//
//	@Override
//	public ArrayList<Order> orderList(String user_id) {
//		return orderDao.orderList(user_id);
//	}
//
//	@Override
//	public Order selectOrder(int order_id) {
//		return orderDao.selectOrder(order_id);
//	}
//
//	@Override
//	public Order selectProduct(int product_id) {
//		return orderDao.selectProduct(product_id);
//	}

	
	

}
