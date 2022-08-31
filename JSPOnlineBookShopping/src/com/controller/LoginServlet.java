package com.controller;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.ServletConfig;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.bean.User;
import com.dao.UserDao;
import com.daoimpl.UserDaoImpl;

/**
 * Servlet implementation class LoginServlet
 */
@WebServlet("/LoginServlet")
public class LoginServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
    private UserDao userDao;
    
    public void init(ServletConfig config) throws ServletException {
		userDao = new UserDaoImpl();
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String username = request.getParameter("username");
		String password = request.getParameter("password");
		if (username != null && password != null) {
			// Verify login credentials
			User user = userDao.login(username, password);
			if (user != null) {
				HttpSession session = request.getSession();
				session.setAttribute("user", user);
				if (user.getRole().equals("admin")) {
					response.sendRedirect("admin/AdminPortal.jsp");
				} else if (user.getRole().equals("customer")) {
					response.sendRedirect("customer/CustomerPortal.jsp");
				}
			} else {
				request.setAttribute("msg", "Login Failed.\\nInvalid username or password...");
				request.getRequestDispatcher("Login.jsp").forward(request, response);
			}
		}
	}
}
