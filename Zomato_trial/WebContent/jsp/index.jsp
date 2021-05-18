<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Insert title here</title>
<link rel="stylesheet"
	href="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css">
<link rel="stylesheet"
	href="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/css/bootstrap.min.css">
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
<script
	src="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/js/bootstrap.min.js"></script>
<style type="text/css">
#done {
	top: 50%;
	transform: translateY(-50%);
	font-family: Brush Script MT, cursive;
	font-size: 80px;
	color: black;
	text-align: center;
}
.carousel-caption {
	top: 50%;
	transform: translateY(-50%);
	font-family: Lucida Console, cursive;
	color:black;
	text-align: center;
	font-size: 40px;
}


</style>
</head>
<body>

	<nav class="navbar navbar-expand-sm bg-dark navbar-dark">
		<ul class="navbar-nav">

			<li class="nav-item active float-right"><a
				class="nav-link float-right"
				href="${pageContext.request.contextPath}/jsp/index.jsp">Home</a></li>
			<li class="nav-item"><a class="nav-link float-right"
				href="${pageContext.request.contextPath}/jsp/login.jsp">Login</a></li>
			<li class="nav-item"><a class="nav-link float-right"
				href="${pageContext.request.contextPath}/jsp/register.jsp">Register</a>
			</li>
		</ul>
	</nav>
	<!-- <div class="container-fluid">
		<div class="row">
			
			<div class="col-md-12 text-center">
			<h2 class="bg-warning text-white">Welcome to Meals on Wheels</h2>
			</div>
			
			</div>
			</div> -->
	<div class="container">
		<div id="myCarousel" class="carousel slide" data-ride="carousel">
			<div class="carousel-inner">
				<div class="item active">
					<img src="${pageContext.request.contextPath}/img/bg1.jpg"
						alt="background1" style="width: 100%; height: 500px;">
					<div class="carousel-caption" id="done">
						<p>
							<b><i>Meals  on  Wheels</i></b>
						</p>

					</div>
				</div>

				<div class="item">
					<img src="${pageContext.request.contextPath}/img/bg2.jpg"
						alt="background2" style="width: 100%; height: 500px;">
					<div class="carousel-caption">
						<h3>Order</h3>
						<p>You can easily order food</p>
					</div>
				</div>

				<div class="item">
					<img src="${pageContext.request.contextPath}/img/bg3.jpg"
						alt="background3" style="width: 100%; height: 500px;">
					<div class="carousel-caption">
						<h3>Feedback</h3>
						<p>High Customer Satisfaction</p>
					</div>
				</div>
			</div>

			<!-- Left and right controls -->
			<a class="left carousel-control" href="#myCarousel" data-slide="prev">
				<span class="glyphicon glyphicon-chevron-left"></span> <span
				class="sr-only">Previous</span>
			</a> <a class="right carousel-control" href="#myCarousel"
				data-slide="next"> <span
				class="glyphicon glyphicon-chevron-right"></span> <span
				class="sr-only">Next</span>
			</a>
		</div>
	</div>

</body>
</html>