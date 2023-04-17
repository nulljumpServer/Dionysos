package org.nulljump.dionysos.draw.model.vo;

public class Draw implements java.io.Serializable {

	private static final long serialVersionUID = 5845126773644254370L;

	private int product_id;
	private String product_name;
	private String product_image;
	private int product_price;
	private int acidity;
	private int sweetness;
	private int body;
	private int tannin;

	public Draw() {
		super();
	}

	public Draw(int product_id, String product_name, String product_image, 
			int product_price, int acidity, int sweetness, int body, int tannin) {
		super();
		this.product_id = product_id;
		this.product_name = product_name;
		this.product_image = product_image;
		this.product_price = product_price;
		this.acidity = acidity;
		this.sweetness = sweetness;
		this.body = body;
		this.tannin = tannin;
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

	public String getProduct_image() {
		return product_image;
	}

	public void setProduct_image(String product_image) {
		this.product_image = product_image;
	}

	public int getProduct_price() {
		return product_price;
	}

	public void setProduct_price(int product_price) {
		this.product_price = product_price;
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

	public static long getSerialversionuid() {
		return serialVersionUID;
	}

	@Override
	public String toString() {
		return "Draw [product_id=" + product_id + ", product_name=" + product_name + ", product_image=" + product_image
				+ ", product_price=" + product_price + ", acidity=" + acidity + ", sweetness=" + sweetness + ", body="
				+ body + ", tannin=" + tannin + "]";
	}

	
}
