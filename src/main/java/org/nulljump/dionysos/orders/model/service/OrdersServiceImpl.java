package org.nulljump.dionysos.orders.model.service;

import java.util.ArrayList;

import org.nulljump.dionysos.common.Paging;
import org.nulljump.dionysos.orders.model.dao.OrdersDao;
import org.nulljump.dionysos.orders.model.vo.Orders;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

@Service("OrdersService")
public class OrdersServiceImpl implements OrdersService {
	
	@Autowired
	OrdersDao ordersDao;

	@Override
	public ArrayList<Orders> selectOrdersList(Paging page) {
		return ordersDao.selectOrdersList(page);
	}

	@Override
	public int selectListCount() {
		return ordersDao.selectListCount();
	}

}
