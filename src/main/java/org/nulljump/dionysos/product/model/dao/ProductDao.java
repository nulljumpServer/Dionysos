package org.nulljump.dionysos.product.model.dao;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.mybatis.spring.SqlSessionTemplate;
import org.nulljump.dionysos.common.Paging;
import org.nulljump.dionysos.product.model.vo.Product;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

@Repository("productDao")  //xml�� �ڵ� ��ϵ�
public class ProductDao {

	@Autowired
	private SqlSessionTemplate session;   //������ ����
	
	public ArrayList<Product> selectProductList(Paging page) {
		List<Product> list = session.selectList("productMapper.selectProductList", page);
		return (ArrayList<Product>)list;
	}
	
	public ArrayList<Product> selectTop4() {
		List<Product> list = session.selectList("productMapper.selectTop4");
		return (ArrayList<Product>)list;
	}
	
	public ArrayList<Product> selectNew4() {
		List<Product> list = session.selectList("productMapper.selectNew4");
		return (ArrayList<Product>)list;
	}
	
	//��ǰ ����� �� ���� ��ȸ
	public int selectListCount() {
		return session.selectOne("productMapper.selectListCount");
	}

	public Product selectProduct(int product_id) {
		return session.selectOne("productMapper.selectProduct", product_id);
	}

	//Ư�� ������ �ش��ϴ� ��ǰ ��� ��ȸ
	public ArrayList<Product> selectFilterProductList() {
		List<Product> list = session.selectList("productMapper.selectFilterProductList");
		return (ArrayList<Product>) list;
	}

	//�˻� ó����
	public ArrayList<Product> selectSearchProductId(int keyword) {
		List<Product> list = session.selectList("productMapper.selectSearchProduct", keyword);
		return (ArrayList<Product>)list;
	}

	public ArrayList<Product> selectSearchProductName(String keyword) {
		List<Product> list = session.selectList("productMapper.selectSearchProductName", keyword);
		return (ArrayList<Product>)list;
	}

	public ArrayList<Product> selectSearchProductEname(String keyword) {
		List<Product> list = session.selectList("productMapper.selectSearchProductEname", keyword);
		return (ArrayList<Product>)list;
	}

	public ArrayList<Product> selectSearchProductPrice(int keyword) {
		List<Product> list = session.selectList("productMapper.selectSearchProductPrice", keyword);
		return (ArrayList<Product>)list;
	}

	public ArrayList<Product> selectSearchProductAlcohol(float keyword) {
		List<Product> list = session.selectList("productMapper.selectSearchProductAlcohol", keyword);
		return (ArrayList<Product>)list;
	}
	
	public ArrayList<Product> selectSearchProductAcidity(int keyword) {
		List<Product> list = session.selectList("productMapper.selectSearchProductAcidity", keyword);
		return (ArrayList<Product>)list;
	}

	public ArrayList<Product> selectSearchProductSweetness(int keyword) {
		List<Product> list = session.selectList("productMapper.selectSearchProduct", keyword);
		return (ArrayList<Product>)list;
	}

	public ArrayList<Product> selectSearchProductBody(int keyword) {
		List<Product> list = session.selectList("productMapper.selectSearchProduct", keyword);
		return (ArrayList<Product>)list;
	}

	public ArrayList<Product> selectSearchProductTannin(int keyword) {
		List<Product> list = session.selectList("productMapper.selectSearchProduct", keyword);
		return (ArrayList<Product>)list;
	}

	public ArrayList<Product> selectSearchProductOrigin(String keyword) {
		List<Product> list = session.selectList("productMapper.selectSearchProduct", keyword);
		return (ArrayList<Product>)list;
	}

	public ArrayList<Product> selectSearchProductType(String keyword) {
		List<Product> list = session.selectList("productMapper.selectSearchProduct", keyword);
		return (ArrayList<Product>)list;
	}

	//������
	public int insertProduct(Product product) {
		return session.insert("productMapper.insertProduct", product);
	}

	public int updateProduct(Product product) {
		return session.update("productMapper.updateProduct", product);
	}

	public int deleteProduct(Product product) {
		return session.delete("productMapper.deleteProduct", product);
	}

	public ArrayList<Product> selectSearchWineType(String wine_type) {
		List<Product> list = session.selectList("productMapper.selectSearchProduct", wine_type);
		return (ArrayList<Product>)list;
	}

	public int selectLastProductId() {
		return session.selectOne("productMapper.selectLastProductId");
		}

	public ArrayList<Product> selectAdvancedSearch(List<String> wine_type, List<String> wine_origin,
			int product_price, int sweetness, int acidity, int body, int tannin) {
		 Map<String, Object> paramMap = new HashMap<>();
		    paramMap.put("wine_type", wine_type);
		    paramMap.put("wine_origin", wine_origin);
		    paramMap.put("product_price", product_price);
		    paramMap.put("sweetness", sweetness);
		    paramMap.put("acidity", acidity);
		    paramMap.put("body", body);
		    paramMap.put("tannin", tannin);
		    
 		    List<Object> products = session.selectList("productMapper.selectAdvancedSearch", paramMap);
 		    ArrayList<Product> list = new ArrayList<Product>();
 		    for(Object obj : products) {
 		    	list.add((Product)obj);
 		    }
 		    return list;
		
	}


}
