<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Insert title here</title>
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css">

</head>
<body>
<nav class="navbar navbar-expand-sm bg-dark navbar-dark">
  <ul class="navbar-nav">
    <li class="nav-item ">
      <a class="nav-link" href="${pageContext.request.contextPath}/jsp/index.jsp">Home</a>
    </li>
    <li class="nav-item ">
      <a class="nav-link" href="${pageContext.request.contextPath}/jsp/login.jsp">Login</a>
    </li>
    <li class="nav-item active">
      <a class="nav-link" href="${pageContext.request.contextPath}/jsp/register.jsp">Register</a>
    </li>
  </ul>
</nav>
<div class="container-fluid">
		<div class="row">
			<div class="col-md-4 col-sm-4 col-xs-12"></div>

			<div class="col-md-4 col-sm-4 col-xs-12">
				<form name="form" action="${pageContext.request.contextPath}/RegisterServlet" method="post">
					<h1>Register...!</h1>
					<div class="form-group">
						<label>Name</label> <input type="text" name="name" class="form-control"/>
					</div>

					<div class="form-group">
						<label>Mobile</label> <input type="text" name="phone" class="form-control" />
					</div>

					<div class="form-group">
						<label>Address</label> <input type="text" name="address" class="form-control" />
					</div>
					<div class="form-group">
						<label>city</label><input type="text" name="city" class="form-control" />
					</div>
					<div class="form-group">
						<label >State</label> <input type="text" name="state" class="form-control" />
					</div>
					<div class="form-group">
						<label >pin</label> <input type="number" name="pincode" class="form-control" />
					</div>
					<div class="form-group">
						<label >Email address</label><input type="email" name="username" class="form-control"/>
					</div>
					<div class="form-group">
						<label >Password</label> <input type="password" name="password" class="form-control" />
					</div>
					<button type="submit" class="btn btn-dark btn-block">Submit</button>
					
					<br>
					
					<div align="JUSTIFY">
						Already have an account<a href="${pageContext.request.contextPath}/jsp/login.jsp"><b>
								<i>Sign in here</i>
						</b></a>
					</div>
				</form>
			</div>
			<div class="col-md-4 col-sm-4 col-xs-12"></div>
		</div>
	</div>
  
   
</body>
</html>