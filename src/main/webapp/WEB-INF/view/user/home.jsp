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
	<%--<%@ include file="../includes/style.jsp" %>--%>
 <link rel="stylesheet" type="text/css" href="/css/bootstrap.min.css">
</head>
<body>
	<%@ include file="../includes/navbar.jsp" %>
	<div class="container">
		<div class="row">
			<div class="col"></div>
			<div class="col-10">
				<%@ include file="../includes/msg.jsp" %>
				<div class="jumbotron">
					<h1 class="display-4">Shopping Web App</h1>
					<p class="lead">This is a simple shopping web app example made via spring boot jpa and h2.</p>
					<hr class="my-4">
					<p>Login to buy items</p>
					<p class="lead">
						<a class="btn btn-primary btn-lg" href="/login" role="button">Login</a>
					</p>
				</div>
			</div>
			<div class="col"></div>
		</div>
	<c:forEach items="${pList}" var="product">
		<div class="row">
			<div class="col"></div>
			<div class="col-10 border-info card shadow-lg p-3 mb-4 bg-white rounded time-right">
				<div class="card-body">
    				<h5 class="card-title">Product Name : <c:out value="${product.name}"/></h5>
    				<h6 class="card-subtitle mb-2 text-muted">Product Price : <c:out value="${product.price}"/></h6>
    				<p class="card-text"><c:out value="${product.quantity}"/> Pieces Left</p>
					<p class="text-danger">Login to buy these products</p>
				</div>
			</div>
			<div class="col"></div>
		</div>
	</c:forEach>
	</div>
	<%@ include file="../includes/scripts.jsp" %>
</body>
</html>