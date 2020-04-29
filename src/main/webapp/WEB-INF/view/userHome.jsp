<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Product Management System</title>
	<%--<%@ include file="includes/style.jsp" %>--%>
	<link rel="stylesheet" type="text/css" href="/css/bootstrap.min.css">
</head>
<body>
	<%@ include file="includes/navbar.jsp" %>
	<div class="container">
	<form action="checkOut" method="post">
	<input type="submit" value="Checkout" class="btn btn-primary">
	<c:forEach items="${pList}" var="product">
		<div class="row">
			<div class="col"></div>
			<div class="col-6 border-info card shadow-lg p-3 mb-4 bg-white rounded time-right">
				<div class="card-body">
    				<h5 class="card-title">Product Name : <c:out value="${product.name}"/></h5>
    				<h6 class="card-subtitle mb-2 text-muted">Product Price : <c:out value="${product.price}"/></h6>
    				<p class="card-text"><c:out value="${product.quantity}"/> Pieces left</p>
    				<div class="form-check">
    				<input id="defaultCheck1" class="form-check-input" type="checkbox" name="order" value='<c:out value="${product.name}"/>,<c:out value="${product.price}"/>,<c:out value="${product.id}"/>,<c:out value="${product.category}"/>'
    				/>
    				<label class="form-check-label" for="defaultCheck1">
    					Check this box to add this item to your cart
  					</label>
    				</div>
  				</div>
			</div>
			<div class="col"></div>
		</div>
	</c:forEach>
	</form>
	</div>
	<%@ include file="includes/scripts.jsp" %>
</body>
</html>