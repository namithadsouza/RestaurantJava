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
	Connection con = null;
	PreparedStatement stmt = null;
	PreparedStatement st = null;
	ResultSet rs = null;
	ResultSet r = null;
	int total=0;
	String name=null,city=null,address=null,phone=null;
	int pincode=0;
	int u_id=(int)session.getAttribute("user_id");

	try {
		Class.forName("com.mysql.jdbc.Driver");
		con = DriverManager.getConnection("jdbc:mysql://localhost:3306/zomatotest","root","root");
		stmt = con.prepareStatement("select orders.order_id,food_item.f_name,orders.order_qty,orders.order_amount,register.name,register.phone_number,register.address,register.city,register.city,register.pincode from orders INNER JOIN food_item on orders.f_id=food_item.f_id and orders.order_status=? and orders.user_id=? INNER JOIN register on register.user_id=orders.user_id");
		stmt.setString(1,"pending");
		stmt.setInt(2,u_id);
		rs=stmt.executeQuery();
	%>
	
		<nav class="navbar navbar-expand-sm bg-dark navbar-dark">
		<ul class="navbar-nav">
			<li class="nav-item "><a class="nav-link"
				href="${pageContext.request.contextPath}/jsp/home.jsp">Home</a></li>
			<li class="nav-item "><a class="nav-link"
				href="${pageContext.request.contextPath}/jsp/cart.jsp">Cart</a></li>
			<li class="nav-item"><a class="nav-link"
				href="${pageContext.request.contextPath}/jsp/home.jsp">Order</a>
			</li>
			<li class="nav-item active"><a class="nav-link"
				href="${pageContext.request.contextPath}/jsp/place_order.jsp">Payment</a>
			</li>
			<li class="nav-item">
      <a class="nav-link" href="${pageContext.request.contextPath}/jsp/logout.jsp">logout</a> 
    </li>
		</ul>
	</nav>
	<br>
	
	
	<div class="container-fluid">
		<div class="row">
			<div class="col-md-3 col-sm-4 col-xs-12"></div>

			<div class="col-md-6 col-sm-4 col-xs-12">
	
	<table class="table table-hover table-bordered">
	<thead class="thead-dark">
	<tr>
	<th  class="text-center">Order id</th>
	<th  class="text-center">Item</th>
	<th  class="text-center">order quantity</th>
	<th  class="text-center">order amount</th>
	</tr>
	</thead>
	 <tbody>
	<% while (rs.next()) {
	 total=total+rs.getInt("order_amount"); 
	 name=rs.getString("name");
	 address=rs.getString("address");
	 city=rs.getString("city");
	 pincode=rs.getInt("pincode");
	 phone=rs.getString("phone_number");
		%>
		

		<tr>
		  <td  class="text-center"><%=rs.getInt("order_id") %></td>
		  <td  class="text-center"><%=rs.getString("f_name") %></td>
		  <td  class="text-center"><%=rs.getInt("order_qty") %></td>
		  <td  class="text-center"><%=rs.getInt("order_amount") %></td>
		</tr>
		
	<% 	
	}
	%>
	
	
	<tr class="warning">
	<td colspan="3"  class="text-center">Total bill:</td><td  class="text-center"> <%=total %>Rs</td></tr>
	</tbody>
   </table>	
   </div>
   <div class="col-md-3 col-sm-4 col-xs-12"></div>
   </div>
  <div class="row">
			<div class="col-md-4 col-sm-4 col-xs-12"></div>

			<div class="col-md-4 col-sm-4 col-xs-12">
	<h2>Confirm delivery address</h2>
	<form action="${pageContext.request.contextPath}/PlaceOrder" method="post">
	<div class="form-group">
	 <label>Name:</label><input class="form-control" type="text" name="name" value=<%= name %>>
	 </div>
	 <div class="form-group">
	 <label>Address:</label><input  class="form-control" type="text" name="address" value=<%= address %>>
	 </div>
	 <div class="form-group">
	 <label>City:</label><input class="form-control" type="text" name="city" value=<%= city %>>
	 </div>
	 <div class="form-group">
	 <label>Phone number:</label><input class="form-control" type="text" name="phone" value=<%= phone %>>
	 </div>
	 <div class="form-group">
	 <label>Pin code:</label><input class="form-control" type="number" name="pincode" value=<%= pincode %>>
	 </div>
	 <button type="submit" class="btn btn-dark btn-block" value="place order">Submit</button>
	
	</form>
	</div>
	<div class="col-md-4 col-sm-4 col-xs-12"></div>
	</div>
	 </div>
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