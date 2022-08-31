package com.daoimpl;

import java.sql.Connection;
import java.sql.Date;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import com.bean.Book;
import com.bean.Order;
import com.bean.User;
import com.dao.OrderDao;
import com.db.DBConnection;

public class OrderDaoImpl implements OrderDao {
	public int purchaseBook(Order order) {
		Connection conn = DBConnection.dbConnect();
		int purchaseBookCount = 0;
		try {
			// Close auto commit to ensure all SQL statements have no issue before commit
			conn.setAutoCommit(false);
			PreparedStatement ps = conn.prepareStatement("update book set stock = stock-? where id=?");
			ps.setInt(1, order.getQuantity());
			ps.setInt(2, order.getBook().getId());
			ps.executeUpdate();
			ps = conn.prepareStatement("insert into bookorder values(seq_bookorder_id.nextval,?,?,?,?,?)");
			ps.setInt(1, order.getBook().getId());
			ps.setInt(2, order.getQuantity());
			ps.setInt(3, order.getCustomer().getId());
			ps.setDouble(4, order.getPrice());
			ps.setDate(5, new Date(order.getPurchaseDate().getTime()));
			purchaseBookCount = ps.executeUpdate();
			// No error thrown, commit the changes to database
			conn.commit();
			conn.close();
		} catch (SQLException e) {
			e.printStackTrace();
		}
		return purchaseBookCount;
	}
	
	public List<Order> list(User user) {
		return list(user, "bo.id");
	}
	
	public List<Order> list(User user, String sort) {
		return list(user, sort, null);
	}

	public List<Order> list(User user, String sort, String categoryFilter) {
		List<Order> list = new ArrayList<>();
		Connection conn = DBConnection.dbConnect();
		try {
			String query = "select bo.id, b.image, b.name, b.author, b.category, bo.quantity, bo.price, c.name, bo.purchase_date from bookOrder bo inner join book b on bo.book_id = b.id inner join bookuser c on bo.customer_id = c.id";
			if (user.getRole().equals("customer") || categoryFilter != null && !categoryFilter.equals("all")) {
				query += " where ";
				if (user.getRole().equals("customer")) {
					query += "bo.customer_id=? ";
				}
				
				if (categoryFilter != null && !categoryFilter.equals("all")) {
					if (user.getRole().equals("customer"))
						query += "and ";
					query += "lower(category) like lower(?) ";
				}
			}
			if (sort != null)
				query += " order by " + sort;
			PreparedStatement ps = conn.prepareStatement(query);
			if (user.getRole().equals("customer")) {
				ps.setInt(1, user.getId());
				if (categoryFilter != null && !categoryFilter.equals("all"))
					ps.setString(2, categoryFilter);
			} else if (categoryFilter != null && !categoryFilter.equals("all"))
				ps.setString(1, categoryFilter);
			ResultSet rs = ps.executeQuery();
			while(rs.next()) {
				Order order = new Order();
				order.setId(rs.getInt(1));
				Book book = new Book();
				book.setImage(rs.getBytes(2));
				book.setName(rs.getString(3));
				book.setAuthor(rs.getString(4));
				book.setCategory(rs.getString(5));
				order.setBook(book);
				order.setQuantity(rs.getInt(6));
				order.setPrice(rs.getDouble(7));
				order.setCustomer(new User(rs.getString(8)));
				order.setPurchaseDate(rs.getDate(9));
				list.add(order);
			}
			conn.close();
		} catch (SQLException e) {
			e.printStackTrace();
		}
		return list;
	}
}
