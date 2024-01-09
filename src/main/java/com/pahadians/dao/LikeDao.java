package com.pahadians.dao;

import java.sql.*;

public class LikeDao {

	Connection con;

	public LikeDao(Connection con) {
		this.con = con;
	}

	public boolean insertLike(int pid, int uid) {
		boolean flag = false;
		try {
			String query = "INSERT INTO likePost(pid, uid) VALUES(?,?)";
			PreparedStatement pstmt = this.con.prepareStatement(query);
			// Setting values
			pstmt.setInt(1, pid);
			pstmt.setInt(2, uid);
			pstmt.executeUpdate();
			flag = true;
		} catch (Exception e) {
			e.printStackTrace();
		}
		return flag;
	}

	public int countLikeOnPost(int pid) {
		int count = 0;

		String query = "SELECT COUNT(*) FROM likePost WHERE pid = ?";
		try {
			PreparedStatement pstmt = this.con.prepareStatement(query);
			pstmt.setInt(1, pid);
			ResultSet set = pstmt.executeQuery();

			if (set.next()) {
				count = set.getInt("count(*)");
			}

		} catch (SQLException e) {
			e.printStackTrace();
		}
		return count;
	}

	public boolean isLikedByUser(int pid, int uid) {
		boolean flag = false;
		try {
			PreparedStatement pstmt = this.con.prepareStatement("SELECT * FROM likePost WHERE pid = ? AND uid = ?");
			pstmt.setInt(1, pid);
			pstmt.setInt(2, uid);
			ResultSet set = pstmt.executeQuery();
			if (set.next()) {
				flag = true;
			}
		} catch (Exception e) {
			e.printStackTrace();
		}
		return flag;
	}

	public boolean deleteLike(int pid, int uid) {
		boolean flag = false;
		try {
			PreparedStatement pstmt = this.con.prepareStatement("DELETE FROM likePost WHERE pid = ? AND uid = ?");
			pstmt.setInt(1, pid);
			pstmt.setInt(2, uid);
			pstmt.executeUpdate();
			flag = true;
		} catch (Exception e) {
			e.printStackTrace();
		}
		return flag;
	}
}
