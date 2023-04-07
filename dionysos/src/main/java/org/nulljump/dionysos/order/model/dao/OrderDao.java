package org.nulljump.dionysos.order.model.dao;

import java.util.ArrayList;
import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;
import org.nulljump.dionysos.order.model.vo.Order;
import org.nulljump.dionysos.product.model.vo.Product;
import org.nulljump.dionysos.users.model.vo.Users;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

@Repository("orderDao")
public class OrderDao {

	@Autowired
	private SqlSessionTemplate session;	
	
//	public Order selectOrder(int order_id) {
//		return session.selectOne("orderMapper.selectOrder", order_id);
//	}
////	public void insert(Order order) {
////		
////		int order_id = session.selectOne("countOrderId");
////		order.setOrder_id(order_id);
////		
////		session.selectOne("orderMapper.insertOrder", order);
////	}
//
//	public ArrayList<Order> orderList(String user_id) {
//		List<Order> list = session.selectList("orderMapper.listOrder", user_id);
//		if(list.size() != 0) {
//			return (ArrayList<Order>) list;
//		}else {
//			return null;
//		}
//	}
//
//	public Order selectProduct(int product_id) {
//		return session.selectOne("orderMapper.selectOrder", product_id);
//	}
//
//	public ArrayList<Order> orders(Order order) {
//		List<Order> list = session.selectList("orderMapper.listOrders", order);
//		if (list != null) {
//			return list;
//		}
//		return null;
//	}
}
