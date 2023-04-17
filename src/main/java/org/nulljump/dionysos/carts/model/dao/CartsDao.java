package org.nulljump.dionysos.carts.model.dao;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.mybatis.spring.SqlSessionTemplate;
import org.nulljump.dionysos.carts.model.vo.Carts;
import org.nulljump.dionysos.carts.model.vo.MyCart;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

@Repository("cartsDao")
public class CartsDao {
	@Autowired    //root-context.xml         
	private SqlSessionTemplate session;    

	public ArrayList<MyCart> selectCarts(Carts cart){
		List<MyCart> list = session.selectList("cartsMapper.selectCarts", cart);
		return (ArrayList<MyCart>) list;
	}
	
	public Carts getCartsByUserAndProduct(String user_id, int product_id) {
        Map<String, Object> params = new HashMap<>();
        params.put("user_id", user_id);
        params.put("product_id", product_id);
        return session.selectOne("cartsMapper.getCartsByUserAndProduct", params);
    }
	
	    public int insertCarts(Carts carts) {
	        return session.insert("cartsMapper.insertCarts", carts);
	    }
	
	public ArrayList<Carts> listCarts(String user_id) {
		List<Carts> list = session.selectList("cartsMapper.clistCarts", user_id);
		return (ArrayList<Carts>)list;
	} 

	
	public int updateCarts(Carts carts) {
		return session.update("cartsMapper.updateCarts", carts);
		
	}


	public int updateQty(Carts carts) {
		return session.update("cartsMapper.updateQty", carts);
	}


	public int getCarts(Carts carts) {
		return session.selectOne("cartsMapper.getCarts", carts);
	}


	public int deleteCarts(int product_id) {
		return session.delete("cartsMapper.deleteCarts", product_id);
	}

	
}
