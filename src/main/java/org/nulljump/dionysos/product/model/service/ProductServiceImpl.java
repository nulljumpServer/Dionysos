package org.nulljump.dionysos.product.model.service;

import java.util.ArrayList;
import java.util.List;

import org.nulljump.dionysos.common.Paging;
import org.nulljump.dionysos.product.model.dao.ProductDao;
import org.nulljump.dionysos.product.model.vo.Product;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

@Service("productService")
public class ProductServiceImpl implements ProductService {
	
	@Autowired
	ProductDao productDao;

	@Override
	public ArrayList<Product> selectProductList(Paging page) {
		return productDao.selectProductList(page);
	}
	
	@Override
	public ArrayList<Product> selectTop4() {
		return productDao.selectTop4();
	}
	
	@Override
	public ArrayList<Product> selectNew4() {
		return productDao.selectNew4();
	}

	@Override
	public int selectListCount() {
		return productDao.selectListCount();
	}
	
	@Override
	public Product selectProduct(int product_id) {
		return productDao.selectProduct(product_id);
	}
	
	@Override
	public ArrayList<Product> selectSearchProduct(String action, String keyword, Paging page) {
		return productDao.selectSearchProduct(action, keyword, page);
	}
	

	
	@Override
	public int insertProduct(Product product) {
		return productDao.insertProduct(product);
	}

	@Override
	public int updateProduct(Product product) {
		return productDao.updateProduct(product);
	}

	@Override
	public int deleteProduct(Product product) {
		return productDao.deleteProduct(product);
	}


	@Override
	public int selectLastProductId() {
		return productDao.selectLastProductId();
	}

	@Override
	public ArrayList<Product> selectFilter(List<String> wine_type, List<String> wine_origin,
			int product_price, int sweetness, int acidity, int body, int tannin) {
		return productDao.selectFilter(wine_type, wine_origin, product_price, sweetness, acidity, body, tannin);
	}

	@Override
	public int selectSearchProductCount(String action, String keyword) {
		return productDao.selectSearchProductCount(action, keyword);
	}




	

	




	
}
