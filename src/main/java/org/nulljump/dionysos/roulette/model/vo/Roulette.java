package org.nulljump.dionysos.roulette.model.vo;

public class Roulette implements java.io.Serializable{

	private static final long serialVersionUID = -4152501582498757829L;
	
	private int pairing_id;
	private String food_name;
	private String  food_image;
	private String  product_name;
	private String  product_image;
	private int sweetness;
	private int acidity;
	private int body;
	private int tannin;
	private String food_detail;
	
	public Roulette() {
		super();
	}

	public Roulette(int pairing_id, String food_name, String food_image, String product_name, String product_image,
			int sweetness, int acidity, int body, int tannin, String food_detail) {
		super();
		this.pairing_id = pairing_id;
		this.food_name = food_name;
		this.food_image = food_image;
		this.product_name = product_name;
		this.product_image = product_image;
		this.sweetness = sweetness;
		this.acidity = acidity;
		this.body = body;
		this.tannin = tannin;
		this.food_detail = food_detail;
	}

	public int getPairing_id() {
		return pairing_id;
	}

	public void setPairing_id(int pairing_id) {
		this.pairing_id = pairing_id;
	}

	public String getFood_name() {
		return food_name;
	}

	public void setFood_name(String food_name) {
		this.food_name = food_name;
	}

	public String getFood_image() {
		return food_image;
	}

	public void setFood_image(String food_image) {
		this.food_image = food_image;
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

	public int getSweetness() {
		return sweetness;
	}

	public void setSweetness(int sweetness) {
		this.sweetness = sweetness;
	}

	public int getAcidity() {
		return acidity;
	}

	public void setAcidity(int acidity) {
		this.acidity = acidity;
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

	public String getFood_detail() {
		return food_detail;
	}

	public void setFood_detail(String food_detail) {
		this.food_detail = food_detail;
	}

	public static long getSerialversionuid() {
		return serialVersionUID;
	}

	@Override
	public String toString() {
		return "Roulette [pairing_id=" + pairing_id + ", food_name=" + food_name + ", food_image=" + food_image
				+ ", product_name=" + product_name + ", product_image=" + product_image + ", sweetness=" + sweetness
				+ ", acidity=" + acidity + ", body=" + body + ", tannin=" + tannin + ", food_detail=" + food_detail
				+ "]";
	}
}
