package org.nulljump.dionysos.product.model.service;

import java.util.ArrayList;

import org.nulljump.dionysos.common.Paging;
import org.nulljump.dionysos.product.model.vo.Product;

public interface ProductService {

	int selectListCount();               				 //��ǰ ����� �� ���� ��ȸ   
	ArrayList<Product> selectProductList(Paging page);  //��ǰ ��� ��ȸ  
	ArrayList<Product> selectTop4();				// ���� ���� �ȸ� 4�� ��ȸ
	ArrayList<Product> selectNew4();                 //�Ż�ǰ 4�� ��ȸ
	Product selectProduct(int product_id);           //Ư�� ��ǰ id�� �ش��ϴ� ��ǰ ��ȸ     
	ArrayList<Product> selectFilterProductList();    //Ư�� ������ �ش��ϴ� ��ǰ ��� ��ȸ
	
	//�˻��� ���� �޼ҵ�
	ArrayList<Product> selectSearchProductId(int keyword);
	ArrayList<Product> selectSearchProductName(String keyword);
	ArrayList<Product> selectSearchProductEname(String keyword);
	ArrayList<Product> selectSearchProductPrice(int keyword);
	ArrayList<Product> selectSearchProductAlcohol(float keyword);
	ArrayList<Product> selectSearchProductAcidity(int keyword);
	ArrayList<Product> selectSearchProductSweetness(int keyword);
	ArrayList<Product> selectSearchProductBody(int keyword);
	ArrayList<Product> selectSearchProductTannin(int keyword);
	ArrayList<Product> selectSearchProductOrigin(String keyword);
	ArrayList<Product> selectSearchProductType(String keyword);
	
	//������
	int insertProduct(Product product);           //��ǰ �߰�
	int updateProduct(Product product);           //��ǰ ����
	int deleteProduct(Product product);           //��ǰ ����

	ArrayList<Product> selectSearchWineType(String wine_type);

	
}
