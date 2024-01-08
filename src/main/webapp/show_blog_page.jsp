
<%
	int postId = Integer.parseInt(request.getParameter("post_id"));
%>

<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Pahadi Blog</title>
</head>
<body>
	<h4>Going to show single blog</h4>
	<h1>Post id : <%= postId %></h1>
</body>
</html>