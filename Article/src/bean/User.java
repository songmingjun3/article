package bean;

import annotation.Column;
import annotation.Table;

@Table(tableName = "t_user")
public class User {
	@Column(type = "VARCHAR(100)",field="id" ,primaryKey =true, defaultNull =false)
	private String id;
	
	@Column(type="VARCHAR(20)",field = "username")
	private String username;
	
	@Column(type="VARCHAR(20)",field = "password")
	private String password;
	
	@Column(type="VARCHAR(60)",field="headerPic")
	private String headerPic;
	
	@Column(type="VARCHAR(60)",field="email")
	private String email;
	
	@Column(type="VARCHAR(2)",field="sex")
	private Integer sex;
	
	@Column(type="datetime",field="create_time")
	private String createTime;
	
	@Column(type="timestamp",field="update_time")
	private String updateTime;
	
	@Column(type="int(1)",field="is_delete")
	private Integer isDelete;
	
	@Column(type="VARCHAR(200)",field="address")
	private String address;
	
	@Column(type="VARCHAR(15)",field="telephone")
	private String telephone;

	public String getId() {
		return id;
	}

	public void setId(String id) {
		this.id = id;
	}

	public String getUsername() {
		return username;
	}

	public void setUsername(String userName) {
		this.username = userName;
	}

	public String getPassword() {
		return password;
	}

	public void setPassword(String passWord) {
		this.password = passWord;
	}

	public String getHeaderPic() {
		return headerPic;
	}

	public void setHeaderPic(String headerPic) {
		this.headerPic = headerPic;
	}

	public String getEmail() {
		return email;
	}

	public void setEmail(String email) {
		this.email = email;
	}

	public Integer getSex() {
		return sex;
	}

	public void setSex(Integer sex) {
		this.sex = sex;
	}

	public String getCreateTime() {
		return createTime;
	}

	public void setCreateTime(String createTime) {
		this.createTime = createTime;
	}

	public String getUpdateTime() {
		return updateTime;
	}

	public void setUpdateTime(String updateTime) {
		this.updateTime = updateTime;
	}

	public Integer getIsDelete() {
		return isDelete;
	}

	public void setIsDelete(Integer isDelete) {
		this.isDelete = isDelete;
	}

	public String getAddress() {
		return address;
	}

	public void setAddress(String address) {
		this.address = address;
	}

	public String getTelephone() {
		return telephone;
	}

	public void setTelephone(String telephone) {
		this.telephone = telephone;
	}
	@Override
	public String toString() {
		return "User [id=" + id + ", username=" + username + ", password="
				+ password + ", headerPic=" + headerPic + ", email=" + email
				+ ", sex=" + sex + ", createTime=" + createTime
				+ ", updateTime=" + updateTime + ", isDelete=" + isDelete
				+ ", address=" + address + ", telephone=" + telephone + "]";
	}
}
