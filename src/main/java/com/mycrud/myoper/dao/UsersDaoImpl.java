package com.mycrud.myoper.dao;

import javax.sql.DataSource;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.jdbc.core.JdbcTemplate;
import org.springframework.stereotype.Repository;

import com.mycrud.myoper.model.Users;

@Repository
public class UsersDaoImpl implements UsersDao {

	@Autowired
	private DataSource dataSource;

	@Override
	public boolean validateUser(Users users) {
		try {
			JdbcTemplate jdbcTemplete = new JdbcTemplate(dataSource);
			String sql = "Select user_name from  users where user_name='" + users.getUsername() + "'and password='"
					+ users.getPassword() + "'";
			String dbUserName = jdbcTemplete.queryForObject(sql, String.class);
			if (dbUserName != null && dbUserName.equals(users.getUsername())) {
				return true;
			} else
				return false;
		} catch (Exception e) {
			e.printStackTrace();
			return false;
		}
	}
}
