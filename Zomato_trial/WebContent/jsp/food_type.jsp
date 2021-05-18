<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@ page import="java.sql.*"%>	
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Insert title here</title>
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css">

</head>
<style>
.flex-container5 {
  display: flex;
  height: 100%;
  flex-wrap: wrap;
  align-content: flex-start;
    justify-content: space-around;

}

.flex-containervalue {
  background-color: #f1f1f1;
  width: 400px;
  margin: 10px;
  text-align: center;
  line-height: 10px;
  font-size: 30px;
}

</style>
<body>
	<nav class="navbar navbar-expand-sm bg-dark navbar-dark">
  <ul class="navbar-nav">
    <li class="nav-item ">
      <a class="nav-link" href="${pageContext.request.contextPath}/jsp/home.jsp">Home</a>
    </li>
    <li class="nav-item active">
      <a class="nav-link" href="${pageContext.request.contextPath}/jsp/home.jsp">Order</a>
    </li>
     <li class="nav-item">
      <a class="nav-link" href="${pageContext.request.contextPath}/jsp/cart.jsp">cart</a>
    </li>
     <li class="nav-item">
      <a class="nav-link" href="${pageContext.request.contextPath}/jsp/logout.jsp">logout</a>
    </li>
  </ul>
</nav>
	<%
	Connection con = null;
	PreparedStatement stmt = null;
	ResultSet rs = null;
	String iurl1 = null;
	String type=request.getParameter("type");

	try {
		Class.forName("com.mysql.jdbc.Driver");
		con = DriverManager.getConnection("jdbc:mysql://localhost:3306/zomatotest","root","root");
		//stmt = con.createStatement();
		stmt = con.prepareStatement("select * from food_item where f_type=?");
		stmt.setString(1,type);
		rs=stmt.executeQuery();
	%>
	<p class="text-center"><%
	//scriptlet tag
	String name=request.getParameter("type");
	out.print(name+" Food Items");
	
	%>.</p>
	<div class="flex-container5 bg-dark ">
	   <% while (rs.next()) {%>
<div class="flex-containervalue">

     <div class="card" style="width:100%">  
    <img class="card-img-top" src="<%=rs.getString("image_path")%>"  alt="Card image" style="width:100% ;height:150px">
    <div class="card-body">
     <h4 class="card-title"><%=rs.getString("f_name")%></h4>
  
      <a href="${pageContext.request.contextPath}/jsp/order_food.jsp?f_id=<%=rs.getInt("f_id")%>" class="btn btn-primary">Order Now</a>
    </div>
  </div>
</div>
    
  

	
	<%
 }
 %>
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