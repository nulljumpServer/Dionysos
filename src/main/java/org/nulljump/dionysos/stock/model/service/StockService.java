package org.nulljump.dionysos.stock.model.service;

import java.util.ArrayList;
import java.util.Map;

import org.nulljump.dionysos.common.Paging;
import org.nulljump.dionysos.stock.model.vo.Stock;

public interface StockService {

	int selectListCount(String store_id); //재고 전체 목록 갯수 조회

	ArrayList<Stock> selectStockList(int store_id); // 매장 아이디 기준 재고리스트 조회
	
	ArrayList<Stock> selectStockPage(Map<String, Object> paramMap); // 재고 리스트 페이징 조회

	int selectSearchStockCount(String action, String keyword, String store_id); // 재고정보 검색결과 갯수 조회(검색 페이징)

	ArrayList<Stock> selectSearchStock(String action, String keyword, Paging paging, String store_id); // 재고 검색(페이징)

	Stock selectStock(String store_id); // 매장 수정페이지로 보낼 객체 조회용
	
	int insertStock(Stock stock); // 매장 정보 수정

	int updateStock(Stock stock); // 매장 정보 수정
	
	int deleteStock(Stock stock); // 매장 정보 삭제


}
