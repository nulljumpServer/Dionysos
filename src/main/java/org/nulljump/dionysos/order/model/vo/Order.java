package org.nulljump.dionysos.order.model.vo;

import java.io.Serializable;
import java.sql.Date;



public class Order implements Serializable {
	private static final long serialVersionUID = -1863124908953232311L;
	private int order_id; //주문 아이디
	private long order_number; //주문 번호
	private String user_id; //유저 정보
	private String store_id; //매장 정보
	private String store_name;
	private int product_id; //상품 정보
	private int order_qty; //상품 수량
	private Date order_date; //주문 일자
	private int total_price; //주문 총 가격
	private String product_name;
	private String product_image;
	private String cancle_info; //주문 취소 여부

	public Order() {
		super();
	}

	public Order(int order_id, long order_number, String user_id, String store_id, String store_name, int product_id,
			int order_qty, Date order_date, int total_price, String product_name, String product_image,
			String cancle_info) {
		super();
		this.order_id = order_id;
		this.order_number = order_number;
		this.user_id = user_id;
		this.store_id = store_id;
		this.store_name = store_name;
		this.product_id = product_id;
		this.order_qty = order_qty;
		this.order_date = order_date;
		this.total_price = total_price;
		this.product_name = product_name;
		this.product_image = product_image;
		this.cancle_info = cancle_info;
	}

	public int getOrder_id() {
		return order_id;
	}

	public void setOrder_id(int order_id) {
		this.order_id = order_id;
	}

	public long getOrder_number() {
		return order_number;
	}

	public void setOrder_number(long order_number) {
		this.order_number = order_number;
	}

	public String getUser_id() {
		return user_id;
	}

	public void setUser_id(String user_id) {
		this.user_id = user_id;
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

	public int getProduct_id() {
		return product_id;
	}

	public void setProduct_id(int product_id) {
		this.product_id = product_id;
	}

	public int getOrder_qty() {
		return order_qty;
	}

	public void setOrder_qty(int order_qty) {
		this.order_qty = order_qty;
	}

	public Date getOrder_date() {
		return order_date;
	}

	public void setOrder_date(Date order_date) {
		this.order_date = order_date;
	}

	public int getTotal_price() {
		return total_price;
	}

	public void setTotal_price(int total_price) {
		this.total_price = total_price;
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

	public String getCancle_info() {
		return cancle_info;
	}

	public void setCancle_info(String cancle_info) {
		this.cancle_info = cancle_info;
	}

	public static long getSerialversionuid() {
		return serialVersionUID;
	}

	@Override
	public String toString() {
		return "Order [order_id=" + order_id + ", order_number=" + order_number + ", user_id=" + user_id + ", store_id="
				+ store_id + ", store_name=" + store_name + ", product_id=" + product_id + ", order_qty=" + order_qty
				+ ", order_date=" + order_date + ", total_price=" + total_price + ", product_name=" + product_name
				+ ", product_image=" + product_image + ", cancle_info=" + cancle_info + "]";
	}

}
