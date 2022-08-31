package com.dao;

import java.util.List;

import com.bean.Book;

public interface BookDao {
	int add(Book book);
	int update(Book book);
	int delete(int id);
	List<Book> list();
	List<Book> list(boolean showOutOfStock);
	List<Book> list(String sort, boolean showOutOfStock);
	List<Book> list(String sort, String searchParams, boolean showOutOfStock);
	List<Book> list(String sort, String categoryFilter, String searchParams, boolean showOutOfStock);
	Book getBookById(int id);
}
