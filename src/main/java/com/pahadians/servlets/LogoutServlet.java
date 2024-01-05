package com.pahadians.servlets;

import java.io.IOException;
import java.io.PrintWriter;

import com.pahadians.entities.Message;

import jakarta.servlet.ServletException;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;

/**
 * Servlet implementation class LogoutServlet
 */
public class LogoutServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;

	protected void processRequest(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		
		try (PrintWriter out = response.getWriter()) {
			out.println("<!DOCTYPE html>");
			out.println("<html>");
			out.println("<head>");
			out.println("<title>Signin Servlet</title");
			out.println("</head>");
			out.println("<body>");
			
			HttpSession httpSession = request.getSession();
			httpSession.removeAttribute("currentUser");
			Message msg = new Message("Logout successfully", "success", "alert-success");
			
			httpSession.setAttribute("msg", msg);
			response.sendRedirect("login.jsp");
			
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
