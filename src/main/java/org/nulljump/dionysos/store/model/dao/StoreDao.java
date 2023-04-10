package org.nulljump.dionysos.store.model.dao;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.mybatis.spring.SqlSessionTemplate;
import org.nulljump.dionysos.common.Paging;
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
