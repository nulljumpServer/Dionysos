package org.nulljump.dionysos.stock.model.vo;

import java.sql.Date;

public class Stock {
	private int stock_id;
	private String store_id;
	private int stock_amount;
	private Date update_date;
	private int sales_amount;
	private int product_id;
	private String product_image;
	private String product_name;
	
	public Stock() {
		super();
	}
	
	public Stock(int stock_id, String store_id, int stock_amount, Date update_date, int sales_amount, int product_id,
			String product_image, String product_name) {
		super();
		this.stock_id = stock_id;
		this.store_id = store_id;
		this.stock_amount = stock_amount;
		this.update_date = update_date;
		this.sales_amount = sales_amount;
		this.product_id = product_id;
		this.product_image = product_image;
		this.product_name = product_name;
	}

	public int getStock_id() {
		return stock_id;
	}
	public void setStock_id(int stock_id) {
		this.stock_id = stock_id;
	}
	public String getStore_id() {
		return store_id;
	}
	public void setStore_id(String store_id) {
		this.store_id = store_id;
	}
	public int getStock_amount() {
		return stock_amount;
	}
	public void setStock_amount(int stock_amount) {
		this.stock_amount = stock_amount;
	}
	public Date getUpdate_date() {
		return update_date;
	}
	public void setUpdate_date(Date update_date) {
		this.update_date = update_date;
	}
	public int getSales_amount() {
		return sales_amount;
	}
	public void setSales_amount(int sales_amount) {
		this.sales_amount = sales_amount;
	}
	
	public int getProduct_id() {
		return product_id;
	}
	public void setProduct_id(int product_id) {
		this.product_id = product_id;
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

	@Override
	public String toString() {
		return "Stock [stock_id=" + stock_id + ", store_id=" + store_id + ", stock_amount=" + stock_amount
				+ ", update_date=" + update_date + ", sales_amount=" + sales_amount + ", product_id=" + product_id
				+ ", product_image=" + product_image + ", product_name=" + product_name + "]";
	}
	
	
}
