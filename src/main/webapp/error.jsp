<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ page isErrorPage="true" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Sorry!! Something went wrong....</title>

<!-- Bootstrap CSS -->
<link rel="stylesheet"
	href="https://cdn.jsdelivr.net/npm/bootstrap@4.0.0/dist/css/bootstrap.min.css"
	integrity="sha384-Gn5384xqQ1aoWXA+058RXPxPg6fy4IWvTNh0E263XmFcJlSAwiGgFAW/dAiS6JXm"
	crossorigin="anonymous">
<!-- MyBootstrap CSS -->
<link rel="stylesheet" href="css/styles.css">
<!--  FontAwesone css-->
<link rel="stylesheet"
	href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">
<!-- clip-path (clippy site)-->
<style>
.banner-background {
	clip-path: polygon(50% 0%, 100% 0, 100% 35%, 100% 70%, 94% 100%, 35% 100%, 9% 83%,
		0 100%, 0% 35%, 0 0);
}
</style>

</head>
<body>
	<div class="container text-center">
		<img src="img/error.png" class="img-fluid mt-1"
			style="width: 500px; height: 500px">
			<h3>Sorry! Something Went Wrong...</h3>
			<%= exception%>
			<a href="index.jsp" class="btn primary-background btn-lg text-white mt-3">Go to Home</a>
	</div>
</body>
</html>