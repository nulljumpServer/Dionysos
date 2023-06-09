package org.nulljump.dionysos.carts.model.vo;

public class MyCart implements java.io.Serializable {
	private static final long serialVersionUID = -1670824469021109335L;
	private int cart_id;
	private String user_id;
	private int product_id;
	private int cart_quantity;
	private int product_price;
	private String product_name;
	private String product_image;
	private String store_id; //매장 아이디
	private String store_name; 

	public MyCart() {
		super();
	}

	public MyCart(int cart_id, String user_id, int product_id, int cart_quantity, int product_price,
			String product_name, String product_image, String store_id, String store_name) {
		super();
		this.cart_id = cart_id;
		this.user_id = user_id;
		this.product_id = product_id;
		this.cart_quantity = cart_quantity;
		this.product_price = product_price;
		this.product_name = product_name;
		this.product_image = product_image;
		this.store_id = store_id;
		this.store_name = store_name;
	}

	public int getCart_id() {
		return cart_id;
	}

	public void setCart_id(int cart_id) {
		this.cart_id = cart_id;
	}

	public String getUser_id() {
		return user_id;
	}

	public void setUser_id(String user_id) {
		this.user_id = user_id;
	}

	public int getProduct_id() {
		return product_id;
	}

	public void setProduct_id(int product_id) {
		this.product_id = product_id;
	}

	public int getCart_quantity() {
		return cart_quantity;
	}

	public void setCart_quantity(int cart_quantity) {
		this.cart_quantity = cart_quantity;
	}

	public int getProduct_price() {
		return product_price;
	}

	public void setProduct_price(int product_price) {
		this.product_price = product_price;
	}

	public String getProduct_name() {
		return product_name;
	}

	public void setProduct_name(String product_name) {
		this.product_name = product_name;
	}

	public String getProduct_image() {
		return product_image;
	}

	public void setProduct_image(String product_image) {
		this.product_image = product_image;
	}

	public String getStore_id() {
		return store_id;
	}

	public void setStore_id(String store_id) {
		this.store_id = store_id;
	}

	public String getStore_name() {
		return store_name;
	}

	public void setStore_name(String store_name) {
		this.store_name = store_name;
	}

	public static long getSerialversionuid() {
		return serialVersionUID;
	}

	@Override
	public String toString() {
		return "MyCart [cart_id=" + cart_id + ", user_id=" + user_id + ", product_id=" + product_id + ", cart_quantity="
				+ cart_quantity + ", product_price=" + product_price + ", product_name=" + product_name
				+ ", product_image=" + product_image + ", store_id=" + store_id + ", store_name=" + store_name + "]";
	}

	

}
