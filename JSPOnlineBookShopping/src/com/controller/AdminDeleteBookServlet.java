package com.controller;

import java.io.IOException;
import java.util.List;

import javax.imageio.ImageIO;
import javax.servlet.ServletConfig;
import javax.servlet.ServletException;
import javax.servlet.annotation.MultipartConfig;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.bean.Book;
import com.dao.BookDao;
import com.daoimpl.BookDaoImpl;
import com.util.FileUtils;

/**
 * Servlet implementation class UpdateBookServlet
 */
@WebServlet("/AdminDeleteBookServlet")
@MultipartConfig(fileSizeThreshold = 1024 * 1024,
maxFileSize = 1024 * 1024 * 5, 
maxRequestSize = 1024 * 1024 * 5 * 5)
public class AdminDeleteBookServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
	private BookDao bookDao;
    
    public void init(ServletConfig config) throws ServletException {
		bookDao = new BookDaoImpl();
	}
    
    /**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		List<Book> list = bookDao.list();
		request.setAttribute("list", list);
		int selected_id = -1;
		if (request.getParameter("id") != null && !request.getParameter("id").isEmpty() 
				&& list.contains(new Book(Integer.parseInt(request.getParameter("id"))))) {
					selected_id = Integer.parseInt(request.getParameter("id"));
		}
		else if (!list.isEmpty()){
			selected_id = list.get(0).getId();
		}
		request.setAttribute("selected_id", selected_id);
		request.setAttribute("selected_book", bookDao.getBookById(selected_id));
		request.getRequestDispatcher("/admin/DeleteBook.jsp").forward(request, response);
	}
       
	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		if (request.getParameter("id") != null && !request.getParameter("id").isEmpty()) {
			int id = Integer.parseInt(request.getParameter("id"));
			int deleteBookCount = bookDao.delete(id);
			if (deleteBookCount > 0) {
				request.setAttribute("msg", "You have successfully deleted the book with ID " + id  + ".");
			} else {
				request.setAttribute("msg", "Failed to delete the book with ID" + id + "...");
			}
			this.doGet(request, response);
		}
	}

}
