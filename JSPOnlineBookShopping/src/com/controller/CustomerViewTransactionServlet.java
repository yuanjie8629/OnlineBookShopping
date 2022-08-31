package com.controller;

import java.io.IOException;
import java.util.List;

import javax.servlet.ServletConfig;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.bean.Book;
import com.bean.Order;
import com.bean.User;
import com.dao.OrderDao;
import com.daoimpl.OrderDaoImpl;

/**
 * Servlet implementation class CustomerViewTransactionServlet
 */
@WebServlet("/CustomerViewTransactionServlet")
public class CustomerViewTransactionServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
	private OrderDao orderDao;
    
    public void init(ServletConfig config) throws ServletException {
    	orderDao = new OrderDaoImpl();
	}

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		HttpSession session = request.getSession();
		List<Order> list;
		User user = (User)session.getAttribute("user");
		if (user != null) {
			list = orderDao.list(user,request.getParameter("ordering"),request.getParameter("categoryFilter"));
			request.setAttribute("list", list);
			request.getRequestDispatcher("/customer/ViewTransaction.jsp").forward(request, response);
		} else {
			response.sendRedirect("index.html");
		}
	}
}
