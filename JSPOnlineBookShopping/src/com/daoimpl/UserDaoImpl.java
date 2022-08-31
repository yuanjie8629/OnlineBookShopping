package com.daoimpl;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

import com.bean.User;
import com.dao.UserDao;
import com.db.DBConnection;

public class UserDaoImpl implements UserDao {
	public User login(String username, String password) {
		// Verify login credentials
		Connection conn = DBConnection.dbConnect();
		User user = null;
		try {
			PreparedStatement ps = conn.prepareStatement("select * from bookuser where username=? and password=?");
			ps.setString(1, username);
			ps.setString(2, password);
			ResultSet rs = ps.executeQuery();
			if (rs.next()) {
				user = new User(rs.getInt(1),rs.getString(2), rs.getString(3), rs.getString(4), rs.getString(5), rs.getString(6), rs.getString(7));
			}
			conn.close();
		} catch (SQLException e) {
			e.printStackTrace();
		}
		return user;
	}
	
	public int registerCustomer(User user) {
		Connection conn = DBConnection.dbConnect();
		int registerCount = 0;
		try {
			PreparedStatement ps = conn.prepareStatement("insert into bookuser values(seq_bookuser_id.nextval,?,?,?,?,?,?)");
			ps.setString(1, user.getUsername());
			ps.setString(2, user.getPasssword());
			ps.setString(3, user.getName());
			ps.setString(4, user.getEmail());
			ps.setString(5, user.getContactNo());
			ps.setString(6, user.getRole());
			registerCount = ps.executeUpdate();
			conn.close();
		} catch (SQLException e) {
			e.printStackTrace();
		}
		return registerCount;
	}

	public boolean checkDuplicateUsername(String username) {
		Connection conn = DBConnection.dbConnect();
		boolean check = false;
		try {
			PreparedStatement ps = conn.prepareStatement("select count(*) from bookuser where username=?");
			ps.setString(1, username);
			ResultSet rs = ps.executeQuery();
			if (rs.next() && rs.getInt(1) > 0) {
				check = true;
			}
			conn.close();
		} catch (SQLException e) {
			e.printStackTrace();
		}
		return check;
	}

	public boolean checkDuplicateEmail(String email) {
		Connection conn = DBConnection.dbConnect();
		boolean check = false;
		try {
			PreparedStatement ps = conn.prepareStatement("select count(*) from bookuser where email=?");
			ps.setString(1, email);
			ResultSet rs = ps.executeQuery();
			if (rs.next() && rs.getInt(1) > 0) {
				check = true;
			}
			conn.close();
		} catch (SQLException e) {
			e.printStackTrace();
		}
		return check;
	}

	public boolean checkDuplicateContactNo(String contactNo) {
		Connection conn = DBConnection.dbConnect();
		boolean check = false;
		try {
			PreparedStatement ps = conn.prepareStatement("select count(*) from bookuser where contact_no=?");
			ps.setString(1, contactNo);
			ResultSet rs = ps.executeQuery();
			if (rs.next() && rs.getInt(1) > 0) {
				check = true;
			}
			conn.close();
		} catch (SQLException e) {
			e.printStackTrace();
		}
		return check;
	}
}
