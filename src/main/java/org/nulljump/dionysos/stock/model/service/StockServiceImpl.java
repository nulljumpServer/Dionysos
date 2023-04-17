package org.nulljump.dionysos.stock.model.service;

import java.util.ArrayList;
import java.util.Map;

import org.nulljump.dionysos.common.Paging;
import org.nulljump.dionysos.stock.model.dao.StockDao;
import org.nulljump.dionysos.stock.model.vo.Stock;
import org.nulljump.dionysos.store.model.dao.StoreDao;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

@Service("stockService")
public class StockServiceImpl implements StockService {
	
	@Autowired
	StockDao stockDao;

	@Override
	public int selectListCount(String store_id) {
		return stockDao.selectListCount(store_id);
	}

	@Override
	public ArrayList<Stock> selectStockList(int store_id) {
		return stockDao.selectStockList(store_id);
	}

	@Override
	public ArrayList<Stock> selectStockPage(Map<String, Object> paramMap) {
		return stockDao.selectStockPage(paramMap);
	}

	@Override
	public int selectSearchStockCount(String action, String keyword, String store_id) {
		return stockDao.selectSearchStockCount(action, keyword, store_id);
	}

	@Override
	public ArrayList<Stock> selectSearchStock(String action, String keyword, Paging paging, String store_id) {
		return stockDao.selectSearchStock(action, keyword, paging, store_id);
	}

	@Override
	public Stock selectStock(String store_id) {
		return stockDao.selectStock(store_id);
	}

	@Override
	public int insertStock(Stock stock) {
		return stockDao.insertStock(stock);
	}

	@Override
	public int updateStock(Stock stock) {
		return stockDao.updateStock(stock);
	}

	@Override
	public int deleteStock(Stock stock) {
		return stockDao.deleteStock(stock);
	}
	
	

}
