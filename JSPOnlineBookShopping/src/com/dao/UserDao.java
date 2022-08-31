package com.dao;

import com.bean.User;

public interface UserDao {
	User login(String username, String password);
	int registerCustomer(User user);
	boolean checkDuplicateUsername(String username);
	boolean checkDuplicateEmail(String email);
	boolean checkDuplicateContactNo(String contactNo);
}