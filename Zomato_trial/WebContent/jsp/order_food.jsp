<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Insert title here</title>
<link rel="stylesheet"
	href="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css">

</head>
<body>
	<%@ page import="java.sql.*"%>
	<%
	int f_id = Integer.parseInt(request.getParameter("f_id"));
	%>
	<%
	Connection con = null;
	PreparedStatement stmt = null;
	ResultSet rs = null;
	String iurl1 = null;

	try {
		Class.forName("com.mysql.jdbc.Driver");
		con = DriverManager.getConnection("jdbc:mysql://localhost:3306/zomatotest", "root", "root");
		//stmt = con.createStatement();
		stmt = con.prepareStatement("select * from food_item where f_id=?");
		stmt.setInt(1, f_id);
		rs = stmt.executeQuery();
	%>
	<%
	while (rs.next()) {
	%>
	<nav class="navbar navbar-expand-sm bg-dark navbar-dark">
		<ul class="navbar-nav">
			<li class="nav-item "><a class="nav-link"
				href="${pageContext.request.contextPath}/jsp/home.jsp">Home</a></li>
			<li class="nav-item active"><a class="nav-link"
				href="${pageContext.request.contextPath}/jsp/cart.jsp">Cart</a></li>
			<li class="nav-item"><a class="nav-link"
				href="${pageContext.request.contextPath}/jsp/home.jsp">Order</a>
			</li>
			<li class="nav-item"><a class="nav-link"
				href="${pageContext.request.contextPath}/jsp/place_order.jsp">Payment</a>
			</li>
		</ul>
	</nav>
	<br>
	<div class="container-fluid">
		<div class="row">
			<div class="col-md-3 col-sm-4 col-xs-12"></div>

			<div class="col-md-6 col-sm-4 col-xs-12">

				<form action="${pageContext.request.contextPath}/OrderServlet" method="post">
					<div class="card border-dark mx-auto" style="max-width: 100%;">
					
						<div class="card-header text-center">Food Details</div>
						
						<div class="text-center">
							<img class="card-img-top" src="<%=rs.getString("image_path")%>"
								alt="Card image cap" alt="Card image"
								style="width: 70%; height: 200px">
						</div>
						
						<div class="card-body text-dark">
							<p class="text-center">
								Name:
								<%=rs.getString("f_name")%></p>
							<p class="text-center">
								Food Type:
								<%=rs.getString("f_type")%></p>
							<p class="text-center">
								Price:
								<%=rs.getInt("f_price")%>Rs
							</p>
							<p class="text-center">
								Ratings:
								<%=rs.getInt("ratings")%></p>
							<%
							session.setAttribute("f_id", f_id);
							%>
							<div class="form-group text-center">
						
										<label>Enter quantity:</label>
									
										<select name="qty" id="qty">
											<option value=1>1</option>
											<option value=2>2</option>
											<option value=3>3</option>
											<option value=4>4</option>
											<option value=5>5</option>
											<option value=6>6</option>
											<option value=7>7</option>
											<option value=8>8</option>
											<option value=9>9</option>
											<option value=10>10</option>
										</select>
									</div>
									
								<button type="submit" class="btn btn-dark btn-block">ADD
									TO CART</button>
							</div>
						</div>
				</form>

			</div>
			
			<div class="col-md-3 col-sm-4 col-xs-12"></div>
		</div>
		<p class="text-center">Order Now...!Get food delivered to your
				door steps</p>
	</div>

	<%
	}
	%>

	<%
	} catch (Exception e) {
	out.println("DB problem");
	return;
	} finally {
	try {
		rs.close();
		stmt.close();
		con.close();
	} catch (SQLException e) {
		e.printStackTrace();
	}
	}
	%>

</body>
</html>
