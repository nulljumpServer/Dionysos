package org.nulljump.dionysos.carts.model.vo;

import java.io.Serializable;

public class CartsItem implements Serializable { 
	
	private static final long serialVersionUID = -3948220937978041922L;
	private int product_id; 
	private int cart_quantity;
	private String product_name;
	private int product_price; 

	public CartsItem() {
		super();
	}

	public CartsItem(int product_id, int cart_quantity, int product_price) {
		super();
		this.product_id = product_id;
		this.cart_quantity = cart_quantity;
		this.product_price = product_price;
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

	@Override
	public String toString() {
		return "CartsItem [product_id=" + product_id + ", cart_quantity=" + cart_quantity + ", product_price="
				+ product_price + "]";
	}
	
}