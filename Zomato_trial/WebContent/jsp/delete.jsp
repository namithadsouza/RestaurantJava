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

<%@page import="java.sql.*,java.util.*"%>
<%
String id=request.getParameter("order_id");
try
{
Class.forName("com.mysql.jdbc.Driver");
Connection conn = DriverManager.getConnection("jdbc:mysql://localhost:3306/zomatotest", "root", "root");
Statement st=conn.createStatement();
int i=st.executeUpdate("DELETE FROM orders WHERE order_id="+id);
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
  </ul>
</nav>
<br>
<br>
<br>
<div class="container-fluid">
		<div class="row">
			<div class="col-md-4 col-sm-4 col-xs-12"></div>

			<div class="col-md-4 col-sm-4 col-xs-12">
			<div class="text-center"><img src="${pageContext.request.contextPath}/img/delete.JPG" alt="food_image" style="height:200px ;width:250px"></div>
			<h3 class="text-center">order deleted successfully</h3>
			</div>
			
			<div class="col-md-4 col-sm-4 col-xs-12"></div>
		</div>

<%
}
catch(Exception e)
{
System.out.print(e);
e.printStackTrace();
}
%>
<br>
<br>
<br>
<div class="row">
			<div class="col-md-4 col-sm-4 col-xs-12"></div>

			<div class="col-md-4 col-sm-4 col-xs-12">
<a href="${pageContext.request.contextPath}/jsp/cart.jsp"><button type="submit" class="btn btn-warning btn-block">Return To Previous Page</button></a><br>
</div>
<div class="col-md-4 col-sm-4 col-xs-12"></div>
</div>
</div>
</body>
</html>