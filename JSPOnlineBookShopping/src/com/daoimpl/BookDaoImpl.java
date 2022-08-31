package com.daoimpl;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import com.bean.Book;
import com.dao.BookDao;
import com.db.DBConnection;

public class BookDaoImpl implements BookDao{
	public int add(Book book) {
		Connection conn = DBConnection.dbConnect();
		int addBookCount = 0;
		try {
			PreparedStatement ps = conn.prepareStatement("insert into book values(seq_book_id.nextVal,?,?,?,?,?,?)");
			ps.setString(1, book.getName());
			ps.setString(2, book.getAuthor());
			ps.setString(3, book.getCategory());
			ps.setInt(4, book.getStock());
			ps.setDouble(5, book.getPrice());
			ps.setBytes(6, book.getImage());
			addBookCount = ps.executeUpdate();
			conn.close();
		} catch (SQLException e) {
			e.printStackTrace();
		}
		return addBookCount;
	}
	
	public int update(Book book) {
		Connection conn = DBConnection.dbConnect();
		int updateBookCount = 0;
		try {
			PreparedStatement ps = conn.prepareStatement(book.getImage() != null ?
					"update book set name=?, author=?, category=?, stock=?, price=?, image=? where id=?" :
						"update book set name=?, author=?, category=?, stock=?, price=? where id=?");
			ps.setString(1, book.getName());
			ps.setString(2, book.getAuthor());
			ps.setString(3, book.getCategory());
			ps.setInt(4, book.getStock());
			ps.setDouble(5, book.getPrice());
			if (book.getImage() != null) {
				ps.setBytes(6, book.getImage());
				ps.setInt(7, book.getId());
			}
			else {
				ps.setInt(6, book.getId());
			}
			updateBookCount = ps.executeUpdate();
			conn.close();
		} catch (SQLException e) {
			e.printStackTrace();
		}
		return updateBookCount;
	}
	
	public int delete(int id) {
		Connection conn = DBConnection.dbConnect();
		int deleteBookCount = 0;
		try {
			// Close auto commit to ensure all SQL statements have no issue before commit
			conn.setAutoCommit(false);
			PreparedStatement ps = conn.prepareStatement("delete from bookorder where book_id = ?");
			ps.setInt(1, id);
			ps.executeUpdate();
			ps = conn.prepareStatement("delete from book where id =?");
			ps.setInt(1, id);
			deleteBookCount = ps.executeUpdate();
			// No error thrown, commit the changes to database
			conn.commit();
			conn.close();
		} catch (SQLException e) {
			e.printStackTrace();
		}
		return deleteBookCount;
	}
	
	public List<Book> list() {
		return list(true);
	}
	
	public List<Book> list(boolean showOutOfStock) {
		return list("id", showOutOfStock);
	}
	
	public List<Book> list(String sort, boolean showOutOfStock) {
		return list(sort, null, showOutOfStock);
	}
	
	public List<Book> list(String sort, String searchParams, boolean showOutOfStock) {
		return list(sort, null, searchParams, showOutOfStock);
	}
	
	public List<Book> list(String sort, String categoryFilter, String searchParams, boolean showOutOfStock) {
		List<Book> list = new ArrayList<>();
		Connection conn = DBConnection.dbConnect();
		try {
			String query = "select * from book";
			if (!showOutOfStock || (categoryFilter != null && !categoryFilter.equals("all") || searchParams != null)) {
				query += " where ";
				if(!showOutOfStock) {
					query += "stock > 0 ";
				}
				if (categoryFilter != null && !categoryFilter.equals("all")) {
					if (!showOutOfStock)
						query += "and ";
					query += "lower(category) like lower(?) ";
				}
				if (searchParams != null) {
					if (!showOutOfStock || (categoryFilter != null && !categoryFilter.equals("all")))
						query += "and ";
					query += "(lower(name) like lower(?) or lower(author) like lower(?))";
				}
			}
			if (sort != null)
				query += " order by " + sort;
			PreparedStatement ps = conn.prepareStatement(query);
			if (categoryFilter != null && !categoryFilter.equals("all")) {
				ps.setString(1, categoryFilter);
				if (searchParams != null) {
					ps.setString(2, "%" + searchParams + "%");
					ps.setString(3, "%" + searchParams + "%");
				}
			} else if (searchParams != null) {
				ps.setString(1, "%" + searchParams + "%");
				ps.setString(2, "%" + searchParams + "%");
			}
			ResultSet rs = ps.executeQuery();
			while(rs.next()) {
				Book book = new Book();
				book.setId(rs.getInt(1));
				book.setName(rs.getString(2));
				book.setAuthor(rs.getString(3));
				book.setCategory(rs.getString(4));
				book.setStock(rs.getInt(5));
				book.setPrice(rs.getDouble(6));
				book.setImage(rs.getBytes(7));
				list.add(book);
			}
			conn.close();
		} catch (SQLException e) {
			e.printStackTrace();
		}
		return list;
	}
	
	
	public Book getBookById(int id) {
		Connection conn = DBConnection.dbConnect();
		Book book = new Book();
		try {
			PreparedStatement ps = conn.prepareStatement("select * from book where id = ?");
			ps.setInt(1, id);
			ResultSet rs = ps.executeQuery();
			while(rs.next()) {
				book.setId(rs.getInt(1));
				book.setName(rs.getString(2));
				book.setAuthor(rs.getString(3));
				book.setCategory(rs.getString(4));
				book.setStock(rs.getInt(5));
				book.setPrice(rs.getDouble(6));
				book.setImage(rs.getBytes(7));
			}
			conn.close();
		} catch (SQLException e) {
			e.printStackTrace();
		}
		return book;
	}
}
