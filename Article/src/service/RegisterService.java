package service;

import java.sql.SQLException;

import bean.User;
import util.DataBaseUtils;

public class RegisterService {
	/*将新注册的用户写入数据库
	 **/
	public void saveUser(User user) {
		String sql="Insert into t_user(id,username,password,email,sex,"
				+ "create_time,is_delete,address,telephone)"+
				"value(?,?,?,?,?,?,?,?,?)";
		DataBaseUtils.update(sql, user.getId(),user.getUsername(),user.getPassword(),
				user.getEmail(),user.getSex(),user.getCreateTime(),user.getIsDelete(),
				user.getAddress(),user.getTelephone());
	}

	/*判断用户名是否已经存在*/
	public boolean usernameExist(String username) throws SQLException {
		String sqlByUsername="select * from t_user where username=?";
		if (DataBaseUtils.queryForMap(sqlByUsername, username)!=null) {
			return true;
		}
		return false;
	}
	/*判断电话号码是否已经被注册
	 * */
	public boolean telephoneExist(String telephone) throws SQLException {
		String sql="select * from t_user where telephone=?";
		if (DataBaseUtils.queryForMap(sql, telephone)!=null) {
			return true;
		}
		return false;
	}
	/*
	 * 判断邮箱是否已经被注册*/
	public boolean emailExist(String email) throws SQLException {
		String sql="select * from t_user where email=?";
		if (DataBaseUtils.queryForMap(sql, email)!=null) {
			return true;
		}
		return false;
	}
}
