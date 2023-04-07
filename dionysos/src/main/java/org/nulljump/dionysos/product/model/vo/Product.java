package org.nulljump.dionysos.product.model.vo;

import java.sql.Date;

public class Product implements java.io.Serializable{

	private static final long serialVersionUID = -3976524226163946467L;

	private int product_id;             //��ǰ ��ȣ
	private String product_name;        //��ǰ �̸�
	private String product_ename;       //��ǰ ���� �̸�
	private int product_price;          //��ǰ ����
	private String product_image;       //��ǰ �̹���
	private float alcohol;              //���� ����
	private int acidity;                //�굵
	private int sweetness;              //�絵
	private int body;                   //�ٵ�
	private int tannin;                 //Ÿ��
	private String description;         //��ǰ ����
	private String grape_type;          //���� ǰ��
	private String wine_detail;         //���� �� ����
	private int wine_volume;            //���� �뷮
	private String wine_origin;         //������
	private String wine_type;           //���� ����
	private Date production_date;       //���� ���곯¥
	
	public Product() {
		super();
	}

	public Product(int product_id, String product_name, String product_ename, int product_price, String product_image,
			float alcohol, int acidity, int sweetness, int body, int tannin, String description, String grape_type,
			String wine_detail, int wine_volume, String wine_origin, String wine_type, Date production_date) {
		super();
		this.product_id = product_id;
		this.product_name = product_name;
		this.product_ename = product_ename;
		this.product_price = product_price;
		this.product_image = product_image;
		this.alcohol = alcohol;
		this.acidity = acidity;
		this.sweetness = sweetness;
		this.body = body;
		this.tannin = tannin;
		this.description = description;
		this.grape_type = grape_type;
		this.wine_detail = wine_detail;
		this.wine_volume = wine_volume;
		this.wine_origin = wine_origin;
		this.wine_type = wine_type;
		this.production_date = production_date;
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

	public String getProduct_ename() {
		return product_ename;
	}

	public void setProduct_ename(String product_ename) {
		this.product_ename = product_ename;
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

	public float getAlcohol() {
		return alcohol;
	}

	public void setAlcohol(float alcohol) {
		this.alcohol = alcohol;
	}

	public int getAcidity() {
		return acidity;
	}

	public void setAcidity(int acidity) {
		this.acidity = acidity;
	}

	public int getSweetness() {
		return sweetness;
	}

	public void setSweetness(int sweetness) {
		this.sweetness = sweetness;
	}

	public int getBody() {
		return body;
	}

	public void setBody(int body) {
		this.body = body;
	}

	public int getTannin() {
		return tannin;
	}

	public void setTannin(int tannin) {
		this.tannin = tannin;
	}

	public String getDescription() {
		return description;
	}

	public void setDescription(String description) {
		this.description = description;
	}

	public String getGrape_type() {
		return grape_type;
	}

	public void setGrape_type(String grape_type) {
		this.grape_type = grape_type;
	}

	public String getWine_detail() {
		return wine_detail;
	}

	public void setWine_detail(String wine_detail) {
		this.wine_detail = wine_detail;
	}

	public int getWine_volume() {
		return wine_volume;
	}

	public void setWine_volume(int wine_volume) {
		this.wine_volume = wine_volume;
	}

	public String getWine_origin() {
		return wine_origin;
	}

	public void setWine_origin(String wine_origin) {
		this.wine_origin = wine_origin;
	}

	public String getWine_type() {
		return wine_type;
	}

	public void setWine_type(String wine_type) {
		this.wine_type = wine_type;
	}

	public Date getProduction_date() {
		return production_date;
	}

	public void setProduction_date(Date production_date) {
		this.production_date = production_date;
	}

	public static long getSerialversionuid() {
		return serialVersionUID;
	}

	@Override
	public String toString() {
		return "Product [product_id=" + product_id + ", product_name=" + product_name + ", product_ename="
				+ product_ename + ", product_price=" + product_price + ", product_image=" + product_image + ", alcohol="
				+ alcohol + ", acidity=" + acidity + ", sweetness=" + sweetness + ", body=" + body + ", tannin="
				+ tannin + ", description=" + description + ", grape_type=" + grape_type + ", wine_detail="
				+ wine_detail + ", wine_volume=" + wine_volume + ", wine_origin=" + wine_origin + ", wine_type="
				+ wine_type + ", production_date=" + production_date + "]";
	}

	
	
	
}
