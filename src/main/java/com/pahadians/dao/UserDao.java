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
			pstmt.setString(4, user.getGender());
			pstmt.setString(5, user.getBio());

			pstmt.executeUpdate();
			f = true;
		} catch (Exception e) {
			e.printStackTrace();
		}
		return f;
	}
	
	
	// Method that takes userEmail & userPassword
	public User getUserByEmailAndPassword(String email, String password) {
		User user = null;
		
		try {
			String query = "SELECT * FROM user WHERE email = ? AND password = ?";
			PreparedStatement pstmt = con.prepareStatement(query);
			pstmt.setString(1, email);
			pstmt.setString(2, password);
			ResultSet set = pstmt.executeQuery();
			if(set.next()) {
				user = new User();
				// Retrieved Data from Db
				String name = set.getString("name");
				// Set to user obj
				user.setName(name);
				user.setId(set.getInt("id"));
				user.setEmail(set.getString("email"));
				user.setPassword(set.getString("password"));
				user.setGender(set.getString("gender"));
				user.setBio(set.getString("bio"));
				user.setDateTime(set.getTimestamp("signupdate"));
				user.setProfile(set.getString("profile"));
			}
			
		} catch (Exception e) {
			e.printStackTrace();
		}
		
		return user;
	}
	
	public boolean updateUser(User user) {
		boolean f = false;
		try {
			String query = "UPDATE user set name=?, email=?, password=?, gender=?, bio=?, profile=? WHERE id=?";
			PreparedStatement pstmt = con.prepareStatement(query);
			pstmt.setString(1, user.getName());
			pstmt.setString(2, user.getEmail());
			pstmt.setString(3, user.getPassword());
			pstmt.setString(4, user.getGender());
			pstmt.setString(5, user.getBio());
			pstmt.setString(6, user.getProfile());
			pstmt.setInt(7, user.getId());
			pstmt.executeUpdate();	
			f = true;
			
		} catch (Exception e) {
			e.printStackTrace();
		}
		return f;
	}
}












