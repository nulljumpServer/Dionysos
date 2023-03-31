package org.nulljump.dionysos.carts.model.service;

import java.util.ArrayList;

import org.nulljump.dionysos.carts.model.dao.CartsDao;
import org.nulljump.dionysos.carts.model.vo.Carts;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;



@Service
public class CartsServiceImpl implements CartsService {

	@Autowired
	private CartsDao cartsDao;

	@Override
	public ArrayList<Carts> cartMoney() {
		return cartsDao.cartMoney();
	}

	@Override
	public int insertCarts(Carts carts) {
		return cartsDao.insertCarts(carts);
		
	}

	@Override
	public ArrayList<Carts> listCarts(String user_id) {
		return cartsDao.listCarts(user_id);
	}

	@Override
	public int deleteCarts(int cart_id) {
		return cartsDao.deleteCarts(cart_id);
		
	}

	@Override
	public int deleteAllCarts(String user_id) {
		return cartsDao.deleteAllCarts(user_id);
		
	}

	@Override
	public int updateCarts(Carts carts) {
		return cartsDao.updateCarts(carts);
		
	}

	@Override
	public int sumMoney(String user_id) {
		return cartsDao.sumMoney(user_id);
	}

	@Override
	public int countCarts(String user_id, int product_id) {
		return cartsDao.countCarts(user_id, product_id);
	}



	
}