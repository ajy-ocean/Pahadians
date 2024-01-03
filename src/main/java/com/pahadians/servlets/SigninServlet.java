package com.pahadians.servlets;

import java.io.IOException;
import java.io.PrintWriter;

import com.pahadians.dao.UserDao;
import com.pahadians.entities.User;
import com.pahadians.helper.ConnectionProvider;

import jakarta.servlet.ServletException;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;

public class SigninServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;

	protected void processRequest(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		// Fetching username & password from request
		try (PrintWriter out = response.getWriter()) {

			out.println("<!DOCTYPE html>");
			out.println("<html>");
			out.println("<head>");
			out.println("<title>Signin Servlet</title");
			out.println("</head>");
			out.println("<body>");
			String userEmail = request.getParameter("email");
			String userPassword = request.getParameter("password");

			UserDao userDao = new UserDao(ConnectionProvider.getConnection());
			User user = userDao.getUserByEmailAndPassword(userEmail, userPassword);
			if (user == null) {
				// login error
				out.println("Invalid Details...Try Again");
			} else {
				// login success
				HttpSession httpSession = request.getSession();
				httpSession.setAttribute("currentUser", user);
				response.sendRedirect("profile.jsp");
			}
			out.println("</body>");
			out.println("<html>");
		}

	}

	@Override
	protected void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		processRequest(request, response);
	}

	@Override
	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		processRequest(request, response);
	}

}
