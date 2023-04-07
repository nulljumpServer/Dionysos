package org.nulljump.dionysos.order.model.vo;

import java.io.Serializable;
import java.sql.Date;

public class Order implements Serializable {
	private static final long serialVersionUID = -1863124908953232311L;
	private int order_id;
	private int order_seq_num;
	private String user_id;
	private String store_id;
	private int product_id;
	private java.sql.Date order_date;
	private int order_quantity;
	private int order_price;
	private int order_status;
	private String cal_info;

	public Order() {
		super();
	}

	public Order(int order_id, int order_seq_num, String user_id, String store_id, int product_id, Date order_date,
			int order_quantity, int order_price, int order_status, String cal_info) {
		super();
		this.order_id = order_id;
		this.order_seq_num = order_seq_num;
		this.user_id = user_id;
		this.store_id = store_id;
		this.product_id = product_id;
		this.order_date = order_date;
		this.order_quantity = order_quantity;
		this.order_price = order_price;
		this.order_status = order_status;
		this.cal_info = cal_info;
	}

	public int getOrder_id() {
		return order_id;
	}

	public void setOrder_id(int order_id) {
		this.order_id = order_id;
	}

	public int getOrder_seq_num() {
		return order_seq_num;
	}

	public void setOrder_seq_num(int order_seq_num) {
		this.order_seq_num = order_seq_num;
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

	public int getProduct_id() {
		return product_id;
	}

	public void setProduct_id(int product_id) {
		this.product_id = product_id;
	}

	public java.sql.Date getOrder_date() {
		return order_date;
	}

	public void setOrder_date(java.sql.Date order_date) {
		this.order_date = order_date;
	}

	public int getOrder_quantity() {
		return order_quantity;
	}

	public void setOrder_quantity(int order_quantity) {
		this.order_quantity = order_quantity;
	}

	public int getOrder_price() {
		return order_price;
	}

	public void setOrder_price(int order_price) {
		this.order_price = order_price;
	}

	public int getOrder_status() {
		return order_status;
	}

	public void setOrder_status(int order_status) {
		this.order_status = order_status;
	}

	public String getCal_info() {
		return cal_info;
	}

	public void setCal_info(String cal_info) {
		this.cal_info = cal_info;
	}

	public static long getSerialversionuid() {
		return serialVersionUID;
	}

	@Override
	public String toString() {
		return "Order [order_id=" + order_id + ", order_seq_num=" + order_seq_num + ", user_id=" + user_id
				+ ", store_id=" + store_id + ", product_id=" + product_id + ", order_date=" + order_date
				+ ", order_quantity=" + order_quantity + ", order_price=" + order_price + ", order_status="
				+ order_status + ", cal_info=" + cal_info + "]";
	}

}
