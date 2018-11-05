package Entity;

public class User {
	
	private int id;/**�û�id������*/
	
	private String username;/**�û���*/
	
	private String password;/**��¼����*/
	
	private String email;/**�����ַ*/
	
	private String phone;/**��ϵ�绰*/
	
	private String qq;/**QQ����*/
	
	private String info;/**���ҽ���*/


	public User() {
		super();
	}
	
	public User( String username, String password, String email, String phone, String qq, String info) {
		super();
		this.setUsername(username);
		this.setEmail(email);
		this.setPassword(password);
		this.setPhone(phone);
		this.setQq(qq);
		this.setInfo(info);
	}

	public int getId() {
		return id;
	}


	public void setId(int id) {
		this.id = id;
	}

	public String getUsername() {
		return username;
	}

	public void setUsername(String username) {
		this.username = username;
	}

	public String getPassword() {
		return password;
	}

	public void setPassword(String password) {
		this.password = password;
	}

	public String getEmail() {
		return email;
	}

	public void setEmail(String email) {
		this.email = email;
	}

	public String getPhone() {
		return phone;
	}

	public void setPhone(String phone) {
		this.phone = phone;
	}

	public String getQq() {
		return qq;
	}

	public void setQq(String qq) {
		this.qq = qq;
	}

	public String getInfo() {
		return info;
	}

	public void setInfo(String info) {
		this.info = info;
	}
	
	@Override
	public String toString() {
		return "User [id=" + id + ", username=" + username + ", password=" + password + ", email=" + email + ", phone="
				+ phone + ", qq=" + qq + ", info=" + info + "]";
	}
}
