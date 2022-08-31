package com.controller;

import java.io.IOException;
import java.util.List;

import javax.servlet.ServletConfig;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.bean.Book;
import com.dao.BookDao;
import com.daoimpl.BookDaoImpl;

/**
 * Servlet implementation class AdminViewBookServlet
 */
@WebServlet("/AdminViewBookServlet")
public class AdminViewBookServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
	private BookDao bookDao;
    
    public void init(ServletConfig config) throws ServletException {
		bookDao = new BookDaoImpl();
	}

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		List<Book> list = bookDao.list(request.getParameter("ordering"), request.getParameter("categoryFilter"), request.getParameter("searchParams"), false);
		request.setAttribute("list", list);
		request.getRequestDispatcher("/admin/ViewBook.jsp").forward(request, response);
	}
}
