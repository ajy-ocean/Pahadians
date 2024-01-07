package com.pahadians.servlets;

import java.io.File;
import java.io.IOException;
import java.io.PrintWriter;

import com.pahadians.dao.PostDao;
import com.pahadians.entities.Post;
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
 * Servlet implementation class AddPostServlet
 */

@MultipartConfig
public class AddPostServlet extends HttpServlet {

	private static final long serialVersionUID = 1L;

	protected void processRequest(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		try (PrintWriter out = response.getWriter()) {

			int cid = Integer.parseInt(request.getParameter("cid"));
			String pTitle = request.getParameter("pTitle");
			String pContent = request.getParameter("pContent");
			String pCode = request.getParameter("pCode");
			Part part = request.getPart("pic");

			// Getting current userid
			HttpSession session = request.getSession();
			User user = (User) session.getAttribute("currentUser");
			// out.println("Title:-" + pTitle);
			// out.println("pic:- " + part.getSubmittedFileName());

			Post post = new Post(pTitle, pContent, pCode, part.getSubmittedFileName(), null, cid, user.getId());
			PostDao postDao = new PostDao(ConnectionProvider.getConnection());
			if (postDao.savePost(post)) {	
				/* /home/ocean/codeStuff/myProjects/.metadata/.plugins/org.eclipse.wst.server.
				   core/tmp0/wtpwebapps/Pahadians/blog_pics
				 */	
				String path = request.getSession().getServletContext().getRealPath("/") + "blog_pics" + File.separator
						+ part.getSubmittedFileName();
				Helper.saveFile(part.getInputStream(), path);
				out.println("DONE");
			} else {
				out.println("ERROR");
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
