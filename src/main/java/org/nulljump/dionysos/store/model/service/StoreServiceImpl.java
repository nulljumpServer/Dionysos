package org.nulljump.dionysos.store.model.service;

import java.util.ArrayList;

import org.nulljump.dionysos.common.Paging;
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
	
	@Override
	public ArrayList<Store> selectStorePage(Paging page) {
		return storeDao.selectStorePage(page);
	}

	@Override
	public int selectListCount() {
		return storeDao.selectListCount();
	}

	@Override
	public Store selectStore(String store_id) {
		return storeDao.selectStore(store_id);
	}

	@Override
	public int selectSearchStoreCount(String action, String keyword) {
		return storeDao.selectSearchStoreCount(action, keyword);
	}

	@Override
	public ArrayList<Store> selectSearchStore(String action, String keyword, Paging paging) {
		return storeDao.selectSearchStore(action, keyword, paging);
	}

	

	@Override
	public int updateStore(Store store) {
		return storeDao.updateStore(store);
	}

	@Override
	public int deleteStore(Store store) {
		return storeDao.deleteStore(store);
	}

}
