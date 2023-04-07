package org.nulljump.dionysos.store.model.service;

import java.io.IOException;
import java.util.ArrayList;

import javax.servlet.http.HttpServletResponse;

import org.nulljump.dionysos.common.SearchDate;
import org.nulljump.dionysos.common.Searchs;
import org.nulljump.dionysos.store.model.vo.Store;

public interface StoreService {
	Store selectLogin(Store store);
	int selectDupCheckId(String store_id);
	Store selectStore(String store_id);
	ArrayList<Store> selectList();
	int insertStore(Store store);
	int updateStore(Store store);
	int evictionStore(String store_id);
	int deleteStore(String store_id);
	int updateLoginok(Store store);
	
}
