package org.nulljump.dionysos.carts.model.vo;

import java.io.Serializable;

public class Carts implements Serializable {
	
	private static final long serialVersionUID = -3996534574803193552L;
	private int cart_id; //장바구니 번호
    private String user_id; // 장바구니 소유자 아이디
    private String name; // 장바구니 소유자 이름
    private int product_id; // 상품번호
    private String product_name; // 상품명
    private int product_price; // 상품 가격
    private int money; // 
    private int cart_quantity; // 장바구니에 담긴 수량
	public Carts() {
		super();
	}
	public Carts(int cart_id, String user_id, String name, int product_id, String product_name, int product_price,
			int money, int amount) {
		super();
		this.cart_id = cart_id;
		this.user_id = user_id;
		this.name = name;
		this.product_id = product_id;
		this.product_name = product_name;
		this.product_price = product_price;
		this.money = money;
		this.cart_quantity = cart_quantity;
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
	public String getName() {
		return name;
	}
	public void setName(String name) {
		this.name = name;
	}
	public int getProduct_id() {
		return product_id;
	}
	public void setProduct_id(int product_id) {
		this.product_id = product_id;
	}
	public String getProduct_name() {
		return product_name;
	}
	public void setProduct_name(String product_name) {
		this.product_name = product_name;
	}
	public int getProduct_price() {
		return product_price;
	}
	public void setProduct_price(int product_price) {
		this.product_price = product_price;
	}
	public int getMoney() {
		return money;
	}
	public void setMoney(int money) {
		this.money = money;
	}
	public int getAmount() {
		return cart_quantity;
	}
	public void setAmount(int amount) {
		this.cart_quantity = cart_quantity;
	}
	@Override
	public String toString() {
		return "Carts [cart_id=" + cart_id + ", user_id=" + user_id + ", name=" + name + ", product_id=" + product_id
				+ ", product_name=" + product_name + ", product_price=" + product_price + ", money=" + money
				+ ", cart_quantity=" + cart_quantity + "]";
	} 
	
	
}
