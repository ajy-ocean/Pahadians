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
import jakarta.servlet.http.HttpSession;
import jakarta.servlet.http.Part;

/**
 * Servlet implementation class EditServlet
 */

@MultipartConfig
public class EditServlet extends HttpServlet {
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
			
			// Fetching data
			String userName = request.getParameter("user_name");
			String userEmail = request.getParameter("user_email");
			String userPassword = request.getParameter("user_password");
			String userBio = request.getParameter("user_bio");
			Part part = request.getPart("update-img");
			String imageName = part.getSubmittedFileName();
			
			// Get the user from the session
			HttpSession httpSession = request.getSession();
			User user = (User)httpSession.getAttribute("currentUser");
			user.setName(userName);
			user.setPassword(userPassword);
			user.setBio(userBio);
			user.setProfile(imageName);
			
			// Updating Database.....
			UserDao userDao = new UserDao(ConnectionProvider.getConnection());
			boolean updateValue = userDao.updateUser(user);
			if(updateValue) {
				out.println("User Updated Successfully");
			}else {
				out.println("Failed to update user!!!!!");
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
