package org.nulljump.dionysos.store.model.service;

import java.util.ArrayList;

import org.nulljump.dionysos.store.model.dao.StoreDao;
import org.nulljump.dionysos.store.model.vo.Store;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;
import org.springframework.stereotype.Service;

@Service("storeService")
public class StoreServiceImpl implements StoreService {

	@Autowired
	StoreDao storeDao;

	@Autowired
	private BCryptPasswordEncoder bcryptPasswordEncoder;



	@Override
	public int selectDupCheckId(String store_id) {
		return storeDao.selectDupCheckId(store_id);

	}


	@Override
	public Store selectLogin(Store store) {
		return storeDao.selectLogin(store);
	}

	@Override
	public Store selectStore(String store_id) {
		return storeDao.selectStore(store_id);
	}

	@Override
	public int insertStore(Store store) {
		return storeDao.insertStore(store);
	}

	@Override
	public int updateStore(Store store) {
		return storeDao.updateStore(store);
	}

	@Override
	public int evictionStore(String store_id) {
		return storeDao.evictionUsers(store_id);
	}


	@Override
	public ArrayList<Store> selectList() {
		return storeDao.selectList();
	}


	@Override
	public int deleteStore(String store_id) {
		return storeDao.deleteStore(store_id);
	}
	
	@Override
	public int updateLoginok(Store store) {
		return storeDao.updateLoginok(store);
	}

}
