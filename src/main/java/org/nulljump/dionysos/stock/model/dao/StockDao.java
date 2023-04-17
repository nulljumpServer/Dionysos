package org.nulljump.dionysos.stock.model.dao;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.mybatis.spring.SqlSessionTemplate;
import org.nulljump.dionysos.common.Paging;
import org.nulljump.dionysos.stock.model.vo.Stock;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

@Repository("stockDao")
public class StockDao {
	
	@Autowired
	private SqlSessionTemplate session;

	public int selectListCount(String store_id) {
		return session.selectOne("stockMapper.selectListCount", store_id);
	}

	public ArrayList<Stock> selectStockList(int store_id) {
		List<Stock> list = session.selectList("stockMapper.selectStockList", store_id);
		return (ArrayList<Stock>) list;
	}

	public ArrayList<Stock> selectStockPage(Map<String, Object> paramMap) {
		List<Stock> list = session.selectList("stockMapper.selectStockPage", paramMap);
		return (ArrayList<Stock>) list;
	}

	public int selectSearchStockCount(String action, String keyword, String store_id) {
		Map<String, Object> paramMap = new HashMap<String, Object>();
		paramMap.put("action", action);
		paramMap.put("keyword", keyword);
		paramMap.put("store_id", store_id);
		List<Stock> list = session.selectList("stockMapper.selectSearchStockCount", paramMap);
		return list.size();
	}

	public ArrayList<Stock> selectSearchStock(String action, String keyword, Paging paging, String store_id) {
		Map<String, Object> paramMap = new HashMap<String, Object>();
		paramMap.put("action", action);
		paramMap.put("keyword", keyword);
		paramMap.put("paging", paging);
		paramMap.put("store_id", store_id);
		List<Stock> list = session.selectList("stockMapper.selectSearchStock", paramMap);
		return (ArrayList<Stock>) list;
	}

	public Stock selectStock(String store_id) {
		return session.selectOne("stockMapper.selectStock", store_id);
	}

	public int insertStock(Stock stock) {
		return session.insert("stockMapper.insertStock", stock);
	}

	public int updateStock(Stock stock) {
		return session.update("stockMapper.updateStock", stock);
	}

	public int deleteStock(Stock stock) {
		return session.delete("stockMapper.deleteStock", stock);
	}
	
	
}
