package com.controller;

import java.io.IOException;
import java.util.Date;
import java.util.List;

import javax.servlet.ServletConfig;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.bean.Book;
import com.bean.Order;
import com.bean.User;
import com.dao.BookDao;
import com.dao.OrderDao;
import com.daoimpl.BookDaoImpl;
import com.daoimpl.OrderDaoImpl;

/**
 * Servlet implementation class CustomerPurchaseBookServlet
 */
@WebServlet("/CustomerPurchaseBookServlet")
public class CustomerPurchaseBookServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
	private BookDao bookDao;
	private OrderDao orderDao;
    
    public void init(ServletConfig config) throws ServletException {
    	bookDao = new BookDaoImpl();
    	orderDao = new OrderDaoImpl();
	}

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		List<Book> list = bookDao.list(false);
		request.setAttribute("list", list);
		int selected_id = request.getParameter("id") != null && !request.getParameter("id").isEmpty() ? Integer.parseInt(request.getParameter("id")) : !list.isEmpty() ? list.get(0).getId() : -1;
		request.setAttribute("selected_id", selected_id);
		request.setAttribute("selected_book", bookDao.getBookById(selected_id));
		request.getRequestDispatcher("/customer/PurchaseBook.jsp").forward(request, response);
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		if (request.getParameter("id") != null && !request.getParameter("quantity").isEmpty() 
				&& request.getParameter("quantity") != null && !request.getParameter("quantity").isEmpty()) {
			int id = Integer.parseInt(request.getParameter("id"));
			Book selected_book = bookDao.getBookById(id);
			int quantity = Integer.parseInt(request.getParameter("quantity"));
			if (quantity > selected_book.getStock()) {
				request.setAttribute("msg", "Not enough book stock. Failed to purchase the book...");
				this.doGet(request, response);
			}
			double price = selected_book.getPrice() * quantity;
			Order order = new Order(selected_book, quantity, (User)request.getSession().getAttribute("user"), price, new Date());
			int purchaseBookCount = orderDao.purchaseBook(order);
			if (purchaseBookCount > 0) {
				String msg = "Congratulations! You have successfully purchased the book.\\n";
				msg += "---------------------------------------------------\\n";
				msg += "Invoice\\n";
				msg += "---------------------------------------------------\\n";
				msg += "Book Name: " + selected_book.getName()  + "\\n";
				msg += "Book Price: $ " + selected_book.getPrice()  + "\\n";
				msg += "Quantity: " + quantity  + "\\n";
				msg += "---------------------------------------------------\\n";
				msg += "Total Price: $ " + (selected_book.getPrice() * quantity) + "\\n";
				msg += "---------------------------------------------------\\n";
				request.setAttribute("msg", msg);
			} else {
				request.setAttribute("msg", "Failed to purchase the book " + selected_book.getName() + "...");
			}
			this.doGet(request, response);
		}
	}
}
