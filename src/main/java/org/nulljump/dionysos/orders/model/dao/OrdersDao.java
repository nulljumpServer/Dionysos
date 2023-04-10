package org.nulljump.dionysos.orders.model.dao;

import java.util.ArrayList;
import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;
import org.nulljump.dionysos.common.Paging;
import org.nulljump.dionysos.orders.model.vo.Orders;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

@Repository("ordersDao")
public class OrdersDao {
	
	@Autowired
	private SqlSessionTemplate session;

	public ArrayList<Orders> selectOrdersList(Paging page) {
		List<Orders> list = session.selectList("ordersMapper.selectOrdersList", page);
		return (ArrayList<Orders>) list;
	}

	public int selectListCount() {
		return session.selectOne("ordersMapper.selectListCount");
	}

}
