package org.nulljump.dionysos.order.model.dao;



import java.util.ArrayList;
import java.util.List;
import java.util.Map;

import org.mybatis.spring.SqlSessionTemplate;
import org.nulljump.dionysos.order.model.vo.Order;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

@Repository("orderDao")
public class OrderDao {

	@Autowired
	private SqlSessionTemplate session;
	
	// 주문 정보 추가
    public int insertOrder(Order order) {
        return session.insert("orderMapper.insertOrder", order);
    }

	public Order selectOrder(Order order) {
		 return session.selectOne("orderMapper.selectOrder", order);
	}
	
	public ArrayList<Order> selectOrderlist(Order order) {
		List<Order> list = session.selectList("orderMapper.selectOrderlist", order);
		return (ArrayList<Order>)list;
	}

	public int selectListCount() {
		return session.selectOne("orderMapper.selectListCount");
	}
	
	public ArrayList<Order> orderMyList(Map<String, Object> paramMap) {
		List<Order> list = session.selectList("orderMapper.orderMyList", paramMap);
		return (ArrayList<Order>)list;
	}

	public int selectMyorderListCount(String user_id) {
		return session.selectOne("orderMapper.selectMyorderListCount", user_id);
	}
	
	public int updateOrderCancelStatus(Order order) {
		return session.update("orderMapper.updateOrderCancelStatus", order);   
	}

	public Order selectOrderForCancel(long order_number) {
		 return session.selectOne("orderMapper.selectOrderForCancel", order_number);
	}
}
