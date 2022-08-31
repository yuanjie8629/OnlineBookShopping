package com.controller;

import java.io.IOException;

import javax.servlet.ServletConfig;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.bean.User;
import com.dao.UserDao;
import com.daoimpl.UserDaoImpl;

/**
 * Servlet implementation class RegisterServlet
 */
@WebServlet("/RegisterServlet")
public class RegisterServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
	private UserDao userDao;
	
	
	public void init(ServletConfig config) throws ServletException {
			userDao = new UserDaoImpl();
	}
	
	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String username = request.getParameter("username");
		String password = request.getParameter("password");
		String name = request.getParameter("name");
		String email = request.getParameter("email");
		String contact_no = request.getParameter("contact_no");
		if (username != null && password != null && name != null && email != null && contact_no != null) {
			// Check Duplicate Account
			if (userDao.checkDuplicateUsername(username)) {
				request.setAttribute("msg","Username exists! Please try another username or login with the existing account.");
			} else if (userDao.checkDuplicateEmail(email)){
				request.setAttribute("msg","Email exists! Please try another email or login with the existing account.");
			} else if (userDao.checkDuplicateContactNo(contact_no)){
				request.setAttribute("msg","Contact Number exists! Please try another contact number or login with the existing account.");
			} else {
				// Register customer
				int registerCount = userDao.registerCustomer(new User(username, password, name, email, contact_no, "customer"));
				if (registerCount > 0) {
					request.setAttribute("msg","You have successfully registered a customer account.");
				} else {
					request.setAttribute("msg","Failed to register a customer account...");
				}
			}
		} else {
			request.setAttribute("msg","Not enough information to register the customer...");
		}
		request.getRequestDispatcher("Register.jsp").forward(request, response);
	}
}
