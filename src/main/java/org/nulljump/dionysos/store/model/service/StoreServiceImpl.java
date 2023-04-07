package org.nulljump.dionysos.store.model.service;

import java.util.ArrayList;

import org.nulljump.dionysos.store.model.dao.StoreDao;
import org.nulljump.dionysos.store.model.vo.Store;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

@Service("storeServcie")
public class StoreServiceImpl implements StoreService{

	@Autowired
	StoreDao storeDao;
	
	@Override
	public ArrayList<Store> selectStoreList(int product_id) {
		return storeDao.selectStoreList(product_id);
	}

}
