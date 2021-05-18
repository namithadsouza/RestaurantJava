<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
	
	
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Insert title here</title>
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css">
  <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
  <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/js/bootstrap.min.js"></script>
</head>
<body>
	<%@ page import="java.sql.*"%>

	<%
	Connection con = null;
	PreparedStatement stmt = null;
	ResultSet rs = null;
	String iurl1 = null;
	
	int u_id=(int)session.getAttribute("user_id");
	

	try {
		Class.forName("com.mysql.jdbc.Driver");
		con = DriverManager.getConnection("jdbc:mysql://localhost:3306/zomatotest","root","root");
		//stmt = con.createStatement();
		stmt = con.prepareStatement("select * from orders INNER JOIN food_item on user_id=? and order_status=? and orders.f_id=food_item.f_id");
		stmt.setInt(1,u_id);
		stmt.setString(2, "pending");
		rs=stmt.executeQuery();
		
	%>
	
		<nav class="navbar navbar-expand-sm bg-dark navbar-dark">
  <ul class="navbar-nav">
    <li class="nav-item ">
      <a class="nav-link" href="${pageContext.request.contextPath}/jsp/index.jsp">Home</a>
    </li>
    <li class="nav-item active">
      <a class="nav-link" href="${pageContext.request.contextPath}/jsp/cart.jsp">Cart</a>
    </li>
    <li class="nav-item">
      <a class="nav-link" href="${pageContext.request.contextPath}/jsp/home.jsp">Order</a>
    </li>
    <li class="nav-item">
      <a class="nav-link" href="${pageContext.request.contextPath}/jsp/logout.jsp">logout</a> 
    </li>
  </ul>
</nav>
<h3 class="text-center">Ordered Food Items</h3>
<div class="container-fluid">
		<div class="row">
			<div class="col-md-1 col-sm-4 col-xs-12"></div>

			<div class="col-md-10 col-sm-4 col-xs-12">
<table class="table table-hover table-bordered">
    <thead class="thead-dark">
      <tr>
        <th class="text-center">Food Image</th>
        <th class="text-center">Order Id</th>
        <th class="text-center">Quantity</th>
         <th class="text-center">Order Amount</th>
         <th class="text-center">Delete Order</th>
      </tr>
    </thead>
    <tbody>
	<% while (rs.next()) {%>
	<tr>
	
	<td class="text-center"><img src="<%=rs.getString("image_path")%>" alt="food_image" style="height:200px ;width:250px"></td>
	<td class="text-center"><%=rs.getInt("order_id") %></td>
	<td class="text-center"><%=rs.getInt("order_qty") %></td>
	<td class="text-center">	<%=rs.getInt("order_amount") %>Rs</td>
		
	<td class="text-center">	<a href="${pageContext.request.contextPath}/jsp/delete.jsp?order_id=<%=rs.getString("order_id") %>"><button type="button" class="delete btn-dark">Delete</button></a>
	</td>
	</tr>
	
	<%
 }
 %>
</tbody>
</table>
</div>
			<div class="col-md-1 col-sm-4 col-xs-12"></div>

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
	<div class="text-center">
	<a href="${pageContext.request.contextPath}/jsp/place_order.jsp"><button type="button" class="payment btn btn-dark">Proceed with payment</button></a>
</div>
</body>
</html>