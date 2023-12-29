package com.pahadians.servlets;

import java.io.IOException;
import java.io.PrintWriter;

import com.pahadians.dao.UserDao;
import com.pahadians.entities.User;
import com.pahadians.helper.ConnectionProvider;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.MultipartConfig;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

@MultipartConfig
public class SignupServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;

	protected void processRequest(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		response.setContentType("text/html;charset=UTF-8");
		try (PrintWriter out = response.getWriter()) {

			// Fetch all form data
			String check = request.getParameter("check");
			if (check == null) {
				out.println("Please Check Terms And Conditions");
			} else {
				// Retrieving other datas
				String name = request.getParameter("userName");
				String email = request.getParameter("userEmail");
				String password = request.getParameter("userPassword");
				String gender = request.getParameter("userGender");
				String bio = request.getParameter("bio");

				// Create User obj and set all data to that obj
				User user = new User(name, email, password, gender, bio);

				// Create UserDao obj
				UserDao userDao = new UserDao(ConnectionProvider.getConnection());
				if (userDao.saveUser(user)) {
					out.println("Data inserted Successfully");
				} else {
					out.println("Failed to insert the DATA");
				}
			}

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
