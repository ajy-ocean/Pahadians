package com.pahadians.servlets;

import java.io.File;
import java.io.IOException;
import java.io.PrintWriter;

import com.pahadians.dao.UserDao;
import com.pahadians.entities.Message;
import com.pahadians.entities.User;
import com.pahadians.helper.ConnectionProvider;
import com.pahadians.helper.Helper;

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
			User user = (User) httpSession.getAttribute("currentUser");
			user.setName(userName);
			user.setPassword(userPassword);
			user.setBio(userBio);
			String oldFile = user.getProfile();
			user.setProfile(imageName);

			// Updating Database.....
			UserDao userDao = new UserDao(ConnectionProvider.getConnection());
			boolean updateValue = userDao.updateUser(user);
			if (updateValue) {

			/*		
			  Image File Path:- /home/ocean/codeStuff/myProjects/.metadata/.plugins/org.eclipse.wst.server.core/
				tmp0/wtpwebapps/Pahadians/profilePics
			*/

				String path = request.getSession().getServletContext().getRealPath("/") + "profilePics" + File.separator
						+ user.getProfile();

				// Delete profile image
				String oldFilePath = request.getSession().getServletContext().getRealPath("/") + "profilePics"
						+ File.separator + oldFile;

				if(!oldFile.equals("default.png")) {
					Helper.deleteFile(oldFilePath);
				}

				if (Helper.saveFile(part.getInputStream(), path)) {
					out.println("Profile Updated...");
					Message msg = new Message("Profile Updated...", "success", "alert-success");
					httpSession.setAttribute("msg", msg);

				} else {
					Message msg = new Message("Something Went Wrong Try Again...", "error", "alert-danger");
					httpSession.setAttribute("msg", msg);
				}

			} else {
				out.println("Failed to update user!!!!!");
				Message msg = new Message("Something Went Wrong Try Again...", "error", "alert-danger");
				httpSession.setAttribute("msg", msg);
			}
			response.sendRedirect("profile.jsp");

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
