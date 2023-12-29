<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Signup</title>
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
	<%@include file="navbar.jsp"%>

	<main class="primary-background p-5 banner-background"
		style="padding-bottom: 80px; height: 120vh;">
		<div class="container">
			<div class="col-md-6 offset-md-3">
				<div class="card">
					<div class="card-header text-center primary-background text-white">
						<span class="fa fa-3x fa-user-circle"></span> <br> Sign-up
						here
					</div>
					<div class="card-body">
						<form id="signup-form" action="SignupServlet" method="POST">
							<div class="form-group">
								<label for="userName">User Name</label> <input name="userName"
									type="text" class="form-control" id="userName"
									aria-describedby="emailHelp" placeholder="Enter User Name">
							</div>

							<div class="form-group">
								<label for="exampleInputEmail1">Email address</label> <input
									name="userEmail" type="email" class="form-control"
									id="exampleInputEmail1" aria-describedby="emailHelp"
									placeholder="Enter email">
							</div>

							<div class="form-group">
								<label for="exampleInputPassword1">Password</label> <input
									name="userPassword" type="password" class="form-control"
									id="exampleInputPassword1" placeholder="Password">
							</div>

							<div class="form-group">
								Select Gender <br> <label for="male"> <input
									type="radio" id="male" name="userGender" value="male">
									Male
								</label> <label for="female"> <input type="radio" id="female"
									name="userGender" value="female"> Female
								</label>
							</div>

							<div class="form-group">
								<textarea name="bio" class="form-control" rows="2"
									placeholder="Enter bio"></textarea>
							</div>

							<div class="form-check">
								<input name="check" type="checkbox" class="form-check-input"
									id="exampleCheck1"> <label class="form-check-label"
									for="exampleCheck1">agree terms and conditions</label>
							</div>
							<br>
							<div class="container text-center" id="loader"
								style="display: none;">
								<span class="fa fa-refresh fa-spin fa-2x"></span>
								<h4>Please Wait...</h4>
							</div>
							<button id="submit-btn" type="submit" class="btn btn-primary">Submit</button>
						</form>
					</div>
				</div>
			</div>
		</div>
	</main>



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

	<!-- sweetalert -->
	<script
		src="https://cdnjs.cloudflare.com/ajax/libs/sweetalert/2.1.2/sweetalert.min.js"></script>

	<script>
		$(document).ready(function() {
			console.log("Loaded.........")
			$('#signup-form').on('submit', function(event) {
				event.preventDefault();
				let form = new FormData(this);

				$("#submit-btn").hide();
				$("#loader").show();

				// Send this to signup servlet
				$.ajax({
					url : "SignupServlet",
					type : 'POST',
					data : form,
					success : function(data, textStatus, jqXHR) {
						console.log(data);
						$("#submit-btn").show();
						$("#loader").hide();
						
						if(data.trim()=='Data inserted Successfully')
							{
						swal("Successful Registration.. Redirecting to Login Page")
						.then((value) => {
						 	window.location="login.jsp"
						});
					 }else {
						 swal(data);
					 }
						
					},
					error : function(jqXHR, textStatus, errorThrown) {
						$("#submit-btn").show();
						$("#loader").hide();
						swal("Something went wrong...Please Try Again");
					},
					processData : false,
					contentType : false
				});

			});
		});
	</script>


</body>
</html>





