<%@ page import="com.pahadians.entities.Message"%>
<%@ page import="com.pahadians.entities.User"%>
<%@ page import="com.pahadians.dao.PostDao"%>
<%@ page import="com.pahadians.entities.Category"%>
<%@ page import="com.pahadians.helper.ConnectionProvider"%>
<%@ page import="java.util.*"%>
<%@ page errorPage="error.jsp"%>
<%
User user = (User) session.getAttribute("currentUser");
if (user == null) {
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
	clip-path: polygon(30% 0%, 70% 0%, 100% 0, 100% 100%, 60% 79%, 27% 100%, 0 86%, 0 0
		);
}
</style>

</head>
<body>
	<%-- Navbar --%>
	<nav class="navbar navbar-expand-lg navbar-dark primary-background">
		<a class="navbar-brand" href="index.jsp"> <span class="fa fa-tree"></span>
			Pahadians
		</a>
		<button class="navbar-toggler" type="button" data-toggle="collapse"
			data-target="#navbarSupportedContent"
			aria-controls="navbarSupportedContent" aria-expanded="false"
			aria-label="Toggle navigation">
			<span class="navbar-toggler-icon"></span>
		</button>

		<div class="collapse navbar-collapse" id="navbarSupportedContent">
			<ul class="navbar-nav mr-auto">
				<li class="nav-item active"><a class="nav-link" href="#"><span
						class="fa fa-map-signs"></span> Explore <span class="sr-only">(current)</span>
				</a></li>
				<li class="nav-item dropdown"><a
					class="nav-link dropdown-toggle" href="#" id="navbarDropdown"
					role="button" data-toggle="dropdown" aria-haspopup="true"
					aria-expanded="false"><span class="fa fa-group"></span> Join
						your Group </a>
					<div class="dropdown-menu" aria-labelledby="navbarDropdown">
						<a class="dropdown-item" href="#">Rishikesh Wale Java Coders</a> <a
							class="dropdown-item" href="#">Dehradun Wale Python Coders</a>
						<a class="dropdown-item" href="#">Tehri Wale UI Designers</a>
					</div></li>
				<li class="nav-item"><a class="nav-link" href="#"><span
						class="fa fa-vcard-o"></span> Contact Us</a></li>
				<li class="nav-item"><a class="nav-link" href="#"
					data-toggle="modal" data-target="#add-post-modal"><span
						class="fa fa-edit"></span> Post</a></li>
			</ul>

			<ul class="navbar-nav mr-right">
				<li class="nav-item"><a class="nav-link" href="#!"
					data-toggle="modal" data-target="#profile-modal"><span
						class="fa fa-user-circle"></span> <%=user.getName()%> </a></li>
				<li class="nav-item"><a class="nav-link" href="LogoutServlet"><span
						class="fa fa-sign-out"></span> Logout</a></li>
			</ul>

		</div>
	</nav>
	<%-- End Of Navbar --%>

	<%
	Message msg = (Message) session.getAttribute("msg");
	if (msg != null) {
	%>
	<div class="alert <%=msg.getCssClass()%>" role="alert">
		<%=msg.getContent()%>
	</div>

	<%
	session.removeAttribute("msg");
	}
	%>

	<%-- profile modal --%>

	<!-- Modal -->
	<div class="modal fade" id="profile-modal" tabindex="-1" role="dialog"
		aria-labelledby="exampleModalLabel" aria-hidden="true">
		<div class="modal-dialog" role="document">
			<div class="modal-content">
				<div class="modal-header primary-background text-white text-center">
					<h5 class="modal-title" id="exampleModalLabel">Pahadians</h5>
					<button type="button" class="close" data-dismiss="modal"
						aria-label="Close">
						<span aria-hidden="true">&times;</span>
					</button>
				</div>
				<div class="modal-body">
					<div class="container text-center">
						<img src="profilePics/<%=user.getProfile()%>" class="image-fluid"
							style="border-radius: 50%; max-width: 150px"> <br>
						<h5 class="modal-title mt-2 mb-2" id="exampleModalLabel"><%=user.getName()%></h5>

						<div id="profile-details">
							<!-- User Details -->
							<table class="table table-bordered table-hover">
								<tbody>
									<tr>
										<th scope="row">ID :</th>
										<td><%=user.getId()%></td>
									</tr>
									<tr>
										<th scope="row">Email :</th>
										<td><%=user.getEmail()%></td>
									</tr>
									<tr>
										<th scope="row">Gender :</th>
										<td><%=user.getGender()%></td>
									</tr>
									<tr>
										<th scope="row">Bio :</th>
										<td><%=user.getBio()%></td>
									</tr>
									<tr>
										<th scope="row">Registered on :</th>
										<td><%=user.getDateTime().toString()%></td>
									</tr>
								</tbody>
							</table>
						</div>

						<!-- profile edit -->
						<div id="profile-edit" style="display: none">
							<h3 class="font-weight-bold text-danger mt-2">Edit
								Cautiously!!!</h3>
							<form action="EditServlet" method="post"
								enctype="multipart/form-data">
								<table class="table">
									<tr>
										<td>ID :</td>
										<td><%=user.getId()%></td>
									</tr>
									<tr>
										<td>Name :</td>
										<td><input class="form-control" type="text"
											name="user_name" value="<%=user.getName()%>"></td>
									</tr>
									<tr>
										<td>Email :</td>
										<td><input class="form-control" type="email"
											name="user_email" value="<%=user.getEmail()%>"></td>
									</tr>
									<tr>
										<td>Password :</td>
										<td><input class="form-control" type="password"
											name="user_password" value="<%=user.getPassword()%>"></td>
									</tr>
									<tr>
										<td>Gender :</td>
										<td><%=user.getGender().toUpperCase()%></td>
									</tr>
									<tr>
										<td>Bio :</td>
										<td><textarea rows:"4" class="form-control"
												name="user_bio"><%=user.getBio()%></textarea></td>
									</tr>
									<tr>
										<td>Update Picture:</td>
										<td><input class="form-control" type="file"
											name="update-img"></td>
									</tr>
								</table>
								<div class="container">
									<button type="submit" class="btn primary-background text-white">Save</button>
								</div>
							</form>
						</div>
					</div>
				</div>
				<div class="modal-footer">
					<button type="button" class="btn btn-secondary"
						data-dismiss="modal">Close</button>
					<button type="button" id="edit-profile-btn"
						class="btn primary-background text-white">Edit</button>
				</div>
			</div>
		</div>
	</div>
	<%-- End of profile modal --%>

	<!-- Post Modal -->

	<!-- Modal -->
	<div class="modal fade" id="add-post-modal" tabindex="-1" role="dialog"
		aria-labelledby="exampleModalLabel" aria-hidden="true">
		<div class="modal-dialog" role="document">
			<div class="modal-content">
				<div class="modal-header">
					<h5 class="modal-title" id="exampleModalLabel">Add Post</h5>
					<button type="button" class="close" data-dismiss="modal"
						aria-label="Close">
						<span aria-hidden="true">&times;</span>
					</button>
				</div>
				<div class="modal-body">
				<!-- FORM -->
					<form id="add-post-form" action="AddPostServlet" method="post">

						<div class="form-group">
							<select class="form-control" name="cid">
								<option selected disabled>Select Category</option>

								<%
								PostDao postDao = new PostDao(ConnectionProvider.getConnection());
								ArrayList<Category> list = postDao.getAllCategories();
								for (Category c : list) {
								%>
								<option value="<%= c.getCid() %>">
									<%=c.getName()%>
								</option>

								<%
								}
								%>
							</select>

						</div>

						<div class="form-group">
							<input name="pTitle" class="form-control" type="text" placeholder="Enter title">
						</div>
						<div class="form-group">
							<textarea name="pContent" class="form-control" placeholder="Enter something"
								style="height: 150px;"></textarea>
						</div>
						<div class="form-group">
							<textarea name="pCode" class="form-control"
								placeholder="Enter your program(optional)"
								style="height: 150px;"></textarea>
						</div>
						<div class="form-group">
							<label>Select Picture</label> <br> <input name="pic" type="file">
						</div>
						
						<div class="container text-center">
							<button type="submit" class="btn primary-background text-white">Submit</button>
						</div>
					</form>
				</div>
			</div>
		</div>
	</div>
	<!-- End Post Modal -->

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
		
		<!-- Sweet alert cdn -->
		<script src="https://cdnjs.cloudflare.com/ajax/libs/sweetalert/2.1.2/sweetalert.min.js"></script>

	<!--  MyJavascrip-->
	<script src="/Pahadians/src/main/webapp/js/scriptName.js"
		type="text/javascript"></script>

	<script>
		$(document).ready(function() {
			let editStatus = false;

			$("#edit-profile-btn").click(function() {
				if (editStatus == false) {
					$("#profile-details").hide();
					$("#profile-edit").show();
					editStatus = true;
					$(this).text("Back");
				} else {
					$("#profile-details").show();
					$("#profile-edit").hide();
					editStatus = false;
					$(this).text("Edit");
				}
			});
		});
	</script>
	
	<!-- JavaScript code for Post -->
	<script>
		$(document).ready(function(e){
			$("#add-post-form").on("submit", function(event){
				/* When we submit our form then this code gets called */
				event.preventDefault();
				console.log("Clicked on Submit");
				let form = new FormData(this);
				
				/* Sending Request To SERVER  */
				$.ajax({
					url: "AddPostServlet",
					type:'POST',
					data: form,
					success: function (data, textStatus, jqXHR) {
						/* This is code is executed if our request is successfully fetched */
						console.log(data);
						if(data.trim()=='DONE'){
							swal("Good job!", "Saved Successfully!", "success");
						}else {
							swal("Error!", "Something Went Wrong Try Again!", "error");
						}
					},
					error: function (jqXHR, textStatus, errorThrown) {
						// Error
						swal("Error!", "Something Went Wrong Try Again!", "error");
					},
					processData: false,
					contentType: false
				})
			})
		});
	</script>
</body>
</html>







