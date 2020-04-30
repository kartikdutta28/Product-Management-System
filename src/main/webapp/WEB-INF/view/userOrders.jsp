<%@page import="java.util.List"%>
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
<title>Order History</title>
	<%--<%@ include file="includes/style.jsp" %>--%>
	<link rel="stylesheet" type="text/css" href="/css/bootstrap.min.css">
</head>
<body>
	<%@ include file="includes/navbar.jsp" %><br/><br/><br/><br/>
	<div class="container">
	<div class="row">
		<div class="col"></div>
		<div class="col-6">
			<%@include file="includes/msg.jsp"%>
		</div>
		<div class="col"></div>
	</div>
		<div class="row">
			<div class="col"></div>
			<table class="col-12 table table-striped">
  			<thead>
    			<tr>
      				<th scope="col">Order Id</th>
      				<th scope="col">User Id</th>
      				<th scope="col">Order Date</th>
      				<th scope=col>Order Status</th>
      				<th scope="col">Order Amount</th>
      				<th scope="col">Available Actions</th>
					<th scope="col">Order Status</th>
    			</tr>
  			</thead>
  			<tbody>
  			<c:forEach items="${oList}" var="orders">
  			<tr>
  				<td>
					<a href="/order?id=<c:out value="${orders.id}"/>&uid=<c:out value="${orders.customerId}"/>">
						<c:out value="${orders.id}"/>
					</a>
				</td>
  				<td><c:out value="${orders.customerId}"/></td>
  				<td><c:out value="${orders.date}"/></td>
  				<c:choose> 
  				<c:when test="${orders.status == 'U'}">
    				<td><a class="btn btn-warning">Under Approval</a></td>
  				</c:when>
  				<c:when test="${orders.status == 'D'}">
    				<td><a class="btn btn-danger disabled" aria-disabled="true">Order Disapproved</a></td>
  				</c:when>
  				<c:otherwise>
    				<td><a class="btn btn-success disabled" aria-disabled="true">Order Approved</a></td>
  				</c:otherwise>
				</c:choose>
				<td><c:out value="${orders.amount}"/></td>
  				<c:choose> 
  				<c:when test="${orders.status == 'U'}">
    				<td><a href="/cancelOrder?id=<c:out value="${orders.id}"/>" class="btn btn-danger disabled" aria-disabled="true">Cancel Order</a></td>
  				</c:when>
  				<c:when test="${orders.status == 'D'}">
    				<td><a href="/cancelOrder?id=<c:out value="${orders.id}"/>" class="btn btn-danger disabled" aria-disabled="true">Cancel Order</a></td>
  				</c:when>
  				<c:otherwise>
    				<td><a href="/cancelOrder?id=<c:out value="${orders.id}"/>" class="btn btn-danger">Cancel Order</a></td>
  				</c:otherwise>
				</c:choose>
				<td>
					<%@ include file="includes/status.jsp" %>
				</td>
  			</tr>
  			</c:forEach>
  			</tbody>
			</table>
			<div class="col"></div>
		</div>
	</div>
	<%@include file="includes/scripts.jsp"%>
</body>
</html>