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
	clip-path: polygon(30% 0%, 70% 0%, 100% 0, 100% 100%, 60% 79%, 27% 100%, 0 86%, 0 0);
}
</style>

</head>
<body>
	<%-- Navbar --%>
	<nav class="navbar navbar-expand-lg navbar-dark primary-background">
	<a class="navbar-brand" href="index.jsp"> <span class="fa fa-tree"></span> Pahadians</a>
	<button class="navbar-toggler" type="button" data-toggle="collapse"
		data-target="#navbarSupportedContent"
		aria-controls="navbarSupportedContent" aria-expanded="false"
		aria-label="Toggle navigation">
		<span class="navbar-toggler-icon"></span>
	</button>

	<div class="collapse navbar-collapse" id="navbarSupportedContent">
		<ul class="navbar-nav mr-auto">
			<li class="nav-item active"><a class="nav-link" href="#"><span class="fa fa-map-signs"></span> Explore
					<span class="sr-only">(current)</span>
			</a></li>
			<li class="nav-item dropdown"><a
				class="nav-link dropdown-toggle" href="#" id="navbarDropdown"
				role="button" data-toggle="dropdown" aria-haspopup="true"
				aria-expanded="false"><span class="fa fa-group"></span> Join your Group </a>
				<div class="dropdown-menu" aria-labelledby="navbarDropdown">
					<a class="dropdown-item" href="#">Rishikesh Wale</a> <a
						class="dropdown-item" href="#">Dehradun Wale</a>
					<div class="dropdown-divider"></div>
					<a class="dropdown-item" href="#">Tehri Wale</a>
				</div></li>
			<li class="nav-item"><a class="nav-link" href="#"><span class="fa fa-vcard-o"></span> Contact Us</a></li>
		</ul>

		<ul class="navbar-nav mr-right">
			<li class="nav-item"><a class="nav-link" href="signup.jsp"><span class="fa fa-user-circle"></span>  
			<%= user.getName() %>
			</a></li>

			<li class="nav-item"><a class="nav-link" href="LogoutServlet"><span class="fa fa-sign-out"></span> Logout</a></li>
		</ul>
		
	</div>
</nav>
	<%-- End Of Navbar --%>

	<!-- Javascript -->
	<script src="https://code.jquery.com/jquery-3.7.1.min.js"
		integrity="sha256-/JqT3SQfawRcv/BIHPThkBvs0OEvtFFmqPF/lYI/Cxo="
		crossorigin="anonymous"></script>
	<script
		src="https://cdn.jsdelivr.net/npm/popper.js@1.12.9/dist/umd/popper.min.js"
		integrity="sha384-ApNbgh9B+Y1QKtv3Rn7W3mgPxhU9K/ScQsAP7hUibX39j7fakFPskvXusvfa0b4Q"
		crossorigin="anonymous"></script>
	<script
		src="https://cdn.jsdelivr.net/npm/bootstrap@4.0.0/dist/js/bootstrap.min.js"
		integrity="sha384-JZR6Spejh4U02d8jOt6vLEHfe/JQGiRRSQQxSfFWpi1MquVdAyjUar5+76PVCmYl"
		crossorigin="anonymous"></script>

	<!--  MyJavascrip-->
	<script src="/Pahadians/src/main/webapp/js/scriptName.js"
		type="text/javascript"></script>
</body>
</html>