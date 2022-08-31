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
@WebServlet("/AdminUpdateBookServlet")
@MultipartConfig(fileSizeThreshold = 1024 * 1024,
maxFileSize = 1024 * 1024 * 5, 
maxRequestSize = 1024 * 1024 * 5 * 5)
public class AdminUpdateBookServlet extends HttpServlet {
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
		int selected_id = request.getParameter("id") != null && !request.getParameter("id").isEmpty() ? Integer.parseInt(request.getParameter("id")) : !list.isEmpty() ? list.get(0).getId() : -1;
		request.setAttribute("selected_id", selected_id);
		request.setAttribute("selected_book", bookDao.getBookById(selected_id));
		request.getRequestDispatcher("/admin/UpdateBook.jsp").forward(request, response);
	}
       
	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		if (request.getParameter("name") != null && request.getParameter("author") != null && request.getParameter("category") != null
				&& request.getParameter("stock") != null && !request.getParameter("stock").isEmpty() && request.getParameter("price") != null 
				&& !request.getParameter("price").isEmpty()) {
			int id = Integer.parseInt(request.getParameter("id"));
			Book book = new Book();
			if (request.getPart("image") != null && request.getPart("image").getSize() > 0) {
				try {
					 ImageIO.read(request.getPart("image").getInputStream()).toString();
				} catch (Exception e) {
					request.setAttribute("msg", "Please Upload Image File for Book Cover...");
					request.getRequestDispatcher("/admin/AddBook.jsp").forward(request, response);
					return;
				}
				book.setImage(FileUtils.toByteArray(request.getPart("image").getInputStream()));
			}
			book.setId(id);
			book.setName(request.getParameter("name"));
			book.setAuthor(request.getParameter("author"));
			book.setCategory(request.getParameter("category"));
			book.setStock(Integer.parseInt(request.getParameter("stock")));
			book.setPrice(Double.parseDouble(request.getParameter("price")));
			
			int updateBookCount = bookDao.update(book);
			if (updateBookCount > 0) {
				request.setAttribute("msg", "You have successfully updated the book with ID " + id  + ".");
			} else {
				request.setAttribute("msg", "Failed to updated the book with ID" + id + "...");
			}
			this.doGet(request, response);
		}
	}

}
