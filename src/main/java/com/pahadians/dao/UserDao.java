package com.pahadians.dao;

import java.sql.*;
import com.pahadians.entities.User;

public class UserDao {
	private Connection con;

	public UserDao(Connection con) {
		this.con = con;
	}

	// created a method() to insert user into database
	public boolean saveUser(User user) {
		boolean f = false;
		try {
			// user --> db
			String query = "insert into user(name, email, password, gender, bio) value(?,?,?,?,?)";
			PreparedStatement pstmt = this.con.prepareStatement(query);
			pstmt.setString(1, user.getName());
			pstmt.setString(2, user.getEmail());
			pstmt.setString(3, user.getPassword());
			pstmt.setString(4, user.getGenger());
			pstmt.setString(5, user.getBio());

			pstmt.executeUpdate();
			f = true;
		} catch (Exception e) {
			e.printStackTrace();
		}
		return f;
	}
}