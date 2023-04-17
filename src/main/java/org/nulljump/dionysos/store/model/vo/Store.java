package org.nulljump.dionysos.store.model.vo;

public class Store implements java.io.Serializable{

	private static final long serialVersionUID = 8139167668835957335L;

	private String store_id;
	private String password;
	private String business_number;
	private String store_name;
	private String address;
	private String phone;
	private String manager;
	private String manager_contact;
	private String email;
	private String login_ok;
	
	public Store() {
		super();
		// TODO Auto-generated constructor stub
	}

	public Store(String store_id, String password, String business_number, String store_name, String address,
			String phone, String manager, String manager_contact, String email) {
		super();
		this.store_id = store_id;
		this.password = password;
		this.business_number = business_number;
		this.store_name = store_name;
		this.address = address;
		this.phone = phone;
		this.manager = manager;
		this.manager_contact = manager_contact;
		this.email = email;
	}

	public String getStore_id() {
		return store_id;
	}

	public void setStore_id(String store_id) {
		this.store_id = store_id;
	}

	public String getPassword() {
		return password;
	}

	public void setPassword(String password) {
		this.password = password;
	}

	public String getBusiness_number() {
		return business_number;
	}

	public void setBusiness_number(String business_number) {
		this.business_number = business_number;
	}

	public String getStore_name() {
		return store_name;
	}

	public void setStore_name(String store_name) {
		this.store_name = store_name;
	}

	public String getAddress() {
		return address;
	}

	public void setAddress(String address) {
		this.address = address;
	}

	public String getPhone() {
		return phone;
	}

	public void setPhone(String phone) {
		this.phone = phone;
	}

	public String getManager() {
		return manager;
	}

	public void setManager(String manager) {
		this.manager = manager;
	}

	public String getManager_contact() {
		return manager_contact;
	}

	public void setManager_contact(String manager_contact) {
		this.manager_contact = manager_contact;
	}

	public String getEmail() {
		return email;
	}

	public void setEmail(String email) {
		this.email = email;
	}

	public static long getSerialversionuid() {
		return serialVersionUID;
	}
	
	public String getLogin_ok() {
		return login_ok;
	}

	public void setLogin_ok(String login_ok) {
		this.login_ok = login_ok;
	}

	@Override
	public String toString() {
		return "Store [store_id=" + store_id + ", password=" + password + ", business_number=" + business_number
				+ ", store_name=" + store_name + ", address=" + address + ", phone=" + phone + ", manager=" + manager
				+ ", manager_contact=" + manager_contact + ", email=" + email + "]";
	}
	
	
}
