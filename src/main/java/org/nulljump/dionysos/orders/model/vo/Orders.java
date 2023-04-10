package org.nulljump.dionysos.orders.model.vo;

import java.io.Serializable;
import java.sql.Date;

public class Orders implements Serializable {

	private static final long serialVersionUID = -7411282463130283325L;
	
	private int order_id;
	private String user_id;
	private String store_id;
	private int product_id;
	private Date order_date;
	private int order_quantity;
	private int order_price;
	private int order_status;
	private String cancle_flag;
	public Orders() {
		super();
	}
	public Orders(int order_id, String user_id, String store_id, int product_id, Date order_date, int order_quantity,
			int order_price, int order_status, String cancle_flag) {
		super();
		this.order_id = order_id;
		this.user_id = user_id;
		this.store_id = store_id;
		this.product_id = product_id;
		this.order_date = order_date;
		this.order_quantity = order_quantity;
		this.order_price = order_price;
		this.order_status = order_status;
		this.cancle_flag = cancle_flag;
	}
	public int getOrder_id() {
		return order_id;
	}
	public void setOrder_id(int order_id) {
		this.order_id = order_id;
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
	public Date getOrder_date() {
		return order_date;
	}
	public void setOrder_date(Date order_date) {
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
	public String getCancle_flag() {
		return cancle_flag;
	}
	public void setCancle_flag(String cancle_flag) {
		this.cancle_flag = cancle_flag;
	}
	public static long getSerialversionuid() {
		return serialVersionUID;
	}
	@Override
	public String toString() {
		return "Orders [order_id=" + order_id + ", user_id=" + user_id + ", store_id=" + store_id + ", product_id="
				+ product_id + ", order_date=" + order_date + ", order_quantity=" + order_quantity + ", order_price="
				+ order_price + ", order_status=" + order_status + ", cancle_flag=" + cancle_flag + "]";
	}
	
	

}
