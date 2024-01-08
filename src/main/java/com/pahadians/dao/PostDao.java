package com.pahadians.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.Statement;
import java.sql.Timestamp;
import java.util.ArrayList;
import java.util.List;

import com.pahadians.entities.Category;
import com.pahadians.entities.Post;

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

			while (set.next()) {
				int cid = set.getInt("cid");
				String name = set.getString("name");
				String description = set.getString("description");
				Category category = new Category(cid, name, description);
				list.add(category);
			}

		} catch (Exception e) {
			e.printStackTrace();
		}

		return list;
	}

	public boolean savePost(Post post) {
		boolean flag = false;

		try {
			String query = "INSERT INTO post(pTitle, pContent, pCode, pPic, cid, userId) values(?,?,?,?,?,?)";
			PreparedStatement pstmt = con.prepareStatement(query);
			pstmt.setString(1, post.getpTitle());
			pstmt.setString(2, post.getpContent());
			pstmt.setString(3, post.getpCode());
			pstmt.setString(4, post.getpPic());
			pstmt.setInt(5, post.getCid());
			pstmt.setInt(6, post.getUserId());

			pstmt.executeUpdate();
			flag = true;

		} catch (Exception e) {
			e.printStackTrace();
		}
		return flag;
	}

	// This method is used to get all the posts
	public List<Post> getAllPosts() {
		List<Post> listOfPost = new ArrayList<>();
		// Retrieve all the post
		try {
			PreparedStatement pstmt = con.prepareStatement("SELECT * FROM post ORDER BY pid DESC");
			ResultSet set = pstmt.executeQuery();
			
			while(set.next()) {
				int pid = set.getInt("pid");
				String pTitle = set.getString("pTitle");
				String pContent = set.getString("pCode");
				String pCode = set.getString("pCode");
				String pPic = set.getString("pPic");
				Timestamp date = set.getTimestamp("pDate");
				int cid = set.getInt("cid");
				int userId = set.getInt("userId");				
				Post post = new Post(pid, pTitle, pContent, pCode, pPic, date, cid, userId);
				listOfPost.add(post);
			}
			
		} catch (Exception e) {
			e.printStackTrace();
		}
		return listOfPost;
	}

	public List<Post> getPostByCid(int cid) {
		List<Post> listOfPost = new ArrayList<>();
		// Retrieve all the post by id
		
		try {
			PreparedStatement pstmt = con.prepareStatement("SELECT * FROM post WHERE cid = ?");
			pstmt.setInt(1, cid);
			ResultSet set = pstmt.executeQuery();
			
			while(set.next()) {
				int pid = set.getInt("pid");
				String pTitle = set.getString("pTitle");
				String pContent = set.getString("pCode");
				String pCode = set.getString("pCode");
				String pPic = set.getString("pPic");
				Timestamp date = set.getTimestamp("pDate");
				int userId = set.getInt("userId");				
				Post post = new Post(pid, pTitle, pContent, pCode, pPic, date, cid, userId);
				listOfPost.add(post);
			}
			
		} catch (Exception e) {
			e.printStackTrace();
		}
		return listOfPost;
	}

}
