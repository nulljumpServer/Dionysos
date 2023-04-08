package org.nulljump.dionysos.product.model.service;

import java.util.ArrayList;
import java.util.List;
<<<<<<< Updated upstream

=======
>>>>>>> Stashed changes

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
	public ArrayList<Product> selectFilterProductList() {
		return productDao.selectFilterProductList();
	}
	
	@Override
	public ArrayList<Product> selectSearchProductId(int keyword) {
		return productDao.selectSearchProductId(keyword);
	}

	@Override
	public ArrayList<Product> selectSearchProductName(String keyword) {
		return productDao.selectSearchProductName(keyword);
	}

	@Override
	public ArrayList<Product> selectSearchProductEname(String keyword) {
		return productDao.selectSearchProductEname(keyword);
	}

	@Override
	public ArrayList<Product> selectSearchProductPrice(int keyword) {
		return productDao.selectSearchProductPrice(keyword);
	}

	@Override
	public ArrayList<Product> selectSearchProductAlcohol(float keyword) {
		return productDao.selectSearchProductAlcohol(keyword);
	}
	
	@Override
	public ArrayList<Product> selectSearchProductAcidity(int keyword) {
		return productDao.selectSearchProductAcidity(keyword);
	}

	@Override
	public ArrayList<Product> selectSearchProductSweetness(int keyword) {
		return productDao.selectSearchProductSweetness(keyword);
	}

	@Override
	public ArrayList<Product> selectSearchProductBody(int keyword) {
		return productDao.selectSearchProductBody(keyword);
	}

	@Override
	public ArrayList<Product> selectSearchProductTannin(int keyword) {
		return productDao.selectSearchProductTannin(keyword);
	}

	@Override
<<<<<<< Updated upstream

=======
>>>>>>> Stashed changes
	public ArrayList<Product> selectSearchWineOrigin(String keyword) {
		return productDao.selectSearchWineOrigin(keyword);
	}

	@Override
	public ArrayList<Product> selectSearchWineType(String keyword) {
		return productDao.selectSearchWineType(keyword);
	}
	
	@Override
	public ArrayList<Product> selectSearchGrapeType(String keyword) {
		return productDao.selectSearchGrapeType(keyword);
<<<<<<< Updated upstream

=======
>>>>>>> Stashed changes
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
<<<<<<< Updated upstream

	}


=======
	}

	@Override
	public int selectSearchProductCount(String action, String keyword) {
		return productDao.selectSearchProductCount(action, keyword);
	}




>>>>>>> Stashed changes
	

	




	
}
