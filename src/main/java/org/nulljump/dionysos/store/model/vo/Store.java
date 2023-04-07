package org.nulljump.dionysos.store.model.vo;

public class Store implements java.io.Serializable {

	private static final long serialVersionUID = 9054441666410940472L;
	private String store_id; // 매장아이디
	private String password; // 패스워드
	private String business_number; // 사업자번호
	private String store_name; // 매장이름
	private String address; //매장 주소
	private String phone; // 전화번호
	private String manager; // 매장 매니저
	private String manager_contact; // 매니저 연락처
	private String email; // 이메일
	private String login_ok; //로그인 가능 여부
	public Store() {
		super();
	}
	public Store(String store_id, String password, String business_number, String store_name, String address,
			String phone, String manager, String manager_contact, String email, String login_ok) {
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
		this.login_ok = login_ok;
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
	public String getLogin_ok() {
		return login_ok;
	}
	public void setLogin_ok(String login_ok) {
		this.login_ok = login_ok;
	}
	public static long getSerialversionuid() {
		return serialVersionUID;
	}
	@Override
	public String toString() {
		return "Store [store_id=" + store_id + ", password=" + password + ", business_number=" + business_number
				+ ", store_name=" + store_name + ", address=" + address + ", phone=" + phone + ", manager=" + manager
				+ ", manager_contact=" + manager_contact + ", email=" + email + ", login_ok=" + login_ok + "]";
	}

	
}
