package org.nulljump.dionysos.store.model.service;

import java.util.ArrayList;

import org.nulljump.dionysos.store.model.vo.Store;

public interface StoreService {

	ArrayList<Store> selectStoreList(int product_id);
}
