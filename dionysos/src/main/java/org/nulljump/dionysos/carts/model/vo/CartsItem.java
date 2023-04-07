package org.nulljump.dionysos.carts.model.vo;

public class CartsItem implements java.io.Serializable {
	private static final long serialVersionUID = -4687086184227225776L;
	private int cart_id; // 카트 아이디
	private String user_id; // 유저 아이디
	private int product_id; // 상품 아이디
	private int cart_quantity; // 상품 수량

	// 상품에 필요한 것들 추가
	private int product_price; // 가격
	private String product_image; // 사진 ????
	private String product_name; // 이름

	public CartsItem() {
		super();
	}

	public CartsItem(int cart_id, String user_id, int product_id, int cart_quantity, int product_price,
			String product_image, String product_name) {
		super();
		this.cart_id = cart_id;
		this.user_id = user_id;
		this.product_id = product_id;
		this.cart_quantity = cart_quantity;
		this.product_price = product_price;
		this.product_image = product_image;
		this.product_name = product_name;
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

	public String getProduct_image() {
		return product_image;
	}

	public void setProduct_image(String product_image) {
		this.product_image = product_image;
	}

	public String getProduct_name() {
		return product_name;
	}

	public void setProduct_name(String product_name) {
		this.product_name = product_name;
	}

	public static long getSerialversionuid() {
		return serialVersionUID;
	}

	@Override
	public String toString() {
		return "CartsItem [cart_id=" + cart_id + ", user_id=" + user_id + ", product_id=" + product_id
				+ ", cart_quantity=" + cart_quantity + ", product_price=" + product_price + ", product_image="
				+ product_image + ", product_name=" + product_name + "]";
	}

}
