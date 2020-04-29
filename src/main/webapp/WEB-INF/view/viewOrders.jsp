<%@page import="java.util.List,com.example.demo.model.OrderdProducts,java.util.Set,com.example.demo.model.Orders"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Customer Orders</title>
	<%--<%@ include file="includes/style.jsp" %>--%>
	<link rel="stylesheet" type="text/css" href="/css/bootstrap.min.css">
</head>
<body>
<%@ include file="includes/adnavbar.jsp" %><br/><br/>
	<div class="container">
		<div class="row">
			<div class="col"></div>
			<table class="col-12 table table-striped">
  			<thead>
    			<tr>
      				<th scope="col">Order Id</th>
      				<th scope="col">Customer  Id</th>
      				<th scope="col">Order Date</th>
      				<th scope="col">Order Price</th>
      				<th scope="col">Actions Available</th>
      				<th scope="col">Approve Order</th>
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
  				<td><c:out value="${orders.amount}"/></td>
  				<c:choose> 
  				<c:when test="${orders.status == 'A'}">
    				<td>
						<a href="/deleteOrder?id=<c:out value="${orders.id}"/>" class="btn btn-danger disabled" type="button" aria-disabled="true">Delete</a>
					</td>
  				</c:when>
  				<c:otherwise>
    				<td>
						<a href="/deleteOrder?id=<c:out value="${orders.id}"/>" class="btn btn-danger">Delete</a>
						</span>
					</td>
  				</c:otherwise>
				</c:choose>
  				<c:choose> 
  				<c:when test="${orders.status == 'A'}">
    				<td><a href="/approvrOrder?id=<c:out value="${orders.id}"/>" class="btn btn-success disabled" aria-disabled="true">Order Approved</a></td>
  				</c:when>
  				<c:when test="${orders.status == 'D'}">
    				<td><a href="/approvrOrder?id=<c:out value="${orders.id}"/>" class="btn btn-danger disabled" aria-disabled="true">Order Disapproved</a></td>
  				</c:when>
  				<c:otherwise>
    				<td><span>
    				<a href="/approvrOrder?id=<c:out value="${orders.id}"/>" class="btn btn-primary">Approve Order</a> | <a href="/disapprovrOrder?id=<c:out value="${orders.id}"/>" class="btn btn-info">Disapprove Order</a>
    				</span></td>
  				</c:otherwise>
				</c:choose>
  			</tr>
  			</c:forEach>
  			</tbody>
			</table>
			<div class="col"></div>
		</div>
	</div>
	<%@ include file="includes/scripts.jsp" %>
</body>
</html>