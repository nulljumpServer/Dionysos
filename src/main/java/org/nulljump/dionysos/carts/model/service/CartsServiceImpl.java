package org.nulljump.dionysos.carts.model.service;

import java.util.ArrayList;

import org.nulljump.dionysos.carts.model.dao.CartsDao;
import org.nulljump.dionysos.carts.model.vo.Carts;
import org.nulljump.dionysos.carts.model.vo.MyCart;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

@Service
public class CartsServiceImpl implements CartsService {

	@Autowired
	private CartsDao cartsDao;

	@Override
	public int insertCarts(Carts carts) {
		return cartsDao.insertCarts(carts);	
	}

	@Override
	public ArrayList<Carts> listCarts(String user_id) {
		return cartsDao.listCarts(user_id);
	}

	@Override
	public int deleteCarts(int product_id) {
		return cartsDao.deleteCarts(product_id);	
	}

	@Override
	public int updateCarts(Carts carts) {
		return cartsDao.updateCarts(carts);
	}

	@Override
	public ArrayList<MyCart> selectCarts(Carts cart) {
		return cartsDao.selectCarts(cart);
	}

	@Override
	public int getCarts(Carts carts) {
		return cartsDao.getCarts(carts);
	}

	@Override
	public Carts getCartsByProductIdAndUserId(String user_id, int product_id) {
		return cartsDao.getCartsByUserAndProduct(user_id, product_id);
	}

	@Override
	public int updateQty(Carts carts) {
		return cartsDao.updateQty(carts);
	}



}