package org.nulljump.dionysos.orders.model.service;

import java.util.ArrayList;

import org.nulljump.dionysos.common.Paging;
import org.nulljump.dionysos.orders.model.vo.Orders;

public interface OrdersService {
	
	ArrayList<Orders> selectOrdersList(Paging page);  // 주문 리스트 조회(페이징)

	int selectListCount();
}
