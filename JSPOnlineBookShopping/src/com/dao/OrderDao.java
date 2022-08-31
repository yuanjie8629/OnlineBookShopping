package com.dao;

import java.util.List;

import com.bean.Order;
import com.bean.User;

public interface OrderDao {
	int purchaseBook(Order order);
	List<Order> list(User user);
	List<Order> list(User user, String sort);
	List<Order> list(User user, String sort, String categoryFilter);
}
