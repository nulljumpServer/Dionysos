package org.nulljump.dionysos.store.model.dao;

import java.util.ArrayList;
import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;
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

	public int updateStore(Store store) {
		return session.update("storeMapper.updateStore", store);
	}

	public Store selectStore(String store_id) {
		return session.selectOne("storeMapper.selectStore", store_id);

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

	
}
