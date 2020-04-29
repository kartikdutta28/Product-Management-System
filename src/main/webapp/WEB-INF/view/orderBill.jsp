<%@page import="com.example.demo.model.OrderdProducts"%>
<%@page import="java.util.Set"%>
<%@page import="com.example.demo.model.Orders"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Order Bill</title>
	<%--<%@ include file="includes/style.jsp" %>--%>
	<link rel="stylesheet" type="text/css" href="/css/bootstrap.min.css">
</head>
<body>
	<%@ include file="includes/navbar.jsp" %><br/><br/><br/><br/>
	<% Orders order=(Orders)session.getAttribute("order");%>
	<% Set<OrderdProducts> set=order.getOrderdProducts();Double total=0.0;%>
	<div align="center">
		<h2>Order Receipt</h2>
	</div>
	<div class="container">
		<div class="row">
			<div class="col"></div>
			<table class="col-6 table table-striped">
  			<thead>
    			<tr>
      				<th scope="col">Id</th>
      				<th scope="col">Product</th>
      				<th scope="col">Price</th>
					<th scope="col">Quantity</th>
    			</tr>
  			</thead>
  			<tbody>
  			<%
  				for(OrderdProducts o:set){
  					out.println("<tr>");
  					out.println("<td>"+o.getPid()+"</td>");
  					out.println("<td>"+o.getName()+"</td>");
  					out.println("<td>"+o.getPrice()+"</td>");
					out.println("<td>"+o.getQuantity()+"</td>");
  					out.println("</tr>");
  					total=total+(o.getQuantity()*o.getPrice());
  				}
  			
  			%>
    		</tbody>
			</table>
			<div class="col"></div>
		</div>
		<div class="row">
			<div class="col"></div>
			<div class="col">
				<div class="alert alert-primary" role="alert">
  					Total Price Paid $<%=total %>
				</div>
			</div>
			<div class="col"></div>
		</div>
	</div>
	<%@ include file="includes/scripts.jsp" %>
</body>
</html>