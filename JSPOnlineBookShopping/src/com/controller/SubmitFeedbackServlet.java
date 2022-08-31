package com.controller;

import java.io.IOException;

import javax.servlet.ServletConfig;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.bean.Feedback;
import com.dao.FeedbackDao;
import com.daoimpl.FeedbackDaoImpl;



/**
 * Servlet implementation class SubmitFeedbackServlet
 */
@WebServlet("/SubmitFeedbackServlet")
public class SubmitFeedbackServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
	private FeedbackDao feedbackDao;
    
    public void init(ServletConfig config) throws ServletException {
    	feedbackDao = new FeedbackDaoImpl();
	}
	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		if (request.getParameter("name") != null && request.getParameter("email") != null
				&& request.getParameter("subject") != null && request.getParameter("details") !=null) {
			Feedback feedback = new Feedback();
			feedback.setName(request.getParameter("name"));
			feedback.setEmail(request.getParameter("email"));
			feedback.setSubject(request.getParameter("subject"));
			feedback.setDetails(request.getParameter("details"));
			int addFeedbackCount = feedbackDao.add(feedback);
			if (addFeedbackCount > 0) {
				request.setAttribute("msg","You have successfully submitted your feedback.");
			} else {
				request.setAttribute("msg","Failed to submit your feedback. Please try again...");
			}
			request.getRequestDispatcher("/ContactUs.jsp").forward(request, response);
		}
	}

}
