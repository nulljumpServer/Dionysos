package org.nulljump.dionysos.store.model.service;

import java.util.ArrayList;

import org.nulljump.dionysos.common.Paging;
import org.nulljump.dionysos.store.model.vo.Store;

public interface StoreService {
	
	int selectListCount(); //매장 전체 목록 갯수 조회

	ArrayList<Store> selectStoreList(int product_id); // 상품 상세페이지, 상품 아이디에 대한 매장 리스트 조회
	
	ArrayList<Store> selectStorePage(Paging paging); // 매장 리스트 페이징 조회

	int selectSearchStoreCount(String action, String keyword); // 매장 검색결과 갯수 조회(검색 페이징)

	ArrayList<Store> selectSearchStore(String action, String keyword, Paging paging); // 매장 검색(페이징)

	

//	int insertStore(Store store); // 매장 추가

	Store selectStore(String store_id); // 매장 수정페이지로 보낼 객체 조회용

	int updateStore(Store store); // 매장 정보 수정
	
	int deleteStore(Store store); // 매장 정보 삭제
}
