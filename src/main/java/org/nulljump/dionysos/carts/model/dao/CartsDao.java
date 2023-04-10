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
	@Autowired    //root-context.xml ���� ������ ��ü�� �ڵ� ����
	private SqlSessionTemplate session;    //������ ����(DI)

//	private final String NS = "ict.org.dionysos";
//	public boolean insertCarts(Carts carts) {
//		return session.selectOne("cartsMapper.insertCarts", carts);
//	}

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
	
	    public boolean insertCarts(Carts carts) {
	        int rowsInserted = session.insert("cartsMapper.insertCarts", carts);
	        return rowsInserted > 0;
	    }
	
	public ArrayList<Carts> listCarts(String user_id) {
		List<Carts> list = session.selectList("cartsMapper.clistCarts", user_id);
		return (ArrayList<Carts>)list;
	} 

	public int deleteCarts(int cart_id) {
		return session.delete("cartsMapper.deleteCarts", cart_id);
	}


	public boolean updateCarts(Carts carts) {
		int rowsUpdate = session.update("cartsMapper.updateCarts", carts);
		return rowsUpdate > 0;
	}



	public int getCarts(Carts carts) {
		return session.selectOne("cartsMapper.getCarts", carts);
	}


//	public boolean findCartProduct(Carts carts) {
//		String result = session.selectOne(NS+".findCartProduct", carts);
//		return Boolean.parseBoolean(result);
//	}
//
//	public void addProductCart(Carts carts) {
//		session.insert(NS+".addProductCart", carts);
//	}
//
////	public Carts selectCartByProductIdAndUserId(@Param("product_id") int product_id, @Param("user_id") String user_id) {
//		return null;
//	}
//
//	void insertCart(@Param("product_id") int product_id, @Param("user_id") String user_id) {
//	}

//	public int countCarts(String user_id, int product_id) {
//		// TODO Auto-generated method stub
//		return 0;
//	}
	
}
