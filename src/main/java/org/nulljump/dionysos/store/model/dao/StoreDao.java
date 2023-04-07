package org.nulljump.dionysos.store.model.dao;

import java.util.ArrayList;
import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;
import org.nulljump.dionysos.store.model.vo.Store;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

@Repository("storeDao")
public class StoreDao {

	@Autowired
	private SqlSessionTemplate session;

	public ArrayList<Store> selectStoreList(int product_id){
		List<Store> list = session.selectList("storeMapper.selectStoreList", product_id);
		return (ArrayList<Store>)list;
	}
}
