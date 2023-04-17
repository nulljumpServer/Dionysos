package org.nulljump.dionysos.order.model.service;



import java.util.ArrayList;
import java.util.Map;

import org.nulljump.dionysos.order.model.dao.OrderDao;
import org.nulljump.dionysos.order.model.vo.Order;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

@Service
public class OrderServiceImpl implements OrderService{
	
	@Autowired
	private OrderDao orderDao;
	
	// 주문 정보 추가
    @Override
    public int insertOrder(Order order) {
        return orderDao.insertOrder(order);
    }

	@Override
	public Order selectOrder(Order order) {
		return orderDao.selectOrder(order);
	}

	@Override
	public ArrayList<Order> selectOrderlist(Order order) {
		return orderDao.selectOrderlist(order);
	}

	@Override
	public int selectListCount() {
		return orderDao.selectListCount();
	}
	
	@Override
	public ArrayList<Order> orderMyList(Map<String, Object> paramMap) {
		return orderDao.orderMyList(paramMap);
	}

	@Override
	public int selectMyorderListCount(String user_id) {
		return orderDao.selectMyorderListCount(user_id);
	}
	
	@Override
	public int updateOrderCancelStatus(Order order) {
		return orderDao.updateOrderCancelStatus(order);
	}

	@Override
	public Order selectOrderForCancel(long order_number) {
		return orderDao.selectOrderForCancel(order_number);
	}
}
