<%@ page import="com.pahadians.entities.User" %>
<%@ page errorPage="error.jsp" %>
<%
	User user = (User)session.getAttribute("currentUser");
	if(user == null){
		response.sendRedirect("login.jsp");
	}
%>

<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Profile</title>
</head>
<body>
	<%= user.getName() %>
	<br>
	<%= user.getEmail() %>
	<br>
	<%= user.getBio() %>
</body>
</html>