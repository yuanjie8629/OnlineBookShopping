package com.controller;

import java.io.IOException;

import javax.imageio.ImageIO;
import javax.servlet.ServletConfig;
import javax.servlet.ServletException;
import javax.servlet.annotation.MultipartConfig;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.Part;

import com.bean.Book;
import com.dao.BookDao;
import com.daoimpl.BookDaoImpl;
import com.util.FileUtils;

/**
 * Servlet implementation class AddBookServlet
 */
@WebServlet("/AdminAddBookServlet")
@MultipartConfig(fileSizeThreshold = 1024 * 1024,
maxFileSize = 1024 * 1024 * 5, 
maxRequestSize = 1024 * 1024 * 5 * 5)
public class AdminAddBookServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
	private BookDao bookDao;
    
    public void init(ServletConfig config) throws ServletException {
		bookDao = new BookDaoImpl();
	}
    
	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		if (request.getParameter("name") != null && request.getParameter("author") != null && request.getParameter("category") != null
				&& request.getParameter("stock") != null && !request.getParameter("stock").isEmpty() && request.getParameter("price") != null 
				&& !request.getParameter("price").isEmpty() && request.getPart("image").getSize() > 0) {
			try {
				 ImageIO.read(request.getPart("image").getInputStream()).toString();
			} catch (Exception e) {
				request.setAttribute("msg", "Please Upload Image File for Book Cover...");
				request.getRequestDispatcher("/admin/AddBook.jsp").forward(request, response);
				return;
			}
			Book book = new Book();
			book.setName(request.getParameter("name"));
			book.setAuthor(request.getParameter("author"));
			book.setCategory(request.getParameter("category"));
			book.setStock(Integer.parseInt(request.getParameter("stock")));
			book.setPrice(Double.parseDouble(request.getParameter("price")));
			book.setImage(FileUtils.toByteArray(request.getPart("image").getInputStream()));
			int addBookCount = bookDao.add(book);
			if (addBookCount > 0) {
				request.setAttribute("msg","You have successfully added a new book.");
			} else {
				request.setAttribute("msg","Failed to add a new book...");
			}
			request.getRequestDispatcher("/admin/AddBook.jsp").forward(request, response);
		}
	}
}
