package org.nulljump.dionysos.store.model.dao;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.mybatis.spring.SqlSessionTemplate;
import org.nulljump.dionysos.common.Paging;
import org.nulljump.dionysos.common.Searchs;
import org.nulljump.dionysos.store.model.vo.Store;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;
import org.springframework.transaction.annotation.Transactional;

@Repository("storeDao")
public class StoreDao {

	@Autowired
	private SqlSessionTemplate session;
	
	public Store selectLogin(Store store) {
		Store loginStore = session.selectOne("storeMapper.selectLogin", store);
		if (loginStore != null && loginStore.getEmail() == null) {
			// 예외 처리
			loginStore = null;
		}
		return loginStore;
	}

	public int selectDupCheckId(String store_id) {
		return session.selectOne("storeMapper.selectDupCheckId", store_id);

	}

	public int deleteStore(String store_id) {
		return session.delete("storeMapper.deleteStore", store_id);
	}

	public ArrayList<Store> selectList() {
		List<Store> list = session.selectList("storeMapper.selectList");
		return (ArrayList<Store>) list;
	}

	public int insertStore(Store store) {
		return session.insert("storeMapper.insertStore", store);

	}

	public int updateLoginok(Store store) {
		return session.update("storeMapper.updateLoginok", store);
	}

	public ArrayList<Store> selectSearchStoreid(Searchs searchs) {
		List<Store> list = session.selectList("storeMapper.selectSearchStoreid", searchs);
		return (ArrayList<Store>)list;
	}
	
	public int evictionUsers(String store_id) {
		return session.selectOne("storeMapper.evictionStore", store_id);
		
	}
	
	// 비밀번호 변경
	@Transactional
	public int update_pw(Store store) {
		return session.update("storeMapper.update_pw", store);

	}

	public ArrayList<Store> selectStoreList(int product_id){
		List<Store> list = session.selectList("storeMapper.selectStoreList", product_id);
		return (ArrayList<Store>)list;
	}

	public ArrayList<Store> selectStorePage(Paging page) {
		List<Store> list = session.selectList("storeMapper.selectStorePage", page);
		return (ArrayList<Store>)list;
	}

	public int selectListCount() {
		return session.selectOne("storeMapper.selectListCount");
	}

	public Store selectStore(String store_id) {
		return session.selectOne("storeMapper.selectStore", store_id);
	}

	public int selectSearchStoreCount(String action, String keyword) {
		Map<String, Object> paramMap = new HashMap<String, Object>();
		paramMap.put("action", action);
		paramMap.put("keyword", keyword);
		List<Store> list = session.selectList("storeMapper.selectSearchStoreCount", paramMap);
		return list.size();
	}

	public ArrayList<Store> selectSearchStore(String action, String keyword, Paging page) {
		Map<String, Object> paramMap = new HashMap<String, Object>();
		paramMap.put("action", action);
		paramMap.put("keyword", keyword);
		paramMap.put("page", page);
		List<Store> list = session.selectList("storeMapper.selectSearchStore", paramMap);
		return (ArrayList<Store>) list;
	}

	public int updateStore(Store store) {
		return session.update("storeMapper.updateStore", store);
	}

	public int deleteStore(Store store) {
		return session.delete("storeMapper.deleteStore", store);
	}
}
