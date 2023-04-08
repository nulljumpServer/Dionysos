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
	public boolean insertCarts(Carts carts) {
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
	public int updateCarts(Carts carts) {
		return cartsDao.updateCarts(carts);
	}

//	@Override
//	public boolean findCartProduct(Carts carts) {
//		return cartsDao.findCartProduct(carts);
//	}
//
//	@Override
//	public void addProductCart(Carts carts) {
//		cartsDao.addProductCart(carts);
//	}

//	@Override
//	public boolean addCart(int product_id, String user_id) {
//		Carts cart = cartsDao.selectCartByProductIdAndUserId(product_id, user_id);
//		if (cart == null) {
//		cartsDao.insertCart(product_id, user_id);
//		return true;
//		} else {
//		return false;
//		}
//		}
//		}

//	@Override
//	public int countCarts(String user_id, int product_id) {
//		return cartsDao.countCarts(user_id, product_id);
//	}

}