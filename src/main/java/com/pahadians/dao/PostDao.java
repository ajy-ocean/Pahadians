package com.pahadians.dao;

import java.sql.*;
import java.util.ArrayList;

import com.pahadians.entities.Category;

public class PostDao {
	Connection con;

	public PostDao(Connection con) {
		this.con = con;
	}

	public ArrayList<Category> getAllCategories() {
		ArrayList<Category> list = new ArrayList<>();

		try {
			String query = "SELECT * FROM categories";
			Statement stmt = con.createStatement();
			ResultSet set = stmt.executeQuery(query);
			
			while(set.next()) {
				int cid = set.getInt("cid");
				String name= set.getString("name");
				String description = set.getString("description");
				Category category = new Category(cid, name, description);
				list.add(category);
			}

		} catch (Exception e) {
			e.printStackTrace();
		}

		return list;

	}

}
