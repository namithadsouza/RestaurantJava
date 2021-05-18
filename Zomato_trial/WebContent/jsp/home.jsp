<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
    <%-- <%
/* response.setHeader("Cache-Control","no-cache");
response.setHeader("Cache-Control","no-store");
response.setHeader("Pragma","no-cache");
response.setDateHeader ("Expires", 0); */

if(session.getAttribute("user_id")==null)
  response.sendRedirect("jsp/login.jsp");

%> --%>
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
<div class="container-fluid">
<div class="row"><div class="col-md-12"><p class="text-center">Varieties</p></div></div>
		<div class="row">
			<div class="col-md-4 col-sm-4 col-xs-12">
			
			</div>

			<div class="col-md-4 col-sm-4 col-xs-12">
<a href="${pageContext.request.contextPath}/jsp/food_type.jsp?type=south indian"><button type="button" class="btn btn-warning btn-block">South Indian</button></a><br>
<a href="${pageContext.request.contextPath}/jsp/food_type.jsp?type=north indian"><button type="button" class="btn btn-warning btn-block">North Indian</button></a><br>
<a href="${pageContext.request.contextPath}/jsp/food_type.jsp?type=chinese"><button type="button" class="btn btn-warning btn-block">Chinese</button></a><br>
<a href="${pageContext.request.contextPath}/jsp/food_type.jsp?type=Italian"><button type="button" class="btn btn-warning btn-block">Italian</button></a><br>
</div>
<div class="col-md-4 col-sm-4 col-xs-12"></div>
</div>
<div class="row">
			<div class="col-md-4 ">
				<img src="${pageContext.request.contextPath}/img/order3.JPG" alt="background2" style="width: 100%; height: 250px;"/>
			</div>

			<div class="col-md-4 ">
							<img src="${pageContext.request.contextPath}/img/delivery3.JPG" alt="background2" style="width: 100%; height: 250px;"/>
			
			</div>
			<div class="col-md-4 ">
							<img src="${pageContext.request.contextPath}/img/delivery2.jpg" alt="background2" style="width: 100%; height: 250px;"/>
			
			</div>
			</div>
</div>
</body>
</html>























