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
<%@ include file="includes/adnavbar.jsp" %>
	<br/><br/>
	<div class="container">
		<div class="row">
			<div class="col"></div>
			<div class="col-8">
				<table class="table table-hover">
					<thead>
					<tr>
						<th>Product ID</th>
						<th>Product Name</th>
						<th>Product Price</th>
						<th>Quantity</th>
						<th>Category</th>
						<th>Actions</th>
					</tr>
					</thead>
					<tbody>
					<c:forEach items="${pList}" var="product">
						<tr>
							<td><c:out value="${product.id}"/></td>
							<td><c:out value="${product.name}"/></td>
							<td><c:out value="${product.quantity}"/></td>
							<td><c:out value="${product.category}"/></td>
							<td><c:out value="${product.price}"/></td>
							<td><span>
        	<a href="/deleteProduct?id=<c:out value="${product.id}"/>">Delete | </a>
        	<a href="/editProduct?id=<c:out value="${product.id}"/>">Edit</a>
        	</span></td>
						</tr>
					</c:forEach>
					</tbody>

				</table>

			</div>
			<div class="col"></div>
		</div>
	</div>
	<%@ include file="includes/scripts.jsp" %>
</body>
</html>