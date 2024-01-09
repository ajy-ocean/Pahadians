package com.pahadians.servlets;

import java.io.IOException;
import java.io.PrintWriter;

import com.pahadians.dao.LikeDao;
import com.pahadians.helper.ConnectionProvider;

import jakarta.servlet.ServletException;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

/**
 * Servlet implementation class LikeServlet
 */
public class LikeServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;

	protected void processRequest(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		try (PrintWriter out = response.getWriter()) {
			String operation = request.getParameter("operation");
			int uid = Integer.parseInt(request.getParameter("uid"));
			int pid = Integer.parseInt(request.getParameter("pid"));
			/*
			 * out.println("Data from server"); out.print(operation); out.print(uid);
			 * out.print(pid);
			 */
			LikeDao ldao = new LikeDao(ConnectionProvider.getConnection());
			if(operation.equals("like")) 
			{
				boolean f = ldao.insertLike(pid, uid);
				out.println(f);
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
